Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9A9FE9F7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B8510E56A;
	Mon, 30 Dec 2024 18:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Bcomze7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE3E10E568
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:37:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 594E4E0009;
 Mon, 30 Dec 2024 18:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735583872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRkeRn6r6X3xh8jLYGJ4zo8IwwZgvPnTh4x0qrq6oH8=;
 b=Bcomze7tL5oNotzwBmMPOZCtqawdOOfiJ+oJEBrfsronhpg4WfjLXnyeUpwNEJ7x77blBR
 E9MpVuwM7d6SLQB1xzgDZ2I04p7FQ1u4Qa37jClHzLC2khDGWSL0Zg62OetulqAVLTWW9f
 asaXge0WI6DElUV3Oqwqg+dC1vkoBB9zIRZrrScx582QvBbEVrd+fAzH4VYc+wVORJDIaj
 ME6cckn+UXSGz/RD2xxQVLEPhNa7lDKokkQTPxitMqMBHciGtxG/9AZcVWLiNqfU+ZyTZM
 abIGkX89Hc4sPTRYAOoFwmCtoR5IAe7c2Yn9A9b0g6NQYLy0+hUBfTdJDkIPNw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:37:38 +0100
Subject: [PATCH v6 8/8] drm/vkms: Switch to managed for writeback connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241230-google-vkms-managed-v6-8-15c7d65cd63b@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fH9+AvVDweyUZN0EnLMOj9Ap1SMeKhBjWS+wS7MANfo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncuhyBIBUSDlz44FD50cpIKLtdaHSEkAZ7nFbw
 J3SBHVjO6CJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LocgAKCRAgrS7GWxAs
 4kEOD/9dx3DoP89o/TmI2BDs1h/X3kYhnliFbaDOiSxjbrGGWBtMbRWAjmd4yO7wRpmrmPWBe/X
 obmsMR2QIHr5mWJhBtOOT2s51LbLPzopmHA/5wP89Oy5sowz4tPnS/SAi4cP6C/9rd1tU8aHIMM
 hlFMzq2cEnP0ijyRYmBE9y4egk4akzvokUisPkJ2X+Vb39I2gaur8BoHvbpaRB+/aed7GZX1hL5
 SSbK8/KxMj+at0hk7gZ9J9WexYcGyzdY0pfdpSESrVdOVGDPwPJPSFaATjL1iFevMDmcgCRY9Aa
 8c40bYr2qAlwwP/xkKKjigv6tSEQ/NDRRB7RAJbzBuI/uBDpfbHjcZ7NZWEmSDkYuJvlFsxmbqm
 IEfjQNWfMJi1jkIUnJQHg67ZcWInfDGiy0y1nWaYlj44ydJKqNrfW3j6Dm5YDnY4f4nXfSomwuj
 SXT3a01DJlNrRvWthlVfzeZA0nyndYQf5cDcp+gjI0qTzme6IX8tkgaqp92nKBgmUS1eePzNIPN
 nIfMBosGarv3gSyDuWZMOE/JHOwWUwpY1/zKhI40AeDyGHcveZ7vWiW8zkHwRJobWTaOsTrlvMI
 kG6K1wxiRlvOU1CseUlUmD02Hm79r07D2Q3zTXqtjXlXUpjt9q8ps4FSHopX1a65iDSr13UhW8M
 Yi004PkNKqyE0FQ==
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

The current VKMS driver uses non-managed function to create
writeback connectors. It is not an issue yet, but in order
to support multiple devices easily, convert this code to
use drm and device managed helpers.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 79918b44fedd7ae2451d1d530fc6d5aabf2d99a3..f12417b2d24803a33e4ff56108cc89704a500faf 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -24,7 +24,6 @@ static const u32 vkms_wb_formats[] = {
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -169,10 +168,10 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&vkmsdev->drm, wb,
-					    &vkms_wb_connector_funcs,
-					    NULL,
-					    vkms_wb_formats,
-					    ARRAY_SIZE(vkms_wb_formats),
-					    1);
+	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
+					     &vkms_wb_connector_funcs,
+					     NULL, NULL,
+					     vkms_wb_formats,
+					     ARRAY_SIZE(vkms_wb_formats),
+					     1);
 }

-- 
2.47.1

