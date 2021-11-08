Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363744A0C7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 02:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF676E202;
	Tue,  9 Nov 2021 01:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383006E203
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 01:03:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2018061452;
 Tue,  9 Nov 2021 01:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419798;
 bh=xbBnIUX/zyaJx7lBhF4iyaKWUIKp0gzgpFILNaZqnwY=;
 h=From:To:Cc:Subject:Date:From;
 b=mmy2IAwcmn0rf43MkV4cKBBHvUMY2P73K2MdK3BxGlQ3BiJnEjyTa8NLqPs3mPgDf
 s5sOhANzHx9H5GqH9bSySZU7bljZRSp9q5zX12g3X/goF2rRA1Q1MXjctYMJlshq1d
 xiqtRe/4cJw3JKwxyOQR4FAIvDpkNX6jgsvNALFZZR+VMWG9H1ATfT7eZTPxmjaXQW
 3fVbyGmZkidGD5XvN1wYmbDmLsSoYjMGyWpHraq2GFqDUxL7eGE6nZ+XOAT/5fVB4L
 Y3xz9PYFqAr1VvhCMkP4FgnUFbiWAHKM4it9fvgasi94ChZc3xG/TnGweVtohsAcwT
 UjjyHyVqRRODg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 001/101] dma-buf: WARN on dmabuf release with
 pending attachments
Date: Mon,  8 Nov 2021 12:46:51 -0500
Message-Id: <20211108174832.1189312-1-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Charan Teja Reddy <charante@codeaurora.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Charan Teja Reddy <charante@codeaurora.org>

[ Upstream commit f492283b157053e9555787262f058ae33096f568 ]

It is expected from the clients to follow the below steps on an imported
dmabuf fd:
a) dmabuf = dma_buf_get(fd) // Get the dmabuf from fd
b) dma_buf_attach(dmabuf); // Clients attach to the dmabuf
   o Here the kernel does some slab allocations, say for
dma_buf_attachment and may be some other slab allocation in the
dmabuf->ops->attach().
c) Client may need to do dma_buf_map_attachment().
d) Accordingly dma_buf_unmap_attachment() should be called.
e) dma_buf_detach () // Clients detach to the dmabuf.
   o Here the slab allocations made in b) are freed.
f) dma_buf_put(dmabuf) // Can free the dmabuf if it is the last
reference.

Now say an erroneous client failed at step c) above thus it directly
called dma_buf_put(), step f) above. Considering that it may be the last
reference to the dmabuf, buffer will be freed with pending attachments
left to the dmabuf which can show up as the 'memory leak'. This should
at least be reported as the WARN().

Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1627043468-16381-1-git-send-email-charante@codeaurora.org
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 922416b3aaceb..93e9bf7382595 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -79,6 +79,7 @@ static void dma_buf_release(struct dentry *dentry)
 	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
 		dma_resv_fini(dmabuf->resv);
 
+	WARN_ON(!list_empty(&dmabuf->attachments));
 	module_put(dmabuf->owner);
 	kfree(dmabuf->name);
 	kfree(dmabuf);
-- 
2.33.0

