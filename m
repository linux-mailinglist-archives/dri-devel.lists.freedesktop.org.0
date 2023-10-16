Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B27CB0DC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 19:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1D810E22C;
	Mon, 16 Oct 2023 17:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFCF10E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 17:00:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39GCslUF028586; Mon, 16 Oct 2023 17:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=5M6rN1ZMyRXNgw5gyKJC0wpJdrpfGL4lansrpnY5rtg=;
 b=CMn3zKi59ogl4gQ03lkDL/5On6S1PDh6wI8XYAofdedAuI/UQlVQBF6pt6UzbT8+NKhG
 9yEAUxZKBwMWECnkE5iLc818/uCR1eSmkl+DFJKnaYqUdKA7Avtws9GGZaN/i+pOUX32
 /cTOfVf1UntKPPg4dWP83bvoZLG7A9P2sfzuvKBBrf35pTwWusUB+LNS7GvqziOThzPu
 34Q7qMDxydLwUp2SFO+/yldZV6sf4rNAHFwkD4Ld5zuynHvFjMnvtCqDnIKCCcSdNdMi
 N82lqUBjMR1OnCwpOd8V8JrSk7YP2qJLQHDdORuxHi0qzQ85+9nmz4LwNOvxyR71mDQg Jg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ts0xksc5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Oct 2023 17:00:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39GH0ppK021072
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Oct 2023 17:00:51 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 16 Oct 2023 10:00:50 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_ajitpals@quicinc.com>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <ogabbay@kernel.org>
Subject: [PATCH v2] accel/qaic: Enable 1 MSI fallback mode
Date: Mon, 16 Oct 2023 11:00:36 -0600
Message-ID: <20231016170036.5409-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8m7sq7SM4CDG9UqSKvdx0mX4l2chrRtm
X-Proofpoint-ORIG-GUID: 8m7sq7SM4CDG9UqSKvdx0mX4l2chrRtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310160147
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Carl Vanderlip <quic_carlv@quicinc.com>

Several virtualization use-cases either don't support 32 MultiMSIs
(Xen/VMware) or have significant drawbacks to their use (KVM's vIOMMU,
which is required to support 32 MSI, needs to allocate an alternate
system memory space for each device using vIOMMU (e.g. 8GB VM mem and
2 cards => 8 + 2 * 8 = 24GB host memory required)). Support these
cases by enabling a 1 MSI fallback mode.

Whenever all 32 MSIs requested are not available, a second request for
a single MSI is made. Its success is the initiator of single MSI mode.
This mode causes all interrupts generated by the device to be directed
to the 0th MSI (firmware >=v1.10 will do this as a response to the PCIe
MSI capability configuration). Likewise, all interrupt handlers for the
device are registered to the 0th MSI.

Since the DBC interrupt handler checks if the DBC is in use or if
there is any pending changes, the 'spurious' interrupts are
disregarded. If there is work to be done, the standard threaded IRQ
handler is dispatched.

On every interrupt, the MHI handler wakes up its threaded interrupt
handler, and attempts to wake any waiters for MHI state events.

Performance is within +-0.6% for test cases that typify real world
use. Larger differences ([-4,+132]%, avg +47%) exist for very simple
tasks (e.g. addition) compiled for single NSPs. It is assumed that the
small work and many interrupts typically cause contention (e.g. 16 NSPs
vs 4 CPUs), as evidenced by the standard deviation between runs also
decreasing (r=-0.48 between delta(Performace_test) and
delta(StdDev_test/Avg_test))

Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---

v2:
- Remove function name from info print

 Documentation/accel/qaic/aic100.rst |  5 +++--
 Documentation/accel/qaic/qaic.rst   | 23 +++++++++++++++++++
 drivers/accel/qaic/mhi_controller.c |  6 ++++-
 drivers/accel/qaic/mhi_controller.h |  2 +-
 drivers/accel/qaic/qaic.h           |  2 ++
 drivers/accel/qaic/qaic_data.c      | 25 +++++++++++++++------
 drivers/accel/qaic/qaic_drv.c       | 35 ++++++++++++++++++++---------
 7 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
index c80d0f1307db..a5fef0869aab 100644
--- a/Documentation/accel/qaic/aic100.rst
+++ b/Documentation/accel/qaic/aic100.rst
@@ -36,8 +36,9 @@ AIC100 DID (0xa100).
 
 AIC100 does not implement FLR (function level reset).
 
