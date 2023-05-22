Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D62B70CB07
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2E910E382;
	Mon, 22 May 2023 20:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738A910E37D;
 Mon, 22 May 2023 20:30:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MJv0gk028434; Mon, 22 May 2023 20:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=qGhFfcyIucRyycSL68bAcGa6q6wpbCAhWMA4o0v3myE=;
 b=Y7SIfyUUy5M5l/ESWrR6GHtXK+d4tkMzrPr6Rhiw5Z6gEJ3U1NR77XZcNHCX6K6UHFyH
 EemwzFm/WRdIrdilyUVgbwEQ8Wt60Dg5hUqozVRmGFnpsqSaic+p5ZcW0VcdEeqBz8sK
 IqEM0B6oUR78T0gnKflWirLVdIDFqnWItUSCbj4esVx38byMKsiCtJNLy+BvvqMN5IF0
 MtvpcbUyQx8FZcBfXS79uQfQ/c3Uul5aE6B18SVKXkKB4LNCEWk7nNHR8Aw/Jlaulth6
 Fi7xI6d7dQaLFADPBOF5miVpwjrGJsXG5RrwGHD2wYsmZbZYQOCj4n7nk3uJq/JifOAH 4A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qr8qr8xxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 20:30:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MKUetm005690
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 20:30:40 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 13:30:39 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 22 May 2023 13:30:24 -0700
Subject: [PATCH v4 5/5] drm/msm/dsi: Remove incorrect references to slice_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v4-5-15daf84f8dcb@quicinc.com>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684787438; l=2829;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=CrzlopdfZxDeqzsqgOzel+FoVfZkpej7bl0jllAxUqg=;
 b=9YuXW72rkOey8EqGRpW5sDumtAKUpMMfMZE7z+daA3d1OF4Q8MqFlmtpw+Wr+Gd+dvpJisBhj
 KRTqx03IuS0DEX3y8MbtdSgdgjtEx30yT9oOfDhZdncaf/i82fwpuVs
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uPKrMoX6vIydOHy4hKch0nt7oRg4vtMR
X-Proofpoint-ORIG-GUID: uPKrMoX6vIydOHy4hKch0nt7oRg4vtMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_15,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220173
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, slice_count is being used to calculate word count and
pkt_per_line. Instead, these values should be calculated using slice per
packet, which is not the same as slice_count.

Slice count represents the number of soft slices per interface, and its
value will not always match that of slice per packet. For example, it is
possible to have cases where there are multiple soft slices per interface
but the panel specifies only one slice per packet.

Thus, use the default value of one slice per packet and remove slice_count
from the aforementioned calculations.

Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d04f8bbd707d..2eed99afdba9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -866,18 +866,17 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	 */
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
-	/*
-	 * If slice_count is greater than slice_per_intf
-	 * then default to 1. This can happen during partial
-	 * update.
-	 */
-	if (dsc->slice_count > slice_per_intf)
-		dsc->slice_count = 1;
-
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-	pkt_per_line = slice_per_intf / dsc->slice_count;
+
+	/*
+	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
+	 *
+	 * Since the current driver only supports slice_per_pkt = 1,
+	 * pkt_per_line will be equal to slice per intf for now.
+	 */
+	pkt_per_line = slice_per_intf;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1001,7 +1000,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (!msm_host->dsc)
 			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
 		else
-			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
+			/*
+			 * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
+			 * Currently, the driver only supports default value of slice_per_packet = 1
+			 *
+			 * TODO: Expand mipi_dsi_device struct to hold slice_per_packet info
+			 *       and adjust DSC math to account for slice_per_packet.
+			 */
+			wc = msm_host->dsc->slice_chunk_size + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |

-- 
2.40.1

