Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881964733B0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2564C10E833;
	Mon, 13 Dec 2021 18:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C3310E829
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 18:11:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so14633487wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 10:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iBIfrfnr3GLdb1qUMNUHlNu3PuJL3644gLoGb9X9DGQ=;
 b=ebJJ52GfshhjdOeOLj4xc0X1TjsexXLbPjpxlTZN3+kZq9w+ZRup8HjxhqlWI9kC5j
 6YvHc4n6xZzUVApWRKW0taYd/OB9Oa4JzHqffwc7y2bNqiwHo3/83leRNDFIC0uBTut9
 MTnUunzTRDjzexMXRiLwrHqNpAmxEBH1T8hn/aPXASlVP8+DUNCV9nfYT6H55rYXtGje
 VT/sIfrowy4gW8GEfTpObCVssF0tGXeo0uVaEM5aKyd+o2vcmcgHB+Mmz2AV0a/4rl4s
 KfCwkBbZZrIPT0d9g8bvRDb1fNM4uGUz/N8Luwc5oVwuAVKPHvrciYNhh+IU0RB6SZk/
 T8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iBIfrfnr3GLdb1qUMNUHlNu3PuJL3644gLoGb9X9DGQ=;
 b=2twIaPZ9Vcc9BClTpTCCG1ZXrUCPm+hbJeWd6a+6ftLkbJf8Fwq50sah+Fjgf9LR/9
 w49IUxTaLSC5aV37lbdENsCdfn2S9TPzdeJurfkMZzDYeW4M7uFL0fUUe1C2/dTtSEBH
 bZl73SX7wuAnDN7eOvOQt9Brdyws2bVxz1SpmJ6xPdz5RbHlSGFwk89RJkYo7gf2fwBx
 URdLcQMrHWbJvGd74RHNqMomPUL8XG4Hlgl40/zoJlnrOaC4d+BV4yivWwvaGmK+hNEL
 S+W+Kuwzh6Nh+Jv3LAOxCCjKC6VYQEdvVDjaFOdPdvyN5S3RcXME2tetrYDi5ZDpXzJd
 xj8Q==
X-Gm-Message-State: AOAM530Pc9OO58NNL2NDZL8c1XZmfKNs+iibiHQ37Q03vSUsqUQ4uTZX
 uXfztqWVEUBmw7LBDFQ6axQ=
X-Google-Smtp-Source: ABdhPJyfQFFdMLlstFu4ZT190nQFT3inzt1bjDzISqxrWE4zsWyirInch5YIHXakodSbJe0Ataqppg==
X-Received: by 2002:a1c:f005:: with SMTP id a5mr41519157wmb.19.1639419099777; 
 Mon, 13 Dec 2021 10:11:39 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id t127sm8750956wma.9.2021.12.13.10.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:11:39 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH 1/3] drm/vkms: refactor overlay plane creation
Date: Mon, 13 Dec 2021 19:11:29 +0100
Message-Id: <20211213181131.17223-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213181131.17223-1-jose.exposito89@gmail.com>
References: <20211213181131.17223-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
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

