Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81FF709C96
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 18:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D991810E48F;
	Fri, 19 May 2023 16:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7770910E2BA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 16:39:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JEjXxf032125; Fri, 19 May 2023 16:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=JRUsMnqln7cZt5qs5HnedPc0mY/Ew7wSzk2Z5dBekec=;
 b=cM9qTaAQl1YTrShSwuY5cGIn3N/zRTlg80DXpjEW1F+wkNMhPv4yBXK+kUUt0ikph8Zf
 eK6PfjZDRXWDyMNericfq0rgN5wPIIlPDzz3esAWcTnhdY3I8rYRShiidRwi8YMyXRdD
 jhZR16VNUAmyxPm5Fk+jvQoioi0rYmOtjJ8Y+JuwwfbzDevwn8MHzshRaHd4byZ/hMMI
 IuPLEUr4TJb08fDHUO7kM0Z3AJ3G2hdhrXIxFZAVrnHkN7HaNbKsSUsglQOatY44PgSn
 L7tAxZSW3u5cCPobZHEaeXDLlmbiYxwTThVhRY5ISZcSt8VQGXVDyxGhG5f6SZTegWXD ng== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp69u10cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 16:39:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JGdNaW005605
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 16:39:23 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 19 May 2023 09:39:22 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <mani@kernel.org>
Subject: [PATCH v2 1/2] bus: mhi: host: Add quirk framework and initial quirk
Date: Fri, 19 May 2023 10:39:01 -0600
Message-ID: <20230519163902.4170-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519163902.4170-1-quic_jhugo@quicinc.com>
References: <20230519163902.4170-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 20jufYsOcK9p9YwLmpcehdNYHf8fLTAv
X-Proofpoint-GUID: 20jufYsOcK9p9YwLmpcehdNYHf8fLTAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_11,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190141
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some devices might require special handling due to flawed implementations
or other reasons. Implement a quirk framework to handle these situations.

Implement the first quirk in this framework -
MHI_QUIRK_SOC_HW_VERSION_UNRELIABLE

The MHI spec indicates that the MHI device must initialize the
SOC_HW_VERSION register before the link to the MHI device is initialized.
The MHI host implementation uses this register as a quick check to see if
the device can be accessed early in the init process.

If an implementation is flawed, and does not properly initialize this
register, it may contain garbage data. In the case of PCIe, the value
0xFFFFFFFF has special meaning and can indicate that the link is down.
Such an implementation may cause MHI to believe the device cannot be
initialized.

Allow such controller to indicate that the host implementation should not
access this register, and handle the access accordingly during MHI init.

Change-Id: I3c8f38e1310f2065004dd6b5c2f0b9b04423205d
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/bus/mhi/host/init.c | 13 +++++++++----
 include/linux/mhi.h         | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index f72fcb66f408..701cdf63b8da 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -891,6 +891,8 @@ static int parse_config(struct mhi_controller *mhi_cntrl,
 	if (config->m2_no_db)
 		mhi_cntrl->db_access &= ~MHI_PM_M2;
 
+	mhi_cntrl->quirks = config->quirks;
+
 	return 0;
 
 error_ev_cfg:
@@ -982,10 +984,13 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	}
 
 	/* Read the MHI device info */
-	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
-			   SOC_HW_VERSION_OFFS, &soc_info);
-	if (ret)
-		goto err_destroy_wq;
+	if (mhi_cntrl->quirks & MHI_QUIRK_SOC_HW_VERSION_UNRELIABLE) {
+		soc_info = 0;
+	} else {
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, SOC_HW_VERSION_OFFS, &soc_info);
+		if (ret)
+			goto err_destroy_wq;
+	}
 
 	mhi_cntrl->family_number = FIELD_GET(SOC_HW_VERSION_FAM_NUM_BMSK, soc_info);
 	mhi_cntrl->device_number = FIELD_GET(SOC_HW_VERSION_DEV_NUM_BMSK, soc_info);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index f6de4b6ecfc7..830df51528aa 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -17,6 +17,20 @@
 
 #define MHI_MAX_OEM_PK_HASH_SEGMENTS 16
 
+/*
+ * List of workarounds for devices that require behavior not specified in
+ * the standard.
+ */
+enum mhi_quirks {
+	/*
+	 * Some devices do not properly initialize the SOC_HW_VERSION register
+	 * in the BHI space. In some instances, the value is 0xFFFFFFFF which
+	 * may hold special meaning. In the case of such devices, do not read
+	 * the register.
+	 */
+	MHI_QUIRK_SOC_HW_VERSION_UNRELIABLE		= BIT(0),
+};
+
 struct mhi_chan;
 struct mhi_event;
 struct mhi_ctxt;
@@ -273,6 +287,7 @@ struct mhi_event_config {
  * @event_cfg: Array of defined event rings
  * @use_bounce_buf: Use a bounce buffer pool due to limited DDR access
  * @m2_no_db: Host is not allowed to ring DB in M2 state
+ * @quirks: Workarounds for devices that require non-standard behavior
  */
 struct mhi_controller_config {
 	u32 max_channels;
@@ -284,6 +299,7 @@ struct mhi_controller_config {
 	struct mhi_event_config *event_cfg;
 	bool use_bounce_buf;
 	bool m2_no_db;
+	u32 quirks;
 };
 
 /**
@@ -358,6 +374,7 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @quirks: Workarounds for devices that require non-standard behavior
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -452,6 +469,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	u32 quirks;
 };
 
 /**
-- 
2.40.1

