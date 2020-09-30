Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B11427DF24
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 06:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E40E89E0C;
	Wed, 30 Sep 2020 04:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC9189E0C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 04:03:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z4so139210wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=48G+15bfLs5A6N/8q3GODnpZR3gghD48B2T2Q5hp+Lo=;
 b=uXqHHtzmIbeqV3eBi0IKkuxTNNeW1sT0Ygz878kKYwHZ476nC+3V9wO35wSvhX6xH7
 pAaT5bN8z+svDSnbxi3LCsMTB0k+umhxROOzxBoTPjUXjTxd5zxS3SwvYnIhFGlEOwGT
 jGBU77MjXClPwwStzAcWi+/aHZlErLsY+Ky/H+CnZ8vBK2/aGohmEuFjSWzu/XehMHTJ
 HuH2Rr/Ad5coPWxApJ6mwdbLwdiV4/xp2v1nGN4XFGTj+jByRhvc44mAkIP5HYGiyTFX
 zmpJzN72nC4Qf2cExLkKNFU+kjOshq5XWejADYLsUWf/WYtX26mUCprC2pbQd9xx0evp
 /wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=48G+15bfLs5A6N/8q3GODnpZR3gghD48B2T2Q5hp+Lo=;
 b=jEYk3NEyxN1ZrZEFQEnfhabv3//5GY2aEdNDz6Egx3XibxHNolucja8bo6IsixJS2t
 8e47/kZFEj9SImnvlKnwFc973w462nl64ZWpG1Cp+ENU23A7Sh9Pfs6+90/hkqtnKXGx
 Px4GJnYz9mcNTVlfXXwnKkzOG9z9yPMbs+izw9ViOJDb9Wx8GAVGReTBSotCq/F04e2M
 pTH2crzz/gxoVzmkrb0QSx+fkcV8y9BkAcbeYcRooA9XBVSZW5pHvKT9Tc5AhKcH5zSn
 nOiOZRtF4INjbM6H3MX3i8/s//b/QqfDiMm5DaR65C1twJRdXL3w7d7SZ08BhWgcFuFw
 wr+Q==
X-Gm-Message-State: AOAM53037qsCue80Z/+G7A6JOTDhWZHN6nYIsmgMocx9/ZSMUv56iV9U
 s4KmuRJjXo/e27SzXKI8VzwLR0Jxin8=
X-Google-Smtp-Source: ABdhPJx+3wmEqsyAo0j+p6ejg1lbZ0+venJC50sgcnnsZTOayhyxi/tFhzld+IJoOMaqPc/dgvc9yA==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr670532wru.363.1601438588992;
 Tue, 29 Sep 2020 21:03:08 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id y5sm534711wmg.21.2020.09.29.21.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 21:03:08 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: Fix error handling in get_node
Date: Wed, 30 Sep 2020 06:03:03 +0200
Message-Id: <20200930040303.1935-1-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-graphics-maintainer@vmware.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

ttm_mem_type_manager_func.get_node was changed to return -ENOSPC
instead of setting the node pointer to NULL. Unfortunately
vmwgfx still had two places where it was explicitly converting
-ENOSPC to 0 causing regressions. This fixes those spots by
allowing -ENOSPC to be returned. That seems to fix recent
regressions with vmwgfx.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Sigend-off-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 4a76fc7114ad..f8bdd4ea294a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -55,7 +55,7 @@ static int vmw_gmrid_man_get_node(struct ttm_mem_type_manager *man,
 
 	id = ida_alloc_max(&gman->gmr_ida, gman->max_gmr_ids - 1, GFP_KERNEL);
 	if (id < 0)
-		return (id != -ENOMEM ? 0 : id);
+		return id;
 
 	spin_lock(&gman->lock);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index b7c816ba7166..c8b9335bccd8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -95,7 +95,7 @@ static int vmw_thp_get_node(struct ttm_mem_type_manager *man,
 		mem->start = node->start;
 	}
 
-	return 0;
+	return ret;
 }
 
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
