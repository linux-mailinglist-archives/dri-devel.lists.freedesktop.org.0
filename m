Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F5A10882
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC27610E33B;
	Tue, 14 Jan 2025 14:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QElbs/CQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4C610E33A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:06:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A551CC0004;
 Tue, 14 Jan 2025 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736863565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6Ug01Oqgqhn2b6kjWiqMK+M+EZunENKCjdzBTZxkz4=;
 b=QElbs/CQM/pr9d2xRusEeCYbWqyQnNkuNwr/Hi+zeAbVUghCjdnOuXfqy5GLHPyqykfpjV
 V8aVZfHS7sBQ6Pvxu3ZxQwrPF/2bRJPgXjOWa/kKz+vCh39CBGEiJvQ42qeK4T2vX9Vhlu
 FT7jFkXBMNOZz291BBaXFMLYowPEWymboBg4BOQttsS+efTBkEp5RUQQufmWkJJhN4pE4h
 XYCLeuJmiZoRomxBKyXEyZzIZIqN3ROcKQeWE0B5vF5Xi671DxuOP+hnrIoEZKRUf7OYTc
 JptICM8OFoQMBj8Q7Ppgb0owbZah7vgVOVpsfdWB4hcnop/LoREe4XSGFiJW2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 14 Jan 2025 15:05:48 +0100
Subject: [PATCH v8 6/8] drm: writeback: Add missing cleanup in case of
 initialization failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-google-vkms-managed-v8-6-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
In-Reply-To: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Jj2xBKvZqIeVLWiarE4BBLIBzl9tolnIJ7HLBg8W17E=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhm9FgNF3J/UYuMbmAUiIIXOYzBI6CAr0+vRM6
 E/gj1T+3r+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4ZvRQAKCRAgrS7GWxAs
 4j6WD/4tdxsmlyAtJ3Y2jqZlR7vV/bWCG+TccCLbZYBRgObBYRgmzb392cDn19cNv080P96EyJx
 N4oUuS4PHYBepTgr7OAl/3UuGSebT3MzEyrUtGupYR6i4HIj7W7sS8mkUMwGhOX51ZiICCyoYko
 Rkihwlmvz4GYIhss+rnm0MLAyQpvzD6pMMr/0U8FsJnn9+DbHc0p9qZA+aTWOc0OjE3BhRuzvKa
 3CImBMYo3yJhznXDw4+WWXtF/LYZN+fUgwPPZUFuBFM1wwHkddoL7LNspA7UlQE8yKQWIRhS149
 aF/QPowMwb/sJqYZ5NY1hG8FgdgGAiieoCdezB+9W1YOI3cj6lG79IcSzyTcnqF/g/qnkuhgYcc
 kRIDxsYjLDKPbDAjDQyGLrQzcmSIcc6SC5fRJp7XPSr5aKvmavvXMi/j4R4JSk0gh1uLHfQEa8d
 wAbtOIsfroj1c6OR1VO0/1td1grDK08yrWGqhpPhoOOr9qOhX1ewWI5StoWFeazk2HJkF4v/saK
 ZXqQvlgcNbdoRA4JwfYoRyjqG+0/MFOAXs3GTjjJfxSi782bJpFt5FFtY5d6crsdpHqElJjPkoF
 kJlF27lpQ1HLWBeWR9j+d6oZ/yMu+hHDvPcdT/dfbkLUbF2t+oY7jRZovIki5ZFW+2KCtXt19wO
 +mNk6qx658BUyMQ==
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

