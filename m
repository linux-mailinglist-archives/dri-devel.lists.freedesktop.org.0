Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8184BB36DD
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 11:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD6C10E180;
	Thu,  2 Oct 2025 09:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O88YpRnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BA510E180
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 09:18:49 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3637d6e9923so6443681fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759396728; x=1760001528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SFj5JXWho4y7Zr7rxeir5WOXBf1uNyHF1YLvdI/yG4Q=;
 b=O88YpRnSQ8WU/SfYzb9oo6LhknKueJjlSIo9UazBCp0+FAR0R36HG+S2mUbn+bg/ua
 1NZxO99cWAT7Jmtss+/m6iFZ4DfMrdQcHGQbrIp7hB7WFGHQPIuKspYFjbQ5PugxIsvw
 iLgTTmSpaM6PYjSXrM2iV90Q1TT2lQFX2ebtKD1h6DYT6fhvglcHi9XnyxlR3nH1yz2R
 gq+kRmZYsw2h22eI6QeeyhqJEcqJIHEifWLe/1J9MB0trSkqT99Q08qjRlDoyVoMAtRs
 9YCczuwTp7hais9YkjXCYPIB//iwBC7BNyd3NuqZCzgb48gNwh9WxEKP1gHXqQasn9G8
 +mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759396728; x=1760001528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFj5JXWho4y7Zr7rxeir5WOXBf1uNyHF1YLvdI/yG4Q=;
 b=c+We9Tks3zAlAbcDUPzvnWW+f/Cw3hFvZeQpUzqe9KekLHboJAAWwWFoGfoskzKSvI
 wOANBl1r8Uk49y51Tk7I5Se0eSAsogb9QEgijZelw0dMAUVFHo6gsji8yHOiIgLBeD7d
 HEPYTTeLEyzTYpP1rtKExJ/l9iEHngH1GgtSjdSkE7mhH4Py6AdRvP5xSv9jFMFe8JVr
 TLVu3pHzdtiTVTIDuo7OBxgfCAY4hsaEFCi6Hg/QS5JpSMG7N/A/oiY1eTj/wV37ja0F
 IVobYoB6CQlCay7b8tfxHg6KuEPRUYzhdykm0GBebZjoJFsABR4Tq55NbAa3cMRdxAwh
 FeXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTMx9DWkHHpgAyvRnfppnfndWWpbhfwUiz8jSYdEHylWbksaNDD2oLvY1DHYPwdTs8+uIunZ00wpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxquDQwWPdLzADFa1fXITtY/op/u/EFyhCC0bRgRQ9bNzWZ3cLh
 kxZoybLPg09ZaXzPB8YF24ANuecoo0Nzxbpt2jtuwAr975IfS4rAhCEj
X-Gm-Gg: ASbGncvoV4JjDMIspgVWEr4JVWaNOe+JiNpOWZ0+Uohjs4vvaLbWeNZ+s4schxiZZGO
 HkJ74Zyo8/WG4tencDhMHR810zEdFe9TcnQlhP7l/bLKe8bSRkUwcCZ248/M2UkSvgf3OMYvMU2
 HXkqEL4hZbQwCx17yLfWSGXEa+MQU9iSOxysmdtk/qgFItRW+REd90aHNQY9lHj1wkz7tn1LN7e
 +n1HjugM3fnGtwN+Vo1JEm+ZQrsjyAlklwCqHYK4DMBf6p5l7eLr0H3uMPn4WrGiEavPW84DAhh
 kpvpWDcTIzpscWyDJoGxxiIj9yNCLmQ5dccrpMixyqo0gzWEpHcz5eg7TkL+asVcpqbBtlwbRN2
 RPAoJgiyqFRmFIjRdy+1H3qznuYqFJb+ZNaN82qSASz9CA+mTMd+5kmm3CKdZmT67/lBCgI6xsH
 3/1YZWz0z2/FHHmgmHgsZxuzwx/92HnKUxNiNehuVR
X-Google-Smtp-Source: AGHT+IGo0cUnHQHcxcOjmzOSKKo/Af/lYMVfK4yFSX4Qzv8Y6i/TYPN9voj8VBfnDDED1vp90psKZw==
X-Received: by 2002:a05:651c:1501:b0:336:d8da:afe2 with SMTP id
 38308e7fff4ca-373a70edd87mr17391331fa.4.1759396727908; 
 Thu, 02 Oct 2025 02:18:47 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba49fd69sm5543761fa.43.2025.10.02.02.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 02:18:47 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] vgem: fix error return in vgem_init()
Date: Thu,  2 Oct 2025 12:18:42 +0300
Message-ID: <20251002091844.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Alexandr Sapozhnikov <alsp705@gmail.com>

The dma_coerce_mask_and_coherent function may 
fail to apply a mask due to incorrectly passed parameters. 
However, since this function returns the -EIO error, 
this is an abnormal situation and the error should be logged.

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
+		goto out_unregister;
 
 	vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
 					 struct vgem_device, drm);
-- 
2.43.0

