Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F56D282B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 20:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DE410E56A;
	Fri, 31 Mar 2023 18:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC88510E430;
 Fri, 31 Mar 2023 18:49:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32VHlVNX032700; Fri, 31 Mar 2023 18:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=1dCe6zH5TPV9+NSxkoSOLELQx+Dutd50keKEdWexZEI=;
 b=TFlJ5muIsRRv2iBImiJPiZITUrOXQoqGGBYVvcUBOlxRwxbGcKkd38z31K4ENxnJyoH7
 B1E89AUgSNPChw7b/NfdAkGgyx2Ze9AAw/0aSDYH76YfIQRuQ8kRjU+klX9rHCsQD+fW
 ZQ3ZqPkdQk+2VQk5IvUzbPb1nWnJdC2WMrktg6o45SKXNiUMxL+5lCd73ek+xLK7UKVd
 cdA+0VhMByZrESBHXxx6fzdXGb8jZgj99ttaVXtgGyEVkReMHYWkTV3+lBD/i62bIgn5
 RCuJbg1B9Bijkuws5ZQBl2MZ6nRvUpAi0eW0jfQeSAX5HjHP2R1iuRZGI+bWKEIoDAhj uA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pnyey9dgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 18:49:43 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32VIngWq030059
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 18:49:42 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 31 Mar 2023 11:49:42 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 31 Mar 2023 11:49:21 -0700
Subject: [PATCH RFC v2 6/6] drm/msm/dsi: Fix calculations for eol_byte_num
 and pkt_per_line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v2-6-3c13ced536b2@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680288580; l=2041;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=kZKkwVo7xgmDFtSUOvXsSf99R0JW0VaxoP+632K9wZg=;
 b=wpTz5kOivSE5xkvzd7pAKcAy+zCqSGK9zSLq5rQ8JCw46RoYlgmOzSDlYDdxCseGvsv8bzSrk
 y1Eh1YgVjLRAu0988ULDMj+kG7i6wcAW1En117Mpy377m50NJ8uwlTt
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Tu_LWpWv1dqCHCHqnSF2AyH7ux9b0BFJ
X-Proofpoint-ORIG-GUID: Tu_LWpWv1dqCHCHqnSF2AyH7ux9b0BFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303310151
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

Use the correct calculations for eol_byte_num and pkt_per_line.

Currently, pkt_per_line is calculated by dividing slice_per_intf by
slice_count. This is incorrect, as slice_per_intf should be divided by
slice_per_pkt, which is not always equivalent to slice_count as it is
possible for there to be multiple soft slices per interface even though
a panel only specifies one slice per packet.

For eol_byte_num, the current calculation describes the size of the
trailing bytes in the line. Change the calculation so that it describes
the number of padding bytes instead.

Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b7ab81737473..613ec19f4383 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -842,7 +842,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 {
 	struct drm_dsc_config *dsc = msm_host->dsc;
 	u32 reg, reg_ctrl, reg_ctrl2;
-	u32 slice_per_intf, total_bytes_per_intf;
+	u32 slice_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
 
@@ -859,10 +859,12 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	if (dsc->slice_count > slice_per_intf)
 		dsc->slice_count = 1;
 
-	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	eol_byte_num = msm_dsc_get_eol_byte_num(dsc, hdisplay, dsi_get_bpp(msm_host->format));
 
-	eol_byte_num = total_bytes_per_intf % 3;
-	pkt_per_line = slice_per_intf / dsc->slice_count;
+	/* Default to 1 slice_per_pkt, so pkt_per_line will be equal to
+	 * slice per intf.
+	 */
+	pkt_per_line = slice_per_intf;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);

-- 
2.39.2

