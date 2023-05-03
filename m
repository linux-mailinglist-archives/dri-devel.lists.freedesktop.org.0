Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E686F4E81
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 03:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D377110E180;
	Wed,  3 May 2023 01:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B28D10E180;
 Wed,  3 May 2023 01:19:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3430noKq020830; Wed, 3 May 2023 01:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=LtM6s7Lrstdtx1MusfgnMv3PxZUc28iuLAVm8ZI+9dY=;
 b=aGOmRe0LFwAGzgS2F+LUD6EcTUYldtAE+5v5tkNRdtFK20Q+qPZkdoiErB6nVMRz1z09
 zAMRNWAFpkCucCuCbyPVI+mocnd0lfkbX52RHUk6r25wIOBgIBpS5huS7kWeFpXyOlYr
 IkU5HReCuI7V+LGsmYtjl+jVcHf69BgNfXsLw7c9s7Bj4geaLpHNeWY66TI5X+ekeumr
 M4rXi14nihZYm/xb6TrQpTNy62Y2GKgNjgz5gL+fZKwjkGGOk3Asq2ZpPUEzuKwcFR14
 ToHg8eaIIe6C0FM/wMEPYU4omz1BKog7wxn64wZqZrYeOZyu5rrAFa+jrCbiEdPXT8w/ fg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qawak29g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 01:19:37 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3431Jabb030207
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 01:19:36 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 2 May 2023 18:19:36 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 2 May 2023 18:19:13 -0700
Subject: [PATCH 2/4] drm/msm/dsi: Fix compressed word count calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683076776; l=1759;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=lkEVFOv91fpXtzkXbOv4q+pszclzbtiApLWiP0WoyC8=;
 b=VrvjNQx/vcaxctv3YaicuRUja5QhBfLiOfgl5JY6qZah8L7R1Rkv0thYQ6zGZDn393CQ8sH5o
 IKzK7SziSuOCA8/GFgL9phdRBPlAqzrAuiwkasEDYvbDOKQUQTIvbpg
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fxhHL7j_Hs39RGzm80XAHZIXerGrQ-BV
X-Proofpoint-ORIG-GUID: fxhHL7j_Hs39RGzm80XAHZIXerGrQ-BV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_14,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030009
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

Currently, word count is calculated using slice_count. This is incorrect
as downstream uses slice per packet, which is different from
slice_count.

Slice count represents the number of soft slices per interface, and its
value will not always match that of slice per packet. For example, it is
possible to have cases where there are multiple soft slices per interface
but the panel specifies only one slice per packet.

Thus, use the default value of one slice per packet and remove slice_count
from the word count calculation.

Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 35c69dbe5f6f..b0d448ffb078 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -996,7 +996,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (!msm_host->dsc)
 			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
 		else
-			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
+			/*
+			 * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
+			 * Currently, the driver only supports default value of slice_per_packet = 1
+			 *
+			 * TODO: Expand drm_panel struct to hold slice_per_packet info
+			 *       and adjust DSC math to account for slice_per_packet.
+			 */
+			wc = msm_host->dsc->slice_chunk_size + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |

-- 
2.40.1