-AIC100 implements MSI but does not implement MSI-X. AIC100 requires 17 MSIs to
-operate (1 for MHI, 16 for the DMA Bridge).
+AIC100 implements MSI but does not implement MSI-X. AIC100 prefers 17 MSIs to
+operate (1 for MHI, 16 for the DMA Bridge). Falling back to 1 MSI is possible in
+scenarios where reserving 32 MSIs isn't feasible.
 
 As a PCIe device, AIC100 utilizes BARs to provide host interfaces to the device
 hardware. AIC100 provides 3, 64-bit BARs.
diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index c88502383136..9ccbfea86f5a 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -10,6 +10,9 @@ accelerator products.
 Interrupts
 ==========
 
+IRQ Storm Mitigation
+--------------------
+
 While the AIC100 DMA Bridge hardware implements an IRQ storm mitigation
 mechanism, it is still possible for an IRQ storm to occur. A storm can happen
 if the workload is particularly quick, and the host is responsive. If the host
@@ -35,6 +38,26 @@ generates 100k IRQs per second (per /proc/interrupts) is reduced to roughly 64
 IRQs over 5 minutes while keeping the host system stable, and having the same
 workload throughput performance (within run to run noise variation).
 
+Single MSI Mode
+---------------
+
+MultiMSI is not well supported on all systems; virtualized ones even less so
+(circa 2023). Between hypervisors masking the PCIe MSI capability structure to
+large memory requirements for vIOMMUs (required for supporting MultiMSI), it is
+useful to be able to fall back to a single MSI when needed.
+
+To support this fallback, we allow the case where only one MSI is able to be
+allocated, and share that one MSI between MHI and the DBCs. The device detects
+when only one MSI has been configured and directs the interrupts for the DBCs
+to the interrupt normally used for MHI. Unfortunately this means that the
+interrupt handlers for every DBC and MHI wake up for every interrupt that
+arrives; however, the DBC threaded irq handlers only are started when work to be
+done is detected (MHI will always start its threaded handler).
+
+If the DBC is configured to force MSI interrupts, this can circumvent the
+software IRQ storm mitigation mentioned above. Since the MSI is shared it is
+never disabled, allowing each new entry to the FIFO to trigger a new interrupt.
+
 
 Neural Network Control (NNC) Protocol
 =====================================
diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 5036e58e7235..41be3626587d 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -468,7 +468,7 @@ static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntrl)
 }
 
 struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
