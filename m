Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C31E680C
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 19:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E646E19A;
	Thu, 28 May 2020 17:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806636E19A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 17:04:55 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id a13so11847766pls.8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3QDLjzxkd7M9KUqjGIPcBygG7uxGYVtFUrGbmOGT24g=;
 b=jJdX3nPMQjqjPMCy3PvCgI97FsITB8PRe+x824sB3Mqz21dNeIFmDEKyMRzPhl/Ghu
 hV5/s5t/8ccuNalsO9ZfRoRW05oKP6h88Vpdm7iu4Wz3hadT+JInoaon+CQAK8Q8t1Pb
 mZ3tpUWBLCcaQ5Pl1lP959clJOS/jW6XMHa+MYCJKOO+ICCh+gPWUFhhLOThWwF7++JL
 K8PFAf/TItqdCfeXl0YxTF4ZBZE1CkWIpGVcCkWPC/4r8M4YXBHtGElcZpbIpCogte1Y
 HNX4p0xW/uhRtVfhPsn9AyL2Fv1F1Z494Hn4WaAaso9MiVbKPV8O5mnAsEd9/aKITf6+
 xlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3QDLjzxkd7M9KUqjGIPcBygG7uxGYVtFUrGbmOGT24g=;
 b=sbRyCAObYC7UPN4iORoA3FpCAbSD+NX+osl64+K9Mvkfda+hNeIvKpxGHAtIFVDzuc
 8prqvHgGtfTsBRbRdObqXIY581mDW1Ru5FTrgP+/nRQBcZTdfl/wUUZsXAt0R9v3Dtx2
 PU1AEHbei31d1tE7N2ZO7BJqgzj949CS5hpUq9sdpz2XA4E5qWugkpRPlp7FthBXUK8e
 CxEKml42pAnKorqjiqQNXzhkLHR9E49ucT45+M14JfrZFYN6j86HET/9fpcKC1kWP2+H
 D25i39Bfyqeyf1gPTx2dGaIbe6SdVod2NpTVyyTH/Jc8S5TFpBcz+O2Rd1zbLkbKrj8H
 S1Qw==
X-Gm-Message-State: AOAM5332b/Xlr3R52njyifDb7rGhmxs05IuADQS63Y8zUSaEU9c15m3o
 sHEetlUmGx2oq4MclDUeOac=
X-Google-Smtp-Source: ABdhPJzxsYqiDwRtUoYkQYtunVIxV8wXSlXowktbdEfaQIiid86PV7fpBBMxhCwXnFlmMSewOzMAjA==
X-Received: by 2002:a17:90a:7b8b:: with SMTP id
 z11mr5134803pjc.234.1590685494994; 
 Thu, 28 May 2020 10:04:54 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id f11sm5298916pfk.58.2020.05.28.10.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 10:04:54 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/kms: Optimize compute_crc(), blend()
Date: Fri, 29 May 2020 02:04:42 +0900
Message-Id: <20200528170442.22337-1-realwakka@gmail.com>
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

Hi Daniel,

I'm newbie in linux kernel and interested in drm module.
Please check this patch and give some advice for me.
I want to participate in developing kernel and community.

Thanks,

Sidong

Optimize looping pixels in compute_crc() and blend(). Calculate
src_offset in start of looping horizontally and increase it.
It's better than calculating in every pixels.

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
