Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE40487C30
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 19:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AED10EB79;
	Fri,  7 Jan 2022 18:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6215E10EAA6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 18:28:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so1303731wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 10:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/cIP//uzFRFV87jVN39f0dog6UQJqLvS7DxqTem8FA=;
 b=omF6CXERZiso6S/q+xBfFG4E6S/jaE5rhg2lyaB1S0VsuJykXq2QgUaB5S1UQAJqtB
 oECLCGvRwZoytXrxX2PyxZFavqhxT2aTAlIDOUOtmvY5K+3r3Vyt5usx6LZXuJOSpFLq
 GDM1clQaRGsLAC08w8hhuTKV+JNvEgBpVo1q29+LprgQvraZVP/qA3j5q8CNTzK7mrxl
 HP+VctVlrDjf3X+wdeHTldpAaURkah2hCUw9IfXGMAE96voKDMG+VcvzOxljJSbIFtv7
 GZm+TChh7JheMXrgOMEw7+3fuSQS0+CodckyVpLpMaaagvJ83sC4zk2SkpiIAQc2Stqv
 GFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/cIP//uzFRFV87jVN39f0dog6UQJqLvS7DxqTem8FA=;
 b=x8CQvkwAc8mUtOw3+DrZ7ULYZQTFcaJ+p3xsuZi/XDKA5xGyCpZ8wG70z5zP7R87+r
 mcxD/EnjBPRoYp2S0jX122necB6X1SCpQzcM3OcsO3TZeNsDdNj1bb/AazRg7Cg53+Xq
 jtt8rSUojU+dpWAkZrUoQRFjSpiyagiAnpWuifi+5H282+vjvxs4Rfoe13mWpBEqHO00
 odK3R/+q0TeuNEoPjkUuuWba8KBa2myAzrj/YzTwvjOYYJpBjceyvdRhKvzsvbLWN9ZL
 so5sivbmSqU/S8Qz45Wylvm3hMJ2EW9xHzwb4cWYo3v28hozB1PI296lnRnK5IACkGSW
 7XnQ==
X-Gm-Message-State: AOAM530Ct6J2zfjyCH737/ETBUaeZFKGI68QUq91kyKtivGLfcgHtLGu
 FYiunFZ6kIcC1CYegmld6JM=
X-Google-Smtp-Source: ABdhPJzgi0ea+eTwdq3v8ZTeIM8py3U0zCuqsI7NW7v8/Iaophy4AcWFjxE+mAZuZRI3V4JPClnmWg==
X-Received: by 2002:a7b:c1c6:: with SMTP id a6mr1706234wmj.182.1641580093982; 
 Fri, 07 Jan 2022 10:28:13 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id p62sm4913499wmp.10.2022.01.07.10.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:28:13 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH RESEND v2 2/3] drm/vkms: add support for multiple overlay
 planes
Date: Fri,  7 Jan 2022 19:28:08 +0100
Message-Id: <20220107182809.141003-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107182809.141003-1-jose.exposito89@gmail.com>
References: <20220107182809.141003-1-jose.exposito89@gmail.com>
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

Create 8 overlay planes instead of 1 when the "enable_overlay" module
parameter is set.

The following igt-gpu-tools tests were executed without finding
regressions. Notice than the numbers are identical:

                    |     master branch     |      this  patch      |
                    | SUCCESS | SKIP | FAIL | SUCCESS | SKIP | FAIL |
 kms_atomic         |      10 |   02 |   00 |      10 |   02 |   00 |
 kms_plane_cursor   |      09 |   45 |   00 |      09 |   45 |   00 |
 kms_plane_multiple |      01 |   23 |   00 |      01 |   23 |   00 |
 kms_writeback      |      04 |   00 |   00 |      04 |   00 |   00 |

Signed-off-by: José Expósito <jose.exposito89@gmail.com>

---

v2:

 - Set the number of overlay planes as a constant instead of as a
   module parameter (Melissa Wen)

 - Add a test results in the commit message (Melissa Wen)
---
 drivers/gpu/drm/vkms/vkms_drv.h    | 2 ++
 drivers/gpu/drm/vkms/vkms_output.c | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d48c23d40ce5..9496fdc900b8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -20,6 +20,8 @@
 #define XRES_MAX  8192
 #define YRES_MAX  8192
 
+#define NUM_OVERLAY_PLANES 8
+
 struct vkms_writeback_job {
 	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 2e805b2d36ae..ba0e82ae549a 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -57,15 +57,18 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
+	unsigned int n;
 
 	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config->overlay) {
-		ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
-		if (ret)
-			return ret;
+		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
+			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
+			if (ret)
+				return ret;
+		}
 	}
 
 	if (vkmsdev->config->cursor) {
-- 
2.25.1

