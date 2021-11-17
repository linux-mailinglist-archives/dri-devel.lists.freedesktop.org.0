Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E744548DB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD738897B5;
	Wed, 17 Nov 2021 14:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 647 seconds by postgrey-1.36 at gabe;
 Wed, 17 Nov 2021 14:33:05 UTC
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD389897EF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:33:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id E295B419B4;
 Wed, 17 Nov 2021 14:22:11 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/format-helper: Fix dst computation in
 drm_fb_xrgb8888_to_rgb888_dstclip()
Date: Wed, 17 Nov 2021 23:22:06 +0900
Message-Id: <20211117142206.197575-1-marcan@marcan.st>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: stable@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dst pointer was being advanced by the clip width, not the full line
stride, resulting in corruption. The clip offset was also calculated
incorrectly.

Cc: stable@vger.kernel.org
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/gpu/drm/drm_format_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index e676921422b8..12bc6b45e95b 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -366,12 +366,12 @@ void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch
 		return;
 
 	vaddr += clip_offset(clip, fb->pitches[0], sizeof(u32));
-	dst += clip_offset(clip, dst_pitch, sizeof(u16));
+	dst += clip_offset(clip, dst_pitch, 3);
 	for (y = 0; y < lines; y++) {
 		drm_fb_xrgb8888_to_rgb888_line(dbuf, vaddr, linepixels);
 		memcpy_toio(dst, dbuf, dst_len);
 		vaddr += fb->pitches[0];
-		dst += dst_len;
+		dst += dst_pitch;
 	}
 
 	kfree(dbuf);
-- 
2.33.0

