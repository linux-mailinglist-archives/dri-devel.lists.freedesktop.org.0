Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AD8248AF7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 18:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2862E89F45;
	Tue, 18 Aug 2020 16:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5926789F45
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 16:02:33 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id g33so9959551pgb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8CE3NEQmVRAQk8SeoQWuBofL/MMdsAZ7wPp6ycr/jPc=;
 b=PrAQkFT0ao4oEqu0oXGLnDdvVaoItpjRDtF1+2PnvmWYEDH84b+Eqb8sXDCx9w4ZE5
 paw+nQVHkxE4v9S2FRTJfzgs01qcsRT5zYK8whc3vwN9D92j5XeQapbEH9Em9eTVeop8
 f+RS6/OmGSHfj4HLsMit9qOOl73V5XjA9fhCGq8HrYzq8Hbvbu3usR+g2klIq2NMkSuz
 QKMCcU2wVZb59IGoS1xE8VqJiZreygOLAP+A7jA94AixnQob4jr2/OgScvLHdq8psgtj
 8j7FPc2PXjodZhUJYsZi018Zfv9XWvm7BXEk+bU1lC+UuZmTOTKfRWTxGdt3g69bOduj
 qGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8CE3NEQmVRAQk8SeoQWuBofL/MMdsAZ7wPp6ycr/jPc=;
 b=aTwMmSXlmuz3O0Hy8BMsBMzWwfztXzGErZgCUe3V0W2R+oVIKkPX+xSPEVTbr/YcMi
 PUzBWdfTQrXAak09KYPuuAPDlzgh1+k+K3KPa1KQ4/lhSSXPHkbJWbvkWJRmq/AVwILC
 atDvOg/BZ6sxWDaMNJ1VKRPXZ2/ZRN7EVHVvD0s3wnwTddeyq03hg/6gJ/WQ9oplnTsh
 zUTtX2sV/hXU/IlF8UihKdA+9gxm1LPAYddWgnlR0ptc46orJDpIr4e4Gz3AKnbZi53p
 KkIa1fFcJQM5/1GYE0r+ICKDq/rbLA4oqM/23KWSswcPpPKIdLQwU1NID27hrkfumhpC
 HR3g==
X-Gm-Message-State: AOAM533XFj+g0lFucPwXsoyDxyhDj/PpQ+0SJQT4xz0en/eMtT2XtBJc
 Al+oPzh6jtMfmP0Dv6YNLN0=
X-Google-Smtp-Source: ABdhPJzbc/f60fNKlmZkmTn6d7uXjcwOGKKY/TMIqF+fK3OP2elNRBEgf+BJEBdbs0ZK1z600GDsIQ==
X-Received: by 2002:a62:3856:: with SMTP id f83mr16079581pfa.35.1597766552881; 
 Tue, 18 Aug 2020 09:02:32 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id g16sm297997pjz.52.2020.08.18.09.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 09:02:32 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/vkms: Use alpha value to blend values.
Date: Tue, 18 Aug 2020 16:02:15 +0000
Message-Id: <20200818160215.19550-1-realwakka@gmail.com>
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
Cc: Sidong Yang <realwakka@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-usp@googlegroups.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I wrote this patch for TODO list in vkms documentation.

Use alpha value to blend source value and destination value Instead of
just overwrite with source value.

Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4f3b07a32b60..e3230e2a99af 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -77,6 +77,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 
 	for (i = y_src, i_dst = y_dst; i < y_limit; ++i) {
 		for (j = x_src, j_dst = x_dst; j < x_limit; ++j) {
+			u8 *src, *dst;
+			u32 alpha, inv_alpha;
+
 			offset_dst = dest_composer->offset
 				     + (i_dst * dest_composer->pitch)
 				     + (j_dst++ * dest_composer->cpp);
@@ -84,8 +87,15 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 				     + (i * src_composer->pitch)
 				     + (j * src_composer->cpp);
 
-			memcpy(vaddr_dst + offset_dst,
-			       vaddr_src + offset_src, sizeof(u32));
+			src = vaddr_src + offset_src;
+			dst = vaddr_dst + offset_dst;
+			alpha = src[3] + 1;
+			inv_alpha = 256 - src[3];
+			dst[0] = (alpha * src[0] + inv_alpha * dst[0]) >> 8;
+			dst[1] = (alpha * src[1] + inv_alpha * dst[1]) >> 8;
+			dst[2] = (alpha * src[2] + inv_alpha * dst[2]) >> 8;
+			dst[3] = 0xff;
+
 		}
 		i_dst++;
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
