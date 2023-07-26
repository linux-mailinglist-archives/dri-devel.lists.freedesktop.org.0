Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33CF76284E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 03:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F79210E0A4;
	Wed, 26 Jul 2023 01:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911FC10E411
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 01:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CV6bigJ0gbFQZfCw2FeG1NlRmrco31qYVSpT2TMTbPA0A8UPheYn4oWDniurWbrCVFPREeusNScbQKzf7wiKi/jZQwUhYfEiQlXVOt53ckRl3mPggsLcTOWSsATaQTdrFeqCMiOrB8u8iPz76h4uToV7b+Ekhko2R8boqLE56Z6ysFPPE+JBe6G7++3F8BO0dz3WGtRc5nGx0mm7qZElA+LuypYu4+XmEWBZRDUjjlBO/cMfKPgm2Paw6cAVJLhIQn74KlcKS4NW2+zPAyfiqLNsMgizGCKzI4oDoLDzwQjcA2hcMyUpw9w9bxL8aqLQs2KzKIvTVMrQexTZNYTmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvdnAdk7QzctPMErf+ih3R5qpCemk0bDu3ZPzO6Aw/o=;
 b=LWQD+NsreOpP65/kDzJW97J72HVOyh5CB9+Z1afQ55ugi9GIh/DzzHywgte5eQsuRW/eYL3MPQ4SPfb2MmPh2VjdO+VFuanfjT8TfGeocBkulWNJFNzixR0//KjOb5lnpTmb3WR9zvLvuommGtiOMrh/8u5C3nNUKRRh5ptSWT3exy/qP6SnBZW6Bw5gBBls8Eay+2yHFYQCaTVb6Of2maWwLf7zANPIwnWqCOHgfxdaN+hJhEgA1dwo8nXvA6KIoAsVeLFZvnBpZayUuo7my3k57V4jT9D1BPErljjQbnhQgoQv6t8CBuj0rbaiO0eytdcYHJX5tAw8BNAXDtL8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvdnAdk7QzctPMErf+ih3R5qpCemk0bDu3ZPzO6Aw/o=;
 b=qReyIk1sVRoOrkVmAHQMyCywTztGuoVsFClyZnMEgKSFv9/fcch9MJIkfVLYxKKz6u5mXc0RbJrJSc4yUC5biQ7IzJo1ReLnAo30e7rV84Bh9tPvwfZS/L8bBxgzc71pStu2u/0lPKG95es7GvyLaFQxn2eB49S+Nutj1NGAeEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 01:49:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 01:49:18 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: dw_hdmi: Fix ELD is not updated issue
