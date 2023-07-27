Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17713765E92
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE97E10E61B;
	Thu, 27 Jul 2023 21:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01072301.me.com (qs51p00im-qukt01072301.me.com
 [17.57.155.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C6C10E61B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 21:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1690494755; bh=XpyNIdF2uhZAhQUKpx12L3Gpl72rWCRfsfzIB7HNnLk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=IJgqXLWrQv7ZqRRd1SPCqOO7HHye4jaYz47x9dg7NbM6TIErBkVQ8MH8Sb4G42/9K
 0sGo9iHeuh6jIbYsmJR1sWfGgmsoWbgCeytnx/ET2Z9lJAz2EPyShYcozxM/3Q8cOB
 +44mc6qbSaRy4uhU7cmVsUNzUIzFKt5f8YFGuwEl+lBlnvEw0/5L7oWUKaJSKKU5+1
 QokDbvi81mb7olxqmjZhRzGUAVmRpzm7tIpCACV+c3rLS12DLSDEk/XliyB27m3GQO
 QzG6rvyI/oiZu7wNVOirzPt5vxETdjIZ72Mdd4W933Q9JVorr9vjC4uogefrmi9nlU
 WEzI3J3Jb1FEQ==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01072301.me.com (Postfix) with ESMTPSA id
 8BF6225401AC; Thu, 27 Jul 2023 21:52:34 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 05/14] drm/sti: add support for stih418 in tvout
Date: Thu, 27 Jul 2023 21:51:29 +0000
Message-Id: <20230727215141.53910-6-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727215141.53910-1-avolmat@me.com>
References: <20230727215141.53910-1-avolmat@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kRQ2cwLkVgPsl2ICV2Gw1qVI7RyokRPq
X-Proofpoint-ORIG-GUID: kRQ2cwLkVgPsl2ICV2Gw1qVI7RyokRPq
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307270198
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tvout for stih407 and stih418 differ in the connection with the
vtg regarding to the hdmi output.  In order to cop with that, introduce
a new compatible st,stih418-tvout in order to have the hdmi_sync_id
being part of the data attached to each compatible.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/gpu/drm/sti/sti_tvout.c | 35 +++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 64615638b79a..685c0a4ba1be 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -118,6 +118,7 @@ struct sti_tvout {
 	struct drm_encoder *hda;
 	struct drm_encoder *dvo;
 	bool debugfs_registered;
+	unsigned int hdmi_sync_id;
 };
 
 struct sti_tvout_encoder {
@@ -130,6 +131,10 @@ struct sti_tvout_encoder {
 
 #define to_sti_tvout(x) to_sti_tvout_encoder(x)->tvout
 
+struct sti_tvout_data {
+	unsigned int hdmi_sync_id;
+};
+
 /* preformatter conversion matrix */
 static const u32 rgb_to_ycbcr_601[8] = {
 	0xF927082E, 0x04C9FEAB, 0x01D30964, 0xFA95FD3D,
@@ -359,14 +364,14 @@ static void tvout_hdmi_start(struct sti_tvout *tvout, bool main_path)
 		DRM_DEBUG_DRIVER("main vip for hdmi\n");
 		/* select the input sync for hdmi */
 		tvout_write(tvout,
-			    TVO_SYNC_MAIN_VTG_SET_REF | VTG_SYNC_ID_HDMI,
+			    TVO_SYNC_MAIN_VTG_SET_REF | tvout->hdmi_sync_id,
 			    TVO_HDMI_SYNC_SEL);
 		tvo_in_vid_format = TVO_MAIN_IN_VID_FORMAT;
 	} else {
 		DRM_DEBUG_DRIVER("aux vip for hdmi\n");
 		/* select the input sync for hdmi */
 		tvout_write(tvout,
-			    TVO_SYNC_AUX_VTG_SET_REF | VTG_SYNC_ID_HDMI,
+			    TVO_SYNC_AUX_VTG_SET_REF | tvout->hdmi_sync_id,
 			    TVO_HDMI_SYNC_SEL);
 		tvo_in_vid_format = TVO_AUX_IN_VID_FORMAT;
 	}
@@ -833,10 +838,26 @@ static const struct component_ops sti_tvout_ops = {
 	.unbind	= sti_tvout_unbind,
 };
 
+static const struct sti_tvout_data stih407_tvout_data = {
+	.hdmi_sync_id = 1,
+};
+
+static const struct sti_tvout_data stih418_tvout_data = {
+	.hdmi_sync_id = 5,
+};
+
+static const struct of_device_id tvout_of_match[] = {
+	{ .compatible = "st,stih407-tvout", .data = &stih407_tvout_data, },
+	{ .compatible = "st,stih418-tvout", .data = &stih418_tvout_data, },
+	{ /* end node */ }
+};
+MODULE_DEVICE_TABLE(of, tvout_of_match);
+
 static int sti_tvout_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	const struct sti_tvout_data *data;
 	struct sti_tvout *tvout;
 	struct resource *res;
 
@@ -851,6 +872,10 @@ static int sti_tvout_probe(struct platform_device *pdev)
 
 	tvout->dev = dev;
 
+	/* populate data structure depending on compatibility */
+	data = of_match_node(tvout_of_match, node)->data;
+	tvout->hdmi_sync_id = data->hdmi_sync_id;
+
 	/* get memory resources */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tvout-reg");
 	if (!res) {
@@ -877,12 +902,6 @@ static void sti_tvout_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &sti_tvout_ops);
 }
 
-static const struct of_device_id tvout_of_match[] = {
-	{ .compatible = "st,stih407-tvout", },
-	{ /* end node */ }
-};
-MODULE_DEVICE_TABLE(of, tvout_of_match);
-
 struct platform_driver sti_tvout_driver = {
 	.driver = {
 		.name = "sti-tvout",
-- 
2.34.1

