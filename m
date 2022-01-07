Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56058487C2F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 19:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E1310EAA6;
	Fri,  7 Jan 2022 18:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B0E10EAA6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 18:28:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o30so4514802wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 10:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iBIfrfnr3GLdb1qUMNUHlNu3PuJL3644gLoGb9X9DGQ=;
 b=EVQui/6Rka9+gaqd2Lzk5fQ3Mi3OfoZA8B4MAlgughIVrqnlgxpmIJOgkaQFPQIRMp
 0FOiOEu38cyYgLswHTUAJkZugAEISKSTlONL00Cuz3ZCm1PZ3jju8c6D4pTKhQqaAW+p
 eS3IIMAriMzs4/27LMuFLpNrfe/CUnVYZ4ZO1UGKYFJyh5nVQcXsACGfjtDTO7R9Pfy4
 isElT3hkg3jeIIXLVc/NlMv+vvus9tddgAnPqek9YEO6o2N41RQMh/HfiJQF2Q6kH8AV
 7eO9afYNNHWJB25A1NUQm/pT3/GVmdgxAf/QI/NofR+tRTVyrzYrRymHZRxMuPAQEe5+
 D6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iBIfrfnr3GLdb1qUMNUHlNu3PuJL3644gLoGb9X9DGQ=;
 b=c0WPI3R/gUgzPCtqpCY5wWfl2CRhcqlgJ2AZyqD3d7DUfLtcT/+USS/DsSIYU1CQ2K
 j2cuTBoTREvH8cYpj0Ge1KWu0RGbIt3ECTwCJEn3rF7RmmgHs8CzX4fftV8DxWfsJ8MN
 A+rxPCdRy2hUcyRDzLE8Ef/XVO6nleb25XXVOk5x8cgK5CyI16ig32h+eY3+d1JsOXlw
 ra9Ydn+Pfa1oQrVDh9o9ZLvi7nXpLYxFSlzzNSIZYKp9CNcjFt7Ct7cyVEpRd80gI7ox
 aY4KcP2QNQEa+riRhLiN8AmNYkQiBI7PowakexvnGZIivYLIiOhAeizQeF9lq5AHPU2F
 zMZg==
X-Gm-Message-State: AOAM5315s4SZbwbYVgOh2hRUU5BJwBcdwjC0bbERVlFLEVz+yHsY6Nxj
 G+xe+cX7cQGXqNi/rYaCRXo=
X-Google-Smtp-Source: ABdhPJzcXNU1oVPwdUqSiPF6gH0piyIBj1KSJz3M+SIp6nsUqMIPwe7Nnh2a4lhVYplw+ffwWGGoOA==
X-Received: by 2002:a05:600c:4e4b:: with SMTP id
 e11mr12054556wmq.28.1641580092750; 
 Fri, 07 Jan 2022 10:28:12 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id p62sm4913499wmp.10.2022.01.07.10.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:28:12 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH RESEND v2 1/3] drm/vkms: refactor overlay plane creation
Date: Fri,  7 Jan 2022 19:28:07 +0100
Message-Id: <20220107182809.141003-1-jose.exposito89@gmail.com>
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

