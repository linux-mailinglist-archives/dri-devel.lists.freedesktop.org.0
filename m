Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8389D62E3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE5910EC30;
	Fri, 22 Nov 2024 17:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nam5ZBlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0167610EC25
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D50771C0004;
 Fri, 22 Nov 2024 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OagiUe3HQkEQnTAKyPtfCFjvpKrwiG5lJesDAbGKips=;
 b=nam5ZBlBu9x6QJVWFD7pv/e3fDvcDmeSGjXbqup52uhxIvAvwtf7Adp7QaYLPhceBb3zyA
 In3rKezJKCf+K2CKHhDJLh/Ov7r8gttdJdou/1kuuH7FoQyTlCq+rxYheZI2AogqYH2Sya
 IuudRhhp8ggvfF3CEUWQN2aid9pJQhBO7hn/Rzlp433K/LGXUhL393CO9AcefGcphF5NmX
 T75AtI/IH7m6bXNf/nn+XzBfij0W5JBT8Rw095Mk3BA6OXUnABwscPBnlvtIeXF+xPKRnH
 ePJvcTT15Xg4SOS6DoZudMrQbmVgQeo+/a/5O3KNg5MpoDrjd5rWZgRv6ROfxg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:18 +0100
Subject: [PATCH RFC v2 14/18] drm/vkms: Introduce config for connector type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-14-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=4AJ4w6rM+OS5dAB1iXM+yakMJb728HKc9lH7IWGkbyM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1QrUbvw2eJYu9SVKJZjEJyrfnmhHUtfq/Ni
 UVC+DS86YSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9UAAKCRAgrS7GWxAs
 4ow0D/9PQENsHV2apPCplfO5JJtA5o8LYAwa2uy7sRHYkDF+uWDvsEsthJOzq3/r89OIqsYxw5m
 jPzVfuNZNc/K7KQFptV/XWaax7EOtIkO+WNxFdcyNZpjY4aDl6i0jLtPnYLJNwmpZBolGkewEy4
 r4dHuVSaGVxyLKhxn4p4oQZy9h3bIzXkQ3Jjqz2hzSJ7vsPTHdSnJElkM69i+3YniCFNX6geAe2
 TBh9QJ2+ZLfoAtK0PnisvjtXWW6Hc2hyaoF/A3KrjpQJZt3lZy2I6Zf+JuiaG/MsX1op+EOF5Va
 5DWn5f4+iRAZRMHs6HVs3Zx7DrG84qYwOCQD9qTUaLyxoRRvVCnxnDDwFMKZUGUsgTu4NaoBte8
 HnYvCSCoTpF9ktjgTJaNS7oWR5IvSLG/ew8Lu3qvWXriIY4lBD1oS0PqfMJJyKpoxwYN40uQQQa
 y7SBka1TZH2rIaf6pXp9I4dcLKaM8DBzGO8tJ/iwDRt+s/CIJWm0U4BhfShJHU7okgOjwXUrAmB
 uZxpQGIXgh3B8459rAOzQoq1JiJoXUqBZma1/tyZb5EGzxMTZINofd+A6fGtdokCgY0tTTQw9WE
 Ynv4R5l4ILrB6i+nx9ghc0yl4iWJWI3v+fbLfpTjViY2paRfCvoTL+4OzyDrh87Ekud1PmXgy5H
 YAAWU+zEkyb25Zw==
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

To allow emulation of different kind of connector, make the connector type
configurable.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 1 +
 drivers/gpu/drm/vkms/vkms_config.h | 1 +
 drivers/gpu/drm/vkms/vkms_output.c | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 998bdc50405116507e9cefd72a7b472c4c17e36d..c3334d3d808e5fc8cd6d855e9e1395f94f157ffb 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -151,6 +151,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *v
 
 	list_add(&vkms_config_connector->link, &vkms_config->connectors);
 	xa_init_flags(&vkms_config_connector->possible_encoders, XA_FLAGS_ALLOC);
+	vkms_config_connector->type = DRM_MODE_CONNECTOR_VIRTUAL;
 
 	return vkms_config_connector;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index d64024e6682d217f7d9265f436ff2e6135860260..c44bcafc3b34e1997f29631fda42af05e1c0c2ba 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -108,6 +108,7 @@ struct vkms_config_connector {
 	struct list_head link;
 
 	struct xarray possible_encoders;
+	int type;
 
 	/* Internal usage */
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 90c0fa8eba53bef4ca80c374b40d69b0de155144..aea6366fd9a662483ed5a255d02d5025a30297f7 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		if (!config_connector->connector)
 			return -ENOMEM;
 		ret = drmm_connector_init(&vkmsdev->drm, config_connector->connector,
-					  &vkms_connector_funcs, DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+					  &vkms_connector_funcs, config_connector->type, NULL);
 		if (ret)
 			return ret;
 		drm_connector_helper_add(config_connector->connector, &vkms_conn_helper_funcs);

-- 
2.47.0

