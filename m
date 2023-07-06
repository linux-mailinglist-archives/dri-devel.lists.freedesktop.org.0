Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C074951E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 07:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031210E401;
	Thu,  6 Jul 2023 05:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97ED10E401
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 05:52:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82d9cso2828565e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688622736; x=1691214736;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xBnIxFbrZYBRg1JLoIaM7oiOzRTygjslunOs97rxcZI=;
 b=ivqjuHVzfLJDn9MOdly8U+ZCr8fLlJmVqX5jfDO++SfAkzezA3eZkBbw3VDEVTr1iw
 I+/NjuSk+iAIaXy9HjGMyE/gXWNwpL4JDhpUDdjcDfML4FOl3IwzbBue9h74hhqjxdAm
 vkF8g/v7iQECp3tB/99sM5pAtuolSI7ZptoprYUfEwSc54VljWIPC1aPWzG3qeRchQsV
 UdMVPTsOERsfk0CSRnI6Ku0NUnR0o0sty4Spr/1oE+uNsddNjwMuHN//E0GfGIxck6VE
 K4L0R7xtKw1hrcHRPtLj2a6NFT487wktqeNm0mzfbN8mxoo0o6ooVcV4sH/j9t0Pg8ia
 QnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688622736; x=1691214736;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xBnIxFbrZYBRg1JLoIaM7oiOzRTygjslunOs97rxcZI=;
 b=OjthVz69uTPzE/fLHZqCrtQKxsBsC+80wgJ9AyxlNK6G5B6JgK8xLIT2vcT7GpwRpq
 26q2nBAye80ueBw6rntgEWlbXWe5+vTtCf36IQamHfSR47skwnout2ThjVrOna+xSyhg
 6Y1n6SrLFaG/fpnkhbfVX5bAlLcE/MA3L68Rd1378mIQPoYvHxBc1O1LJsao36VQVWJw
 SknU/ogNiLkRdoFjLDAU+TtKlhHf6/gWdUNhu2BuU6sS8c4V5bkNOjn8nPNUg76Dl4OS
 K21gWuScvzEU8BR97M/Mr8+WiB0moiSJThAe3r//LXoDX1uReqc4Z/WS0nq+qUFUuZeV
 agLg==
X-Gm-Message-State: ABy/qLZILxGdo13psmjoYjfRr+8jV6sVXJP/R6PSKakSv87cljGPJPwz
 lhntq0sZGh+bQtA7pmOsrYv+LA==
X-Google-Smtp-Source: APBJJlEdnT5CsfLEze+SxP6AZhI5PIAj9Jkcr7yKYANPXjaEGIK5uo87cktbva2hd8k6ClKAQd1dJg==
X-Received: by 2002:a05:600c:ad8:b0:3fa:d160:fc6d with SMTP id
 c24-20020a05600c0ad800b003fad160fc6dmr481579wmr.30.1688622735764; 
 Wed, 05 Jul 2023 22:52:15 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c029300b003fbe4cecc5fsm977367wmk.34.2023.07.05.22.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 22:52:14 -0700 (PDT)
Date: Thu, 6 Jul 2023 08:52:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: fix an error pointer vs NULL bug
Message-ID: <694691bf-f591-4286-a615-df91d2ebab93@moroto.mountain>
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
Cc: Gustavo Padovan <gustavo@padovan.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The __dma_fence_unwrap_merge() function is supposed to return NULL on
error.  But the dma_fence_allocate_private_stub() returns error pointers
so check for that and covert the error pointers to NULL returns.
Otherwise, the callers do not expect error pointers and it leads to an
Oops.

Fixes: f781f661e8c9 ("dma-buf: keep the signaling time of merged fences v3")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma-buf/dma-fence-unwrap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index c625bb2b5d56..d183eda0db89 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -94,8 +94,12 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 	 * If we couldn't find a pending fence just return a private signaled
 	 * fence with the timestamp of the last signaled one.
 	 */
-	if (count == 0)
-		return dma_fence_allocate_private_stub(timestamp);
+	if (count == 0) {
+		tmp = dma_fence_allocate_private_stub(timestamp);
+		if (IS_ERR(tmp))
+			return NULL;
+		return tmp;
+	}
 
 	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
 	if (!array)
@@ -176,6 +180,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 
 return_tmp:
 	kfree(array);
+	if (IS_ERR(tmp))
+		return NULL;
 	return tmp;
 }
 EXPORT_SYMBOL_GPL(__dma_fence_unwrap_merge);
-- 
2.39.2

