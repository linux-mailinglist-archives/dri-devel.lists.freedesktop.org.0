Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6B2A3B14
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 04:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C3E6E155;
	Tue,  3 Nov 2020 03:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E57A6E82F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 03:38:05 +0000 (UTC)
IronPort-SDR: vUq5qprJXc8qUkN7stxoXHzI4T0MasP97s728nmF/XDoBAZUrMvuDaIs9u5Rii6kBp+8lSUMFf
 InKVRifI/TUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="233163225"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="233163225"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 19:38:04 -0800
IronPort-SDR: YZtzvHiXwGgrng1OEHaydIOog74tass7MzRCPiqTDyZrXzNcRMvU0R5aab09MRZwM1DtkM3Oc3
 OIeXfcIl/3KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="325087546"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga006.jf.intel.com with ESMTP; 02 Nov 2020 19:38:04 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Fix static checker warning
Date: Mon,  2 Nov 2020 19:51:58 -0800
Message-Id: <1604375518-145511-1-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here is the warning message:

	drivers/dma-buf/dma-buf.c:917 dma_buf_map_attachment()
	error: 'sg_table' dereferencing possible ERR_PTR()

Fix by adding error checking before dereferencing the pointer.

Fixes: ac80cd17a615 ("dma-buf: Clarify that dma-buf sg lists are page aligned")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 556f62e..0eb80c1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -908,7 +908,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	}
 
 #ifdef CONFIG_DMA_API_DEBUG
-	{
+	if (!IS_ERR(sg_table)) {
 		struct scatterlist *sg;
 		u64 addr;
 		int len;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
