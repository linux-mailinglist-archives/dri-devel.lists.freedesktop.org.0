Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32964305B75
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3148D89B96;
	Wed, 27 Jan 2021 12:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48F2289B96
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:34:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A8CF1FB;
 Wed, 27 Jan 2021 04:34:54 -0800 (PST)
Received: from cubie.arm.com (unknown [10.37.8.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E35103F68F;
 Wed, 27 Jan 2021 04:34:53 -0800 (PST)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/komeda: Fix bit check to import to value of proper type
Date: Wed, 27 Jan 2021 12:34:30 +0000
Message-Id: <20210127123430.301752-1-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: liviu.dudau@arm.com, Carsten Haitzler <carsten.haitzler@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Carsten Haitzler <carsten.haitzler@arm.com>

Another issue found by KASAN. The bit finding is buried inside the
dp_for_each_set_bit() macro (that passes on to for_each_set_bit() that
calls the bit stuff. These bit functions want an unsigned long pointer
as input and just dumbly casting leads to out-of-bounds accesses.
This fixes that.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 .../gpu/drm/arm/display/include/malidp_utils.h   | 10 ++++++++--
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c | 16 +++++++++++-----
 .../arm/display/komeda/komeda_pipeline_state.c   | 13 ++++++++-----
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/include/malidp_utils.h b/drivers/gpu/drm/arm/display/include/malidp_utils.h
index 3bc383d5bf73..8d289cd0b5b8 100644
--- a/drivers/gpu/drm/arm/display/include/malidp_utils.h
+++ b/drivers/gpu/drm/arm/display/include/malidp_utils.h
@@ -12,9 +12,15 @@
 
 #define has_bit(nr, mask)	(BIT(nr) & (mask))
 #define has_bits(bits, mask)	(((bits) & (mask)) == (bits))
-
+/*
+#define dp_for_each_set_bit(bit, mask) \
+	for_each_set_bit((bit), (&((unsigned long)(mask))), sizeof(mask) * 8)
+#define dp_for_each_set_bit(bit, mask) \
+	unsigned long __local_mask = mask; \
+	for_each_set_bit((bit), (&__local_mask), sizeof(mask) * 8)
+*/
 #define dp_for_each_set_bit(bit, mask) \
-	for_each_set_bit((bit), ((unsigned long *)&(mask)), sizeof(mask) * 8)
+	for_each_set_bit((bit), &(mask), sizeof(mask) * 8)
 
 #define dp_wait_cond(__cond, __tries, __min_range, __max_range)	\
 ({							\
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
index 719a79728e24..a85c8a806334 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
@@ -46,8 +46,9 @@ void komeda_pipeline_destroy(struct komeda_dev *mdev,
 {
 	struct komeda_component *c;
 	int i;
+	unsigned long avail_comps = pipe->avail_comps;
 
-	dp_for_each_set_bit(i, pipe->avail_comps) {
+	dp_for_each_set_bit(i, avail_comps) {
 		c = komeda_pipeline_get_component(pipe, i);
 		komeda_component_destroy(mdev, c);
 	}
@@ -247,6 +248,7 @@ static void komeda_pipeline_dump(struct komeda_pipeline *pipe)
 {
 	struct komeda_component *c;
 	int id;
+	unsigned long avail_comps = pipe->avail_comps;
 
 	DRM_INFO("Pipeline-%d: n_layers: %d, n_scalers: %d, output: %s.\n",
 		 pipe->id, pipe->n_layers, pipe->n_scalers,
@@ -258,7 +260,7 @@ static void komeda_pipeline_dump(struct komeda_pipeline *pipe)
 		 pipe->of_output_links[1] ?
 		 pipe->of_output_links[1]->full_name : "none");
 
-	dp_for_each_set_bit(id, pipe->avail_comps) {
+	dp_for_each_set_bit(id, avail_comps) {
 		c = komeda_pipeline_get_component(pipe, id);
 
 		komeda_component_dump(c);
@@ -270,8 +272,9 @@ static void komeda_component_verify_inputs(struct komeda_component *c)
 	struct komeda_pipeline *pipe = c->pipeline;
 	struct komeda_component *input;
 	int id;
+	unsigned long supported_inputs = c->supported_inputs;
 
-	dp_for_each_set_bit(id, c->supported_inputs) {
+	dp_for_each_set_bit(id, supported_inputs) {
 		input = komeda_pipeline_get_component(pipe, id);
 		if (!input) {
 			c->supported_inputs &= ~(BIT(id));
@@ -302,8 +305,9 @@ static void komeda_pipeline_assemble(struct komeda_pipeline *pipe)
 	struct komeda_component *c;
 	struct komeda_layer *layer;
 	int i, id;
+	unsigned long avail_comps = pipe->avail_comps;
 
-	dp_for_each_set_bit(id, pipe->avail_comps) {
+	dp_for_each_set_bit(id, avail_comps) {
 		c = komeda_pipeline_get_component(pipe, id);
 		komeda_component_verify_inputs(c);
 	}
@@ -355,13 +359,15 @@ void komeda_pipeline_dump_register(struct komeda_pipeline *pipe,
 {
 	struct komeda_component *c;
 	u32 id;
+	unsigned long avail_comps;
 
 	seq_printf(sf, "\n======== Pipeline-%d ==========\n", pipe->id);
 
 	if (pipe->funcs && pipe->funcs->dump_register)
 		pipe->funcs->dump_register(pipe, sf);
 
-	dp_for_each_set_bit(id, pipe->avail_comps) {
+	avail_comps = pipe->avail_comps;
+	dp_for_each_set_bit(id, avail_comps) {
 		c = komeda_pipeline_get_component(pipe, id);
 
 		seq_printf(sf, "\n------%s------\n", c->name);
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index e8b1e15312d8..7640dae7f4bf 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -1232,7 +1232,8 @@ komeda_pipeline_unbound_components(struct komeda_pipeline *pipe,
 	struct komeda_pipeline_state *old = priv_to_pipe_st(pipe->obj.state);
 	struct komeda_component_state *c_st;
 	struct komeda_component *c;
-	u32 disabling_comps, id;
+	u32 id;
+	unsigned long disabling_comps;
 
 	WARN_ON(!old);
 
@@ -1287,7 +1288,8 @@ bool komeda_pipeline_disable(struct komeda_pipeline *pipe,
 	struct komeda_pipeline_state *old;
 	struct komeda_component *c;
 	struct komeda_component_state *c_st;
-	u32 id, disabling_comps = 0;
+	u32 id;
+	unsigned long disabling_comps;
 
 	old = komeda_pipeline_get_old_state(pipe, old_state);
 
@@ -1297,7 +1299,7 @@ bool komeda_pipeline_disable(struct komeda_pipeline *pipe,
 		disabling_comps = old->active_comps &
 				  pipe->standalone_disabled_comps;
 
-	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, disabling_comps: 0x%x.\n",
+	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, disabling_comps: 0x%lx.\n",
 			 pipe->id, old->active_comps, disabling_comps);
 
 	dp_for_each_set_bit(id, disabling_comps) {
@@ -1331,13 +1333,14 @@ void komeda_pipeline_update(struct komeda_pipeline *pipe,
 	struct komeda_pipeline_state *new = priv_to_pipe_st(pipe->obj.state);
 	struct komeda_pipeline_state *old;
 	struct komeda_component *c;
-	u32 id, changed_comps = 0;
+	u32 id;
+	unsigned long changed_comps;
 
 	old = komeda_pipeline_get_old_state(pipe, old_state);
 
 	changed_comps = new->active_comps | old->active_comps;
 
-	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, changed: 0x%x.\n",
+	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, changed: 0x%lx.\n",
 			 pipe->id, new->active_comps, changed_comps);
 
 	dp_for_each_set_bit(id, changed_comps) {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
