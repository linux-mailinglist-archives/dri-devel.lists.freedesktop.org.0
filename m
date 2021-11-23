Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27F45A55E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290266E7D5;
	Tue, 23 Nov 2021 14:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBB16E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id y196so18874200wmc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
 b=aEZ/5Co18nmkp4u62saEitAQxChSJWjNnhcmwRyA7HJWR3C3GTieWR2z66rxkMFfq+
 tS4X5c47nYBWxBnijFMqa9zD0nNrtGgqN+EOxv92Fi7QkseSFSHXuT3xv6kWnOAzPbDV
 4zy4ec69l7ELE9julXZ/0CnQijZK4TNtcZjHH/YagK1wCHMCLtM80e6mc8qroihM/xYt
 +aBvAZ7f1373MuUiM2oZ9wjxQ2g7tfmrnh+eybJqnpzG56xXtCGv+qr8VbtplHFlj3vL
 pkhUgI2D5Lk+le3R0J9UE94THxI2DlHtKNlmmKKHVsbbpcMjL9kPE9tczUyAHjCcZJpL
 R35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
 b=TmwIhXaLRmX3Js8A+SRlEj6PIgPw3bfQuU/4JGcNyB58EZdyze1+khJPlSpsTUeWfE
 MFMfS5HNUOJJ6eXWEoECE4c3GNMoPCkgEcmv5Qak7WWm5kQMt4LX2o+7ilrlLgK8tQqw
 wx6b2L5FBXJc3TK66O5J94/+LS3TtESsFh21o2ftbleSX5Lpk6IjEQri/uwQU0TcjB/7
 YXio+aq6iHvmRj15pYAgHisE9TI8GTGDs0iF8qMuCs9738KSlIptIC6lGB1FuI8K5K7U
 1lVYEekOPYk79c85c/lM06svb1FmE+eA9QTaU7ATtxPtIQVwUTUfWrS9dXWkkjFlR1/8
 VK1g==
X-Gm-Message-State: AOAM531ErVhHVWUXDIhjCkS3fxIN52gYfh5ZtLi0OFKnBZzF3tZGUlQA
 61Wa2Sy56fciDO9cmTtO1PM=
X-Google-Smtp-Source: ABdhPJwU5ehlAAReHLP8vmHUQVVd0ybuX/CrJukp6q5v77UxVmI5GfpdLM8DWJnlQ9mVR3h91d45Bg==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id
 f13mr3661249wmq.7.1637677300824; 
 Tue, 23 Nov 2021 06:21:40 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 15/26] drm/amdgpu: use dma_resv_for_each_fence for CS
 workaround
Date: Tue, 23 Nov 2021 15:21:00 +0100
Message-Id: <20211123142111.3885-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the write fence using dma_resv_for_each_fence instead of accessing
it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 53e407ea4c89..7facd614e50a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1268,6 +1268,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		struct dma_resv *resv = e->tv.bo->base.resv;
 		struct dma_fence_chain *chain = e->chain;
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
 
 		if (!chain)
 			continue;
@@ -1277,9 +1279,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		 * submission in a dma_fence_chain and add it as exclusive
 		 * fence.
 		 */
-		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
-				     dma_fence_get(p->fence), 1);
-
+		dma_resv_for_each_fence(&cursor, resv, false, fence) {
+			break;
+		}
+		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
-- 
2.25.1

