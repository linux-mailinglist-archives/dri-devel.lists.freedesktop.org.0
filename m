Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB2B8982F8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 10:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9470113726;
	Thu,  4 Apr 2024 08:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547D11374D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 08:17:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rsIIH-0000hH-1t; Thu, 04 Apr 2024 10:17:57 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rsIIG-00AKhO-Ht; Thu, 04 Apr 2024 10:17:56 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH] drm/atomic-helper: fix parameter order in
 drm_format_conv_state_copy() call
Date: Thu,  4 Apr 2024 10:17:56 +0200
Message-Id: <20240404081756.2714424-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Old and new state parameters are swapped, so the old state was cleared
instead of the new duplicated state.

Fixes: 903674588a48 ("drm/atomic-helper: Add format-conversion state to shadow-plane state")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Leonard Göhrs <l.goehrs@pengutronix.de>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e440f458b663..93337543aac3 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -224,8 +224,8 @@ __drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane,
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &new_shadow_plane_state->base);
 
-	drm_format_conv_state_copy(&shadow_plane_state->fmtcnv_state,
-				   &new_shadow_plane_state->fmtcnv_state);
+	drm_format_conv_state_copy(&new_shadow_plane_state->fmtcnv_state,
+				   &shadow_plane_state->fmtcnv_state);
 }
 EXPORT_SYMBOL(__drm_gem_duplicate_shadow_plane_state);
 
-- 
2.39.2

