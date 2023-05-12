Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00D701159
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 23:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF56210E2E1;
	Fri, 12 May 2023 21:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6300610E2C1;
 Fri, 12 May 2023 21:32:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CDpraS005574; Fri, 12 May 2023 21:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=K6pvt/KXDAo8KSKc00MIS7L7Ff9MuWAaT2rYVyRHplw=;
 b=Vq0POCzupgUONuVdEK95bJtHZwbb+PuGzS1kc6vYxwsNtyjEFHRyjC7kslC67G0/altf
 5XP08Oe1nFt9X1dHeqbCt+0x3pD+fyMdth2S2gW9UuxGilYqVW43TMOsJz4FnaCyZ9kb
 2zaFG2+Z1G9ZHYOGie8D9MxSvTiBUmsy6+Mn/I8/t+TUXIIVKM+kMTNJWe6D12376eLg
 uFO69cRD6F/7Ds99Qb9UgRhp4n5jkjOnktr0fW4TuddcG+UnCVU1+d91ppzTYvW3fNxk
 7JXX2GVgiUUCSwMwhCN7sV5jrAFA4qJC8DdkEKp1U/++djFgV/AvjBZ6NlN4rSVmPyG5 WA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhcj1tcsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:32:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CLWOW1024889
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:32:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 12 May 2023 14:32:23 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 12 May 2023 14:32:16 -0700
Subject: [PATCH v10 6/8] drm/msm/dpu: Fix slice_last_group_size calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v10-6-4cb21168c227@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683927142; l=1214;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=JS9YeZ/caONaWwAdUbJOH/08/BIFVmo1xGTyIpBgzyM=;
 b=jKwGcHob2UU3OGagFRVH4GUD1mESiMZBr0FVLUHpz6Aso4FMcgazr+2/klTbwD0J5OKT5lU9A
 u7hZ9WtF2WNAlnPqpKubVKIL7TF+sXzBeScZLZJ6ur4wSr1Qr+QU7UO
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eDKmumuBVPFgfkTD0yM4ES-V9fXKdPh0
X-Proofpoint-ORIG-GUID: eDKmumuBVPFgfkTD0yM4ES-V9fXKdPh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=933
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120181
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
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct the math for slice_last_group_size so that it matches the
calculations downstream.

Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 3cad6a80af97..ea7d828b8812 100644
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
2.40.1

