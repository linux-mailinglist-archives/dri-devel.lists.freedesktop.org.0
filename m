Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7362D369
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 07:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73A510E540;
	Thu, 17 Nov 2022 06:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81BF10E540
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 06:21:58 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NCV9J2bx9zJnpN;
 Thu, 17 Nov 2022 14:18:44 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 14:21:53 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <tjmercier@google.com>, <quic_charante@quicinc.com>,
 <cuigaosheng1@huawei.com>
Subject: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Date: Thu, 17 Nov 2022 14:21:52 +0800
Message-ID: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
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

Smatch report warning as follows:

drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
  '&dmabuf->list_node' not removed from list

If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
and dmabuf will be freed, but dmabuf->list_node will not be removed
from db_list.head, then list traversal may cause UAF.

Fix by removeing it from db_list.head before free().

Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf is in valid list")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/dma-buf/dma-buf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b809513b03fe..6848f50226d5 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	return dmabuf;
 
 err_sysfs:
+	mutex_lock(&db_list.lock);
+	list_del(&dmabuf->list_node);
+	mutex_unlock(&db_list.lock);
 	/*
 	 * Set file->f_path.dentry->d_fsdata to NULL so that when
 	 * dma_buf_release() gets invoked by dentry_ops, it exits
-- 
2.25.1

