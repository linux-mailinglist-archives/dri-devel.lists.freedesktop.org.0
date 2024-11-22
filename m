Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C79D6354
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9C910EC3E;
	Fri, 22 Nov 2024 17:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Se1wBB0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A27710EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 039FCC000E;
 Fri, 22 Nov 2024 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6erMn2IUOhaxEwt1K1wXIPBMHYHP3JAfl2LkVCXhdgw=;
 b=Se1wBB0CfL05V039gAnQwVm4ysoe/oNJA4y2USukCRo4WWyDO0tTasCJyHeI9yJzeYl4AO
 HvLx5L/slO0m7Sy4meq+HXVzdeIFhGXGnDC2BbCu/oGPPopuayTGKiYLgaE4AXkwOHkXyD
 PPTOpjTr99dDUTvRvBNI14g4uJq997IiZVIVrQMDAfi/xBF0jh2J4y4fhAKnR0XMXhrbkW
 h8v9d446GamA+dF6yhERLyyjupCB9e/9LzHav/SdqZ3dYbjQqj7gdtGvw5mnsMzj0+EZNU
 pe/uX6/QJ1D99qtgLo6UtKANbwf6Bj8i/LgZx6R5fw6Plv+p97xjkJF6LBY6/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:36 +0100
Subject: [PATCH RFC v2 10/16] drm/vkms: Introduce configfs for connector type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-10-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2904;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Rr7dRz6qR+bWqme3mPmuGeLQenp1Ju5aXzM4IVaRvVU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGsquDFewtGtygWdwqthIx4WNhQNyLz4q6EC
 vzWJQaAfVyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBrAAKCRAgrS7GWxAs
 4h+1EADN//gYSaiCxSp2uNlRbSG7UAsk7EJDgaI5v/2RAxGi12o78+6I6P1YjTt/Jt+TVcKuJsK
 I4jnRlRs7IM3hR+KDcNT4dlXpaNsZrzSBGleFoIDDNJ5lkcCDGl3yEjFCzvJvWagSdcmFgoOYBW
 390QSXepY0uSjUDT1D/gT4OLbpuKI/rUzDJ+eh/GAkE9uhTy16PP7ftacrxrEjO6P9MFtamcHrn
 +XrpYJlKBQ8gPTbwN9Ce3cfJptBbuampjRh8LIGR953phBUQNx+/CVFHpVTGncD90OwmVwz+DHh
 SFbm3tERLDNqxZlH/gpSdPk63m/6wnhcUHfgC+6C30M4U+hPH5LCosNdty+yO84sScuylmPOOMz
 ETJFuMFUz8xdWN2bgKsgEfUltxyMdc42fgzAuSqaAoKaHeLa7tYT/U2rvKL1QzS1h2/j42/6USf
 zPde0uvshSVLgy0KIwYWD6ggPOG0xTY+OkgSSxdLwWW3PKHaFn912B3bmDExgMvcanLka+5ntfo
 lk3ZYg0XG15dd69udv1jQGiWLsiYBTZIygTjIc2Ck30txq3/kHSJYZC03s1IX8gytciOCNXrYO4
 TnQFQnLfR4L2RW6UykrRe3loJGLpIVvcXK8+bXrFmUsA2oFruwvGuuFK2yq+2QbVGpARoBCZUd9
 GTcawk692SaFeMQ==
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
 drivers/gpu/drm/vkms/vkms_configfs.c | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 94c288514172b88d06c2b74e36569c6d55383782..ef9a00c41b7b030d0d60ffe078809f9799539f40 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -843,12 +843,83 @@ static void connector_release(struct config_item *item)
 	kfree(vkms_configfs_connector);
 }
 
+static ssize_t connector_type_show(struct config_item *item, char *page)
+{
+	struct vkms_config_connector *connector;
+	int connector_type;
+	struct vkms_configfs_device *vkms_configfs = connector_child_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	connector = connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+	connector_type = connector->type;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", connector_type);
+}
+
+static ssize_t connector_type_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_config_connector *connector;
+	int val = DRM_MODE_CONNECTOR_VIRTUAL;
+	struct vkms_configfs_device *vkms_configfs = connector_child_item_to_vkms_configfs_device(item);
+	int ret;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case DRM_MODE_CONNECTOR_Unknown:
+	case DRM_MODE_CONNECTOR_VGA:
+	case DRM_MODE_CONNECTOR_DVII:
+	case DRM_MODE_CONNECTOR_DVID:
+	case DRM_MODE_CONNECTOR_DVIA:
+	case DRM_MODE_CONNECTOR_Composite:
+	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_Component:
+	case DRM_MODE_CONNECTOR_9PinDIN:
+	case DRM_MODE_CONNECTOR_DisplayPort:
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+	case DRM_MODE_CONNECTOR_TV:
+	case DRM_MODE_CONNECTOR_eDP:
+	case DRM_MODE_CONNECTOR_VIRTUAL:
+	case DRM_MODE_CONNECTOR_DSI:
+	case DRM_MODE_CONNECTOR_DPI:
+	case DRM_MODE_CONNECTOR_SPI:
+	case DRM_MODE_CONNECTOR_USB:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &vkms_configfs->lock) {
+		if (vkms_configfs->enabled)
+			return -EINVAL;
+
+		connector = connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+		connector->type = val;
+	}
+
+	return count;
+}
+
+CONFIGFS_ATTR(connector_, type);
+
+static struct configfs_attribute *connector_attrs[] = {
+	&connector_attr_type,
+	NULL,
+};
+
 static struct configfs_item_operations connector_item_operations = {
 	.release = connector_release,
 };
 
 static const struct config_item_type connector_item_type = {
 	.ct_item_ops = &connector_item_operations,
+	.ct_attrs = connector_attrs,
 	.ct_owner = THIS_MODULE,
 };
 

-- 
2.47.0