-						    int mhi_irq)
+						    int mhi_irq, bool shared_msi)
 {
 	struct mhi_controller *mhi_cntrl;
 	int ret;
@@ -500,6 +500,10 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 		return ERR_PTR(-ENOMEM);
 
 	mhi_cntrl->irq[0] = mhi_irq;
+
+	if (shared_msi) /* MSI shared with data path, no IRQF_NO_SUSPEND */
+		mhi_cntrl->irq_flags = IRQF_SHARED;
+
 	mhi_cntrl->fw_image = "qcom/aic100/sbl.bin";
 
 	/* use latest configured timeout */
diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
index 2ae45d768e24..500e7f4af2af 100644
--- a/drivers/accel/qaic/mhi_controller.h
+++ b/drivers/accel/qaic/mhi_controller.h
@@ -8,7 +8,7 @@
 #define MHICONTROLLERQAIC_H_
 
 struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
-						    int mhi_irq);
+						    int mhi_irq, bool shared_msi);
 void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
 void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
 void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index e3f4c30f3ffd..01e9dda0cc37 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -123,6 +123,8 @@ struct qaic_device {
 	struct srcu_struct	dev_lock;
 	/* true: Device under reset; false: Device not under reset */
 	bool			in_reset;
+	/* true: single MSI is used to operate device */
+	bool			single_msi;
 	/*
 	 * true: A tx MHI transaction has failed and a rx buffer is still queued
 	 * in control device. Such a buffer is considered lost rx buffer
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c90fa6a430f6..b868b4de4d0f 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1465,6 +1465,16 @@ irqreturn_t dbc_irq_handler(int irq, void *data)
 
 	rcu_id = srcu_read_lock(&dbc->ch_lock);
 
+	if (datapath_polling) {
+		srcu_read_unlock(&dbc->ch_lock, rcu_id);
+		/*
+		 * Normally datapath_polling will not have irqs enabled, but
+		 * when running with only one MSI the interrupt is shared with
+		 * MHI so it cannot be disabled. Return ASAP instead.
+		 */
+		return IRQ_HANDLED;
+	}
+
 	if (!dbc->usr) {
 		srcu_read_unlock(&dbc->ch_lock, rcu_id);
 		return IRQ_HANDLED;
@@ -1487,7 +1497,8 @@ irqreturn_t dbc_irq_handler(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	disable_irq_nosync(irq);
+	if (!dbc->qdev->single_msi)
+		disable_irq_nosync(irq);
 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
 	return IRQ_WAKE_THREAD;
 }
@@ -1558,12 +1569,12 @@ irqreturn_t dbc_irq_threaded_fn(int irq, void *data)
 	u32 tail;
 
 	rcu_id = srcu_read_lock(&dbc->ch_lock);
+	qdev = dbc->qdev;
 
 	head = readl(dbc->dbc_base + RSPHP_OFF);
 	if (head == U32_MAX) /* PCI link error */
 		goto error_out;
 
-	qdev = dbc->qdev;
 read_fifo:
 
 	if (!event_count) {
@@ -1644,14 +1655,14 @@ irqreturn_t dbc_irq_threaded_fn(int irq, void *data)
 	goto read_fifo;
 
 normal_out:
-	if (likely(!datapath_polling))
+	if (!qdev->single_msi && likely(!datapath_polling))
 		enable_irq(irq);
-	else
+	else if (unlikely(datapath_polling))
 		schedule_work(&dbc->poll_work);
 	/* checking the fifo and enabling irqs is a race, missed event check */
 	tail = readl(dbc->dbc_base + RSPTP_OFF);
 	if (tail != U32_MAX && head != tail) {
-		if (likely(!datapath_polling))
+		if (!qdev->single_msi && likely(!datapath_polling))
 			disable_irq_nosync(irq);
 		goto read_fifo;
 	}
@@ -1660,9 +1671,9 @@ irqreturn_t dbc_irq_threaded_fn(int irq, void *data)
 
 error_out:
 	srcu_read_unlock(&dbc->ch_lock, rcu_id);
-	if (likely(!datapath_polling))
+	if (!qdev->single_msi && likely(!datapath_polling))
 		enable_irq(irq);
-	else
+	else if (unlikely(datapath_polling))
 		schedule_work(&dbc->poll_work);
 
 	return IRQ_HANDLED;
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 6f58095767df..5eba5f03d3bf 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -424,14 +424,24 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
 	int i;
 
 	/* Managed release since we use pcim_enable_device */
-	ret = pci_alloc_irq_vectors(pdev, 1, 32, PCI_IRQ_MSI);
-	if (ret < 0)
-		return ret;
+	ret = pci_alloc_irq_vectors(pdev, 32, 32, PCI_IRQ_MSI);
+	if (ret == -ENOSPC) {
+		ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+		if (ret < 0)
+			return ret;
 
-	if (ret < 32) {
-		pci_err(pdev, "%s: Requested 32 MSIs. Obtained %d MSIs which is less than the 32 required.\n",
-			__func__, ret);
-		return -ENODEV;
+		/*
+		 * Operate in one MSI mode. All interrupts will be directed to
+		 * MSI0; every interrupt will wake up all the interrupt handlers
+		 * (MHI and DBC[0-15]). Since the interrupt is now shared, it is
+		 * not disabled during DBC threaded handler, but only one thread
+		 * will be allowed to run per DBC, so while it can be
+		 * interrupted, it shouldn't race with itself.
+		 */
+		qdev->single_msi = true;
+		pci_info(pdev, "Allocating 32 MSIs failed, operating in 1 MSI mode. Performance may be impacted.\n");
+	} else if (ret < 0) {
+		return ret;
 	}
 
 	mhi_irq = pci_irq_vector(pdev, 0);
@@ -439,15 +449,17 @@ static int init_msi(struct qaic_device *qdev, struct pci_dev *pdev)
 		return mhi_irq;
 
 	for (i = 0; i < qdev->num_dbc; ++i) {
-		ret = devm_request_threaded_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
+		ret = devm_request_threaded_irq(&pdev->dev,
+						pci_irq_vector(pdev, qdev->single_msi ? 0 : i + 1),
 						dbc_irq_handler, dbc_irq_threaded_fn, IRQF_SHARED,
 						"qaic_dbc", &qdev->dbc[i]);
 		if (ret)
 			return ret;
 
 		if (datapath_polling) {
-			qdev->dbc[i].irq = pci_irq_vector(pdev, i + 1);
-			disable_irq_nosync(qdev->dbc[i].irq);
+			qdev->dbc[i].irq = pci_irq_vector(pdev, qdev->single_msi ? 0 : i + 1);
+			if (!qdev->single_msi)
+				disable_irq_nosync(qdev->dbc[i].irq);
 			INIT_WORK(&qdev->dbc[i].poll_work, irq_polling_work);
 		}
 	}
@@ -479,7 +491,8 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto cleanup_qdev;
 	}
 
-	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq);
+	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_0, mhi_irq,
+						       qdev->single_msi);
 	if (IS_ERR(qdev->mhi_cntrl)) {
 		ret = PTR_ERR(qdev->mhi_cntrl);
 		goto cleanup_qdev;
-- 
2.40.1

