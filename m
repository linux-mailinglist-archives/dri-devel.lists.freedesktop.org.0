Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA00A88244
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC7910E5D8;
	Mon, 14 Apr 2025 13:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="txO8bS0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B0C10E5DB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:32:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6409D5C3EFB;
 Mon, 14 Apr 2025 13:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F4FC4CEE2;
 Mon, 14 Apr 2025 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744637549;
 bh=upAYoaIKfnFp1YqPIV0HEDCVf8HfkmFlgbEOGAyFOxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=txO8bS0U2ja0qSKFP9not2bmF6L3p/E1hywzwYkETmFklK8+WXK7sYzfV8jqOuXBc
 l14hyH4zApSIewGPcsO6j9q0KNFAzmae0Fe0ozl2GMqY+GvGKxn3qE1/w7EBRdlVTz
 wGDI4YWoOJsnlURcTGmXe0YrWZ8ZYejeUD0InhuyGzFuHBlkJJYJreWvewQNL4oeWD
 yi+i8vXWmoRbICXWrzCadrxioEFcKSonXpk0VNjYv3276dV7yZi6ZZfL1Ljg1eRmtN
 zannv8vFie+2kHs6kttGXCs9o6h+rXs1TmSdb10bCR0ReTGjJbrAJEHgZFA4c0/T3U
 Um7AM51+Ey9vQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xiaogang Chen <xiaogang.chen@amd.com>,
 Xiaogang Chen <Xiaogang.Chen@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, kraxel@redhat.com,
 vivek.kasireddy@intel.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 5.4 2/5] udmabuf: fix a buf size overflow issue during
 udmabuf creation
Date: Mon, 14 Apr 2025 09:32:20 -0400
Message-Id: <20250414133223.681195-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133223.681195-1-sashal@kernel.org>
References: <20250414133223.681195-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.292
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

From: Xiaogang Chen <xiaogang.chen@amd.com>

[ Upstream commit 021ba7f1babd029e714d13a6bf2571b08af96d0f ]

by casting size_limit_mb to u64  when calculate pglimit.

Signed-off-by: Xiaogang Chen<Xiaogang.Chen@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250321164126.329638-1-xiaogang.chen@amd.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index ae42e98cf8350..dfb572282097b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -138,7 +138,7 @@ static long udmabuf_create(const struct udmabuf_create_list *head,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
 			goto err;
-- 
2.39.5

