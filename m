Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1B951E4D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 17:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD57810E4C5;
	Wed, 14 Aug 2024 15:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EtDRzC5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9221310E497
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:16:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 768286000A;
 Wed, 14 Aug 2024 15:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723648561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Wko6E4xauEKtnSS+VtA8L9zWLyLrg2+6EVQu8Spj3Y=;
 b=EtDRzC5+Ss9Oq+2KQNkKy8at1k40UMvePEDL2U66dQBb3+Y/2umeU+6Ky5yGt44JHToADt
 W/xXuK8YiRbkcV8TG7EhBAFlxfSUN8oV7nVDlUCWOD4wyA84msi4Zx9/CLbSCYNW5839Kc
 ZV4lWJm60PtlS6NEibbEYXFcuaoUjVa7M4XirybCgCIdLHgFltCHEt3Is/1Xd2NxEzp4lp
 B47rUNrPMmtvCxyccAeJmAWbrgztW9eI+iPrBifmVsercwtOYskISrQC23V0QKV7bWbP+m
 FjuqYtXnzpXqY7g9ZkmKUUqmaCrcOUr4JAg/HMpReen8zytzXftUzS0VHBGGOQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 17:15:48 +0200
Subject: [PATCH RFC 1/7] drm/vkms: Add vkms_delete/create_device helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-config-fs-v1-1-8363181907a6@bootlin.com>
References: <20240814-google-config-fs-v1-0-8363181907a6@bootlin.com>
In-Reply-To: <20240814-google-config-fs-v1-0-8363181907a6@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=KBDfEXrg7EsnVFW5hE1grE5/QDKpIdyCTzXK1gODbho=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGa8yi2jOTyL9U67CP+cMHFwbfrbUNg9XtS1i7neBOhqybYoC
 okCMwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJmvMotAAoJECCtLsZbECzi1GkP/2jx
 3MbwfaNkXhRdgz1oHQ1pLPqJoCaEIJ8M4VnLuC07CWSvDeF2zPxhTYWVhAdXP25nf1esGS7pvSF
 KryjPMVcZNn1OPWNiROOaQSAw8Zz7jiFP/kOXYOX4HFf5RHwN9JYglq3CdS5PP3K0g6xiLd3bEI
 SEPCDzS05qaA5Jnra13fxzVclYKKfUVuP5Zcbg0jFYOv6a7XEakTaDtgKYntE49dHuBOrQaOHoy
 JBHw1Rf7/mLTT2VlDqD82zC59Htq9FYAxH+U9iU+EwrFoCC2FV1bLM8DvUjow8UI8no6ecNwrYU
 aIzUkpn1Xkib/vKME+gbf9tIFLU4ecfJorqbMKy7cLCjLLbiO0HA3l5lVfgWJZKwN1Xz8T75tlg
 LfZf1ay3ytAzVyxk6pcLMUBYRDmjiQYayyMFNfGgedt+uSOwku806dh/IowEgIKhKK6JJxwBLfW
 701uC0HIEbQaiNrmp1ONZKB9pTcy0R4FqGdNrOD3zUbSHzA8N/UQV1ZbUn7zX8h4zAZz7LzdaRP
 s6+ksDvZfvHoyptgfR2oRXNyfgF5GyAneD1LQrIUhoKDI/guVRGXDqwWGldhw20mfncAVUTRFwf
 +8tHiqcAdQ3JLkuwE9eoXAepS87ayXzdmSc1Qp5OqP5acrcIOei/0SE7yBzwn7Cf89Bi9XuDBq9
 iXc/u
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

In preparation for introduction of ConfigFS support, expose the
vkms_destroy/create helper to remove a vkms device.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index cd3920270905..9ea379f4338f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -264,7 +264,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
@@ -331,7 +331,7 @@ static int __init vkms_init(void)
 	return ret;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 64574695f655..0e62c6b6bdbc 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -41,6 +41,9 @@ struct vkms_device {
 	const struct vkms_config *config;
 };
 
+int vkms_create(struct vkms_config *config);
+void vkms_destroy(struct vkms_config *config);
+
 /*
  * The following helpers are used to convert a member of a struct into its parent.
  */

-- 
2.44.2

