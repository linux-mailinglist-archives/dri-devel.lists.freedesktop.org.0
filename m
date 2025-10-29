Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC07AC1CC49
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 19:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE51D10E1AB;
	Wed, 29 Oct 2025 18:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI/u6Sxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D41610E1AB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:25:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TBvqUo3692136; Wed, 29 Oct 2025 18:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ZJ+GCWj0mWEzZtMx5o2Zuv9K8lczbhQgnGr
 VYz1BI18=; b=lI/u6Sxauvu5kC5WYw2ikzld5I3rOOraBQ0hKzggWG5/xhwnmKU
 NHok1rPXl6dnOGeT6+uQgiJz5IX3rSadUfA/b2wqOv4S+R8J45ejdmua2w3RRBu4
 Ab+UpSmavYzcsgJ7ZIoxdFZLU/5lNU5iBBG+prJLrElhAACX9T4jVxty3bD6Exjm
 7bZFdh6ftfYLTgWdyDBx/aD41udGWztHbDTrS6C4XWrlDDnTwKtmxwhrCRGTz+sC
 J7rtZmsR+wNGIdfpCStvbe1jden8eqbr6KXGUpBk7FKOkbcBClBxtbnWzFo6bdcn
 WmLwLzl0PJD6mCv22r2qVJ9Awi1LULNCIhg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2kppk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Oct 2025 18:25:18 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59TIPHKw010528; 
 Wed, 29 Oct 2025 18:25:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a3m4ntac2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Oct 2025 18:25:17 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59TIPHo3010523;
 Wed, 29 Oct 2025 18:25:17 GMT
Received: from hu-devc-lv-u22-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com
 [10.81.26.129])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 59TIPHpc010520
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Oct 2025 18:25:17 +0000
Received: by hu-devc-lv-u22-a.qualcomm.com (Postfix, from userid 4696302)
 id 5D7B25B6; Wed, 29 Oct 2025 11:25:17 -0700 (PDT)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson.kernel@gmail.com,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [PATCH v3] accel/qaic: Add support for PM callbacks
Date: Wed, 29 Oct 2025 11:18:12 -0700
Message-Id: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VQXRHv26FFsJlVW2sftG5-RujTYBpcQm
X-Proofpoint-ORIG-GUID: VQXRHv26FFsJlVW2sftG5-RujTYBpcQm
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=69025c0e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=o44ZkyJObLYcM7zQEGMA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE0NyBTYWx0ZWRfX9Bu+qsSh4QXk
 O9wSbEBwn+/Mznia7BZkVoGGEhyd+5n+axxrfkOIMOw1g/lz4nPHL8C/A8wrcpTfIrvQgu1ouQ0
 iY0/qEJ9UgYR2PCyTcJKhTu9VCcWuQh/5W9pGDXg0JgZLTcmjgwQQlzYZOcxQ9w2c/CUIJhgPGU
 1UzG7jsYXBV8Q7Z/IOgaVDW1KwIA4DaapHhIHMIckdKxaY2aM5/KeSx6eTZVm2ICpJwiZS1Uqd6
 Wo+EpySljpl7u8JwZa0kgNBBj9SkoER6BsL4tWdBTE3/+38oVRnLxU5JCzKx8lhU7tyojTsGXTq
 pij5w2otbQrPLdcs/wbkK6N7fyTL6xNhkPgQp83caWzD3fJZmhKWC5/q4Fs558cnPrILvvcwfhT
 2X6IhR+SRWDO1KXku34H5qVoSmIQqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290147
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

From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Add initial support for suspend and hibernation PM callbacks to QAIC.
The device can be suspended any time in which the data path is not
busy as queued I/O operations are lost on suspension and cannot be
resumed after suspend.

Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---
Changes in v3:
- Update commit message to be more descriptive.
- Initialize return value to avoid returning uninitialized data in qaic_data_path_busy.
- Use modern PM macros to register callbacks and avoid checking for CONFIG_PM_SLEEP directly.
- Link to v2: https://lore.kernel.org/all/20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com/

