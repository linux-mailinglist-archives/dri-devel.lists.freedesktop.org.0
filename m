Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7176D7104
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 01:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70E610E7F9;
	Tue,  4 Apr 2023 23:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873BB10E7EC;
 Tue,  4 Apr 2023 23:56:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334Lg9FE029884; Tue, 4 Apr 2023 23:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=jZQX2JmDNQ0YQhqf6UVdZyLPMqqAOej/1rHsvMi6mLU=;
 b=lrZPfW/aT7RqU8pxVhShTf1GS7nszFwdPWF/V86otVrg7E1zaoXz1Y3PlL3BPSTQ+sQV
 TlzP/YBJ0ZFnCtulVXTYlJlqtIBOpn/dsm/YQiOxtbGfTosnsFIohqQ3EBruk+lxb642
 1WDF5u8PJMhlb9kJaFqiTqsZZgDL07SwRD8GL937vZhk9763ccfJETLW1scIdWWXeABG
 Jjhtm0ViCyuTlxIVHOzC/vAmpnqkYlkPjYMzFplzGKgt9kfT+O48B+Co5NSZfbpSo7wf
 zrtVYrqnJpmpRT2yPSxiGLlx0Qx/4fYRc+dDLrQpOtjh9h6jQyPFHmtvNKlIVHbnLEyg Cg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prnbt1es1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Apr 2023 23:56:43 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334Nuhvq015885
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Apr 2023 23:56:43 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 16:56:42 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 4 Apr 2023 16:56:15 -0700
Subject: [PATCH v3 3/6] drm/msm/dpu: Fix slice_last_group_size calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v3-3-6bec0d277a83@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680652601; l=1191;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=626UczrBvbBXHAzAtCtgR6FxGBdQQBWmOE/OfL7f5Vw=;
 b=hdw+qnZb11dWIGFOj8laB4OXit+w7SsZCY2c2LJwHAVY/O+fjsldvwvaiBX0Y3iosrKpySfJV
 N8oQk13GAaRBJIfAbn98Zp+aE0Z3rFbJWlOAqH4+BXWTQAVL4Jizar2
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1YCWhDrJhVkmmYmIWH-nLO4dPahA2KKx
X-Proofpoint-GUID: 1YCWhDrJhVkmmYmIWH-nLO4dPahA2KKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_12,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=992
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040217
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct the math for slice_last_group_size so that it matches the
calculations downstream.

Changes in v3:
- Reworded slice_last_group_size calculation to
  `(dsc->slice_width + 2) % 3`

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index b952f7d2b7f5..ff1c8f92fb20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -56,9 +56,10 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	if (is_cmd_mode)
 		initial_lines += 1;
 
-	slice_last_group_size = 3 - (dsc->slice_width % 3);
+	slice_last_group_size = (dsc->slice_width + 2) % 3;
+
 	data = (initial_lines << 20);
-	data |= ((slice_last_group_size - 1) << 18);
+	data |= (slice_last_group_size << 18);
 	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
 	data |= (dsc->bits_per_pixel << 8);
 	data |= (dsc->block_pred_enable << 7);

-- 
2.40.0

