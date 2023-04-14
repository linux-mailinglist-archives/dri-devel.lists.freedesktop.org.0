Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D928F6E2AD4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 21:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7443210E1EA;
	Fri, 14 Apr 2023 19:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC92810E1EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 19:57:55 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EJrUfv003334; Fri, 14 Apr 2023 19:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=ivKdHCEi3ff5nOITkb0KdpQohw5GX5SWMKKCmM2W5Ak=;
 b=AdFdHRm2zfoKnhr5cifP5+irD5DS++jS15JnykxSe16UuczzvaCACkWvCohtUbWEVzvv
 JA+DFifPwY85e8umKEYd09uvBTWiChB+E2lPK20iEyV7sScVA17dZaC2B9h7xSTNWlb1
 GUM1nUlc2rki76kO0V+8V823xOqVPzGG0z0zrsKcyRjrf6Joec0qE2BEdOhl2opIykre
 +jZXe3DnHEQwcmBd9A7+G6HkZAAMnF5a/mduHBkKFoiwE5a/lX5jMdQ9ezsUO4loLRL0
 vK8yciAVHdEDhjlN8sSCG9ZVOeEcG/cLObBy0qbj6yq9rZNaJb52nemRtaIHf0YcB9G5 yg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pxx8ut0c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 19:57:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33EJvobk025060
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 19:57:50 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 14 Apr 2023 12:57:50 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <mani@kernel.org>
Subject: [PATCH 1/2] bus: mhi: host: Add quirk framework and initial quirk
Date: Fri, 14 Apr 2023 13:57:18 -0600
Message-ID: <1681502239-3781-2-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681502239-3781-1-git-send-email-quic_jhugo@quicinc.com>
References: <1681502239-3781-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fL8hfNXzmu7D85Liy23AxAphGz2K8RsM
X-Proofpoint-GUID: fL8hfNXzmu7D85Liy23AxAphGz2K8RsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_12,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140177
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
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
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

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 drivers/bus/mhi/host/init.c | 13 +++++++++----
 include/linux/mhi.h         | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index f72fcb6..2731b78 100644
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
+	else {
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, SOC_HW_VERSION_OFFS, &soc_info);
+		if (ret)
+			goto err_destroy_wq;
+	}
 
 	mhi_cntrl->family_number = FIELD_GET(SOC_HW_VERSION_FAM_NUM_BMSK, soc_info);
 	mhi_cntrl->device_number = FIELD_GET(SOC_HW_VERSION_DEV_NUM_BMSK, soc_info);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index f6de4b6..830df51 100644
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
2.7.4