Date: Wed, 26 Jul 2023 09:48:33 +0800
Message-Id: <20230726014833.1647244-1-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e0ac55-0e35-4851-0467-08db8d7a86a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mj31pVqzgWG2eCKm1fRDv29ovWrKee16G3AjYekoFC7WSxhAdSh4U+vK/cbmrC5jzUQuiSlhcklX7oLKa5FWqtBY4VLyQMhIqELL9nHPBPkFKfHQx4IHl2SomfbMI6p3JR3RZXANNH6JAxANQb9Vcz6vPGfrkmDiWg68NcdInL1ZwMwzYQ8mb5FEJmV9dpPZSieU3ukA/ZSxw3zF835BbmrYfDu818k1KrCBv+LcLrxl1gZkMjIFXiSa5ok0W3Ce5Z2OUtUstLuxICPXhxsvI0fnK1Zv4iVCFN88dDJtWG6h1ATAHwpj/jKltZrbrAXvrMPRQwCLjgYDYS21Mj+Kegcdf0b4zJf1AurTK6paLPmL6AqMf+DxjReG6Elp4kmzieOuQSKUNm7rjAT/oXskH2eGbVUtkGcEZd7DYAg5sWl1Z7CSzA3GCS1Z1E7U+lQw7DP4yeiGINHILkM1Kgx351nWfxk3Bvz11G4jxnJS07S7QcUKkR6/81IG5/1AwkttPoEaQ3ny16tmi4uCZfg07KzQ6zdLKnf2gbLKqcVIk7DGnoO+dS0ydwKkBKcBPjVpsexE7nIoRMZ5PY8rf5lToxtgKZOWC1yj/juAAFGeIduBfAN8MXjMfs7Z5YX85VMH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(15650500001)(8676002)(8936002)(7416002)(5660300002)(41300700001)(316002)(4326008)(2906002)(66946007)(66476007)(66556008)(6512007)(26005)(52116002)(478600001)(186003)(6506007)(1076003)(6666004)(6486002)(86362001)(36756003)(2616005)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sNqHo2FvjED9FLNyJb9fPb1L59YwmqoosNsAnXuwWltkM/Q1nTNSui+fTXi6?=
 =?us-ascii?Q?h2PsYEtmB2GCVopsqLDgg6arHCfW8doEfcbCW3RSY1I9+eMmK0Z9QBIQwI6K?=
 =?us-ascii?Q?Gg2y68u7n6qe84igdfiZt5MhlgOYkZO8vbAsjz+uPV5TNq8oNSSDbuYwTkOB?=
 =?us-ascii?Q?ErfpYAdSmoyRdHnkC0deOTP8X5gV/WvbQ0S0D5iy4gK0S1ErIHxeDtAWCYqs?=
 =?us-ascii?Q?ZTfeRqMCluz4MA56UN7BownEQ6mGGJAOV+oKg/vDoW4JB613qizkhsklSZPL?=
 =?us-ascii?Q?RbnGNN5PU31RbySxfoYdbQ2k2k+jJu+ut9Kmvs6Df06oi2/dJAkoBu5N4rYm?=
 =?us-ascii?Q?BapqLTrDf1iwc/UQARjjfq+s6WHXpEDSgLZsyAPSxkgAQhgFtv+4EIiAPFaw?=
 =?us-ascii?Q?KgDsgZM48W5hmjLIIzZ4qmNe843BCB44o+rd1oEKksHZbipG8FOucz+GpJiy?=
 =?us-ascii?Q?B9LeFzInImAaj6HZuijlGEQ53Woh0TJTrNdNluSySnf5h6GN0H7UvC0178vA?=
 =?us-ascii?Q?rBJPaS3jwyjFXzlJ70JluwHfArie3XQsPodbIfNip9myLDq5vztFsQWjIwJC?=
 =?us-ascii?Q?pOp0mB4TuxA653RCiAsFrhgWWY6XiM1w7xKpwCnoSQq1AcxzAWX/tDdbM7p5?=
 =?us-ascii?Q?VuypbadhdIYdNpnUXWhAEmwaEVhVDGDbw2BRxxMmEvfwPCspI7ZJmxcmzqc/?=
 =?us-ascii?Q?92gvHH2YBfd/8upHswvm9aw+wB+5vBeESHyMVeCiid5nbCYyX1vELusz8ROp?=
 =?us-ascii?Q?EHhzcxe/wE8lOgEksizheb2vOvqDhoWFQccwHIGviUPXxzL0JXSSv5MVxh+C?=
 =?us-ascii?Q?jUqxIDb+y1cJ0OB9Icl+0f1ysG+nxT2F13sWO6ubbDzaqUSiK+wYQzwlcq9D?=
 =?us-ascii?Q?sXNVShHll/47vVVl04B4QGwd2fs4cOws7Iv3Xc3dV968CCIuJ9A3qGzs7Odb?=
 =?us-ascii?Q?/LnEGW+wCab50BFFzKmkp1ae180rKL/mcnqMR6p86GeY+JDfV2Ds7tzMg6yq?=
 =?us-ascii?Q?mBACyz5hSgxrsO0x1RgGns3eJwqxcB7NVQTTrvvgAPZXe1TI7MN+ER5xBRRq?=
 =?us-ascii?Q?LfYJXQDZtGkafjZv1tsEYRB+npFV9R8ZyX9Fn8U2QofvwV99KDzS5Sr3+BJN?=
 =?us-ascii?Q?f24Dj3stBO8RBw3jNZfJQmjrSkM8DUzZX2mvaCgvdLkAdOQHnRtHjjqAyo7G?=
 =?us-ascii?Q?oS7xeHxyqTaVzUP1vgeZTPkI8la0/83eia8uXTjTQkJoav4MwmYRXX1wu9Vn?=
 =?us-ascii?Q?k38YOk2HALUbyjer+XgJqs5NDF4KzXkcGtM2PDFB4L5JzeETnbioydyQTiDr?=
 =?us-ascii?Q?Q3cS3hT280bU6hiReYcjalm0cp7BIzkecEzSVavPl/r7T40jNqnQ2LBvsOOV?=
 =?us-ascii?Q?hA3YJtEN5wtgpIbrumCIFX8ozHiaWNiew/nrBI/wPusuFvp6/pHXLWj242i1?=
 =?us-ascii?Q?VWdjbNQKrlcwqkaMfp7HGE54Sm64fojkPyY91Hbul1yuOPUh1fKcUlXEvvET?=
 =?us-ascii?Q?7cJYxUa/fkmHLNA7cE9eMk3nVtZNaR6kif2/JXDFDEnP69VEtSJWgsrVPi/M?=
 =?us-ascii?Q?PVwsD4PbUYvpxTQevYsHvlYjjqNl4lsPObG8ENbm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e0ac55-0e35-4851-0467-08db8d7a86a0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 01:49:18.8973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nw/LO8a78HmavYOH/ATEMb+CZe0qPfmZ1bsnxH4RDcTE7ZXYY8GLEPbFAZ+Mque+3/fvFaUT2PMDo573kIWwhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322
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
Cc: neil.armstrong@linaro.org, the.cheaterman@gmail.com, rfoss@kernel.org,
 jonas@kwiboo.se, cychiang@chromium.org, Sandor.yu@nxp.com,
 shengjiu.wang@nxp.com, adrian.larumbe@collabora.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, treding@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ELD (EDID-Like Data) is not updated when the HDMI cable
