Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954F76F9E5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 08:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7CE10E248;
	Fri,  4 Aug 2023 06:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653B910E249
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 06:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9SUWZgb1fk1Pojr+DTWhZO8pDc0gS0yM49wbmXNaSoOu5CYRk0U5jirizwTmYYEi28PeZ5pH2S4jW0MT9Tck5fC8kCmDmC5IqUsA8jZYDc1vPF/Qj7Gz78zuOALR2OEFBCDwjwKQF9mpLJNybGJAGb9nMjW0Lj+HOndHYpDXQIjBQyP7Ky+sRRsOqj+60Xg8b0XIUSufAeRrg1G3hWfXtPKv6ND4zyOcSoQqXP35a6iGy/pNyVYIYB/2w9N3mM6AQsXsuZqhBUTrYn9SlnLc2aeAiSE4c0GajMKORr1Fu2VozVRJ6hrk1qCrZHIvtGSejf4EKl/LO+Gb7KZftXoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pqDlp8NbSJUqyvctfy+3VuNilza2OTPgQRYXfOcw34=;
 b=jiveFtumVtDobD1eJrRaizVB21dzi+8kETJYIiSj1Q5Rn1KwRJy5TuY7sH5iCXgb3p7GynKqSJ6Yy7bO7QfSOoCqLEPHdtMbwZ5eNJlOeTf2wrKHZy51638Z+CSoSttQv+FP8QV34uSbznWB9S1tdMP9VZLWKNhX6v9xyQTHf1sD3NA+wZsXznoTVArWY2rOALP02Al4x6A79XbnvrQ9BvyriY+rMcTUivnPWj+lV+NBWq30Ym/IyDfk3miHT/zva/swdSDV2hPPLfMgD+fTcHPC0lhLrdp2qQ+EECBNrBaH8NpRopxudCTOs6V+NzXcLvJtmCkdBAupIAzqBPb2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pqDlp8NbSJUqyvctfy+3VuNilza2OTPgQRYXfOcw34=;
 b=QokvSIOyro8eSwzHht/Qy1G7cOeVUxU06CzCC5W8ObevweHAfrsVxYIkIJ38vjhg6R9QpUCW3kDauntJmS60JUQf0J2N405HQRxOTE/fnPXSgfQVjU6qKRrEO+t1BG2mU922fkHHcGXGfRov8pDze+9fCdvNpqcP8/kjWaFak+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 06:12:29 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:12:29 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: bridge: dw_hdmi: Fix ELD is not updated issue
