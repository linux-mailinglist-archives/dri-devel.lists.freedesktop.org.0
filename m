Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE8191DFE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 01:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511EB89CDF;
	Wed, 25 Mar 2020 00:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729A589CDF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 00:26:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t7so810415wrw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kqtjnkeA1o492+hzho+siO+SpdGYc+Jz09ohf2AgTl4=;
 b=pMzLMHpIwyYHw40q+5Uu50/h3p3+t6KeFcacEagOg5WhZ6GPpAA5Kp3/joBrvE2HOr
 /m1yuRGoJgDDP+uz0N9vD07nCaJAwYv8VA105yfZ1tRmFpdGNzfUutLwXiFtsvqL3E02
 07JpxTlamKhArOPazOnR83+yeSFaHtVD1I+u4gODVEdNOMT2FjDWDr4g3TqqaH9ZETkM
 KXGocm/neGUdt2XxpA6ya3A/Jt/WuOKM8oQsAsiaLN6yD2vfmZSEJ6wweqvv2rZ544He
 ThheO4NGoM0xJrzwf8aL2nacnXv9r7utUIlaWclMRkN+hFQRcxydtzq+evtkde/NEFE/
 8uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kqtjnkeA1o492+hzho+siO+SpdGYc+Jz09ohf2AgTl4=;
 b=Y1TXjBjIr29ZXpERosfsaKFRIVABND7pe5pA2WZlLIWikF6MCrV7mwMCUZP5OMmQ0K
 lQ8sis0WJjWol2ocPESTO1BOanPTY62N4ea3b14M6FdjAarsnodq1yHMKkRE5XqyDwXS
 3mOwRepcnKL0yOgrAQB8e9cfZEhrEtD6lvmtGK4xpxI6sncH17kPbChaV85cQ2zq+PDc
 9HSvqMVM0ENDVoSn76LHYZij7uqSSdIQrsto0t48x1F5zhP9HxLb26ldzYCVNKs8H2a4
 3ri2vHWTIJ0wGmjIl+eOaD1mYll2ErPG/dFWcq7Rx1GWyrxfZ/aUfBmqaq2A5T68pqFV
 SvXw==
X-Gm-Message-State: ANhLgQ1IUzlya/6DOhbvWb4g+1Xuw2J5HQ6THrYSM/QmgS4nY7rLKH+g
 eWsP548SLVt3tb/4ANsABKNMb19a2LQ=
X-Google-Smtp-Source: ADFU+vu+SgYh/IxcwtQpRWvWmDtKQNPJ4Dd18UPckdl0x+gxYIpIGyOCXhj0gtAjthjIzBaGVGmbdw==
X-Received: by 2002:adf:e70d:: with SMTP id c13mr349166wrm.306.1585095996875; 
 Tue, 24 Mar 2020 17:26:36 -0700 (PDT)
Received: from wasp.lan (250.128.208.46.dyn.plus.net. [46.208.128.250])
 by smtp.googlemail.com with ESMTPSA id a64sm6632935wmh.39.2020.03.24.17.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 17:26:36 -0700 (PDT)
From: Shane Francis <bigbeeshane@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/prime: use length macro when mapping sgl
Date: Wed, 25 Mar 2020 00:24:48 +0000
Message-Id: <20200325002450.5240-2-bigbeeshane@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325002450.5240-1-bigbeeshane@gmail.com>
References: <20200325002450.5240-1-bigbeeshane@gmail.com>
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
Cc: airlied@linux.ie, bigbeeshane@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As dma_map_sg can reorganize scatter-gather lists in a
way that can cause some later segments to be empty we should
always use the sg_dma_len macro to fetch the actual length.

This could now be 0 and not need to be mapped to a page or
address array

Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
---
 drivers/gpu/drm/drm_prime.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 86d9b0e45c8c..e4eff5b84597 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -965,12 +965,14 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 	u32 len, index;
 	dma_addr_t addr;
 
+
 	index = 0;
 	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
-		len = sg->length;
+		len = sg_dma_len(sg);
 		page = sg_page(sg);
 		addr = sg_dma_address(sg);
 
+
 		while (len > 0) {
 			if (WARN_ON(index >= max_entries))
 				return -1;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
