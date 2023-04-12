Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BE66DFE7F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 21:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC55E10E945;
	Wed, 12 Apr 2023 19:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB2A10E92F;
 Wed, 12 Apr 2023 19:10:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CIJlnW000494; Wed, 12 Apr 2023 19:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=i7ay0NpscQ5tUXKrgtfN37c9JMToX6jDCkt1j96wJlM=;
 b=Y3YIw39kzZWXDXOQqrDZp+B+khsr4djHQZe/YN97l5jKjI6q1ds1l9XxA2N1/Nbe7tVo
 L+DCQiWxJ+IUGYU5cSl9yxUAN8maJgIwVaXTWRRD+YUCPPeJoeTRk+MxyrU7v5V4nWPI
 tPtdD2J6gF1s5VYri7dTrglfgLiggxS+z/TVNOUSOLpvlyybiGr9BQR1dsdvfCcKoJd3
 RD3Ps4Zq/GAo+LayKRfU10bL/Or+7x3B6nOrfh7cHhakzYmW1bVB/d+aAShtYJ8O4Fer
 Q7mUqagssx+5XzB4L6TTc3HxCF8niQxF7hou5PGFJLwm2orQrr5+XRUtYRp9n8YogQPS 5A== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwchbtu6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 19:10:00 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CJ9xM4024211
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 19:09:59 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 12 Apr 2023 12:09:58 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 12 Apr 2023 12:09:48 -0700
Subject: [PATCH v5 8/8] drm/msm/dsi: Fix calculation for pkt_per_line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v5-8-0108401d7886@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681326596; l=1392;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=epOztMquNcJjfSdTdLWdp4KesaKwtwKqdN08Dl1tTJA=;
 b=hB56qmkmNTcFr4ER+re/AP25uwZAHXMMtMoKz9rzXHjnJQvTCUA2/PyrtuvS+P20ojXkUEW6R
 20c+KvZ2n//BBnotWAKiSwBQoLxfyFmrJC6xblYuHM1eFKbvQ6EZNGl
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: IhG9ZwIdYeloNIKNdGtpqmD-gr5NVWry
X-Proofpoint-GUID: IhG9ZwIdYeloNIKNdGtpqmD-gr5NVWry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=977 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120164
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

Currently, pkt_per_line is calculated by dividing slice_per_intf by
slice_count. This is incorrect, as slice_per_intf should be divided by
slice_per_pkt, which is not always equivalent to slice_count as it is
possible for there to be multiple soft slices per interface even though
a panel only specifies one slice per packet.

Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 412339cc9301..633b60acfe18 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -862,7 +862,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	total_bytes_per_intf = msm_dsc_get_bytes_per_intf(dsc, hdisplay);
 
 	eol_byte_num = total_bytes_per_intf % 3;
-	pkt_per_line = slice_per_intf / dsc->slice_count;
+
+	/* Default to 1 slice_per_pkt, so pkt_per_line will be equal to
+	 * slice per intf.
+	 */
+	pkt_per_line = slice_per_intf;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);

-- 
2.40.0

