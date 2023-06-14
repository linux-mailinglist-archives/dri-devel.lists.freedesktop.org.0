Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9A672F24F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 03:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FA710E400;
	Wed, 14 Jun 2023 01:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EAB10E400;
 Wed, 14 Jun 2023 01:57:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35E1s1lI030547; Wed, 14 Jun 2023 01:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7IuSoxzYw9GT1ObCc/Ng+kegCxk9VlhIFuB5I2kbQ3Q=;
 b=XgcbdrvevbRN5aaN2stOACzynOrEwgKTN8c2Wy7nYD+oISBQyVPzMwaER79S3g9o40+h
 HOUsE8T3cfOc60yepif8XKWAzfLc7J3dtdZhEEv9a92W86sgtQEzs1CVx3leYUxYVMHN
 BdO0/jFd9b0hI/ZU+ucPtGB7b/31EFieqU29eb+OX5XMHIOYfuiPZZxtn5p8xv0kQCCI
 THIAKXx0T2DdolWVCysGQjyFerj5nhxSWBO3GKi9VIJN/Mmz+ewWkY18uvLzQTaEPTgQ
 7BJ+JS8PgCzjaYJX49Sf/NNtD3RjeqVUPAUcpVzR6gyI0ZCGbZi76W01d4CHIjHIEU1v Jw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r6s3wsgjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 01:57:54 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35E1vrVB002740
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 01:57:53 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 13 Jun 2023 18:57:53 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten
 <marijn.suijten@somainline.org>
Subject: [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
Date: Tue, 13 Jun 2023 18:57:13 -0700
Message-ID: <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686707625; l=3041;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Ot5W85+n2wSTIxyhW7ySIwhaJ3NO/jx9Yep4NiTXQiA=;
 b=unTYKp7curlQIui91ILgtf7E8XxrRmddLFh5QbVXblSyPFSY77q7yQVlmKpdADQEchfm/ffls
 XekqlBYArvwBkMWQbww+HeIdL8ypjtKsGst/dF0lLJqgRW2/+qN3tl3
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: bY4MKNSQfFzApHCdzXE94bzKJIJ5kXWm
X-Proofpoint-GUID: bY4MKNSQfFzApHCdzXE94bzKJIJ5kXWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_24,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=706 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140012
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
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
48 bits of compressed data per pclk instead of 24.

For all chipsets that support this mode, enable it whenever DSC is
enabled as recommend by the hardware programming guide.

Only enable this for command mode as we are currently unable to validate
it for video mode.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---

Note: The dsi.xml.h changes were generated using the headergen2 script in
envytools [1], but the changes to the copyright and rules-ng-ng source file
paths were dropped.

[1] https://github.com/freedreno/envytools/

 drivers/gpu/drm/msm/dsi/dsi.xml.h  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index a4a154601114..2a7d980e12c3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
 	return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
 }
 #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE			0x00010000
+#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN			0x00100000

 #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL			0x000001b8
 #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK		0x0000003f
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 5d7b4409e4e9..1da5238e7105 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -927,6 +927,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	u32 hdisplay = mode->hdisplay;
 	u32 wc;
 	int ret;
+	bool widebus_supported = msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
+			msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0;
+

 	DBG("");

@@ -973,8 +976,15 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 *
 		 * hdisplay will be divided by 3 here to account for the fact
 		 * that DPU sends 3 bytes per pclk cycle to DSI.
+		 *
+		 * If widebus is supported, set DATABUS_WIDEN register and divide hdisplay by 6
+		 * instead of 3
 		 */
-		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
+		if (!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) && widebus_supported)
+			hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 6);
+		else
+			hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
+
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
 	}
@@ -1027,6 +1037,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
 			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
 			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
+
+		if (msm_host->dsc && widebus_supported) {
+			u32 mdp_ctrl2 = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
+
+			mdp_ctrl2 |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
+			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, mdp_ctrl2);
+		}
 	}
 }


--
2.40.1

