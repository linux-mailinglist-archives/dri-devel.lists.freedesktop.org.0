Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B8A88213
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F10D10E5C4;
	Mon, 14 Apr 2025 13:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YdyEmnS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D3710E5C4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:30:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A6B3A48962;
 Mon, 14 Apr 2025 13:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9674AC4CEE2;
 Mon, 14 Apr 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744637405;
 bh=bSdjzf03N5dkH1r6wALmuE4ALtyVK39xcb0mwy/hEwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YdyEmnS95zF/sd+/SjXX8/WuYXIfZiGn7p5vOt0GQHcqVacfiyw+n4YitYmUi1Cd4
 B1l/3M5xykCIrLKkpl/OKdrN+EkEhZOdJMrBJLz6wXDf6ipTuWPHCTcsiz2Uja5Xog
 h0DyPs6xTcXbqHIiKixa+PGEEWfK0LjjRknDjZLXqM0ou5rjFQ7Sw6/V8ZbCWj67Mt
 46tq3Xy6dZb7MhtLpmNGtXeCC1GozlpnZV/JE9tuoRw9AJSryPIT/FboEP8dC/GLX5
 9uChci2tSdK/nUu7Yue3pJEm+5uSaxRxIQpMCyxGFjv67EInYj4hZf4OEuQ7R00PjP
 nZmRgbLIfQEhw==
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
Subject: [PATCH AUTOSEL 6.6 03/24] udmabuf: fix a buf size overflow issue
 during udmabuf creation
Date: Mon, 14 Apr 2025 09:29:36 -0400
Message-Id: <20250414132957.680250-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132957.680250-1-sashal@kernel.org>
References: <20250414132957.680250-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.87
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
index d1fcdd1f9aaed..373282beeb606 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -214,7 +214,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
 			goto err;
-- 
2.39.5

