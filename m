Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA46664EB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 21:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60AC10E807;
	Wed, 11 Jan 2023 20:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1882510E81A;
 Wed, 11 Jan 2023 20:41:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30BKahCv013006; Wed, 11 Jan 2023 20:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=vnVQRlbz65kpZ9CPLBMw5g3EBHn3MMxumfT9/SjDkkQ=;
 b=DHPZVBpCiwnUluh68TIdNxH6JV9Imol2mHj59VWdIBUSE1QBZpLsCsreyVPn3Sg7NQ11
 fPDNKmQOa/9kpNnZW8us+yBLvy1stfT/97cu1akOIRVLmhu+CWQKWxxMlTWZXxtzVcBm
 rNOnUB/jKCWoHfYgVJu9eflXLNvJp67vZb8uzUGyBMF8g9SYL4ynmM8C+1mrDW3xj5cD
 k5iJNmU1hzyXrS3bmIfHLXmIvPBzTcbJFL7zCLw5CW+DeOy5xagbFs7LGHVMOxVi6Zms
 5mqrnndHDnReHpnaYOyvyb3nOUlQSUHFZjgeLN8aBSLjAEIt3l+eWmff/oNHTzUrzGTX IQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1k6a26ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 20:41:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30BKfB51030642
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 20:41:11 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 11 Jan 2023 12:41:10 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/msm/dsi: implement opp table based check for
 dsi_mgr_bridge_mode_valid()
Date: Wed, 11 Jan 2023 12:40:36 -0800
Message-ID: <20230111204037.9105-2-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111204037.9105-1-quic_abhinavk@quicinc.com>
References: <20230111204037.9105-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PO79gvSqMg8pihf_fjPKOomQbx3f9h6D
X-Proofpoint-GUID: PO79gvSqMg8pihf_fjPKOomQbx3f9h6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_10,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110152
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently there is no protection against a user trying to set
an unsupported mode on DSI. Implement a check based on the opp
table whether the byte clock for the mode can be supported by
validating whether an opp table entry exists.

For devices which have not added opp table support yet, skip
this check otherwise it will break bootup on those devices.

changes in v2:
	- drop dev_pm_opp_get_opp_table() usage

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
Reported-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 3a1417397283..c4c24dabfd6f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -450,6 +450,31 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct mipi_dsi_host *host = msm_dsi->host;
+	struct platform_device *pdev = msm_dsi->pdev;
+	struct dev_pm_opp *opp;
+	unsigned long byte_clk_rate;
+
+	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
+
+	/*
+	 * If dev_pm_opp_find_freq_ceil() returns -EINVAL, its a bad
+	 * pointer being passed, so treat as an error and return MODE_ERROR
+	 *
+	 * If dev_pm_opp_find_freq_ceil() returns -ERANGE, no clock
+	 * was found matching the byte_clk, so return MODE_CLOCK_RANGE
+	 *
+	 * If dev_pm_opp_find_freq_ceil() returns -ENODEV, don't treat
+	 * it as an error as it could mean opp table is not implemented
+	 */
+	opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
+	if (IS_ERR(opp)) {
+		if (PTR_ERR(opp) == -EINVAL)
+			return MODE_ERROR;
+		else if (PTR_ERR(opp) == -ERANGE)
+			return MODE_CLOCK_RANGE;
+	} else {
+		dev_pm_opp_put(opp);
+	}
 
 	return msm_dsi_host_check_dsc(host, mode);
 }
-- 
2.39.0

