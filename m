Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A1D19024A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480D26E437;
	Mon, 23 Mar 2020 23:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA526E436
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:53:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d1so1636608wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ggi0IKAIfon+EWStWLGQx5WP/k8S48zYQvRxI28qFWY=;
 b=NcJsV9+jqu4aK3cF0m4tMUrvrwhiLbRYi/t7mzR0CMOhrMOMqLlcbqmD1JLFYTMCbi
 tlGEBFHUBOvG3Sl27f0d//1EKlPiRq4AruInE/3n/JrePzaqzWVamBA7ystkkmkQrQmW
 UFK4PKh8eaAwXVCOIqvPYENSCFK0MToCwV5X0X4PgxvoWQso92bLEf76ywAXt3wD7euX
 2eMKvESLg+fVNR+sLl8VxINMxuVFfVWp6ceJbF1ieB9QsSNWFPLuiE3zwmwHGcH32xtu
 sW3V1gfr9W+7ZqCeX0fGO6C/GMcCVmjObLGIWgJj+ZzLSj9VZiAa6Px/RYHR8uNzqp8B
 D0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ggi0IKAIfon+EWStWLGQx5WP/k8S48zYQvRxI28qFWY=;
 b=fyEGRS8jACSZcDmw56bHsF6CUhwmcY3qdzXw4XaXs64HYHBvJidmaayf610UNPM7b5
 xo+61uw1CWnFxh4v0KKLg5wWMD+G3Hgq07gmClCAGNbDkrBUQuAXbtwXxecMRp/GJNhE
 a4dVg0XEOf2HdRC3UpmD2Tdjs9xi6HM1xbaihOuCTG4l1pv5z404fnOUFgUqeK+DHy1J
 ToasVl/q6t1GkSF1M7umHMppZ0QD2otMrGaIoOuwfpjYsM2cWYsdGWN2JV0sRDAX/JQ5
 bekQCeQlVZy1LWKOPaaEU8f9aiMQs/2WgEzbA7lLekqONqc6/uIMq8VFM1/Qp9/7kjWh
 wj6A==
X-Gm-Message-State: ANhLgQ1jbL5YuxoIMzCJ49NT7jLoDzg6nJV4nsHbTCCrrZ23nFXGxxNo
 7PderUOE0dws60yo67h5ksd8jH/QwUY=
X-Google-Smtp-Source: ADFU+vuaFYPtDbqCpEeBtB/gcKwnf9q11ODHHEszzT5QR5HHh38xVNRrg+IfX1uaF2+szoPEewyO1A==
X-Received: by 2002:a05:600c:54d:: with SMTP id
 k13mr1923933wmc.161.1585007582168; 
 Mon, 23 Mar 2020 16:53:02 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id t1sm26729287wrq.36.2020.03.23.16.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:53:01 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/radeon: fix scatter-gather mapping with user pages
Date: Mon, 23 Mar 2020 23:51:38 +0000
Message-Id: <20200323235138.207442-4-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200323235138.207442-1-bigbeeshane@gmail.com>
References: <20200323205137.136530-1-bigbeeshane@gmail.com>
 <20200323235138.207442-1-bigbeeshane@gmail.com>
MIME-Version: 1.0
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
 drivers/gpu/drm/radeon/radeon_ttm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 3b92311d30b9..e6003f701517 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -528,11 +528,12 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt *ttm)
 
 	r = -ENOMEM;
 	nents = dma_map_sg(rdev->dev, ttm->sg->sgl, ttm->sg->nents, direction);
-	if (nents != ttm->sg->nents)
+	if (nents == 0)
 		goto release_sg;
 
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
