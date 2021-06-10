Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A33A281C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729536EC95;
	Thu, 10 Jun 2021 09:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB40B6EC93;
 Thu, 10 Jun 2021 09:18:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4392171wmc.1; 
 Thu, 10 Jun 2021 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tvv/a4GnE6e26XfGwf+jm2ojTcweECJjiaTCOzTo/lM=;
 b=NtPrBOPcWSrdMhHJwnwOZTRwh9kmDP+5JjjxL/qYUCX1CCd/dK2VzLzbowYEY1cJ5a
 Oziu3kHe7JXfs9M/00EvAbQlath5+N7C/9ckmGzukTq3+DFymFRw88fGK2IFd7kc1RcH
 Jco+JG3N/gDyQAdufF67Sh31KIW3hZCI7K1am5MPMoloVGWkw3LXa9ZJMtwaqkugqkid
 9YHlOCe8t+AuLmbT7k1rQPsq274Ew+cwyvdlaq4mveNxHMcQ1fqgJPW3lnzhSoih4aaw
 CJP2wh5GQQhigq5Sp0n40fXmwFYrM2NejxL7tM53nSaKSny+LWbId24MoffdXlf5TcEO
 KOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tvv/a4GnE6e26XfGwf+jm2ojTcweECJjiaTCOzTo/lM=;
 b=kOZj1ycxeOgVxUOAtyYnhN24xLxhc8cNtjkAbyw1mDDhzzKCKPEESJqAjKzOUe9Xfo
 5NgAvCO6L/rEMi+CouiY4GY0fdyWHaEl7O1NIUgyLdmGNFQ8uTsGgzF+SIqr3lN1GYap
 iNjAeqsNwherKpQyUapXbQP8X5QJyp0UX1jRpf/T1cdGiuEK19nua2waVIgHGMyxn4QI
 LPiogX0RMjg7JD531h2X1v354TdDhTnbY56nm8gKrxQcfzznE5T5p8Rf+hel9mND4s/p
 j8qM88kALbPGHy2F/bFESsgvSCTUM3VJe5H9f0FVZpZ9D+MEnaJmWs+lerPk+W9EPbhk
 8d+g==
X-Gm-Message-State: AOAM532hueKRJWsHFpTwSUV3C8QQl3afa3/1il10arDLkFqqre+/kya5
 UXr7E7Brsn5vkic4mk2HrtzDQ1l5PPc=
X-Google-Smtp-Source: ABdhPJzEL3NtHnpWqIAvKt6SXLvn9uMnJZGM2//K98BExFWSS1agitTdfZu8UPCqx/1oGqHSw64WbQ==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr4031900wmf.7.1623316685627;
 Thu, 10 Jun 2021 02:18:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:561f:e43a:edf5:8f95])
 by smtp.gmail.com with ESMTPSA id v8sm3087445wrc.29.2021.06.10.02.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:18:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/syncobj: drop the manual garbage collection
Date: Thu, 10 Jun 2021 11:17:58 +0200
Message-Id: <20210610091800.1833-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610091800.1833-1-christian.koenig@amd.com>
References: <20210610091800.1833-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not needed any more since dma_fence_chain objects take care of this now.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_syncobj.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 1c5b9ef6da37..e6d144775a87 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -304,9 +304,6 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 	list_for_each_entry_safe(cur, tmp, &syncobj->cb_list, node)
 		syncobj_wait_syncobj_func(syncobj, cur);
 	spin_unlock(&syncobj->lock);
-
-	/* Walk the chain once to trigger garbage collection */
-	dma_fence_chain_for_each(fence, prev);
 	dma_fence_put(prev);
 }
 EXPORT_SYMBOL(drm_syncobj_add_point);
-- 
2.25.1