Changes in v2:
- Guard the pm callbacks with CONFIG_PM_SLEEP to fix openrisc build error
- Add __maybe_unused to helper functions used only in PM callbacks currently
- Link to v1: https://lore.kernel.org/all/20251022204005.3888195-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/qaic.h          |  2 +
 drivers/accel/qaic/qaic_drv.c      | 89 ++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_timesync.c |  9 +++
 drivers/accel/qaic/qaic_timesync.h |  3 +
 4 files changed, 103 insertions(+)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 820d133236dd..2bfc4ce203c5 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -161,6 +161,8 @@ struct qaic_device {
 	struct mhi_device	*qts_ch;
 	/* Work queue for tasks related to MHI "QAIC_TIMESYNC" channel */
 	struct workqueue_struct	*qts_wq;
+	/* MHI "QAIC_TIMESYNC_PERIODIC" channel device */
+	struct mhi_device	*mqts_ch;
 	/* Head of list of page allocated by MHI bootlog device */
 	struct list_head        bootlog;
 	/* MHI bootlog channel device */
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index e162f4b8a262..1b5dc717a6c7 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -660,6 +660,92 @@ static const struct pci_error_handlers qaic_pci_err_handler = {
 	.reset_done = qaic_pci_reset_done,
 };
 
+static bool qaic_is_under_reset(struct qaic_device *qdev)
+{
+	int rcu_id;
+	bool ret;
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	ret = qdev->dev_state != QAIC_ONLINE;
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return ret;
+}
+
+static bool qaic_data_path_busy(struct qaic_device *qdev)
+{
+	bool ret = false;
+	int dev_rcu_id;
+	int i;
+
+	dev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->dev_state != QAIC_ONLINE) {
+		srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
+		return false;
+	}
+	for (i = 0; i < qdev->num_dbc; i++) {
+		struct dma_bridge_chan *dbc = &qdev->dbc[i];
+		unsigned long flags;
+		int ch_rcu_id;
+
+		ch_rcu_id = srcu_read_lock(&dbc->ch_lock);
+		if (!dbc->usr || !dbc->in_use) {
+			srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
+			continue;
+		}
+		spin_lock_irqsave(&dbc->xfer_lock, flags);
+		ret = !list_empty(&dbc->xfer_list);
+		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
+		srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
+		if (ret)
+			break;
+	}
+	srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
+	return ret;
+}
+
+static int qaic_pm_suspend(struct device *dev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+
+	dev_dbg(dev, "Suspending..\n");
+	if (qaic_data_path_busy(qdev)) {
+		dev_dbg(dev, "Device's datapath is busy. Aborting suspend..\n");
+		return -EBUSY;
+	}
+	if (qaic_is_under_reset(qdev)) {
+		dev_dbg(dev, "Device is under reset. Aborting suspend..\n");
+		return -EBUSY;
+	}
+	qaic_mqts_ch_stop_timer(qdev->mqts_ch);
+	qaic_pci_reset_prepare(qdev->pdev);
+	pci_save_state(qdev->pdev);
+	pci_disable_device(qdev->pdev);
+	pci_set_power_state(qdev->pdev, PCI_D3hot);
+	return 0;
+}
+
+static int qaic_pm_resume(struct device *dev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
+	int ret;
+
+	dev_dbg(dev, "Resuming..\n");
+	pci_set_power_state(qdev->pdev, PCI_D0);
+	pci_restore_state(qdev->pdev);
+	ret = pci_enable_device(qdev->pdev);
+	if (ret) {
+		dev_err(dev, "pci_enable_device failed on resume %d\n", ret);
+		return ret;
+	}
+	pci_set_master(qdev->pdev);
+	qaic_pci_reset_done(qdev->pdev);
+	return 0;
+}
+
+static const struct dev_pm_ops qaic_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(qaic_pm_suspend, qaic_pm_resume)
+};
+
 static struct pci_driver qaic_pci_driver = {
 	.name = QAIC_NAME,
 	.id_table = qaic_ids,
@@ -667,6 +753,9 @@ static struct pci_driver qaic_pci_driver = {
 	.remove = qaic_pci_remove,
 	.shutdown = qaic_pci_shutdown,
 	.err_handler = &qaic_pci_err_handler,
+	.driver = {
+		.pm = pm_sleep_ptr(&qaic_pm_ops),
+	},
 };
 
 static int __init qaic_init(void)
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 3fac540f8e03..8af2475f4f36 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -171,6 +171,13 @@ static void qaic_timesync_timer(struct timer_list *t)
 		dev_err(mqtsdev->dev, "%s mod_timer error:%d\n", __func__, ret);
 }
 
+void qaic_mqts_ch_stop_timer(struct mhi_device *mhi_dev)
+{
+	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
+
+	timer_delete_sync(&mqtsdev->timer);
+}
+
 static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
@@ -206,6 +213,7 @@ static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_devi
 	timer->expires = jiffies + msecs_to_jiffies(timesync_delay_ms);
 	add_timer(timer);
 	dev_set_drvdata(&mhi_dev->dev, mqtsdev);
+	qdev->mqts_ch = mhi_dev;
 
 	return 0;
 
@@ -221,6 +229,7 @@ static void qaic_timesync_remove(struct mhi_device *mhi_dev)
 {
 	struct mqts_dev *mqtsdev = dev_get_drvdata(&mhi_dev->dev);
 
+	mqtsdev->qdev->mqts_ch = NULL;
 	timer_delete_sync(&mqtsdev->timer);
 	mhi_unprepare_from_transfer(mqtsdev->mhi_dev);
 	kfree(mqtsdev->sync_msg);
diff --git a/drivers/accel/qaic/qaic_timesync.h b/drivers/accel/qaic/qaic_timesync.h
index 851b7acd43bb..77b9c2b55057 100644
--- a/drivers/accel/qaic/qaic_timesync.h
+++ b/drivers/accel/qaic/qaic_timesync.h
@@ -6,6 +6,9 @@
 #ifndef __QAIC_TIMESYNC_H__
 #define __QAIC_TIMESYNC_H__
 
+#include <linux/mhi.h>
+
 int qaic_timesync_init(void);
 void qaic_timesync_deinit(void);
+void qaic_mqts_ch_stop_timer(struct mhi_device *mhi_dev);
 #endif /* __QAIC_TIMESYNC_H__ */
-- 
2.34.1

