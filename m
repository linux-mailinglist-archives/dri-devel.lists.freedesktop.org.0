Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489169FE9F6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2563010E564;
	Mon, 30 Dec 2024 18:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BbqcSCRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C0E10E564
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:37:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A986E0003;
 Mon, 30 Dec 2024 18:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735583870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kdMq3NtV1Q5rfs52CZ3pak+GVWVcqrSS19cQV3F3L4=;
 b=BbqcSCRzUIGlYxbaLmwXSPAAwCsQM4Yh2k+UBY7DVF7K9eTO9f4B4Qff7hs2ALiZs/5qYg
 RM1IlEADzgT0mxjTUgBY4oLsZqppFpxMAmcqHWPmMvQ1iJL05AkHvMM5qW7YmiIDw9hu7R
 Jo4tGiepbAJOSd8rHF07NI46rqZEy1uwvQC5l65Oq2YZtQmfkPm7doNtavu4i5gmvKtGze
 XRlZQgx/kNouzy7QW0gJfq9EZNmYAjv5DcZ90KjWoKfIAkI5//Rsx4n3PvZRMWBaPfMX4R
 eGsQ4CiJv9lfEYafW5D9aaocSsn5ioCAnTOaji2p0jnVPafzs4uCxY5GU1o6hg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:37:36 +0100
Subject: [PATCH v6 6/8] drm: writeback: Add missing cleanup in case of
 initialization failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-google-vkms-managed-v6-6-15c7d65cd63b@bootlin.com>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
In-Reply-To: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lDpIpMGmW4xSLFBh/IPDhkS6hO2kKkwvWKfd99XUa90=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncuhygB+fcbeHP/IV7O9W1NgMz50gh9k6nBZEI
 wtKuf6Kaa+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LocgAKCRAgrS7GWxAs
 4mBrD/4oUWX/P3pWLjtGvXPojjCwdX/LNNYOG/Dk7gGeBG0mqN/6ktVZjKapfgGSks7PROWDAnV
 GqFM/MErjka6PwAdz/JYPwmqxl1zKtZobOKPQjxMS0NYiYLaz81zjQxGzZWcVXiHROKQodPIBF8
 PNLP8b6tGeiU7JiJukmgxlI9GragQ3vKpOiglhtWn15P+pEFaHjuoS5lUeGS1HaJyeHTEKciOtP
 o7pedgR1bN0zIrqEPb7G8DRyRUd+bwa3lhfpzQOt6RXi+Bel6U7g8tG55qVyHiv+9wgMhE19uwV
 BouoNl9g5BWsXXUCQyilB4gkRn3BoC6ahYR14Ttqg3BnGg0bCHL5qECowmW+lgMO1+7PwJrpkbK
 uDzjs3kegez9/tEJ2AGnNndMZGcPtfAL8htmIo9GZX3GVEGHfaqX1Cej3OA/1LBEHSFPgw27oDf
 7ZSe+p+jBbt1uIUOdyyed5GCvAexC8OYG3wu5bczVCfMhd2BdKK+CLpOaD//C9c7XFQ+bz6QGV2
 czHyba0WyR1SOXSSXWzhBlU6HhveqlKneLMZRMbNmKiSPBSvwOvJXoDTgw+mJmA6KaHrV2LJX4Q
 54tM1hbmRrqNzXDTNrMOj1izMfqVAAAwPvEeQIz17N3AtuXP9IN0OudeoLQL7PuLFvd4duVb+y3
 SWnkt0AHhJmMoLg==
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
 drivers/gpu/drm/drm_writeback.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 494400b09796d37ed89145da45d5f1e029632de5..9c69f7181e02c23dabce488405608c40d4184af5 100644
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
+		goto failed_blob;
+	}
 
 	INIT_LIST_HEAD(&wb_connector->job_queue);
 	spin_lock_init(&wb_connector->job_lock);
@@ -281,6 +283,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 	wb_connector->pixel_formats_blob_ptr = blob;
 
 	return 0;
+failed_blob:
+	connector->possible_encoders &= ~drm_encoder_mask(enc);
+failed_properties:
+	delete_writeback_properties(dev);
+	return ret;
 }
 
 /**

-- 
2.47.1

