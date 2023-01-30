Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8768143C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 16:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC31810E273;
	Mon, 30 Jan 2023 15:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BA910E272;
 Mon, 30 Jan 2023 15:12:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UDc01O003593; Mon, 30 Jan 2023 15:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=5mFrOPCuJpELd7cFaQmUZ0V5GlCh3W2QTWCLLtSx65E=;
 b=escDh8iLX/EDzBBh1qKeZHidVXXRne7Ag7Du2yeSOWmx8bQ/u3L/sDYQwsy0sqpUHYGc
 9mkoulOH2GTYit1v/Ltvb/ixQq95QIxAtRbWt2l8O/bmcDxegxlPLaNfThUwLGLSC6o+
 V83zNE3/RnCkidbuTwkr+vCAH/TYYd6qD+d8CpmKSK0KzGKhZ6yiKnOIiBzuRINyEuKQ
 IcKpR27cvSYExUtg/nzmGI1BKzqRjWmNVjjEUyglugVtPOLTwf5P1wdppb94EN5gj+U9
 qncUaBzZNY/rqzocJLUkIwxzUhJIWSoejnh7yfhtkKDvAhebHtpJtEe7ZKQROVD3p5Lm Lw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncsdpv2sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 15:12:10 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30UFC981016794
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 15:12:09 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 30 Jan 2023 07:12:04 -0800
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v12 03/14] drm/msm/disp/dpu: wait for extra vsync till timing
 engine status is disabled
Date: Mon, 30 Jan 2023 20:41:23 +0530
Message-ID: <1675091494-13988-4-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 18MCVCdXZGR0XbcP7EPKPeUMr_qriyLJ
X-Proofpoint-ORIG-GUID: 18MCVCdXZGR0XbcP7EPKPeUMr_qriyLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_14,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300147
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There can be a race between timing gen disable and vblank irq. The
wait post timing gen disable may return early but intf disable sequence
might not be completed. Ensure that, intf status is disabled before
we retire the function.

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 48c4810..0396084 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -523,6 +523,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 {
 	unsigned long lock_flags;
 	int ret;
+	struct intf_status intf_status = {0};
 
 	if (!phys_enc->parent || !phys_enc->parent->dev) {
 		DPU_ERROR("invalid encoder/device\n");
@@ -567,6 +568,26 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 		}
 	}
 
+	if (phys_enc->hw_intf && phys_enc->hw_intf->ops.get_status)
+		phys_enc->hw_intf->ops.get_status(phys_enc->hw_intf, &intf_status);
+
+	/*
+	 * Wait for a vsync if timing en status is on after timing engine
+	 * is disabled.
+	 */
+	if (intf_status.is_en && dpu_encoder_phys_vid_is_master(phys_enc)) {
+		spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
+		dpu_encoder_phys_inc_pending(phys_enc);
+		spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
+		ret = dpu_encoder_phys_vid_wait_for_vblank(phys_enc);
+		if (ret) {
+			atomic_set(&phys_enc->pending_kickoff_cnt, 0);
+			DRM_ERROR("wait disable failed: id:%u intf:%d ret:%d\n",
+				  DRMID(phys_enc->parent),
+				  phys_enc->hw_intf->idx - INTF_0, ret);
+		}
+	}
+
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 
-- 
2.7.4

