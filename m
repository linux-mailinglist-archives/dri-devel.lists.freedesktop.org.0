Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E10270BF8
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EA96E1B6;
	Sat, 19 Sep 2020 08:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Fri, 18 Sep 2020 10:37:46 UTC
Received: from so254-54.mailgun.net (so254-54.mailgun.net [198.61.254.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44936E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 10:37:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600425466; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qb2WoD3uf4Yfjw2dRwpjc0+G2WvhyNMin/XBmb+tRQ4=;
 b=RWAqYS9lyVOJZ5XyTiA+/ulneXpW83nTT/hfSox1o9nb0yhO+mzUv1Sk8d87nGXr0AHpxBP2
 FUEoMeGbyeYjDJ/uP2iwljzQqL6uvMcJ+aHw72XOUHyoU20gMmSKJ6ul/47kuZiVSUWduWiA
 HLBjsHUgkZjFhHsNdAAcAm1rrNA=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f648ccd0049ea5816406199 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 10:32:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C6F9C4339C; Fri, 18 Sep 2020 10:32:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from charante-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: charante)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 21028C43382;
 Fri, 18 Sep 2020 10:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 21028C43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=charante@codeaurora.org
From: Charan Teja Reddy <charante@codeaurora.org>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	arnd@arndb.de
Subject: [PATCH] dmabuf: fix NULL pointer dereference in dma_buf_release()
Date: Fri, 18 Sep 2020 16:02:31 +0530
Message-Id: <1600425151-27670-1-git-send-email-charante@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, vinmenon@codeaurora.org,
 Charan Teja Reddy <charante@codeaurora.org>, stable@vger.kernel.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NULL pointer dereference is observed while exporting the dmabuf but
failed to allocate the 'struct file' which results into the dropping of
the allocated dentry corresponding to this file in the dmabuf fs, which
is ending up in dma_buf_release() and accessing the uninitialzed
dentry->d_fsdata.

Call stack on 5.4 is below:
 dma_buf_release+0x2c/0x254 drivers/dma-buf/dma-buf.c:88
 __dentry_kill+0x294/0x31c fs/dcache.c:584
 dentry_kill fs/dcache.c:673 [inline]
 dput+0x250/0x380 fs/dcache.c:859
 path_put+0x24/0x40 fs/namei.c:485
 alloc_file_pseudo+0x1a4/0x200 fs/file_table.c:235
 dma_buf_getfile drivers/dma-buf/dma-buf.c:473 [inline]
 dma_buf_export+0x25c/0x3ec drivers/dma-buf/dma-buf.c:585

Fix this by checking for the valid pointer in the dentry->d_fsdata.

Fixes: 4ab59c3c638c ("dma-buf: Move dma_buf_release() from fops to dentry_ops")
Cc: <stable@vger.kernel.org> [5.7+]
Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
---
 drivers/dma-buf/dma-buf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 58564d82..844967f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -59,6 +59,8 @@ static void dma_buf_release(struct dentry *dentry)
 	struct dma_buf *dmabuf;
 
 	dmabuf = dentry->d_fsdata;
+	if (unlikely(!dmabuf))
+		return;
 
 	BUG_ON(dmabuf->vmapping_counter);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
