Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E10C1B467
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2975D10E7D6;
	Wed, 29 Oct 2025 14:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0tHwITeS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0FA10E7C4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1024AC0DA83;
 Wed, 29 Oct 2025 14:36:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6790A606E8;
 Wed, 29 Oct 2025 14:37:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E5CDB117F81B4; Wed, 29 Oct 2025 15:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gKwfA60Mu6/uVfL7AHgIja/er1PeHgmxn0F8i6czpgo=;
 b=0tHwITeSEX9IAT2Hkl/0Uuv/GhmMDL88SaubPkaF9e5H4kUNc9HUlt5sXkY9npPyp8I0Tn
 zP5n7PMlkz2YFydJda7wDt29qI9rRLjRy/ipA6qwaWs1l3wWz2gK/qVL8791kkbZcNspL6
 WbNMgrb4BGkCLFVffutBzTq2PfXwgaPp2kCd174ndr3OFEkRBhPh59239P25iewNvI9Ee3
 MAqliYxfXJpCNr0KB046ahAhuns5Xf4vJ1MPS69DUXmRUyyj9fRepWRZM9wq/szA4lsA+J
 LPlvmYQsj7wMYH7t6xKy1geB9trIkTseNVhLnzShPfx9J31MDy6+qvcLi9Jexg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:47 +0100
Subject: [PATCH RESEND v2 10/32] drm/drm_color_mgmt: Expose
 drm_get_color_encoding_name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-10-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2102;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9TfPsJICnyPE31+Hej6T7C008mQBIxzh3S131zfeBZs=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ7YdK4D+jRwSz0I2Yym8cFs6ppWAkleolSn
 HCQlwv/fd+JAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImewAKCRAgrS7GWxAs
 4vWyD/91ynn74BtgRUvbYFkm0ImaDjsitRUS+6cZFBqLq5GMOqDHYGohrQhHQKlhT6XLJwzM2A2
 DrC0zLlHQy2gwkNTYJbshcP/zt9gG47bl0gc5TVYPyRIOlPamT+Mj/DQmFXVB6IYUKVMmv5XqZW
 kHGjeHo7M68Cx2dJN6cvYrv5mHyVzwAgBuyeUchDBW8Mb7EftbCFD7fMdC0fq8ud1iJQvGswsqm
 Tf1kZ+USr2UAnDie0tvZnAxy3L2O5w4T82oTZVovTU+RIzlEUqFEcr0NZrx4jaJVzbmrZYicL54
 1AjigRjU9ntVCmq9ii3fZrJBxvW/LPOndVRFkZswWtduu6D1btutts+YVxMNlEVRZBnheOE5eKI
 nrkwVjPV/UjRJ1QSgWaJCsz43EIiQ2TRzNB4H9LlOdk2Hfh2lzNprIykFGGgOlt+QCx2f5udUh5
 YCSIsrQafuTZtpwSc0HwaiVjzNMa4L2YEwv4q0Yp3EVQgRiRIDrIc3g3d0WxZ+aUIjWTUbn08dF
 j0Wb6O6LDcVfyw5xLpkG0si2q+IsAiW0vQreTmeA+uubinlLBAfFTUV6KOSocpodnPlRc68osof
 dVShjf9peW3iTRbhb+naKsfQ+D6sPZF+VY4vw5UHMyxsyqEwvgX9aLqtl7UMnxchnlp0KdeaprY
 eUmB7VJXjWySNLw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

drm_get_color_encoding_name can be useful to display debug information
outside drm core. Export it so it could be used for VKMS

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c    | 2 +-
 drivers/gpu/drm/drm_crtc_internal.h | 2 --
 include/drm/drm_color_mgmt.h        | 2 ++
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 131c1c9ae92f..b0a3be3cc016 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -496,7 +496,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
-EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
+EXPORT_SYMBOL(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 89706aa8232f..68fd5385917f 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -38,7 +38,6 @@
 #include <linux/err.h>
 #include <linux/types.h>
 
-enum drm_color_encoding;
 enum drm_color_range;
 enum drm_connector_force;
 enum drm_mode_status;
@@ -121,7 +120,6 @@ int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *file_priv);
 
 /* drm_color_mgmt.c */
-const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
 const char *drm_get_color_range_name(enum drm_color_range range);
 
 /* IOCTLs */
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index eccb71ab335a..eb55bdd33f50 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -85,6 +85,8 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
+const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
+
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,

-- 
2.51.0

