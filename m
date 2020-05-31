Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D81E97CB
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 15:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8373989F61;
	Sun, 31 May 2020 13:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797B89F3C
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 13:12:52 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y11so3144964plt.12
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 06:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eYCtR5XyB8uUfd8xXmIEoD6CXSCHEWmBCVrdsJOKI14=;
 b=EuOaIXRX6UNAuI03P+SZF1/kwWXLjvWjU6NvoBr9uUNG4FOzQU1lO6NzHGii3nQ8JZ
 CHn6Pch07wPHqTbrLYFdCOci6KiUUCY8PdLf9tHnX1V2uD7wWuzYgc0EYBRNjoOrHna1
 STUM+LzTB3cu76b3OZXoV4XojZpQLzAn6L+oesG9aRZaV6EviTh8uhePndoMq8Ze8V0Q
 UYimf9+zaMxJUNN23PkI9m6/x1BQ7oeiHl4KnTYsZKcuk4s0QUfinQoYB9micQ3rn88L
 ZgQ8gFH35v1ojC9Xd8pagrCxKlu4ILHPV4yr0fmDDiRyoFW5a64+jgdinWXqN6Zh+tf0
 BNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eYCtR5XyB8uUfd8xXmIEoD6CXSCHEWmBCVrdsJOKI14=;
 b=TVGIj73FB3/85Sxji1XxaxjeqkePEBS+RZDzGpJitg9NL5La6o0leABMRtfOUM97bS
 3vxcw8XCQwuMpqPCLH5rO0ZfDugwq19yWPecKHlmdywAa+NkkOLQmkKULqu88iHxzZZv
 PcSOpiy94SHED8fr9Y4R3L8Sp8oe29tTuDGUKPF18vxF+S4lcvRhC0ltHP0+MFaiXnkk
 eqlTLJPwR1hMMIINzpawuDJRjGdjqs/qy5xpfP/+y9VvEnmpITy75iYr1PVJhfs8mCiL
 xF1bO0f6sl+ycGckuTC6jnqrOVjto+47qSUOek1AmgZlwuntoNgUDXo5wmywj3QgXP10
 W5JQ==
X-Gm-Message-State: AOAM533ljGL8xoqfFykcfSgmwFjHAfIzMMnQWk4DpPGbZ4QdFtcDfDAm
 Wg4Oh2Am4oVbk3vyX+2jp4U=
X-Google-Smtp-Source: ABdhPJwmBYcznNqHHUuDeCfeV0pjzcwW3UxmM/z91hCyce6BMJ4xyeq+jeXmmXW4udl7uC11ysMPng==
X-Received: by 2002:a17:90b:28d:: with SMTP id
 az13mr16251573pjb.67.1590930772433; 
 Sun, 31 May 2020 06:12:52 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id m2sm4701573pjk.52.2020.05.31.06.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 06:12:51 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/vkms: Optimize compute_crc(), blend()
Date: Sun, 31 May 2020 22:12:37 +0900
Message-Id: <20200531131237.24781-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sidong Yang <realwakka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Optimize looping pixels in compute_crc() and blend(). Calculate
src_offset in start of looping horizontally and increase it.
It's better than calculating in every pixels.

Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 32 +++++++++++++++-------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4af2f19480f4..9d2a765ca1fb 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -28,14 +28,14 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
 	u32 crc = 0;
 
 	for (i = y_src; i < y_src + h_src; ++i) {
-		for (j = x_src; j < x_src + w_src; ++j) {
-			src_offset = composer->offset
-				     + (i * composer->pitch)
-				     + (j * composer->cpp);
+		src_offset = composer->offset + (i * composer->pitch)
+				+ (x_src * composer->cpp);
+		for (j = 0 ; j < w_src; ++j) {
 			/* XRGB format ignores Alpha channel */
 			memset(vaddr_out + src_offset + 24, 0,  8);
 			crc = crc32_le(crc, vaddr_out + src_offset,
 				       sizeof(u32));
+			src_offset += composer->cpp;
 		}
 	}
 
@@ -61,7 +61,7 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 		  struct vkms_composer *dest_composer,
 		  struct vkms_composer *src_composer)
 {
-	int i, j, j_dst, i_dst;
+	int i, j, i_dst;
 	int offset_src, offset_dst;
 
 	int x_src = src_composer->src.x1 >> 16;
@@ -73,21 +73,23 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 	int w_dst = drm_rect_width(&src_composer->dst);
 
 	int y_limit = y_src + h_dst;
-	int x_limit = x_src + w_dst;
 
-	for (i = y_src, i_dst = y_dst; i < y_limit; ++i) {
-		for (j = x_src, j_dst = x_dst; j < x_limit; ++j) {
-			offset_dst = dest_composer->offset
-				     + (i_dst * dest_composer->pitch)
-				     + (j_dst++ * dest_composer->cpp);
-			offset_src = src_composer->offset
-				     + (i * src_composer->pitch)
-				     + (j * src_composer->cpp);
+	for (i = y_src, i_dst = y_dst; i < y_limit; ++i, ++i_dst) {
+		offset_dst = dest_composer->offset
+		     + (i_dst * dest_composer->pitch)
+		     + (x_dst * dest_composer->cpp);
 
+		offset_src = src_composer->offset
+		     + (i * src_composer->pitch)
+		     + (x_src * src_composer->cpp);
+
+		for (j = 0; j < w_dst; ++j) {
 			memcpy(vaddr_dst + offset_dst,
 			       vaddr_src + offset_src, sizeof(u32));
+
+			offset_dst += dest_composer->cpp;
+			offset_src += src_composer->cpp;
 		}
-		i_dst++;
 	}
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
