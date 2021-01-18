Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D52D2FA2CC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 15:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DC7898BC;
	Mon, 18 Jan 2021 14:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2251C898BC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 14:21:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398A11FB;
 Mon, 18 Jan 2021 06:21:47 -0800 (PST)
Received: from cubie.arm.com (unknown [10.37.8.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 847FA3F68F;
 Mon, 18 Jan 2021 06:21:46 -0800 (PST)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/komeda: Fix bit check to import to value of proper type
Date: Mon, 18 Jan 2021 14:20:13 +0000
Message-Id: <20210118142013.277404-1-carsten.haitzler@foss.arm.com>
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

Another issue found by KASAN. The bit finding is bueried inside the
dp_for_each_set_bit() macro (that passes on to for_each_set_bit() that
calls the bit stuff. These bit functions want an unsigned long pointer
as input and just dumbly casting leads to out-of-bounds accesses.
This fixes that.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 .../drm/arm/display/komeda/komeda_pipeline_state.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index e8b1e15312d8..f7dddb9f015d 100644
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
 
@@ -1262,7 +1263,6 @@ int komeda_release_unclaimed_resources(struct komeda_pipeline *pipe,
 		st = komeda_pipeline_get_new_state(pipe, drm_st);
 	else
 		st = komeda_pipeline_get_state_and_set_crtc(pipe, drm_st, NULL);
-
 	if (WARN_ON(IS_ERR_OR_NULL(st)))
 		return -EINVAL;
 
@@ -1287,7 +1287,8 @@ bool komeda_pipeline_disable(struct komeda_pipeline *pipe,
 	struct komeda_pipeline_state *old;
 	struct komeda_component *c;
 	struct komeda_component_state *c_st;
-	u32 id, disabling_comps = 0;
+	u32 id;
+	unsigned long disabling_comps;
 
 	old = komeda_pipeline_get_old_state(pipe, old_state);
 
@@ -1297,7 +1298,7 @@ bool komeda_pipeline_disable(struct komeda_pipeline *pipe,
 		disabling_comps = old->active_comps &
 				  pipe->standalone_disabled_comps;
 
-	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, disabling_comps: 0x%x.\n",
+	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, disabling_comps: 0x%lx.\n",
 			 pipe->id, old->active_comps, disabling_comps);
 
 	dp_for_each_set_bit(id, disabling_comps) {
@@ -1331,13 +1332,14 @@ void komeda_pipeline_update(struct komeda_pipeline *pipe,
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
