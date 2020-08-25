Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF9250F15
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 04:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFAD6E817;
	Tue, 25 Aug 2020 02:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BBA6E804
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 02:32:00 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y65so1589495qtd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 19:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVrepQbKS5smnSSp+87jEgzSFfpHNiyewdFx9duqOuI=;
 b=nRvBhDEI2BV+7EkphcVZVX66VEDD/PwjhzFsTQK4NxX+EE6wLIEL664mNEQMeaUFKx
 OS1dJafMgXYxr8be451Uq1L8f1iq5lfV0il3Y1wQ7YUQhAQrqMvtH3kLIOe3J4znjE1s
 tPTo5RNXQtnvydNifkvx3L+nuKPNf/EPeNIbFLdXf+mXFzZp3AHcQDcuE9QpUXDAiJx2
 gd+Tmk4/NX3ImimYlJHQTLJcsf+SRjrFMrPOlNI6PcVZngoHv4W8XVRBTlAWJmReIpxC
 phUE1ngDlu0uCM/dUBIe4y7xLRpluQ74HrtCWtFilFkALDIZjw+M4wCFqAYnzqS1GKL7
 Ip1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVrepQbKS5smnSSp+87jEgzSFfpHNiyewdFx9duqOuI=;
 b=dPBEpL03vYMP1Qq0gy+UpZS0uTiihezqnqtDeB0aLc6hT1M89PPwWwBfH4VdUPKSbh
 GcWT9b89++7T7m1D74NmHd3TCd1kvFnwAOcBSfPEEdQDPt76ehplimb6NyoTOh9Y50CG
 qthEhRXGfXiG8A51kaexhdjxJBpgdpVxyXGs5GW1GRPMBWVeIdDwtnhzb2SjdbRvgY/6
 tVURcvO/mcm1lzKyVfGOUWzFL8Z1tEnliDVQPBV9wSHk9efdEXfGYZSwRr6GDBF8WD9A
 Cf9Ra4tTJ/4hf+wT4nXf/1jGYkNBVuCAQGWOjXzjkT0IzRcScM8GDB3SjsBTTIUoT8E5
 G6ig==
X-Gm-Message-State: AOAM531e0L8+qo5aUYFL+yX/PNVeUEZk6XpESoMermnMipdMh3yiEf7F
 okuT5jnFW0ZQMfAwjPwpxqo=
X-Google-Smtp-Source: ABdhPJyXGRbgzqM5yxyFWq1Z08wxyCE0jq38h47EW23TfJl30UMuiznhKk/MLSOCvZ8ETpHpO78l4w==
X-Received: by 2002:ac8:4652:: with SMTP id f18mr7395756qto.142.1598322719808; 
 Mon, 24 Aug 2020 19:31:59 -0700 (PDT)
Received: from atma2.hitronhub.home ([2607:fea8:56e0:6d60::2db6])
 by smtp.gmail.com with ESMTPSA id x137sm11095372qkb.47.2020.08.24.19.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:31:59 -0700 (PDT)
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/3] drm/vkms: Compute CRC without change input data
Date: Mon, 24 Aug 2020 22:31:41 -0400
Message-Id: <20200825023142.2561220-3-rodrigosiqueiramelo@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825023142.2561220-1-rodrigosiqueiramelo@gmail.com>
References: <20200825023142.2561220-1-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
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
Cc: daniels@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The compute_crc() function is responsible for calculating the
framebuffer CRC value; due to the XRGB format, this function has to
ignore the alpha channel during the CRC computation. Therefore,
compute_crc() set zero to the alpha channel directly in the input
framebuffer, which is not a problem since this function receives a copy
of the original buffer. However, if we want to use this function in a
context without a buffer copy, it will change the initial value. This
patch makes compute_crc() calculate the CRC value without modifying the
input framebuffer.

Change in V4 (Emil):
- Move bitmap_clear operation and comments to get_pixel function

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 38 ++++++++++++++++++----------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4d8bc04bb6ee..387b0690a64a 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -9,33 +9,43 @@
 
 #include "vkms_drv.h"
 
+static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
+				 const struct vkms_composer *composer)
+{
+	u32 pixel;
+	int src_offset = composer->offset + (y * composer->pitch)
+				      + (x * composer->cpp);
+
+	pixel = *(u32 *)&buffer[src_offset];
+	/* XRGB format ignores Alpha channel */
+	bitmap_clear((void *)&pixel, 0, 8);
+
+	return pixel;
+}
+
 /**
  * compute_crc - Compute CRC value on output frame
  *
- * @vaddr_out: address to final framebuffer
+ * @vaddr: address to final framebuffer
  * @composer: framebuffer's metadata
  *
  * returns CRC value computed using crc32 on the visible portion of
  * the final framebuffer at vaddr_out
  */
-static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
+static uint32_t compute_crc(const u8 *vaddr,
+			    const struct vkms_composer *composer)
 {
-	int i, j, src_offset;
+	int x, y;
+	u32 crc = 0, pixel = 0;
 	int x_src = composer->src.x1 >> 16;
 	int y_src = composer->src.y1 >> 16;
 	int h_src = drm_rect_height(&composer->src) >> 16;
 	int w_src = drm_rect_width(&composer->src) >> 16;
-	u32 crc = 0;
-
-	for (i = y_src; i < y_src + h_src; ++i) {
-		for (j = x_src; j < x_src + w_src; ++j) {
-			src_offset = composer->offset
-				     + (i * composer->pitch)
-				     + (j * composer->cpp);
-			/* XRGB format ignores Alpha channel */
-			bitmap_clear(vaddr_out + src_offset, 24, 8);
-			crc = crc32_le(crc, vaddr_out + src_offset,
-				       sizeof(u32));
+
+	for (y = y_src; y < y_src + h_src; ++y) {
+		for (x = x_src; x < x_src + w_src; ++x) {
+			pixel = get_pixel_from_buffer(x, y, vaddr, composer);
+			crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
 		}
 	}
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
