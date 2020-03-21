Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7276418E47D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 21:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B6F6E362;
	Sat, 21 Mar 2020 20:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CAB6E362
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 20:36:49 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a43so11571037edf.6
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 13:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=ZZ8vMEMrPzAmCCEBSbU8aR5UX0QpU9PFQ1YG0DRV08Y=;
 b=IttaYxyjD1JYhBBOqIdM+9UpYtHnFoKk0/PzLFAQvrnz1/GlrqsgArmSJ9zmLkoNHl
 le8t7zck7thQKq+I30w2OlvuVkPshfI8avRRtZOSw+ddn4jWuCIBkl1s97bXBa+CQBVE
 ly/Lxh+N/wFaFtPYpv3Ag/QXfRMVrR/tUqXYH9vy3u7cKliybR6MHGPrzH7RnPdrI0CI
 HKhYdDYg4YhiWY3YRZlq5ldLK7+f7dnwl3EQNV41eGg/w5HScKZ6iq1AKIop2XAtb9Cw
 IVud8nbkuDvbjvZfn669sQMyxPkbQZZavuiYtBnxcB57F3G+SxyBJ0xM9rmTEE6DSW+m
 UINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ZZ8vMEMrPzAmCCEBSbU8aR5UX0QpU9PFQ1YG0DRV08Y=;
 b=VGFTEu6Db22Pe1Pe8ST9RaPXhe76LhowmxnS8Ug80te5vk0UtXQsSSbZcKaNtyfkKO
 mVUCKsU0PmfpdmMCqn//sfkS9FACHmcV9pL1cbVoqa1FULJhcXHZJbkcKEYwIBooU+6j
 5ke7kIkUxnchBXpfTvdOEHcxzOFBu1uh+MEzVhnybT9Lkyg3uUw4IZIEDpuaEZmiWcR+
 gAQHswBQh1FE7TpzFCahB3cqgd/FA1dR9xiuVO13xutSL28zcAqy2Wq7z7nCY96oDhcE
 yOFfuOi7+NRpHssGtNAoSd5hnow4eW8d0MiHn7jRVOFTUREY+iUu9V8/BmhVTAPM6tSX
 nnJA==
X-Gm-Message-State: ANhLgQ2K3lnAkgEk843FbUI+p926AVyE0r4qmaIOM0/ngtIuxgWoK1Di
 x1BW4BRoMFA+OrGgoQVIGQg=
X-Google-Smtp-Source: ADFU+vukBYjeON5F6ElcikyjD2ci8Wh81K5f1NPZQSPa4qKB245eQEJz/JeGy420N6MHU+jzMww35Q==
X-Received: by 2002:a17:906:34db:: with SMTP id
 h27mr13452108ejb.111.1584823008214; 
 Sat, 21 Mar 2020 13:36:48 -0700 (PDT)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id ca12sm683498edb.47.2020.03.21.13.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 13:36:47 -0700 (PDT)
Date: Sat, 21 Mar 2020 17:36:40 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo.Siqueira@amd.com
Subject: [PATCH] drm/vkms: use bitfield op to get xrgb on compute crc
Message-ID: <20200321203640.dwyk25jvnn2rffpw@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous memset operation was not correctly setting zero on the
alpha channel to compute the crc, and as a result, the
pipe-A-cursor-alpha-transparent subtest of the IGT test kms_cursor_crc
was crashing. To avoid errors of misinterpretation related to
endianness, this solution uses a bitfield operation to extract the RGB
values from each pixel and ignores the alpha channel as expected.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4af2f19480f4..8c1c005bb717 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/crc32.h>
+#include <linux/bitfield.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -9,6 +10,8 @@
 
 #include "vkms_drv.h"
 
+#define XRGB_MSK GENMASK(23, 0)
+
 /**
  * compute_crc - Compute CRC value on output frame
  *
@@ -26,6 +29,7 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
 	int h_src = drm_rect_height(&composer->src) >> 16;
 	int w_src = drm_rect_width(&composer->src) >> 16;
 	u32 crc = 0;
+	u32 *pixel;
 
 	for (i = y_src; i < y_src + h_src; ++i) {
 		for (j = x_src; j < x_src + w_src; ++j) {
@@ -33,7 +37,8 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
 				     + (i * composer->pitch)
 				     + (j * composer->cpp);
 			/* XRGB format ignores Alpha channel */
-			memset(vaddr_out + src_offset + 24, 0,  8);
+			pixel = vaddr_out + src_offset;
+			*pixel = FIELD_GET(XRGB_MSK, *(u32 *)pixel);
 			crc = crc32_le(crc, vaddr_out + src_offset,
 				       sizeof(u32));
 		}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
