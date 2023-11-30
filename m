Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E97FE9B5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 08:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE8810E6BC;
	Thu, 30 Nov 2023 07:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2781B10E6BD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:27:21 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9b5e50c1fso8616361fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 23:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701329239; x=1701934039; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7WLNcsSt42LaGfjZQ98cMh59wBp+UL1asBOR9zkijns=;
 b=SEhTMGQT/XgpzgWT+c2CWNaNRS8HM3NxvZC9pWANi1zvtWJ543xbNt9W1sE2LRhTHf
 Fknk/ftAThW84a1RfuJxZFka49s/y8DE7LCVoC8eg2IDaKNpWFIJ+Fu75GkA5p9C7I5p
 3oIZBkLiWD/TXW7KglqdkQZSCYAWQIB0i5dOUvtQLmdD+pzho3ftG6clab9fCwXeqcxD
 yzFlyYm1Hv7lb/5P5Z/xVq4nPRd1KuWpoLx8QWrZLJkyqlXKdL4VxaREJLM/Q+otw9lD
 7+YSdWHWPURS0qyOdKcAarBk8KwGUQy/rayO2sufgeWPMUH1xbkv5UvN2gaLXQow43QZ
 FTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701329239; x=1701934039;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7WLNcsSt42LaGfjZQ98cMh59wBp+UL1asBOR9zkijns=;
 b=ucd5nqpP18bYBhJLtEJz7+KsFZQuKJL4PriqL2rivK1Tl73N1keNBZK+2VNP8myMbN
 XvM9bBYGxzCGySgWLm9PxyY8IQd+lVHmdPr2j62WybyjQHMh2J8QTkheXxsoyyIqfVL4
 XsDEPiet5QINkyRzMveZ01kziHVl2HRiCleUZ6giL3lDeQLSAMeFuqMhI0JfATHulwLY
 1VxnJDHCxdkKU4tUplXyI9CWYRen+LK3j80VF1YOKfZ5MKTc/5HoT8+wmoC6QGykoxFV
 AO3M1/pt9zFVSYpybBIXsNSIq8cuzIC7iQnpwsmmejT+Ev4UPDYSKmdBM34OYEfsQK+2
 O0lg==
X-Gm-Message-State: AOJu0YxhIggaXerzqnkJvzhUtHJrWvXJeCtG9HIYoCjwYH52ZOEMIW1d
 rnvW8uYfz0OW7G7ePxI5rkXB+w==
X-Google-Smtp-Source: AGHT+IHAz8JwF2cwklTl4K6IgQx7ErykCE5QzPE31FEM/rixp/mIlIv5wVKVj+dAewFSOm0L2zbr/g==
X-Received: by 2002:a2e:8606:0:b0:2c9:af18:2e8c with SMTP id
 a6-20020a2e8606000000b002c9af182e8cmr5027808lji.10.1701329239279; 
 Wed, 29 Nov 2023 23:27:19 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c4f8a00b004053e9276easm4564118wmq.32.2023.11.29.23.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 23:27:19 -0800 (PST)
Date: Thu, 30 Nov 2023 10:27:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: [PATCH] drm/imagination: fix off by one in pvr_vm_mips_init() error
 handling
Message-ID: <a2d3210b-290f-4397-9c3e-efdcca94d8ac@moroto.mountain>
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the call to vmap() fails the "page_nr" is one element beyond the end
of the mips_data->pt_dma_addr[] and mips_data->pt_pages[] arrays.

The way that this is traditionally written is that we clean up the
partial loop iteration before the goto and then we can say
while (--i >= 0).  At that point we know that all the elements thus
far are initialized so we don't need to have NULL checks.

Fixes: 927f3e0253c1 ("drm/imagination: Implement MIPS firmware processor and MMU support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
index 7268cf6e630b..2bc7181a4c3e 100644
--- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -57,6 +57,7 @@ pvr_vm_mips_init(struct pvr_device *pvr_dev)
 							       PAGE_SIZE, DMA_TO_DEVICE);
 		if (dma_mapping_error(dev, mips_data->pt_dma_addr[page_nr])) {
 			err = -ENOMEM;
+			__free_page(mips_data->pt_pages[page_nr]);
 			goto err_free_pages;
 		}
 	}
@@ -79,13 +80,11 @@ pvr_vm_mips_init(struct pvr_device *pvr_dev)
 	return 0;
 
 err_free_pages:
-	for (; page_nr >= 0; page_nr--) {
-		if (mips_data->pt_dma_addr[page_nr])
-			dma_unmap_page(from_pvr_device(pvr_dev)->dev,
-				       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
+	while (--page_nr >= 0) {
+		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
+			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
 
-		if (mips_data->pt_pages[page_nr])
-			__free_page(mips_data->pt_pages[page_nr]);
+		__free_page(mips_data->pt_pages[page_nr]);
 	}
 
 	return err;
-- 
2.42.0

