Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4F2AC4AD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8238945B;
	Mon,  9 Nov 2020 19:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222108947A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 19:09:13 +0000 (UTC)
IronPort-SDR: 78Cp6sQnX7Z8Xepe1JxGr8LnlR5OOJXMPXFqDjPkl3zhVUd8uCKw22AjDWW4txpb5YHhC08RMO
 qbuKCuS5JgqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="169070012"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="169070012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 11:09:12 -0800
IronPort-SDR: XniuvPadEvO05b5r0EfhCtbwkxIRmNx1RHP8ILdHHGPLXWnqEfAUQAwxv2orW0hIrWGmChJaGd
 7KoQbTV8lm8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="365175188"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2020 11:09:11 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 5/5] dma-buf: Reject attach request from importers that use
 dma_virt_ops
Date: Mon,  9 Nov 2020 11:23:01 -0800
Message-Id: <1604949781-20735-6-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1604949781-20735-1-git-send-email-jianxin.xiong@intel.com>
References: <1604949781-20735-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_virt_ops is used by virtual devices that map pages / scatterlists to
virtual addresses for CPU access instead of performing DMA. This is not
the intended use of dma_buf_attach() and dma_buf_map_attachment(). CPU
access of dma-buf should use dma_buf_vmap() and related functions.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 drivers/dma-buf/dma-buf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 9a054fb5..ba2b877 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -686,6 +686,11 @@ struct dma_buf_attachment *
 	if (WARN_ON(importer_ops && !importer_ops->move_notify))
 		return ERR_PTR(-EINVAL);
 
+#ifdef CONFIG_DMA_VIRT_OPS
+	if (dev->dma_ops == &dma_virt_ops)
+		return ERR_PTR(-EINVAL);
+#endif
+
 	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
 	if (!attach)
 		return ERR_PTR(-ENOMEM);
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
