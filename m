Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8E389B5EE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 04:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D249410F71F;
	Mon,  8 Apr 2024 02:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="YHvzKqyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7242E10E21B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 02:28:09 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6e6b22af648so3479815b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 19:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712543288; x=1713148088;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/UyEnRJ7Sv6c5TCjCFpEabTDcdegfRiMpEIjLnwomgc=;
 b=YHvzKqyUHbjGp70mRhbh8O5Aq52Pa0rSivpyXGvd9MhVNYHEMNB3KHZ1BgVZkNUu5h
 e41XoAhx3F88e+NJZHPuOBdhXR54osAv7JjvBb4cq433E6bC5rDKFEQR3A0Ma6Y4o0mu
 lt2GgOZc/VE0OcmVCsS7uW/zLJaHJW4yd84bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712543288; x=1713148088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/UyEnRJ7Sv6c5TCjCFpEabTDcdegfRiMpEIjLnwomgc=;
 b=pa6dOqGTYH8zSueDNzSd/b8XgB7psxJAyafWWykuam0Qv0w7ADvNCIBTuJyycj0WOq
 S/O2zXGg0N1YrzRn0MTths2LxhF+6IdRGoBNTOx5cToRhVk0sW/h3EpSrJiOXcJ0DYvH
 X4MFlHfzFs9rudo116ILOpecllg+Xp3KSlbFgwphwXJwRvDRcSx7q2WKukD2sNws0vHb
 il5w4J92D5SwReDu3034jzR8b/dgb9xh+d7A//jJIytVZHPWS6Wi2umQ79yVAXBoPNlG
 iU1BdP9UQmqBhhbNM3vdEEsrZqsQCCEvlAqhk6XccA7ZmOIycUxOEz2ib18gaOpuJ2Vf
 MZ2Q==
X-Gm-Message-State: AOJu0Yz97BQZvZ3FZnMCzc3/bopcOgVzHT3Qu4347DuZbY72wCwkO+cf
 g4LrE0N83PkavMMCpGui/7mHde5DRacc63WK5k6j6y9uMGKeLRuhBI8n+2zSGmaZK3HlF/k6hyg
 8pNvcMM09z52br+Zp2tfJEm5A07Y39qTJur/6bpxBF6NbT4llP2VVFcFQ76Ti12/iJHGGCqB3wN
 RGS1igqDoSKJxHnYDNSOPYIulCdqLlv9aDy4HSLLdip8pct4b7Pg==
X-Google-Smtp-Source: AGHT+IHsec30tzs8cC+COVqHUQmcffu/WcMahAp9hT1R4C3+zSwQKOi2Xw1G1u9gMiLXW5aJNbPZhQ==
X-Received: by 2002:a05:6a20:da81:b0:1a7:6a4a:a663 with SMTP id
 iy1-20020a056a20da8100b001a76a4aa663mr2345789pzb.17.1712543288342; 
 Sun, 07 Apr 2024 19:28:08 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 fa12-20020a056a002d0c00b006e694719fa0sm3477159pfb.147.2024.04.07.19.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 19:28:08 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, Ye Li <ye.li@broadcom.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Enable DMA mappings with SEV
Date: Sun,  7 Apr 2024 22:28:02 -0400
Message-Id: <20240408022802.358641-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable DMA mappings in vmwgfx after TTM has been fixed in commit
3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")

This enables full guest-backed memory support and in particular allows
usage of screen targets as the presentation mechanism.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Reported-by: Ye Li <ye.li@broadcom.com>
Tested-by: Ye Li <ye.li@broadcom.com>
Fixes: 3b0d6458c705 ("drm/vmwgfx: Refuse DMA operation when SEV encryption is active")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.6+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 41ad13e45554..bdad93864b98 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -667,11 +667,12 @@ static int vmw_dma_select_mode(struct vmw_private *dev_priv)
 		[vmw_dma_map_populate] = "Caching DMA mappings.",
 		[vmw_dma_map_bind] = "Giving up DMA mappings early."};
 
-	/* TTM currently doesn't fully support SEV encryption. */
-	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
-		return -EINVAL;
-
-	if (vmw_force_coherent)
+	/*
+	 * When running with SEV we always want dma mappings, because
+	 * otherwise ttm tt pool pages will bounce through swiotlb running
+	 * out of available space.
+	 */
+	if (vmw_force_coherent || cc_platform_has(CC_ATTR_MEM_ENCRYPT))
 		dev_priv->map_mode = vmw_dma_alloc_coherent;
 	else if (vmw_restrict_iommu)
 		dev_priv->map_mode = vmw_dma_map_bind;
-- 
2.40.1

