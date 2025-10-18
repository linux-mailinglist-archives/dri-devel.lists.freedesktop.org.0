Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD01BEC44B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3541F10ECDD;
	Sat, 18 Oct 2025 02:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="G6PTXMbJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B561610ECDD
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9F0444E4115A;
 Sat, 18 Oct 2025 02:02:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6EB9D60701;
 Sat, 18 Oct 2025 02:02:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4D10102F236F; 
 Sat, 18 Oct 2025 04:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wuzcvgdxKucfzXi8j9im5vi/vTJhBZGMa5n+dwDEVE8=;
 b=G6PTXMbJ2EaohODqgvnjVzWRhmqz/rtYZmiCb9ifBrVZxX4qToO8NttU3cVVLGoHzHc9e6
 3btjYWvTZMxCUiLEToLnyBhnC7DHTzMBWbrDEazYoALYhYM0McJBwueWaa7IIsNvkfcnZI
 lnLbMONXzDJWBxdjn1rAFNP/E17J5NKIFVm+sViXiwRDIrIE5Z4fH02CHSyDaXk7SKMlUA
 xMXyjo6yFIVV35NrilWVFORS+0ogSBM464dJ7wPYDf12SlW1Y9U9q4VZNSElnoJdjzkWhY
 0EuWlY8OKag9kIt55e9HYc9CO5F0xCnQRq5C8sQbLh0B4yR0bhArhKuzBffXJg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:11 +0200
Subject: [PATCH 11/22] drm/vkms: Properly render plane using their zpos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-vkms-all-config-v1-11-a7760755d92d@bootlin.com>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rnZm7r0xEd9LrIvetwHGtyd26t99JexCbu1jReAcAkA=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT+xoIue1CpAIt4T6KN7jou+Bm1RD5sZk06R
 Y9MqZmRzrGJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/gAKCRAgrS7GWxAs
 4gswD/9uz11YdVk/AI3/365zjvg18lMdo4jHtEy8xMti9+hcxrUil51n1yf5iwXrhkIToD6zHf4
 i/PAkjqr/R59R+btkABHQUm7fOmiVKzDLpmGXOsMBU5eXlm4g6KaPKLH/oUyd0Tax7cEaEJUJYh
 /y1JkEj1r32BYFJp2EaGl+tbX6B4FfabljJzeR2pG+1KJIrwH0U7t8s7t1WjelTSjd5DLF8/rYs
 rOrA5N7Svo4d1LYOhdOgySm+Mu8JghwH+bD6RlE6BeMEESNnUhhXHFI9BPic7l3/L2hZMbdl1xm
 Gv7KVU7hhqzRwn7iZSM2WLfk7T3XbpuA+YSIBN5DbvVcOru3fFl9aTwicRfiR+nAA6ezG8THBLR
 QUx27OZ287igzrR/0BPnJdSfE3Mjfh7P9I1qwGtaswrMeJIA+mWAoxr/cRkKezeQLe/L+LSBuJ1
 YRHU5iiDFqWXAyAmnotVNVZBZGrjuxyXIsW2bP1Icq1y5KUg9KmmXY71kpxRcK4ynmbg54JvIR2
 SAlyos/XtBMZbaxVTWcYL51ALTI/WSH68MwVbEEaMgwf3IMDOXsGxJy2x7asKcknsyntYJP6ou9
 LYkkjTs4HYygNQhyurMd0DERmZ1FUAkEARbhYW/pA1WPIAJgMEYZJ0Cc3SsO6aML4YQRA1cKcq2
 7B23EQ03kCe447Q==
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

Currently planes are rendered in creation order. This is not an issue, but
with the introduction of new zpos configuration, it is required to
properly render planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index bac0790c6577..0524c47460fb 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -141,14 +142,20 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
-	i = 0;
+	ret = drm_atomic_normalize_zpos(crtc->dev, state);
+	if (ret)
+		return ret;
+
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
 
-		vkms_state->active_planes[i++] =
+		// Order planes according to their normalized_zpos
+		// After drm_atomic_normalize_zpos, the possible values are 0..n_planes-1
+		// so store them using this index
+		vkms_state->active_planes[plane_state->normalized_zpos] =
 			to_vkms_plane_state(plane_state);
 	}
 

-- 
2.51.0

