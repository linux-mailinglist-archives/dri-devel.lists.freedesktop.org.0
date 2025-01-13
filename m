Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB0A0BE58
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD4B10E74D;
	Mon, 13 Jan 2025 17:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K4XUM005";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4410E74D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:09:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 373DD1C000C;
 Mon, 13 Jan 2025 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbZGI3iaw6v64Oa62WZ9y1Ih6KJdlkQdAE3kimv6ZpM=;
 b=K4XUM005KjhqpH/9HH4dVESy0IwvaCRuK9EpqBTda8kFogIvk8edGfrNmRd0eD0tr1HJFl
 2zGvLRnetEK28w3uD48rtt2q+kSDQFA+Br/f9rNyEWsBHIUCZHzGHJ7/h8ydTihv2zfjQR
 XaixdTqxfifHIDPbyya4Kk4aenQENs8YzuJtl6OdE9suVRWuxnVnHxbGrcM4LaTwyslmvU
 uR6ffFwPUNE5Wptt0lZ9T3blgAFFVmWS55bxdlKmmgs1WHbPVPaqKhdYSFo3tKl3ckeBJh
 ByOcSvPpDgYVS7vxOmcQ73PiByOi4OhbpFJ1d+hfLI8bzldgZU9oeiyG1wh9kw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 Jan 2025 18:09:06 +0100
Subject: [PATCH v7 5/7] drm: writeback: Add missing cleanup in case of
 initialization failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-google-vkms-managed-v7-5-4f81d1893e0b@bootlin.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
In-Reply-To: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=foxH0jXApj+1fifHQDexLR3f94qCCB3NlkU9y81HDfU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhUi0KwaUmHJzaji+m3uAmNQAHwSxhRKsM5kIP
 4wL+DY0I3yJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4VItAAKCRAgrS7GWxAs
 4jtxD/4/bwSLEZbXMqBqxTJThAiDTh3uDvLMx/GFk4OSYtBWjqlzp6jeY2Lr/bK6icioC07aUzk
 M+o3afsDljkVnnIgymsMFmxiEgH8pFPp4y98pUo1geWk+RjjwoL5MEWAQ9UVosUWzAvnHxLEVDW
 9QgY3e4qS09Q9ugWiFSOsVhz5qNnGs8dy8rNJkrR8xlaeUDcRlKExphznTfwQjuUI3J0SvP+XFj
 ueFWpCMzJnLKuCnQJUToph4jKgXlUCz0i212KxCMYKGgz0fCJOGaMKACYFJfK/wR5qu0PwTcgXz
 gJ+R3xTUGl8vRt0Irj/txNJ99+8qgdgVZRby1FP1alziWkLuPAJyt2wRR91IEftFwfgqv5OzDGA
 f2Ljd3wOVa8CMTh7J/zLF5lTBcHlbyzLPs2BW5toMv3jiKBNTSHGIPr+vq+7T3uIgLCm30VGexm
 26pY4IZ+w32Isq69Q1+gHvgVXV1H/Wxu/vbSvsXNhAcWjiX/4/vabf1Yj3kBSC5NBHZk9+gHTUK
 ii87Nt+LQgU/neGn8hADww8W314iJac0Skov97jlol2gcCxfWkFFEis/wWoOOLwvRD1VefKUKGo
 W4cSTnFtk36lQG5qCBNjeR3YF8gGGoWy0bvWR/6qLVmyU68Tb/uvNh+KZGvNNbvug3UHfNiry+3
 9BQPKVjxXcCc3Bg==
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

The current implementation of drm_writeback_connector initialization does
not properly clean up all resources in case of failure (allocated
properties and possible_encoders). Add this cleaning in case of failure.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 494400b09796d37ed89145da45d5f1e029632de5..b767184289222353489b21416a3329352c3bdfa0 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -247,18 +247,20 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 	int ret = create_writeback_properties(dev);
 
 	if (ret != 0)
-		return ret;
+		goto failed_properties;
 
 	connector->interlace_allowed = 0;
 
 	ret = drm_connector_attach_encoder(connector, enc);
 	if (ret)
-		return ret;
+		goto failed_properties;
 
 	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
 					formats);
-	if (IS_ERR(blob))
-		return PTR_ERR(blob);
+	if (IS_ERR(blob)) {
+		ret = PTR_ERR(blob);
+		goto failed_properties;
+	}
 
 	INIT_LIST_HEAD(&wb_connector->job_queue);
 	spin_lock_init(&wb_connector->job_lock);
@@ -281,6 +283,9 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 	wb_connector->pixel_formats_blob_ptr = blob;
 
 	return 0;
+failed_properties:
+	delete_writeback_properties(dev);
+	return ret;
 }
 
 /**

-- 
2.47.1

