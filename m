Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE782FC90
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 23:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4271F10E5F8;
	Tue, 16 Jan 2024 22:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035A510E5ED
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 22:22:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40GLK9x0001662; Tue, 16 Jan 2024 22:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=X7pudHFbPhvig+cOVdw0OfswUXgRDwB047Kg839LXIg
 =; b=KSq1LBJrdL4bPUL5dRBgyyVhF0G0KbH+GPcclo8g1ojzdqhxTlgTgmF4WLP
 8cp6UtQdnMF6j/lnb/0fqoxhpmGWv1wbg2tppMPEmsNdQF4pZmaY4zMV6lQvsY3p
 GDSgJSiLh+haZpt8g5C6QoXfgstOAjaI0GCil3K3rj+nh1NNoGEOwTCniA90FZXb
 mAkY25H1SYa6xKmmBePuzFnuqHJCClWaMbqD71e2lXJ/oEhjfUvSXjPwT47+wZ9O
 3F5UMjdbMMObeWsgtgw8963fROeORCNrkTbdDf63Z6SKgOFFWwtlVcSnRje2fum+
 oEE3712GHfHqe4UxbBsTNwyiY9g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnnajj3s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 22:22:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40GMMO46001543
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 22:22:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 14:22:24 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 16 Jan 2024 14:22:05 -0800
Subject: [PATCH RFC 2/4] drm/dsi: Add API to register simulated DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240116-jz-test-sim-panel-v1-2-f9511f46c9c7@quicinc.com>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
In-Reply-To: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705443743; l=2397;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=4exVjp7sl3jEyHqi/O64KXlGDRIagRnzpF/Qkfnhe10=;
 b=s+bAYnBaboUd1+InwjYXBosjD+zhAarjEiwUpa26kWQUIQJMRjqpzxuz9+CDjxRyilnNf3VkP
 Ykj3M2Voiq4D0NoRSu/VIbhdfgxAOK/Y5Fv4mmgwkPnfkn7s9wyphuQ
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eC_wffRwQnb7km1OuZgQX2uX-BTEglnb
X-Proofpoint-ORIG-GUID: eC_wffRwQnb7km1OuZgQX2uX-BTEglnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=968 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401160174
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
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new APIs to register a simulated panel.

For drivers that want to support a simulated panel, they must call
mipi_dsi_host_register_sim_panel().

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 843a6dbda93a0..6996014990979 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -153,6 +153,24 @@ static int mipi_dsi_device_add(struct mipi_dsi_device *dsi)
 	return device_add(&dsi->dev);
 }
 
+#if IS_ENABLED(CONFIG_DRM_PANEL_SIMULATION)
+static struct mipi_dsi_device *mipi_dsi_device_add_sim_panel(struct mipi_dsi_host *host)
+{
+	struct mipi_dsi_device_info info = { };
+
+	info.channel = 0;
+	info.node = NULL;
+	strscpy(info.type, "panel_simulation", sizeof(info.type));
+
+	return mipi_dsi_device_register_full(host, &info);
+}
+#else
+static struct mipi_dsi_device *mipi_dsi_device_add_sim_panel(struct mipi_dsi_host *host)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 #if IS_ENABLED(CONFIG_OF)
 static struct mipi_dsi_device *
 of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
@@ -324,6 +342,18 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node)
 }
 EXPORT_SYMBOL(of_find_mipi_dsi_host_by_node);
 
+int mipi_dsi_host_register_sim_panel(struct mipi_dsi_host *host)
+{
+	mipi_dsi_device_add_sim_panel(host);
+
+	mutex_lock(&host_lock);
+	list_add_tail(&host->list, &host_list);
+	mutex_unlock(&host_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dsi_host_register_sim_panel);
+
 int mipi_dsi_host_register(struct mipi_dsi_host *host)
 {
 	struct device_node *node;
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c0aec0d4d664e..4ca44b7b3efdb 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -107,6 +107,7 @@ struct mipi_dsi_host {
 	struct list_head list;
 };
 
+int mipi_dsi_host_register_sim_panel(struct mipi_dsi_host *host);
 int mipi_dsi_host_register(struct mipi_dsi_host *host);
 void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
 struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);

-- 
2.43.0

