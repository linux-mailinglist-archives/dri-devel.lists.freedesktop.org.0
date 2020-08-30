Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5666256E92
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 16:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACDC6E46F;
	Sun, 30 Aug 2020 14:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE6D6E46B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 14:20:37 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p25so4002609qkp.2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bwWKMSkRvOEL7YPRUvfw4HtVpw9bW0LN4U6a+UXn+Q=;
 b=TufzN+pNu74PL6ESl+o6lR3qczJn4loFbgr5N0BarA4Pbscrm+frzq70lvB8EhtG+t
 P5s2t1Hjk+t0zDmsFl/Ws54uZpVilXQQW6QMU82/dV8hfLfElNMNkQ85Q9+z9NjOTfc5
 cLwagE1GrgGsVX8SLilPtnqOIYPTEKvFFmwDrhlzlvCmSDLNKx9cz7LGOH5Qz/yUf/JY
 qPWHRXFx1aMfXeezKG96O+b9V9F0b7kqnEVTHsyOAIcLfN82O16nykd1Zaks42Ipt/hr
 i6GuhouHzMMrqnbzox3VPvyRfagVOtyHNQsX6/Jr9YMzwr+Ini7soxhqfI/tQ0DDPyFp
 C57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bwWKMSkRvOEL7YPRUvfw4HtVpw9bW0LN4U6a+UXn+Q=;
 b=ASgUZA+dcBF11qtmZEA+I1+NB9j6iVTC8rLaLUVpcszvG+tVRRyanP/e42U3z+WJ3m
 wIQ6lpedeyX0XFojWKEd4yMe6AxSSn6ihd8+lyWAJ0tuN29gKmgzovVYsRcNHMJWVfCC
 xskTOh9Ka4B2326O72rx4Ma9AHHHHVkqTk5m3bKDvpyV+blNNN6ue3MWAk2AqWXol5Gg
 euA6fikM1jbEKm3dHUkRUBKp5dpZTXKSdP48u4u1YZO7ng80zJHh4pwrnp3hd2jrsWEb
 3NvWZQfM3u0EHCiz7qgpXHXY6f5wzhCk5j8yxLh8oX8uWY5kuJHSBNZomi7IM++15Glm
 zYOg==
X-Gm-Message-State: AOAM531Ej1coUff0GSwLi8Wlkc1y02cUwzzTQomRehoi6LVr/PwFD2zE
 9P+B+z9aTkXPrxR7P1GjSDM=
X-Google-Smtp-Source: ABdhPJyPJkHpOhlBfpi6mKFBVfVZQcx17T2SFL1d7NKkZUq5JJCuCkeUo76htNk/OIFP+eGug4Nmew==
X-Received: by 2002:a37:8601:: with SMTP id i1mr7332702qkd.307.1598797236348; 
 Sun, 30 Aug 2020 07:20:36 -0700 (PDT)
Received: from atma2.hitronhub.home ([2607:fea8:56e0:6d60::2db6])
 by smtp.gmail.com with ESMTPSA id o72sm5884861qka.113.2020.08.30.07.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 07:20:35 -0700 (PDT)
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/3] drm/vkms: Compute CRC without change input data
Date: Sun, 30 Aug 2020 10:19:59 -0400
Message-Id: <20200830142000.146706-3-rodrigosiqueiramelo@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200830142000.146706-1-rodrigosiqueiramelo@gmail.com>
References: <20200830142000.146706-1-rodrigosiqueiramelo@gmail.com>
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

Change in V5 (Melissa):
- Rebase and drop bitmap for alpha
Change in V4 (Emil):
- Move bitmap_clear operation and comments to get_pixel function

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 34 ++++++++++++++++++----------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index f67d1baf1942..c5b32fe5870f 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -9,31 +9,41 @@
 
 #include "vkms_drv.h"
 
+static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
+				 const struct vkms_composer *composer)
+{
+	u32 pixel;
+	int src_offset = composer->offset + (y * composer->pitch)
+				      + (x * composer->cpp);
+
+	pixel = *(u32 *)&buffer[src_offset];
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