Date: Fri,  4 Aug 2023 14:11:45 +0800
Message-Id: <20230804061145.2824843-1-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: f389d3cd-6b43-4e9a-703a-08db94b1c811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVJ48XHmZW5f0LUgL8KvZGLWbW/Xj2SrKpcW9y/Aa3cIjUNKWGoiBB6uA72vDu4unC8hIryC7Yi9+YBcw4NhpYh4HOiIFoaPwqWUGVrBJwueJ3pDmHvXAzBmo+e8dy1dnUO5smLMuKg45vgsp0eJNC1b9UecyLpRe6BpTpXBPAf4RMhGvq1KXgN7/jSOR5q4O8KeJWZByqGVwUSxIB4KYO+na8vShAeeWFX0SvJObyPIujw6GjE+IT1c9HthvJNZ7Rb04oG3gFRgbSza/kiuipQ7XQL6w3YogLU1fIh6xV6PtH01apWfIgh3KX73qKZPMsZOFP/lLf8g3LZyYrbvMwtGW04fJaDB71MUlF16kKe2FYhJ+31NvYk/bN+7pJFsSCL8A9wNv5F7HyeMlNzws4NxrZoGh0N9PBG69YkxkyrIpX7dSPd4UFE1Luhd5rewiNdM0Gzs7pgP2ZLzeXnM45q1ZejV4UnTAIziiVbmTv5lKWrYi0MhSP0q0rg+qR6z+C/B8iwHHpT3n1nCnubdjsKz9sT/XDEdoQgN0NZREO6KD8Fx4CdEP90EpX0hAjF5Z1ymYpFqYtljUKb5UB6ukoSkgYpcRMJa1VKo/a0hiBr/sexRfN+dDtcMqhTZ0IFg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(186006)(451199021)(1800799003)(66476007)(66946007)(66556008)(4326008)(2906002)(38100700002)(38350700002)(2616005)(1076003)(6506007)(7416002)(83380400001)(86362001)(6512007)(26005)(478600001)(36756003)(6486002)(52116002)(6666004)(8936002)(8676002)(5660300002)(15650500001)(41300700001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BWzZiDwwDQnwUT2HmXA3/pYbuM0zleAZ/FpmWhm11vxcqpjLiwAhnu94LZJC?=
 =?us-ascii?Q?dkOcoQmBwzID1ggA/whWQnj/d+PoYq3YAC7O1cZFNbaBYzLWCc9gj0qX7c8z?=
 =?us-ascii?Q?Nw/wOqszstMAtPT8Xu5AaqCJKTskf0dxjshYrzsc0PSSivd9oZnH0lYdnTrv?=
 =?us-ascii?Q?fmBUYaSXHIYhjorYXL9IpNdd8g2TxfnEjX1EFBihEEPtjEW2JyUZo22mqxGH?=
 =?us-ascii?Q?eeSvgOVLUEd/PKbockkNeKIwvQ25Tho8HZPBnCwrxL29IIGCkb1rOjHdqDVi?=
 =?us-ascii?Q?cjXS+jM38KqGrIp8iDQC63HfVPCQUUcaiJC8f3krI+YfyOIpk3eHYJjwzQOf?=
 =?us-ascii?Q?Onc9/hlNgGhGIlo5fRmQMfFNCF3U3tH0svdJ65At1b0yBRiHYqkCCuGEOovt?=
 =?us-ascii?Q?ojljmf+CFHcCPEuKzutCOnNhXSgmxrKBd1soGu8OcZOPls0iIbHIqHc2S4RZ?=
 =?us-ascii?Q?9mnQovno5qmOIdhnJc9c3dCQuEMHw6BXwtnW97e48lDJwT8OmnO6WEcucKAP?=
 =?us-ascii?Q?O1dNmyVYaJoyfGLElc9w0vZjEzt7lkTLbtygmfzQv4nyiFvd9iv9iVK6JaFj?=
 =?us-ascii?Q?h3ytwybRxugqCQ/u3JnUd5bfGaV6Vtp4HGingi3KjfJjDAqxhbVg26SDbWwK?=
 =?us-ascii?Q?x+PSpepjXiUqYXtYkjEvKJKpdeIPbgbuz8H2KvzOVpzMBw765SQrk3taRXX6?=
 =?us-ascii?Q?V8K1ncfiyQ2i+UyXKBiU1hFqcMrgc9gLkx013MlFt4DyUvg1xSTotc+W6j0Y?=
 =?us-ascii?Q?0W+mS6E5brRiE96tPYaLWgXDngHl0W5AFyLefZybjNW7dzpo6fBxU6IRd/4d?=
 =?us-ascii?Q?7evhcAbFl3osXcCVYbQohtHuM9SnnI4HAhOahG7Z7OKpMRu22qZpGIHVMT9Y?=
 =?us-ascii?Q?xfNyzaP3evacsBRVXD2Ot0BUXiPlX/DB7ion23FI8aVyIWfAq1lCEHhKNTST?=
 =?us-ascii?Q?kOn/FQAWVKDwKT3bzVJDu9SpKoi+//DwdiS3LhmqIvi0VRHlGr5q8PASSUY6?=
 =?us-ascii?Q?97HouDO4ivGr7HywCodunZ4CIE6m1WjrQqDxmp+LbL++oFWrJr5UUX3lB66f?=
 =?us-ascii?Q?1sSjI6NY/zHo/Jd0RJsGNcH6NFT12x6mlkv8JG37CPEPIXdQcvgwNqGIvMd0?=
 =?us-ascii?Q?MNBydameESHvavlS+SUShXheOXkmLSaFFPjsVQIHcZS1FvPQol0/uEAwp57x?=
 =?us-ascii?Q?+so4BRzcyRMrYB6lfQKVjbEDc7AyW11/o7r9J6OpQw98KKkTDS4qYPkOTjkZ?=
 =?us-ascii?Q?FHO4sLmmK6OAVjxK5mut6PkZrRsoIeyjhe0dFEfyi5H+5335MSP4PjGKKfSm?=
 =?us-ascii?Q?uzI7QAYpXLPVuRrjgdPVoA6OWR/FN80sDd2G7Yi21Ab0Q+PqkjezolgSXj9J?=
 =?us-ascii?Q?IpSzaspk4yIEZCEwmWuvqL2+lsDVbxVfwRmKcAzQzpAq/PxiQHBM5C9V4kSq?=
 =?us-ascii?Q?/6jwPjTpqXUyy+5ZptDnpCIs+ajScUVQabDObeDt2Zt2pZ/tjO9d5gJMzm7V?=
 =?us-ascii?Q?faqayPEZyoxKTJX5ys8eA1OvDPI4AkSd4K/AQOoorY6/OA9e8Ff+j2VG86Yx?=
 =?us-ascii?Q?TU0nS2adVhCfRyn9Izzs3yZr7zH+osOalK10vxdq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f389d3cd-6b43-4e9a-703a-08db94b1c811
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:12:29.2609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75cFUlSvfV4qUxuV8btBHScVbXa3HyHTAqcXUWv3W1yQQhzl2zPrpSbITn2A9qoi2eYYbQHJ4ZzlDyPJOZCjqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
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
v2:
  - Add the variable of last_connector_result back to driver.
    It will only be used to initialize audio codec jack status when audio codec driver probe.

---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aa51c61a78c7..963050de42c3 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2463,15 +2463,7 @@ static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
 	enum drm_connector_status result;
 
 	result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
-
-	mutex_lock(&hdmi->mutex);
-	if (result != hdmi->last_connector_result) {
-		dev_dbg(hdmi->dev, "read_hpd result: %d", result);
-		handle_plugged_change(hdmi,
-				      result == connector_status_connected);
-		hdmi->last_connector_result = result;
-	}
-	mutex_unlock(&hdmi->mutex);
+	hdmi->last_connector_result = result;
 
 	return result;
 }
@@ -2971,6 +2963,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 	hdmi->curr_conn = NULL;
 	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
+	handle_plugged_change(hdmi, false);
 	mutex_unlock(&hdmi->mutex);
 }
 
@@ -2989,6 +2982,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	hdmi->curr_conn = connector;
 	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
+	handle_plugged_change(hdmi, true);
 	mutex_unlock(&hdmi->mutex);
 }
 
-- 
2.34.1

