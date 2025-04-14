Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B779A881DD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43B110E5B5;
	Mon, 14 Apr 2025 13:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oMqg/MOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7DF10E5B5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:27:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3DB5D44E8F;
 Mon, 14 Apr 2025 13:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C120C4CEE2;
 Mon, 14 Apr 2025 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744637257;
 bh=TsvvjU34ou6DeKBnAEaZf6xjk/wVJu2sGieu/mEr1vs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oMqg/MOf3Lo00KJvtKWWbFZDheN9yP2HK+OpYqI7R8SXt+pWU3AC6r1MdK0VaHNUm
 wB+bZ7JUs1WQ7jrPJK8HrTr23Vip3CUo/ySzeTGXBmqbwJUODuYN8okrt3fcsZreFR
 2UuWug76wUzP3SahaJOCZ6Iarv8h4VBxE5vJI04iokHUKGceodm0vLJx78v8dQ6wmP
 /axJ9I7fgBro3iyUcDwoBliZBpjsu3m2wFSIto74BO/dgWMryPmsBG6Bm7saV0bs9Z
 4yH7omRPby867GmIxULPBEx+CcGG0TcCuO4H9niyv7H1G6N7Vnab0fMMEpxFMI9NEg
 VW+at8GvTpA6A==
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
Subject: [PATCH AUTOSEL 6.13 03/34] udmabuf: fix a buf size overflow issue
 during udmabuf creation
Date: Mon, 14 Apr 2025 09:26:57 -0400
Message-Id: <20250414132729.679254-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132729.679254-1-sashal@kernel.org>
References: <20250414132729.679254-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.11
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
index cc7398cc17d67..e74e36a8ecda2 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -393,7 +393,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		pgoff_t subpgcnt;
 
-- 
2.39.5

