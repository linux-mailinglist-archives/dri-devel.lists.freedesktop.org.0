Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01102190717
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E3D6E445;
	Tue, 24 Mar 2020 08:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E9C6E3FE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 18:51:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r7so732141wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5I6qrUB9zZYnQdhUw4mTDUTn75EK4hFMwJK/AIN1r+A=;
 b=gwHnLe+WnO72V6HQtoDeX8TvO7l04B/9+nBEihmlBaZzuBAP7Z9SAoXn77icarXb/D
 yeQku8ZzvV35hTQHgtnx3TPUUcFL6yUJSe50ZjHSywq4ScR4mDRXplpivM/hXbLlKEdQ
 YtAaIyFPesIiRNuwYCCEP/HrAgOQj4XLz245baD7NaGj+FlN3jAxkvrbERYmmW1DQAez
 XlsS3D3FHfaF6CAsUw+J6zTGH/aB5JIRobg0tZkt0r2m81lrOFT2vlrdFjKPZno93kry
 DuhmNqCvUUV/7bAFEAXXo8/bq0tfjL3V9HowFd8TPrAH3U6bUD4NzACM0kFwgl2TUc9e
 h36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5I6qrUB9zZYnQdhUw4mTDUTn75EK4hFMwJK/AIN1r+A=;
 b=OY1qmy7odhTvd+xFbcAIg/KrGrdywI/mVBm4EN9noL8PQP3jMpxixp5AoaORF2wrwQ
 whaiPFTXDSV0iinwALdOTSCESdbx1YSnMruRthvpUCv0SHHW/vC+nb17M3bNXlqjrGDa
 RoXEQJhFr8ScFlsI6rgPVLke8nio+qmQCQ9wZoqghQKbA1M01mk4yv9VNPQfKjYFHf6d
 RZ+JF+xBPulUuUqrMXKN3S/vuii+pcESov3shyzTWadiAyKf8UVi02EdencZrAW5fukg
 YouJipAp4gCdceRRm0DlvdB1gP7GM967zN++UhOKMKGUx7a0RAECf51J3WgbZZ3R+WOM
 IKCA==
X-Gm-Message-State: ANhLgQ0/ip9iILhhPzkzKEBulb9vpot9XPMTguuW9rcrxQirSG6jC++R
 YmXNIoBeUkdcdEsqt8Gyv0HstjONpYA=
X-Google-Smtp-Source: ADFU+vuymaQZptYXgfroJNMEAaK6S/B8xKA2YNTPZimL9o4O2BKZr/raz5uaVB+R58I2ZoEGWJflLA==
X-Received: by 2002:a7b:c3cf:: with SMTP id t15mr718389wmj.183.1584989495921; 
 Mon, 23 Mar 2020 11:51:35 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id o26sm574111wmc.33.2020.03.23.11.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 11:51:35 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: fix scatter-gather mapping with user pages
Date: Mon, 23 Mar 2020 18:51:11 +0000
Message-Id: <20200323185111.135713-2-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200323185111.135713-1-bigbeeshane@gmail.com>
References: <20200323185111.135713-1-bigbeeshane@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
Cc: bigbeeshane@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calls to dma_map_sg may return segments / entries than requested
if they fall on page bounderies. The old implementation did not
support this use case.

Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index dee446278417..d07f143b50c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -974,12 +974,13 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 	/* Map SG to device */
 	r = -ENOMEM;
 	nents = dma_map_sg(adev->dev, ttm->sg->sgl, ttm->sg->nents, direction);
-	if (nents != ttm->sg->nents)
+	if (nents == 0)
 		goto release_sg;
 
 	/* convert SG to linear array of pages and dma addresses */
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
-					 gtt->ttm.dma_address, ttm->num_pages);
+	drm_prime_dma_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+					gtt->ttm.dma_address, ttm->num_pages,
+					nents);
 
 	return 0;
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
