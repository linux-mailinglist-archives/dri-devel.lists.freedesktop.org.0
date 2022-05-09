Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354F520E0F
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA6710EC23;
	Tue, 10 May 2022 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3978910E0FE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652125834; x=1683661834;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4lF5eKVzZJ607ZK+N219R0WFG63ugDlCSKTeifbf0n4=;
 b=dwT3eOL99g1zvoiXB94bqakkz5737gM1/x1jHPQwxEEDMxjHZTlY+aer
 cCIgEKeSI9QRfezVTc+uOH2Btnir12VqRU0hDX6fGXmFbtTW71HPToF58
 r9XJ579hS8UNDRzbiUH3NSF6KuOP548X9ggSweHUpKOaK8f5Ege6Awy5G s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 09 May 2022 12:50:33 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 12:50:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 12:50:32 -0700
Received: from hu-charante-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 12:50:28 -0700
From: Charan Teja Kalla <quic_charante@quicinc.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <hridya@google.com>, <daniel.vetter@ffwll.ch>, <gregkh@linuxfoundation.org>
Subject: [PATCH] dma-buf: call dma_buf_stats_setup after dmabuf is in valid
 list
Date: Tue, 10 May 2022 01:19:57 +0530
Message-ID: <1652125797-2043-1-git-send-email-quic_charante@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Tue, 10 May 2022 06:48:43 +0000
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
 linaro-mm-sig@lists.linaro.org, Charan Teja Reddy <quic_charante@quicinc.com>,
 tjmercier@google.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Charan Teja Reddy <quic_charante@quicinc.com>

When dma_buf_stats_setup() fails, it closes the dmabuf file which
results into the calling of dma_buf_file_release() where it does
list_del(&dmabuf->list_node) with out first adding it to the proper
list. This is resulting into panic in the below path:
__list_del_entry_valid+0x38/0xac
dma_buf_file_release+0x74/0x158
__fput+0xf4/0x428
____fput+0x14/0x24
task_work_run+0x178/0x24c
do_notify_resume+0x194/0x264
work_pending+0xc/0x5f0

Fix it by moving the dma_buf_stats_setup() after dmabuf is added to the
list.

Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
Signed-off-by: Charan Teja Reddy <quic_charante@quicinc.com>
---
 drivers/dma-buf/dma-buf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 602b12d..a6fc96e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -543,10 +543,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	file->f_mode |= FMODE_LSEEK;
 	dmabuf->file = file;
 
-	ret = dma_buf_stats_setup(dmabuf);
-	if (ret)
-		goto err_sysfs;
-
 	mutex_init(&dmabuf->lock);
 	INIT_LIST_HEAD(&dmabuf->attachments);
 
@@ -554,6 +550,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	list_add(&dmabuf->list_node, &db_list.head);
 	mutex_unlock(&db_list.lock);
 
+	ret = dma_buf_stats_setup(dmabuf);
+	if (ret)
+		goto err_sysfs;
+
 	return dmabuf;
 
 err_sysfs:
-- 
2.7.4

