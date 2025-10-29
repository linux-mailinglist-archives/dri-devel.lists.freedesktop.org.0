Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FDDC1B47F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299E2891AA;
	Wed, 29 Oct 2025 14:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T5YSSU1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB51891AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 13C9FC0DA83;
 Wed, 29 Oct 2025 14:37:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B995606E8;
 Wed, 29 Oct 2025 14:37:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0FDB117F81B1; Wed, 29 Oct 2025 15:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1ieovVEGpwnQqb90fB7Ngr7zVzD1mSM9AkeaTdc+irk=;
 b=T5YSSU1wvQNqcc6rNh/2C4BRhuc+nYxcgwcnsynSEyO2CozaB/we6zQGJOTiPJ0KWPRiW9
 cYCTm64iAwoPiFWqZTprfc267INgck5jHMdPgVOBmPBFnK5vrsCVTla5qSr4ko13uUs7gP
 qGIT2cn1+xm7Xsa445PTsGnt+4q5z7bCbFkyl02u5g6y0q2lg1bdBdg55m/RRMsuv2/dYG
 RiME2wqahwCyVv4KdFmcfZS+O+uemK133VjOf6xU0RzEcwsFOx5mZEOYiOqCXlgc6gSC2A
 LibunI+puZbf2oo/xrSUWNJQ/7CkZe6lNQKs/OdA5m37So5RZAzqD4lDh4IArg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:37:06 +0100
Subject: [PATCH RESEND v2 29/32] drm/vkms: Rename vkms_connector_init to
 vkms_connector_init_static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-29-a49a2d4cba26@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3042;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=GNdCT1aWfEW/qQlyX1iY1PDslsm0v0L9+mabaSCFgjo=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ+usbluoyz+CVfmPQXVAXXfGDxuzYNqVvoa
 2ohYNQaJQyJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImfgAKCRAgrS7GWxAs
 4nJGD/4oPPsr2RLiMOtmF96vYPcdYsC+1EeKdAwcEv8q7E27qGzoniikcQujb5YvgFR+73BNINc
 I9MgDxWVRO10GJPYJAfPmJ2UVLHY7qezORxrfYLSHmOCN0Tgs5lfaAt+cjXkzhS4bVZ32AGj9vW
 1qbH2lgsREbgSTYYjX9n9PhIX7QWgo81jQpPXpt3SHLzPziN8k4iydWCWJ6XU93K2UzC1AF+SfU
 WeBKog6NZAEsrDOqiqWcvrFPl2lOy/jo02HWgoOsNRxhHlWVaukYi36cRvhRST3j7eb0nPRQ+Bi
 9IsY4diLOc10z9xDjVo+zWsE5R2Brj9iowHGDCa5kRLiY42Fhm2PKcLf1Vqz9Vr1AdCqUdLuffw
 gI4PGckVPYr4bOTY25LHxD1NI846c7IpenZ7DTLgCR93N4+ni6lb8Sl13D5fxAaPsG/Qw1x6npj
 mby3ml+AeCJjJzT/cwQUrOV7lqjXF1a8Irk2bXiyKEaNnpl13xIimTHXAeICfAGMIZmoCfq1XMr
 nOTqHcVlV7d7U0hILu8SRn4w2XOX3EggAklZKPWQq0Y1RNHABNyYjl45ekPErsgFX3CKj9MeWEv
 OAiuYqG/vkhHJ4adKUmEzhtO6Qu6txdESMFCZN8i29UqJ+VQXV5kFGF9+KTi+mLMhlgAR56dRSZ
 2/IBUzcnUtdgsug==
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

With the introduction of dynamic connectors we will have two way of
initializing a VKMS connector. Rename the current function to clarify
the case.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 4 ++--
 drivers/gpu/drm/vkms/vkms_connector.h | 7 ++++---
 drivers/gpu/drm/vkms/vkms_output.c    | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 699b6779a46c..1b7ccca2abc0 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -108,8 +108,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
-					   struct vkms_config_connector *connector_cfg)
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index a124c5403697..85f9082c710e 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -4,6 +4,7 @@
 #define _VKMS_CONNECTOR_H_
 
 #include "vkms_drv.h"
+#include "vkms_config.h"
 
 #define drm_connector_to_vkms_connector(target) \
 	container_of(target, struct vkms_connector, base)
@@ -18,14 +19,14 @@ struct vkms_connector {
 };
 
 /**
- * vkms_connector_init() - Initialize a connector
+ * vkms_connector_init_static() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
  *
  * Returns:
  * The connector or an error on failure.
  */
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
-					   struct vkms_config_connector *connector_cfg);
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 217f054d9598..44f8f53c9194 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -92,11 +92,11 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+	vkms_config_for_each_connector_static(vkmsdev->config, connector_cfg) {
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
-		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
+		connector_cfg->connector = vkms_connector_init_static(vkmsdev, connector_cfg);
 		if (IS_ERR(connector_cfg->connector)) {
 			DRM_ERROR("Failed to init connector\n");
 			return PTR_ERR(connector_cfg->connector);

-- 
2.51.0

