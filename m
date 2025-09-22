Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5BB93207
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 21:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC4F10E502;
	Mon, 22 Sep 2025 19:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B+JlWJKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91BA10E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 14:43:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-57e03279bfeso1705895e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758552229; x=1759157029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+XeqFLg3di5BWF4+ZwuO795a3+ZuhvFgttiR6R4NPvc=;
 b=B+JlWJKPC36LDBORkRBLc4tf+/EYt1jWlgmUpJVxHnfUTDps3NHNoBakkqRs4lz+vB
 K7ySXGgzAdNDbzQSTmGdsUsLvE49T2CslUbE65/sG+H0l87u6/qh7hiVyoRihEXM21HM
 JrcWVq/UYMQmzzPtfF22SHPTs205Z0vSU85DzNDgO29kXRORCCYKkH0jVgiHCJpzy/la
 ni1m2RlwyHHdq9UcfVw5s1JgGzBkZBnpLN95Wu/AU4Hwu7touiV6KvCHoKarz0baDTfi
 0G4A/I+TUIb8d4r+y/dHGfWiqYoFdpiPoBVpVjBG3QaO5qdja5GHf6kxyY1kEREKBQCZ
 RTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758552229; x=1759157029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+XeqFLg3di5BWF4+ZwuO795a3+ZuhvFgttiR6R4NPvc=;
 b=CdEOjmfYLAtWe2ABvmaiaO2w38naD2JRRn6ZTba8IoFSQi7XKUjGPrwzIZiupWXPQE
 i+9pp3IXrtVc+KNHwaxX5xdsYacMI8aNFG3M8Gky9DysnRscFDCd0JYM6nRzHbfqGjqC
 wM0sWWnL6bct9or7K6SaYj/627LSOg0HlG6+ReyJwMfsXtNloDtJC+Ewb5SkXGgwEqtW
 0vz2YFwUswpVFYvz7ZnUbf+MxgIt4FWR4JhKGBCs+SMHFsC/lv9n00ECjTXzvgYWBnJR
 N/sxJeJBPsnyXP6V1QEP7txIv1l5x64uzZK2buqcsgnXksgVDTEjM18zswCiimqo58u7
 TwZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7glgQk7JjCFhho83VSPIJagNdehQFg7u/6oy+zZBOiGVyezxUSJbpEnUvni4h4s7XRbQuYNgjsbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHl44zISRXPV+6cMqEUibKcJAxmaEqazz8wnzPBnDu4tc4m46x
 dWEPorC0CexLy/mKqBosYGOo8/1dCvj6QBNYWifYqjId6N255BpyDp22
X-Gm-Gg: ASbGnctMdysY6xn3cE7KF7Sn9Ob3wzW98IFkDMC7X4L1hxKNa8j/axQes4BbtzSafQt
 R1NvojeuBN5V70EAQwlySKhgMYH5Ix3nY+e8MT42Av4n3holTNbIXi2tb3VcZfORbURvqKSIcTS
 Ax/UGJJOQqEY4pv+OqyJEoHQlgvtOPAqPYxTSbHEYXkr+p97ZiqBYmJm0lJ2mqo9eJUO71ngEbM
 fMFNrXiymI79bZILAEB93Of56dBH8lsVCuPJ2qH2Tcz+7n04by806cqjQCV/GuWWcu71GZzSL5x
 V+JFwlt/ExDsLokGZ5ySgr3fKxCoa3M+PP19yPPAHCqkU5A/RL4qGUxLXkG2UmjiH/low0FNDIm
 ikhVnedhIF4WZpzmH8j/BdK0GQv7+yQJnhis+sHwgKugg92mU1NJjH8x/hcGcuLpBdlXNCh22nl
 Hne9W7WHhA7XV2nKDU
X-Google-Smtp-Source: AGHT+IHzYtEpfKcEprfpGuIP1MO4GWVytyEbGxSxTMCwGQRrh8Hl2fondVW+aeo1G/kVRwlHSYdpkg==
X-Received: by 2002:a05:6512:6819:b0:57b:a1d3:10be with SMTP id
 2adb3069b0e04-57ba1d313f0mr2266689e87.8.1758552228118; 
 Mon, 22 Sep 2025 07:43:48 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f44b29sm3348282e87.24.2025.09.22.07.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 07:43:47 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] vgem: fix error return in vgem_init()
Date: Mon, 22 Sep 2025 17:43:41 +0300
Message-ID: <20250922144344.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Sep 2025 19:47:43 +0000
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

From: Alexandr Sapozhnikov <alsp705@gmail.com>

Return value of function dma_coerce_mask_and_coherent(), 
called at vgem_drv.c:143, is not checked, 
but it is usually checked for this function

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index c5e3e5457737..dc132dd44b9e 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -140,8 +140,10 @@ static int __init vgem_init(void)
 		goto out_unregister;
 	}
 
-	dma_coerce_mask_and_coherent(&pdev->dev,
+	ret = dma_coerce_mask_and_coherent(&pdev->dev,
 				     DMA_BIT_MASK(64));
+	if (ret)
+		goto out_devres;
 
 	vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
 					 struct vgem_device, drm);
-- 
2.43.0

