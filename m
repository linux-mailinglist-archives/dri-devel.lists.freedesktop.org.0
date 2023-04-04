Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A36D7105
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 01:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85C610E7FB;
	Tue,  4 Apr 2023 23:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACE010E051;
 Tue,  4 Apr 2023 23:56:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334Mjvsc023005; Tue, 4 Apr 2023 23:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=h+SMyxFtZmUC9M86ZltlRcdL71Gagz2BniMbMC8D/n8=;
 b=UwXT1c8tNls0CAlYmLCGRsSCAeEbz71vQdMYlvu2Kav4ZJvaYZ7j7DNLyH4YhBHaRhV4
 q0CbVT3zTpoappNyCu3mzcT8cxksbm8GjsSQtVClINJUCmdMWrSX7xYQwkMIC7kCfCFz
 1ZRDDWXVCImR4vYXfv7YMXLWh8TgWosB+LhXthN6aTVgYjlhYnPqdLbapUfYZqhDnyVI
 5yCpSeGVflTi+GN+kZ+hrr9zkvn672f92rJMFd+CVa6v0oUjVylNF9LKMtnFvm2QAVuh
 tb4U8fF4+Q+jCUdhYzRGcNAx6pGXmssm0N6XgoDa+/my9dhMyeCRCnDMbeQFG49165VU Dg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prg8wtbm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Apr 2023 23:56:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334NuhEU015907
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Apr 2023 23:56:43 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 16:56:43 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 4 Apr 2023 16:56:17 -0700
Subject: [PATCH v3 5/6] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v3-5-6bec0d277a83@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680652602; l=1081;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=VHl0Pt7IbnSwSyH35emBGgqoRJ1gsEd7mGghUGrKklw=;
 b=zXg3ZPuZcItrpz7cIPHS+SdpSslmx+QMRzKa1p1bLQYBoG+8fJqg7TUz13glLYz3K11WPBgsf
 yiziM7HiCuPBBV+cTXrP2BoxLsklQr69RX/l/gyF9FIxirbe1xeil3L
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zkbMQkSTKP_lY8_OP9Q8UbK_SqTeLlRC
X-Proofpoint-ORIG-GUID: zkbMQkSTKP_lY8_OP9Q8UbK_SqTeLlRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_12,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=992
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

hdisplay for compressed images should be calculated as bytes_per_slice *
slice_count. Thus, use MSM DSC helper to calculate hdisplay for
dsi_timing_setup instead of directly using mode->hdisplay.

Changes in v3:
- Split from previous patch
- Initialized hdisplay as uncompressed pclk per line at the beginning of
  dsi_timing_setup as to not break dual DSI calculations

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6a6218a9655f..9c33060e4c29 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -912,6 +912,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	DBG("");
 
+	if (msm_host->dsc)
+		hdisplay = msm_dsc_get_uncompressed_pclk_per_intf(msm_host->dsc);
+
 	/*
 	 * For bonded DSI mode, the current DRM mode has
 	 * the complete width of the panel. Since, the complete

-- 
2.40.0

