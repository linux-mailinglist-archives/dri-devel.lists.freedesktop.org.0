Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4DFC1B405
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198CA10E7C1;
	Wed, 29 Oct 2025 14:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m2zA1bez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FDA10E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:36:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BF845C0DA85;
 Wed, 29 Oct 2025 14:36:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 225BF606E8;
 Wed, 29 Oct 2025 14:36:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3A265117F81A9; Wed, 29 Oct 2025 15:36:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=i1b8cguAuDAWMh3z6p1IfLyIILSme00GdU6qG7LpcBQ=;
 b=m2zA1bezwoqu3zurDoQ94Z5MtQt6uLN9OsCUsArtpwfXXiIFfNaGkLlvjsLUXcLlsDkLcH
 xBY5DDrNUWOTsMyGyh8HMDsyklmAkbLXLPd2AaemdMj9/e0LVeok/D/44vnyDQqZf3Je2m
 z+b1bnPysc9N2OOlSUjNi7/jYVgRv9NLkFvUsGRZAeQGmGME5oUTFOpr6H9M/iPD8abIB2
 oFE+5mAiMeNI6BuPZkGANTybIeOSxYAPVGtRxIOVAUyrFB4pConqjD7KtXkcTd9bdfnu4I
 5i7oDt7fG+kwV3lcFeX6PFk9DF9odFM6BnpStzuv2YE3r8k/dkA9hnZnRadNSg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:39 +0100
Subject: [PATCH RESEND v2 02/32] drm/vkms: Explicitly display plane type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-2-a49a2d4cba26@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/zJLRQgbJlUfEK19hPalGGNnAJ4C2mB7Maijaaat2XM=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ6YJtcz0xN6TVwjzGz36c3EzPxXjnLyF11C
 6Mq0zX0FmWJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImegAKCRAgrS7GWxAs
 4s46D/9Fu1frCAsfKOM7QS8UpkoROepANkt+RonasMS7MWBI8erXKXen5s+F9GS5lqbIvayZOFb
 JSzi1MVo6leKw4U9af2+CDZpWNZAvay6mH1Aqyd1ApolQQc50bxAmiLM1qzcDT0dGaA8tnCyKMi
 TRomV6xZ7pG5SQN9G+mAJek3B11bzE/AjZ2VEZaTHHC1EsvM1OMD8Q1FX+MvgDjniTlCuvd0B6H
 GX49YmYESYWmg/QDZvny42k/J/h0GMgV5x41l/j+voj4gWAkiGE8wEpS93m3Yi1qrQBxtErS2cI
 KfKb1VXbKovaig6Pw/EYiV+XfRqcVGe8FeM+wEZBYle5Nr3iPjOWzhY8D4+rb4X1PYVSZOw/qkB
 FOWyxyFotriE+f8SqKn9HScLxxHSYxNUS6qyMf2TvQIGpgvDjVXM874XIxFBM6DoVih1E7MaTxS
 scMAdkL6d9D9y8OOiVrBm+JjOQbvDKZ6hE+SktDr8Dh8fKwen0KwBmDzkVtEk/JVppJTEws/Kjd
 qaEdTuCOv8oaHzRViddQ0sF8w+xzb2MX1FFd8ExmNcqJokBz6wE9J7ImVl5o/r1E8tnJQCAK066
 GCKorjhZo80MkgbP6LgHmSIu7o0PttIZCXO21nOWm8JyPRI28pbte075AjjDhlObSbRnMj3OICx
 3lEZzCoyjaHs3fg==
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

Debug information are mainly read by human, so use full name instead
of values.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index f8394a063ecf..cfdd5f32f234 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -348,8 +348,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
 		seq_puts(m, "plane:\n");
-		seq_printf(m, "\ttype=%d\n",
-			   vkms_config_plane_get_type(plane_cfg));
+		seq_printf(m, "\ttype=%s\n",
+			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {

-- 
2.51.0

