Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD0C2339A7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004866E08C;
	Thu, 30 Jul 2020 20:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689896E08C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 20:25:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a15so26039883wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=4YsKWelpae7Y1+xemmp6VK2YWsEOoYbYZuWlAGBx8x8=;
 b=WmD9vMwiGZxymz2aRm2EXNkvN6yIiWDtjrUR+ki0OvZ3q6ag6xUUyO/PZF0Cmg2BQM
 wTwFRDSoBMZjxbncjHdvnJ/M6QtOWy+uoaDVLY/cSUcheDHSQ7PsThIlNB2bR3aCcw73
 8Ywqv3AMjkoY3oZU53D2GdBgHO9WwqKQD+pJRxXGboiqGlq8NhY/xA0iUhDka52p/dvm
 lLekms/R3iPZeTRXsVrUMIiQuUY+7FBGRTxvTY/TREbULB61PQdg61nj4hncrecXGKmn
 NyK0ESFmwxUDacgqOP8Mv09uDDjtQfOtcqfIKS52gSGkd7T/wl2l3EebUqQ5HLRAwCOX
 02Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=4YsKWelpae7Y1+xemmp6VK2YWsEOoYbYZuWlAGBx8x8=;
 b=AKOjxNYcbQvZ2Wf8jajXao+U3le3cv3226fbaVW0A6IFKcO7dap9Os4aQy8/V58fDi
 dbI03pbqA7oVHYgvcdIonPd0ThO935KC5h7dp6I1dZpjJ4tOWEidBKkzQBJkQvkphMsh
 SCMA3WoYMT6VnAn3UZyTd8siRzo0bgdtGJcBX+iCR5zPNh7PhK8XQprcim42RnrAhiGA
 7tDXEBq0qbIe0MIR/mvY71Ci+WItk2rpNWzv47ZkRea1N2NwZdqIFItxJcFSwJigQTau
 tr2MwZKj2zXe81maeEEZEIx8B78mdWTGERjyTsDa5hviVg8iVbri1K5OFkwX9INeuSGa
 2saw==
X-Gm-Message-State: AOAM532UL5lAl6mbJ0jeuM8ds7idm+NUdxMYpXgOxkm3YMqMS3kxQbXW
 yQaVVUr4NHDUjpLzQrNV1tY=
X-Google-Smtp-Source: ABdhPJzNALvML/QpB+h/O6L02OLC+VZbNf0WhhYyg+bv2xKyFI/sFBJ3HwhfAd2l/RN0tefJgxZ9hw==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr432689wro.164.1596140732077;
 Thu, 30 Jul 2020 13:25:32 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id n5sm10611542wrx.22.2020.07.30.13.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 13:25:31 -0700 (PDT)
Date: Thu, 30 Jul 2020 17:25:24 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/vkms: fix xrgb on compute crc
Message-ID: <20200730202524.5upzuh4irboru7my@smtp.gmail.com>
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
Cc: kernel-usp@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous memset operation was not correctly zeroing the alpha
channel to compute the crc, and as a result, the IGT subtest
kms_cursor_crc/pipe-A-cursor-alpha-transparent fails.

Fixes: db7f419c06d7c ("drm/vkms: Compute CRC with Cursor Plane")

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4af2f19480f4..b8b060354667 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -33,7 +33,7 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
 				     + (i * composer->pitch)
 				     + (j * composer->cpp);
 			/* XRGB format ignores Alpha channel */
-			memset(vaddr_out + src_offset + 24, 0,  8);
+			bitmap_clear(vaddr_out + src_offset, 24, 8);
 			crc = crc32_le(crc, vaddr_out + src_offset,
 				       sizeof(u32));
 		}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
