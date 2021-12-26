Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D91A47F66B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 11:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3CF10E6F0;
	Sun, 26 Dec 2021 10:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D8D10E6F0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 10:41:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o30so5343687wms.4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 02:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iBIfrfnr3GLdb1qUMNUHlNu3PuJL3644gLoGb9X9DGQ=;
 b=Ock4A3uoGStWAqVLbKFpQ0G5feZlxJ5tGxucKxVG85VNVRD+NoFnpyyXQBFQW+up/y
 5YjQonEU+szM63am1pR3OVzffe4Rg6DVnQiPggbfPYjGlrBM2+eSjcipDUU/T7pQaWjN
 oO2p/LoWWIzLj5yfgg9KJHPFLA/nndVKJ+aavpNDpqHA0ULByzl6Uno2+mJVfxaWiAq1
 KIJ099J6+r6cPfyD+XEKBUK2d6MOGgn53wjVdBcf/o4eVqn46ANPDGZWYiLzQ493NYfw
 w9z1TFZ2JYl3ZGVggUM0oXgnyPp/gH1Qy+p+JPe77f/3CzMZ5IpYRGWzS2VDL/bk16/e
 ClbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iBIfrfnr3GLdb1qUMNUHlNu3PuJL3644gLoGb9X9DGQ=;
 b=3NFg88Zv0Xrdhu1CcbRyEUErI54ZMQU36tmIzn+gHjbzBR+K1FxIaR/6HM7Yh5Gp+0
 HYYz6jKm7UNejzFo4Hdblx/3bHfyP7LH8dqnvycqKxIIkhmnw0HGJNQYadJtYgl0FNZn
 vdxgToFMqMFiLesu1RBXDDZseMEDRaDS01OTuLp8Bm7C5xgqLdROplZDmdsAOwZ1w1BC
 xIofDmQEejCOwyo7xyWeBqYQIee79z/iVeowP+OzuZ0vDVl/RuU1uoD946uNCqIZeEP/
 D0UBQihGAAxsudVJpLIDLmLKlpbizcPTrO55LHh5U6cmmpeLhdQNOBSJOCOJlTQ/80qo
 ae6g==
X-Gm-Message-State: AOAM530V97BvFip4cWdeB4sx+GE2Yl5eihmCw1aovczQT4aT+lcEFEZ2
 N8uLoqZHqI8gH3bk2V/2aIU=
X-Google-Smtp-Source: ABdhPJzt8QgSrDwaC8ul4L8AhTDytNAzH1P6MVQB50CiqghEZHGW//SXTCTmmRT1vZJ4sWLB0EiNQA==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr9862595wmi.128.1640515267984; 
 Sun, 26 Dec 2021 02:41:07 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g9sm12592729wmq.22.2021.12.26.02.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 02:41:07 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH v2 1/3] drm/vkms: refactor overlay plane creation
Date: Sun, 26 Dec 2021 11:40:57 +0100
Message-Id: <20211226104059.11265-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the logic to create an overlay plane to its own function.
Refactor, no functional changes.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 04406bd3ff02..2e805b2d36ae 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -32,6 +32,21 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
 };
 
+static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
+				  struct drm_crtc *crtc)
+{
+	struct vkms_plane *overlay;
+
+	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
+	if (IS_ERR(overlay))
+		return PTR_ERR(overlay);
+
+	if (!overlay->base.possible_crtcs)
+		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+
+	return 0;
+}
+
 int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
 	struct vkms_output *output = &vkmsdev->output;
@@ -39,7 +54,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct drm_connector *connector = &output->connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
-	struct vkms_plane *primary, *cursor = NULL, *overlay = NULL;
+	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
 
@@ -48,12 +63,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config->overlay) {
-		overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
-		if (IS_ERR(overlay))
-			return PTR_ERR(overlay);
-
-		if (!overlay->base.possible_crtcs)
-			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+		ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
+		if (ret)
+			return ret;
 	}
 
 	if (vkmsdev->config->cursor) {
-- 
2.25.1

