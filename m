Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0D807295
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 15:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EDC10E743;
	Wed,  6 Dec 2023 14:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C21210E743
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 14:37:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b399a6529so5377495e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 06:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701873448; x=1702478248; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VW3Q3pYivZ0nqLu9afJmoH7SdepQ5nT0zPYa9KiyjuA=;
 b=j1DZvEaVw6PxmVHFOWlt7w+VUATmoPl+zYgKNqLWGvzC29uLF5r7aGmprGhQ5KELL5
 pgrozW2JdsjjGbsmOqdq+lrWcoEchGCTnyQqUPfMcmgGZxbY56ZC7EiSrLbSgnD8DUdW
 xpPrrl577viBygTwhPl4NH72J0DZ+TKyocKVaXXLxSCQvHgSSO5OSjN7sgcFJnL1NJBE
 b63iK29268kvfbeMw+96hB5beIG/iMyxO5zaYP9H/yUM39KiI+KeLaAVN4rpUiV47a5D
 nX13sV2uk0hLYy9HMPPXhOQ/N9d+MAQYLlSrJeunB38v7SLYnpD2LVi7mMjXo+eLhU2h
 b+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701873448; x=1702478248;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VW3Q3pYivZ0nqLu9afJmoH7SdepQ5nT0zPYa9KiyjuA=;
 b=b4ldlAAaEsXXrUzBhJtLDBuQbcHOlGaT6l8ypulYGchcKa2l6ceNJSTXhQkf/Su+uW
 fB7oFr3tnqvT0ftTEbHC+JkB1deUAvVpInGOgrmmF26jcmqGQ213Y9Sg4ZMb5Qb5KprO
 tS338mqmdlW2dLl5SIqDnR6i32lbERv1bJqDPK6zFfjyRdWxK4e84mjTp2Hmuo6mZSoh
 dFN9l4847RJvV2F3sjhKS6Hzl6lVwTjbXVxbh2C6O+gF1H67ZUNoDoDHJ+Om8ykKPxDS
 1GZFsbNvY/LmmfxT0BOe3FmMKb+zBRTWcJrfg4uijB+Oe2xcvPjEdTDqR3EcNAnuQVoR
 Ctlw==
X-Gm-Message-State: AOJu0YxSjvA32Ec0mC+yhhplqPJPybDJ3VMVAxL3+tTh/AYkA2qWQovl
 1AHNyj3y0T4aCdI4VALO8GZPIA==
X-Google-Smtp-Source: AGHT+IGEfgHWhI3i0hf5O74h0s9YQTUHmBfTR0yRIKQM71/4+mYNuyHDYdRRnr1gnYUuNd8DlAYpWg==
X-Received: by 2002:a05:600c:4e90:b0:40b:5e56:7b68 with SMTP id
 f16-20020a05600c4e9000b0040b5e567b68mr1640147wmq.177.1701873448401; 
 Wed, 06 Dec 2023 06:37:28 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 fa10-20020a05600c518a00b00405442edc69sm25776814wmb.14.2023.12.06.06.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 06:37:27 -0800 (PST)
Date: Wed, 6 Dec 2023 17:37:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Donald Robson <donald.robson@imgtec.com>
Subject: [PATCH] drm/imagination: Move dereference after NULL check in
 pvr_mmu_backing_page_init()
Message-ID: <13f4278e-af9c-4092-9196-bc0e6b76f1eb@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: kernel-janitors@vger.kernel.org, Sarah Walker <sarah.walker@imgtec.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code dereferences "page->pvr_dev" and then checked for NULL on the
next line.  Re-order it to avoid a potential NULL pointer dereference.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index c8562bfc0dcd..4fe70610ed94 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -316,12 +316,14 @@ pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
 static void
 pvr_mmu_backing_page_fini(struct pvr_mmu_backing_page *page)
 {
-	struct device *dev = from_pvr_device(page->pvr_dev)->dev;
+	struct device *dev;
 
 	/* Do nothing if no allocation is present. */
 	if (!page->pvr_dev)
 		return;
 
+	dev = from_pvr_device(page->pvr_dev)->dev;
+
 	dma_unmap_page(dev, page->dma_addr, PVR_MMU_BACKING_PAGE_SIZE,
 		       DMA_TO_DEVICE);
 
-- 
2.42.0

