Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A86027FD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 11:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DB310ED3E;
	Tue, 18 Oct 2022 09:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2457B10E50F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:10:15 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id c24so13256484plo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 02:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ukoFf7wEa/GfUfveeUzu2PUBZk7HPVe9cL2u/UltyEU=;
 b=csXExqhBkarPFPg6wEBtNxdgATZM8UopsHo3GUeTmwW04QbJH4NX5y5046JrhCf66H
 OS0czsOqU3JxwafgRAZIi/JmUa4SB4MFcsWb6JIv40cZWC5kkr9pC+tJUljFXEwRJ0fy
 cnX/HOTJHiOBudJTp5MtFv4L99UUXYYVX7yLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ukoFf7wEa/GfUfveeUzu2PUBZk7HPVe9cL2u/UltyEU=;
 b=a7bOCyLPIA2X+FPYW/Mij2i+xTC0Tvwu2pCBvJ5HtX0SsIOuTPwMjo7zXwAkirKXN4
 ZWKhY/D6lMkabHPYv7qIZUHHjVAMb0qX6SDrzu63VC7eWnC249OYsvWY/edK1zoJvEQq
 P+ImH8mc7rq6n2U/QEcf38P+Ta6fYlldfm4lkOt7j+P5+zPJtrOHk0sCH0Klk8BE1xs1
 ogPkTNrb75CRO/BzQccu82yj6T41j+1KPrdeVNnwB14tdWvKYi4KUwoievhHx6oQCSXC
 Gjjg+eCBTINZCJjgfA0eAUayAMPC8H19b2XUydIKfkxYZJG4O01ESBbL/3u5n8nlHqiX
 00NA==
X-Gm-Message-State: ACrzQf3xW4+ifBPN7JhsJlJj+UiyKfQMHUjL+hdvd7eEVbNWvN0MIPnO
 /aQc6mPTboKGi1oIlP007riApg==
X-Google-Smtp-Source: AMsMyM6AMqxalz2EiUvSsTLj683MBoAwpQpreDb/Xeav5jgLr57NynSC9KI51LhT7Kytdced3HqcMQ==
X-Received: by 2002:a17:90b:3588:b0:20b:590:46a2 with SMTP id
 mm8-20020a17090b358800b0020b059046a2mr2491865pjb.14.1666084214343; 
 Tue, 18 Oct 2022 02:10:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902680a00b0017300ec80b0sm8058997plk.308.2022.10.18.02.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 02:10:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v3] dma-buf: Proactively round up to kmalloc bucket size
Date: Tue, 18 Oct 2022 02:10:11 -0700
Message-Id: <20221018090858.never.941-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; h=from:subject:message-id;
 bh=8hepCmu6KkNCIQiT6ONpaMe4VoHSy9sRDnadRc3o6dY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjTm1zq8jKCG/tc7/8bPvsM44d+bw8pliNmUV1nYs9
 oZ3UNCqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY05tcwAKCRCJcvTf3G3AJh7AEA
 CTcI1pdlR5PlvYxNvP2WDxxU4tjQpCYFU8DL3QIbpSPAGCSHnu/fLH6mOTmflitrQ/DsyHD4LRh+Gc
 MNL44FREEbJ4PDUi+k2SbLlkCESNKduXwzMSU4AzBIbf3TD2GmvqnQc6663oVj/0gCMK1PtcnYqkkK
 7dOrQHMvouIoxWrgiOoK8U8K+6pHwwJK66vChECKJN261DcRu+LrteWxTMCEuwWexFa8DVde3NAK9Z
 rBLz4Cq8ZdLitk/OXx0Dq5Sr+lvsTuhgodexasrD6PbK4g3XSSyHuqSiRLwSb+WgKJaOQ/FwHA/zxz
 N1ktC3FGVv0rs3PTxdAwcI0FNVEpUdZUkQI0UfFotI03jATt3Ar/11oa77oln6OVD4p86J25TmPSsL
 5mbkclNofm6EXo/VniQoq6dc6Bt4acmroVMeYDxRuAwfwxW0tBusHyGG0uUaczhMLcI+8aB7B9Ww5w
 Z1tpDuQLaTSmDAfOskStapWlFTBdZczM8RsO88iM5k/TH/00g53wBnDEHyYBXaMZWIc+rSuGFChZzf
 H0+guk6+nfMF3k18/pY3Ysj5RPQE3FF4i1DOJ1aqc9zQLB9+BV8bbsTxy/GCHGenjhYmFipzHZeJat
 dOlM+mCyFQ3zOAYDS2ZW+1sW0Gfg5Xqh5qC7jyxMfqfwVjvzt1oaXABQEm0g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-hardening@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v3: added reviewed-by, rebase to v6.1-rc1
v2: https://lore.kernel.org/lkml/20220923202822.2667581-9-keescook@chromium.org/
---
 drivers/dma-buf/dma-resv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index e3885c90a3ac..1c76aed8e262 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -98,12 +98,17 @@ static void dma_resv_list_set(struct dma_resv_list *list,
 static struct dma_resv_list *dma_resv_list_alloc(unsigned int max_fences)
 {
 	struct dma_resv_list *list;
+	size_t size;
 
-	list = kmalloc(struct_size(list, table, max_fences), GFP_KERNEL);
+	/* Round up to the next kmalloc bucket size. */
+	size = kmalloc_size_roundup(struct_size(list, table, max_fences));
+
+	list = kmalloc(size, GFP_KERNEL);
 	if (!list)
 		return NULL;
 
-	list->max_fences = (ksize(list) - offsetof(typeof(*list), table)) /
+	/* Given the resulting bucket size, recalculated max_fences. */
+	list->max_fences = (size - offsetof(typeof(*list), table)) /
 		sizeof(*list->table);
 
 	return list;
-- 
2.34.1

