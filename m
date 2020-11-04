Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586CA2A6A66
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 17:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E8389DB9;
	Wed,  4 Nov 2020 16:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A76A89DB9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y12so22789850wrp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RcZE+F0xLfrdUe3r18uG2gKVVr07Jo/tSCiOs/hSrt4=;
 b=cXsNhHjYVdbdCvwiNuXe4XE/BV1n5zdYf5OjkIvg3H05OrP3XAy8f6li2lRmqW7RG0
 PTFTfA9L/e2M8RNY0mABPssZXBaCVM1ztvVZ9QYWY+DK1wie3xW86ZS5F3FS4azaNaY9
 Tbug3URvxJSQN7wXhTy5ztj9SYyGWwQtqmkwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RcZE+F0xLfrdUe3r18uG2gKVVr07Jo/tSCiOs/hSrt4=;
 b=iR0ohQUCGRzfCqzlLcYgodwja6Xgd9aHqCHruUJAuIYkthNcFQ7pdPuOAA60suFI7l
 XPfYDGli0LcCZ4ChpGOztGRDcgWjfvp+Ryj7kFf+q8ScLEjDFSU13TnBdujyetQyBhgZ
 tJEuNMI3fNTwlPdZ1Rva6IRyt22aMIQUc/mBm4JuK3lWY2gkJaugeaTxwfHrGboHEEy4
 XLsfrlEgBIQ01mDYI3/3me/K1y9tOaElzLODoDtnEhwa5XWpTwBwO72miN545Kl3TWOt
 HTymMZD+yA3gt3H2AWzt4m7vI18F0S4TDsdEk5yaIqBwMiM8gGgvR/5GmraUaJ0kbKWe
 ccUw==
X-Gm-Message-State: AOAM533J4XiVH12diXQML8XddaMFsLjXdNpLMiqx5LGRWb72KZXgY7v1
 GzBRbp3UR73mJf35w4SJUWBedqVyMnQJHpqx
X-Google-Smtp-Source: ABdhPJzuLILn+R7WKqUa0SIJdj5+eZRmpyobhGOvNwhp4ceddsVgJMI3W7RKOG7pT86u1nTLk/LfDw==
X-Received: by 2002:a5d:54d0:: with SMTP id x16mr32648655wrv.75.1604508643986; 
 Wed, 04 Nov 2020 08:50:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y187sm3011723wmg.33.2020.11.04.08.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:43 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: don't set page->mapping
Date: Wed,  4 Nov 2020 17:50:30 +0100
Message-Id: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Random observation while trying to review Christian's patch series to
stop looking at struct page for dma-buf imports.

This was originally added in

commit 58aa6622d32af7d2c08d45085f44c54554a16ed7
Author: Thomas Hellstrom <thellstrom@vmware.com>
Date:   Fri Jan 3 11:47:23 2014 +0100

    drm/ttm: Correctly set page mapping and -index members

    Needed for some vm operations; most notably unmap_mapping_range() with
    even_cows = 0.

    Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
    Reviewed-by: Brian Paul <brianp@vmware.com>

but we do not have a single caller of unmap_mapping_range with
even_cows == 0. And all the gem drivers don't do this, so another
small thing we could standardize between drm and ttm drivers.

Plus I don't really see a need for unamp_mapping_range where we don't
want to indiscriminately shoot down all ptes.

Cc: Thomas Hellstrom <thellstrom@vmware.com>
Cc: Brian Paul <brianp@vmware.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 8861a74ac335..438ea43fd8c1 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -291,17 +291,6 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 	return ret;
 }
 
-static void ttm_tt_add_mapping(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
-{
-	pgoff_t i;
-
-	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
-		return;
-
-	for (i = 0; i < ttm->num_pages; ++i)
-		ttm->pages[i]->mapping = bdev->dev_mapping;
-}
-
 int ttm_tt_populate(struct ttm_bo_device *bdev,
 		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
@@ -320,7 +309,6 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
 	if (ret)
 		return ret;
 
-	ttm_tt_add_mapping(bdev, ttm);
 	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
 	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
 		ret = ttm_tt_swapin(ttm);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
