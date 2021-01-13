Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCC02F5D4A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC3C6E0FD;
	Thu, 14 Jan 2021 09:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA386E177
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:47:50 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id b3so821592pft.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QoNieAZwQHLgxomuapjkBumRUy7lrrmCEnKb+YYdBG8=;
 b=cC14kghJMqVr32ARRTARfaFiRG7f1mW1J8Fqn8Kurn+KMqANWD/rkaUQrPzkP+Q/LZ
 l+fEZIbkc9tdpsqraiM6tPy9mw0pIfjh2ShAkEbYlAgvrnpKw5wuGEgy5Dbw/mOJHest
 RQeqwngSA0Gpn3qNSm8o3i3vwbyVYhEmWr0ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QoNieAZwQHLgxomuapjkBumRUy7lrrmCEnKb+YYdBG8=;
 b=ovfzquMleCA421Tx4+rs+kmjVVhf29GD4fe0J0nDlKSRg5r/ol6Rxg5kuSCO5bq3Z7
 yuoaFZ2qquHbc72X/z8I5IqjaCC9gQCzbJw0WbRKF3V5wIxUYkKTdKB8fGzhdlGW3Sp0
 c45YKuGRRLO/GQ1vQFzUaBHn48vtnpKIgLxd4NKvQeUEBbb2oKPchC2Mnl7wFMGv4i4D
 9QkfZY80iD57au0jdO6lqiGP27TXI+gE78wMkFqPPrtZR/0w14D9EHho8dYkTrYJsqsY
 araOzDJ7CEK6+aNJ4fy2Mh8/GeLQadevEaiA2XEcXVHm0GDW3NWgcVSSZNnknxAZDxLv
 l+EA==
X-Gm-Message-State: AOAM533V02x4LIcgdvY+lv36EVpLVUpLrFj0+ofxujHkW/SnX0G77Ezo
 0zhhi+dgCp5t5iuX/pG4vY6rUg==
X-Google-Smtp-Source: ABdhPJw+Frz9JPhlVZa4cOr6ax1eWqPFMccUCqObgtbJeCByVkPPzri4wEaQMgXspWjrg8+aNJYAZQ==
X-Received: by 2002:a62:7907:0:b029:19d:cf5d:20ae with SMTP id
 u7-20020a6279070000b029019dcf5d20aemr1221505pfc.2.1610527670281; 
 Wed, 13 Jan 2021 00:47:50 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
 by smtp.gmail.com with ESMTPSA id m22sm1806934pgj.46.2021.01.13.00.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 00:47:49 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: Christian Koenig <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: use compound pages for THP
Date: Wed, 13 Jan 2021 17:47:33 +0900
Message-Id: <20210113084733.1181460-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compound page metadata is necessary for page reference counting to work
properly on pages besides the head page. Without it, put_page
corresponding to the last outstanding get_page call on a tail page will
end up freeing that page, even if the bo still references the page.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 7b2f60616750..09239b93dc2c 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -83,7 +83,6 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 		gfp_flags |= GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
 			__GFP_KSWAPD_RECLAIM;
 		gfp_flags &= ~__GFP_MOVABLE;
-		gfp_flags &= ~__GFP_COMP;
 	}
 
 	if (!pool->use_dma_alloc) {
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
