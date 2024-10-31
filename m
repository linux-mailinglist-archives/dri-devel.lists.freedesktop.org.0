Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3DA9B81B6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 18:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E471110E42B;
	Thu, 31 Oct 2024 17:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AOQv+Joq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9B510E422
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:53:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC605E000D;
 Thu, 31 Oct 2024 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730397230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXNtTQEa6PQ4chY1V5pewNIjVgXipIVtKBwRPGWAEjI=;
 b=AOQv+JoqdeBdR9LhtvG0FYdrbRVCQS2yj37mB7CmHxeWGx4TASDwktx2HmE1K1LHkjK5Ln
 DgRCbs22iUbyYHZEHAVVKzkEknGlMmMzNrvP0BWYZ8cXm4iRDknM1ZEgV7abHRElC1w17r
 +HlYu8+0nPESVaKH/vBiaG4ua5pBqjDm0DgPhJHyLCnDVOwwfg7Fqibo+/Wq1Y3qVMf1wd
 BcThCt4AdWsbKUew12TQrzWBoqT0kSiy2mQL7UyTvYde1vHfJJ92JROw8eGclTOL3G6syf
 FOecWfcUd2ZmmyokGFeENCWqX6kRAD9/Vm2PBR6Uex0yt2xRhKrOhl9hlQmO0A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 31 Oct 2024 18:53:33 +0100
Subject: [PATCH v13 9/9] drm/vkms: Remove useless drm_rotation_simplify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-yuv-v13-9-bd5463126faa@bootlin.com>
References: <20241031-yuv-v13-0-bd5463126faa@bootlin.com>
In-Reply-To: <20241031-yuv-v13-0-bd5463126faa@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=uUawjcWkSnRz6+496bAdLII+36tesOT/CJyAg3irReg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8Qdxj/4TIdGSmYfMyWUFQIdhiq6KblD+ndAp
 eBco+NBw5+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPEHQAKCRAgrS7GWxAs
 4nN+D/0Y/PPTh8mB2hpdcBh8KHUn5+3unK7HT1v3J+RNHjd8DFXSJXb8yOeCyC1xjNBOWyPqDOf
 mbRdhBItZXGKGC9fEivrH5VaHHKCRrCtOVMQsdWsLAvupBlVu5VALJmFl2FoVqLmXXg/kWDFUH+
 Y3ArXklQC/NupCY5+bq9M4OlhfCvEoVjPbzfnoiqfs6zy6LTNQIErZXkl71Qf6Fg2pAPdN7ikVK
 ml4XfsjEFisl17wOmZu1fpg4hjHDZ9a3RseXwuk16g6TJgZKAed4qTw3PVRB2umelRfjxuSQncc
 7JOuLNPGTaFQ1V/vRl0jviqBhQmIiZ9+ym5E3SLqir1tS4WPVk0OsLZzL2Gjie3LmMJjouo8UpF
 UEPIWRChQGrSG/Pis0nuGBxEhElK+Q4xh2ltBO+xZimEp7HknoBxTXmxyLTMkbwIOMDR1O5zxcE
 ++seqV41DGbzGt/mwpXjNeHIpfvg4LirIJcHbq22oiOmYJKoFktFoLYSql+T4jLf/0pJ9TKvXvL
 SWBv6Aotea1qFEDZBuKbZp1rZ9ZTRuywXwAlQtf/CWtiC6RvSZSNnoausL16h6PkeK1GxrhR7XR
 ICw2WxUAPzK6Z7tnyOEJ+2iF3u+gw/CksZjKfjgTJBCaIaJSRC3tYwarfs5Fff7UkM8/09jns0N
 j47XNRFTd3JQhTw==
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

As all the rotation are now supported by VKMS, this simplification does
not make sense anymore, so remove it.

Acked-by: Maíra Canal <mairacanal@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 8875bed76410..5a028ee96c91 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
-	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
-									  DRM_MODE_ROTATE_90 |
-									  DRM_MODE_ROTATE_270 |
-									  DRM_MODE_REFLECT_X |
-									  DRM_MODE_REFLECT_Y);
-
+	frame_info->rotation = new_state->rotation;
 
 	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
 }

-- 
2.46.2

