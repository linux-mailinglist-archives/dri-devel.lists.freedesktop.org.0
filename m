Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335325E579F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 02:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8841810EA1C;
	Thu, 22 Sep 2022 00:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F7D10EA1D;
 Thu, 22 Sep 2022 00:49:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LNmFSx005027;
 Thu, 22 Sep 2022 00:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=QdoABD93UTh1JVoxckKw2fQKUXrYi04PTjvhk1tQxcg=;
 b=bMMJK+SBX0dJDE1ndc+Wq716Nd8MQKNv8ahOWju4MSswHbZGYQNkq1e1M/Zn1zA56/QW
 z6hYeToNRc2Aqwo9YFHlLv4c/I4p0xP01PWOZFv0CR8jDQnRaEEjPzjVyGvNvAQmcg7w
 CKMSescvRNV3hssEQStE1dsmGh1qsZzmBwESEGagTovUxHO9c5Ubaj9LCFWYadgQ1a0r
 PnfJxhh7lVgVyncUmL1XaWEf1wZGCR+vusZi+W3k0xbnu//YLR8tTxOGmsFUayP35bZj
 pEEbWp0g9z2Rs/dmMV+/m0LlkNsJfaNomp+P71K3oX1lLLQ/Y/DbYFfLIq5N/YnDWDVR MQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jr4ge1r8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 00:49:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28M0njce016531
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 00:49:45 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 21 Sep 2022 17:49:44 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/msm/dsi: implement opp table based check for
 dsi_mgr_bridge_mode_valid()
Date: Wed, 21 Sep 2022 17:49:28 -0700
Message-ID: <1663807768-23969-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lqfj3OcwOeAVAU4y6kIsNSrCZq1w2XV3
X-Proofpoint-ORIG-GUID: lqfj3OcwOeAVAU4y6kIsNSrCZq1w2XV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_13,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220003
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
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently there is no protection against a user trying to set
an unsupported mode on DSI. Implement a check based on the opp
table whether the byte clock for the mode can be supported by
validating whether an opp table entry exists.

For devices which have not added opp table support yet, skip
this check otherwise it will break bootup on those devices.

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
Reported-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 3a1417397283..87b518c42965 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -450,6 +450,29 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct mipi_dsi_host *host = msm_dsi->host;
+	struct platform_device *pdev = msm_dsi->pdev;
+	struct dev_pm_opp *opp;
+	struct opp_table *opp_tbl;
+	unsigned long byte_clk_rate;
+
+	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
+
+	/*
+	 * first check if there is an opp table available for the calculated
+	 * byte clock and then check DSC related info. Some devices have not
+	 * added support for OPP table. Skip the check for those.
+	 */
+	opp_tbl = dev_pm_opp_get_opp_table(&pdev->dev);
+	if (opp_tbl) {
+		opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
+		if (IS_ERR(opp)) {
+			pr_err("opp table not found for freq %lu err: %ld\n",
+					byte_clk_rate, PTR_ERR(opp));
+			return PTR_ERR(opp);
+		}
+		dev_pm_opp_put(opp);
+		dev_pm_opp_put_opp_table(opp_tbl);
+	}
 
 	return msm_dsi_host_check_dsc(host, mode);
 }
-- 
2.7.4