is plugged into different HDMI monitors.
This is because the EDID is not updated in the HDMI HPD function.
As a result, the ELD data remains unchanged and may not reflect
the capabilities of the newly connected HDMI sink device.

To address this issue, the handle_plugged_change function should move to
the bridge_atomic_enable and bridge_atomic_disable functions.
Make sure the EDID is properly updated before updating ELD.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9a3db5234a0e0..6fa4848591226 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -196,7 +196,6 @@ struct dw_hdmi {
 
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
-	enum drm_connector_status last_connector_result;
 };
 
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
@@ -235,7 +234,7 @@ int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 	mutex_lock(&hdmi->mutex);
 	hdmi->plugged_cb = fn;
 	hdmi->codec_dev = codec_dev;
-	plugged = hdmi->last_connector_result == connector_status_connected;
+	plugged = hdmi->connector.status == connector_status_connected;
 	handle_plugged_change(hdmi, plugged);
 	mutex_unlock(&hdmi->mutex);
 
@@ -2446,20 +2445,7 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
 
 static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
 {
-	enum drm_connector_status result;
-
-	result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
-
-	mutex_lock(&hdmi->mutex);
-	if (result != hdmi->last_connector_result) {
-		dev_dbg(hdmi->dev, "read_hpd result: %d", result);
-		handle_plugged_change(hdmi,
-				      result == connector_status_connected);
-		hdmi->last_connector_result = result;
-	}
-	mutex_unlock(&hdmi->mutex);
-
-	return result;
+	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
 }
 
 static struct edid *dw_hdmi_get_edid(struct dw_hdmi *hdmi,
@@ -2958,6 +2944,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 	hdmi->curr_conn = NULL;
 	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
+	handle_plugged_change(hdmi, false);
 	mutex_unlock(&hdmi->mutex);
 }
 
@@ -2976,6 +2963,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	hdmi->curr_conn = connector;
 	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
+	handle_plugged_change(hdmi, true);
 	mutex_unlock(&hdmi->mutex);
 }
 
@@ -3369,7 +3357,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->rxsense = true;
 	hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
 	hdmi->mc_clkdis = 0x7f;
-	hdmi->last_connector_result = connector_status_disconnected;
 
 	mutex_init(&hdmi->mutex);
 	mutex_init(&hdmi->audio_mutex);
-- 
2.34.1

