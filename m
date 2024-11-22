Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E29D6355
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B589E10EC45;
	Fri, 22 Nov 2024 17:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PFJEXr5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F54910EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1517CC0006;
 Fri, 22 Nov 2024 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Umi/Nc0PaCWgnTJXdvq5nC0lHTLO/Dv+MccW98xmYjM=;
 b=PFJEXr5kYMEyByoavROrDhb0QDrLNCjVyLbE7LUU7lnPfwm0P+87zn6m8y6Km7rikB3g0+
 BdbVx9roantQbqNNznAIOhmbW/SW7kMvTDnqdgCZlfPBLrUr1CGwIKjCYRdPXI+u/hd0s5
 gCeKxG0/b2vKU1LtE0dV/2WAi6tP5s3IUKUaRRhSZ9DEFnup4h7PJ8V1szDf7ztlf3Owkx
 yglaM7PKamqxBMQkPPmfOqVso9Uu4Tcb5g0+djN2Ki+i9UhpRXhI/6fZbvuxFD136e5uGp
 6meWwerB39UwS0N7275f5liOx1dI6q5BP9jtAdYJwEk2WELOlzu54v7WJeXLGA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:38 +0100
Subject: [PATCH RFC v2 12/16] drm/vkms: Introduce configfs for device name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-12-4b7e6f183320@bootlin.com>
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
In-Reply-To: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1Ri0TOTViTXTQHPBy7TMsfMxJ4cY55t/DcvCkNIQR34=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGslsy21ABH21B13Q+YvwSq1A/MGbJKgsbL2
 zLJCX8MK66JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBrAAKCRAgrS7GWxAs
 4tFmD/9L9XzU8tBSrGH5ErZur/taVRSe5Xv6FAgtgK3bckxOAuYLrjP+gVleufcFAYJDHBavEMn
 pnevD0nL7Gu5Zx4qOdwoNTdmR9+RcQIyJ9Dk5Dhw012UsLylzGFj2Nlc2tNti91gQ0xOapijn7D
 Pf4fmVYGwHyli+GSDcRzCia2ELSZcIv5h/rxrWP+onsV8bt971/tUYsYQYNt0cIAFlzXplkBrQH
 jVEa1Ot9NrfFSNQM8+RHbIFAGfxkZBGLlUawvRJbTKaRe67dnBjaub074puL4b0eVPDQXHVCrfZ
 QkU6q+6xOcI/16HiL3cY7vms/FnXuZZMyU00EFLWEbxDeGxjSdHiNzxRtr3rkMusqk1bApnKo8y
 MRUuwObaBXCGDJrqqIdqDAZvRAJ9SvcWEnIi8/j3uQgZyeKj3UFaFiNDY2EeLtdP7hp8HfL4xoa
 RetgJ/GEXfi/XVoQGqIyi5GIBGrJ0LHgnPXSNsC+U7RfHmUhnD/8R1t8y9SzE5TB3fVCP1TsS46
 gDa6CFoQK9u1TwkP2IYBClditq2iYRL2MgDP8EyVxy7QTmyobZspogsXChWzDTAi2YbNTkKOsoz
 FnOHj/qLmsdRJ+3v1M8zbGjO81D9j4kjmUoczUuzuVPcaskkEM9TjQDx9Iv1FqoQJhZZBhgkIwr
 TcVf9UySYfuV4zg==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index a1ddf25ab6f882ae1857bc82fb4b4a425b6d287d..dede56a8a2c1e866734f9c979c76977370907680 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1137,10 +1137,26 @@ static ssize_t device_enable_store(struct config_item *item,
 	return (ssize_t)count;
 }
 
+static ssize_t device_device_name_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_device *configfs_device = config_item_to_vkms_configfs_device(item);
+
+	scoped_guard(mutex, &configfs_device->lock)
+	{
+		if (configfs_device->enabled)
+			return sprintf(page, "%s\n",
+				       dev_name(configfs_device->vkms_config->dev->drm.dev));
+		return -EINVAL;
+	}
+	return -EINVAL;
+}
+
 CONFIGFS_ATTR(device_, enable);
+CONFIGFS_ATTR_RO(device_, device_name);
 
 static struct configfs_attribute *device_attrs[] = {
 	&device_attr_enable,
+	&device_attr_device_name,
 	NULL,
 };
 

-- 
2.47.0

