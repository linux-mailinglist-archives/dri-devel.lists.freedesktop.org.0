Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49CD6768FB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A4410E429;
	Sat, 21 Jan 2023 20:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFFA10E409
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A94460BC2;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D710C433A1;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331674;
 bh=bLA+Md4GdDl2TeCuBfoYUlFv707i2BU4sfLFk5t13vo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=nDpUvkLybRp4umcxs9V/hzmclEMeDVf/AiD9dJP5OB4OpnrZMinWcU5tqixrYwCeb
 lXUd3U1cFwaCLizepQ1sIEIBVLzhcrquAtbO/xWVI3uXMYIC6wcN+obeN2N3/fmh0C
 wWq8veXCsA2xjLPrTIJUj50cDGfVcfN77HR398mgQYqgT0sVsUJXGDuLp0MTOw/hGh
 DygDKBNoBe7wRFmhVSin1FC4wrVCdSqbq8LUwB4B1wNsVI87EBJLpwMhh6s+jLqzRj
 nTzDfjuWtFaFKuy9b2yWr2f0NdirdBV0VwhxTBtAS58sVEqdnvEyCXlStO3Ub2Nvc/
 LM2wynoVuUiLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE9DC38142;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:09:02 +0100
Subject: [PATCH 84/86] drm/drm_atomic_helper: Minimize include footprint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-84-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=1468;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=zJMm7dzYnLnxIUkQaPpznHgQB5PDGjDdaSZxy+nXRsY=; =?utf-8?q?b=3DpJuWc0PUjXTz?=
 =?utf-8?q?JAkxcoDrQYfkxTc1R/gaoZEWroVm8LPkVPp5qgtduXd9xBwNZIFnmyx3L2tUWcnj?=
 eCRR3yFPB+/Y1TTJARVT4B3dGjE14p3wmM4TomCG5hCWXQ/o/PlU
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Reduce drm_atomic_helper.h to include or forward the minimal set of
files/symbols - to minimize the impact of the files that includes this
header file.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/drm/drm_atomic_helper.h | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 33f982cd1a27..c7f2bc46bd24 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -28,11 +28,9 @@
 #ifndef DRM_ATOMIC_HELPER_H_
 #define DRM_ATOMIC_HELPER_H_
 
-#include <drm/drm_crtc.h>
-#include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_modeset_helper.h>
-#include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_util.h>
+#include <linux/types.h>
+
+#include <drm/drm_plane.h>
 
 /*
  * Drivers that don't allow primary plane scaling may pass this macro in place
@@ -44,8 +42,17 @@
 #define DRM_PLANE_NO_SCALING (1<<16)
 
 struct drm_atomic_state;
-struct drm_private_obj;
-struct drm_private_state;
+struct drm_bridge;
+struct drm_bridge_state;
+struct drm_connector_state;
+struct drm_crtc_state;
+struct drm_device;
+struct drm_encoder;
+struct drm_framebuffer;
+struct drm_mode_set;
+struct drm_modeset_acquire_ctx;
+struct drm_pending_vblank_event;
+
 
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);

-- 
2.34.1

