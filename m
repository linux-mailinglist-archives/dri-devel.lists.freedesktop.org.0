Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71253E441
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 13:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A4810E6D4;
	Mon,  6 Jun 2022 11:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F0FDE10E8DC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 11:47:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A29181042;
 Mon,  6 Jun 2022 04:47:48 -0700 (PDT)
Received: from e126387.arm.com (unknown [10.57.68.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 010AC3F73B;
 Mon,  6 Jun 2022 04:47:47 -0700 (PDT)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/komeda - Fix handling of pending crtc state commit to
 avoid lock-up
Date: Mon,  6 Jun 2022 12:47:14 +0100
Message-Id: <20220606114714.175499-3-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: liviu.dudau@arm.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Carsten Haitzler <carsten.haitzler@arm.com>

Sometimes there is an extra dcm crtc state in the pipeline whose
penting vblank event has not been handled yet. We would previously
throw this out and the vblank event never triggers leading to hard
lockups higher up the stack where an expected vlank event never comes
back (screen freezes).

This fixes that by tracking a pending crtc state that needs handling
and handle it producing a vlank event next vblank if it had not
laready been handled before. This fixes the hangs and ensures our
display keeps updating seamlessly and is certainly a much better state
to be in than after some time ending up with a mysteriously frozen
screen and a lot of kernle messages complaining about this too.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 10 ++++++++++
 .../gpu/drm/arm/display/komeda/komeda_kms.c   | 19 ++++++++++++++++++-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  3 +++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 59172acb9738..b7f0a5f97222 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -227,6 +227,16 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			complete_all(kcrtc->disable_done);
 			kcrtc->disable_done = NULL;
 		} else if (crtc->state->event) {
+			if (kcrtc->state_needs_handling) {
+				event = kcrtc->state_needs_handling->event;
+				if (event) {
+					kcrtc->state_needs_handling->event = NULL;
+					kcrtc->state_needs_handling = NULL;
+					drm_crtc_send_vblank_event(crtc, event);
+				} else {
+					kcrtc->state_needs_handling = NULL;
+				}
+			}
 			event = crtc->state->event;
 			/*
 			 * Consume event before notifying drm core that flip
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 93b7f09b96ca..bbc051a1896a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -226,10 +226,27 @@ static int komeda_kms_check(struct drm_device *dev,
 	return 0;
 }
 
+static int komeda_kms_commit(struct drm_device *drm,
+                             struct drm_atomic_state *state,
+                             bool nonblock)
+{
+	int i;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct komeda_crtc *kcrtc;
+
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
+				      new_crtc_state, i) {
+		kcrtc = to_kcrtc(crtc);
+		kcrtc->state_needs_handling = crtc->state;
+	}
+	return drm_atomic_helper_commit(drm, state, nonblock);
+}
+
 static const struct drm_mode_config_funcs komeda_mode_config_funcs = {
 	.fb_create		= komeda_fb_create,
 	.atomic_check		= komeda_kms_check,
-	.atomic_commit		= drm_atomic_helper_commit,
+	.atomic_commit		= komeda_kms_commit,
 };
 
 static void komeda_kms_mode_config_init(struct komeda_kms_dev *kms,
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 456f3c435719..8ff3ad04dfe4 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -84,6 +84,9 @@ struct komeda_crtc {
 
 	/** @disable_done: this flip_done is for tracing the disable */
 	struct completion *disable_done;
+
+	/** @state_needs_handling: Has not had it's vblank event handled yet */
+	struct drm_crtc_state *state_needs_handling;
 };
 
 /**
-- 
2.32.0

