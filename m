Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DA959B07E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 22:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3011210E18D;
	Sat, 20 Aug 2022 20:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1035 seconds by postgrey-1.36 at gabe;
 Sat, 20 Aug 2022 20:36:19 UTC
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042C310E18D
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Aug 2022 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f2B88BtT0BwDCUCOMm6ekzS3U/w1aqQ18CQ1ZZdJD/E=; b=t4V9+RqY7T7nt2AplXZGZuwMf7
 s3qXoMRZHZiKje/YQV1Pfsc32jeoxb/0lO+zLdoFJaiQxul0jyhraOYDIoZDmJAM4/NUj/ucvtv+y
 nuc508sDx7XDqrE2PlAGqzyC2v4L03sey6n0yO+T2fJA2bwDTzslN0G8AcAb4hV+Cv5PJ08T2xbwH
 btzgXGsOTMIqHOGNdqb+QWXU9X0nboW7znR+9sc5xGqTx2NdqIMcRy+w9xJgCB0Ds54QJyKIGiDKN
 2+xjRGY44/nrkUjd42RKHK5rSV+G92uTI12jCDdpmbVm/vaYcb9eO5bcgTL2PWwEtpRfowheUmqzj
 7FatFZyg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat
 Linux)) id 1oPUvs-006TBb-7J; Sat, 20 Aug 2022 20:19:00 +0000
Date: Sat, 20 Aug 2022 21:19:00 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 6/8] dma_buf: no need to bother with file_inode()->i_mapping
Message-ID: <YwFBtOjAW6wSddh1@ZenIV>
References: <YwFANLruaQpqmPKv@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwFANLruaQpqmPKv@ZenIV>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

->f_mapping will do just fine

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 38e8767ec371..210473d927d8 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -210,7 +210,7 @@ static long udmabuf_create(struct miscdevice *device,
 		memfd = fget(list[i].memfd);
 		if (!memfd)
 			goto err;
-		mapping = file_inode(memfd)->i_mapping;
+		mapping = memfd->f_mapping;
 		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
 			goto err;
 		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
-- 
2.30.2

