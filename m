Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD81C9BAB48
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A20010E35B;
	Mon,  4 Nov 2024 03:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Wnjsf2Ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2040.outbound.protection.outlook.com [40.107.104.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6426110E35C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:28:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBJjshO1C9FHls8YNEspUNeFPZ67qfAiCJGp4UQsqq86y1k/VE0IIDG3QCP9peLGnGpluUwSYVnTUFmovk3S61owGxu+vfxZjIBwNdgddCO9e3tn8lnbobHAooww8sq9apt6rpFPhKRCypsbjFFMKwVkImYRVpVGBqheWIk9yhvGU5nfS4oyJ5LqxrnuJHEsmBvAP3oiwgVHF59efY9Obhf+lXADWKw6IFSqE7B98d2kNpuRGp6eFfm/ZMNatodGQtp0Bu6DoR3eAYM3iXLMQUOcYYSGq5Gp/1EW+rXEaKJsc1rY95XW6MSEY+AuVqhQZ2jEQfQB6uVMrvPaSorlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTwgJoGZ+i2vyWhZFpIrNU1QoxR72zxmrVW0muOCozw=;
 b=eKb7JZ5aO4THq45nqIhanRVrjoZuxrZb0CESV9ks1974GlRqHaO3heXDbCPeHm9oub4vZoSMlo4U9I2EORZflbNBJcSTmCqgg+Tr6BoYFQIr5feaxl9QugeKlRYsTsf+5NHoaoWb/klQKzoZvLUXuw2odbt6p+L9MtchXjlpuQ8FhN/BkdpJit3KRultE3+xWQN7TTvl15/NvtZEA3NybMbJqu9qDj1n0E03ZjzrWE3/BYvZVepFMQkyPCl6QLLtLYMiI1sFyjbOvkAZiQCHnReho4xAlot8l27o2wRFskeCElqapUPoS1+Rj+cPsb0q2gUP9jPyWndpbprkcQLxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTwgJoGZ+i2vyWhZFpIrNU1QoxR72zxmrVW0muOCozw=;
 b=Wnjsf2IhWxy4J6wNnFo88YM86EkoS6yTagCsw7ZWwCaQrMqgu4OZLeBckntM+vqH4dE9LazNvh9sd9dcN62FK4UDEx8FdBA2BNZJMQknIrrtesbj9RSG+sWqQQLkBoLpHWDtWeyvNdypRMm+12rlcL0FmtUf9PWqye0+LarKsm8o9TDepKvN4XywTkGYlRImuvavTPCMt+Z99A42dsWHOteUmgqan32RpJLiAGZDvglmAa09OeLKQf4dg2M4q0JuG3Ucf8XN89IafAAfhbP/EdjDOAnyy9PtrDDiZTNBcizWcEHIJJutt/HrA3ORhSkO/HHmhvQNuAus1SzwHJEevg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:28:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:28:44 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v5 02/13] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Mon,  4 Nov 2024 11:27:55 +0800
Message-Id: <20241104032806.611890-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1678932c-e7a4-4160-b5c8-08dcfc80c96e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MCoYZ46bGsAf+EvtPQhXwsn2RZoft9WffGQE2JctZeItd/sSeACT//4PuOs9?=
 =?us-ascii?Q?1bgZrlVKelZUOxKImWhbeJERGMgEheKVjJtAyI0af6dln0YNU5HKsczcMWlN?=
 =?us-ascii?Q?IXc8CI24bJaTv1eaQaVQFyWzJCUPx/2cvvShQ4v91fu2zKJqansUkzO0G1xR?=
 =?us-ascii?Q?YbrBNkLFQ49Yq3GrN+nIWfEYafBOZrWeg4LVbRcOz/7hxsJ5dLryYeqwWKO5?=
 =?us-ascii?Q?X5DK5AsnsWjge0mlyGKO19c9aRH1cR7sJGzM+P4/uLc76zfGAoBhf7yKZHoW?=
 =?us-ascii?Q?8Tm5JsCc0x5+qiiOKPKhE7vgRQFpgj0Crj/09WsjsuuVYfZo2XbYoLR0CPRo?=
 =?us-ascii?Q?+Em+8KOb7ybMpat1j8bZWHHuRHXjQ02Yq/sQb+BiKO4U1VhQnef9W0ECDTGK?=
 =?us-ascii?Q?qdu85sPjxtktUQ6w1w9oCimCWwgrFkdRZcY5o5yFDCFMjak2NYxodculE1yy?=
 =?us-ascii?Q?aAJzqAAoU1JkVCanBqSb0rpOqXBVTKzpTQYk88sdUBjod7Vb/NG5JdvLs81y?=
 =?us-ascii?Q?Kr9J2l5XRl1/o3/NiZkxC+4tmJRyv29p+j7GdUJ3R3iOVoq99sZ78MPUuhyg?=
 =?us-ascii?Q?Kd2v7PxtpWBu5xi0Pwt1BnX41i2OhUar6uVZ7RBgS4fEGN+pRqsCmGr1mWyS?=
 =?us-ascii?Q?gzeoDdc+94OeHcX9h6ucdFJSZfFEnMpBTu9c3FSNvLh7botvec+/EZxwoyQv?=
 =?us-ascii?Q?ZzSYs/9keh1ARZxyluLlfj8c4+ucFfeLv+zc+Rfppv9VUJzZMS3Bx/N/a2rn?=
 =?us-ascii?Q?s7OYpL37SqgcFksbZkpKSegWUdyx9caAtu0ZcUFlmD6ksk2floyXyG7J5ywW?=
 =?us-ascii?Q?l9DRUfV0b3GGAwxbD39/5uj+hnLL6ElTdYPxGy3/9cwsJunQTsHyynvzPlPv?=
 =?us-ascii?Q?JK3/jMx23LcdmPe1aqr9mOQ2HMSbKTaGDGYF0A6Cz2mgu3tWn2Lt1LOIxoYl?=
 =?us-ascii?Q?th2nqJNrAmNCx0F9KaGy1UokJIlMaXTwY/Bl+kyjtXG25WA6xfrgJiA54DyO?=
 =?us-ascii?Q?iROb+Xz+J/qIVLFWhSEj4FvkrKCJUqd5tkQe1+bRzMpGmaSTY/ECZ7K0c3lc?=
 =?us-ascii?Q?p538mHcYOX42MdnqHi9n+SIc+UGoF6Cj5GVsCTOp4pz9gPJModYf2/Vj9+wR?=
 =?us-ascii?Q?f5b6JZgshRY0djx9k6c2lhi4+PJqI5eECV3p0nugVG1o5rfIKoFwNX7gnTlf?=
 =?us-ascii?Q?+yxdoV5VD8y+ktEA8PusvjfLsIA/CXrEhp5KkcNvPasEL6k2BbJXfr32BUGQ?=
 =?us-ascii?Q?j714g0qxuQGnpyYPs99qY8BqaajQ6CcczfKHEE+ZeA6ayBuwGGxqvJWwKkTM?=
 =?us-ascii?Q?/MQmu1I7fF67UhWuPKXimSfvT/83HLpi3aDheKDiDuaaYbnikFyEPQL8xqdW?=
 =?us-ascii?Q?EkS8D/c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pepQn57oFNOBlYH8erVwELSSWWWmYPrcJruOFtt0AsXX73eanoz2k2YjaMNC?=
 =?us-ascii?Q?1kAQJ1oTXEsz1eRESUHGdAVDAaDepOtCU3Q9J1Hbq7GE103YabADzXw5XLFU?=
 =?us-ascii?Q?aZZfE/JVT2KLj1GhlMAAFnUSIxX6+DjG688sBFTe4Vbod5t+gmgI/R0CvW7y?=
 =?us-ascii?Q?27qjTIwoVH4VdhVRXN7BiDDZMBdWgWkxffjnkFVNqqe4lxA61tjOG8dfaswY?=
 =?us-ascii?Q?EUW+zjdQ6oTrxijBdbhBBbqR889NXyzZ9ngoojma19JKu4e0hdNagGvL48Ic?=
 =?us-ascii?Q?CpiAcK3AMSo1ze0l9Nj/p+YSPxR00SjisguLwT8rIWnNPJ2h2StJjpTprhU+?=
 =?us-ascii?Q?tontmQBG4BWVSNo8nYnTazGcNxfBkY8Emk/JCBCgoDZ6nQQMGvtMbSnTxIjv?=
 =?us-ascii?Q?CQPG3kjxwDTKOS85+1KHOTLesTr6ein3kx83qtkeLTPWtCNgQvr1H0TlCHzI?=
 =?us-ascii?Q?+Zs723GKibvEVmweZ7i4oxEMjSuhaW1y9yc0xyruAc+Ht+3YhgBHMT4rz6bl?=
 =?us-ascii?Q?fD29clGkSOlydEQGId3tThpITNMfy7bwOGaxkyyfzQdZm3lafGBzofWu0c8t?=
 =?us-ascii?Q?H59hxTXiwAnmYSyfjeO0YaQ27TP8WgtokPAJikCrILgkmCpgjPeoo2099qBZ?=
 =?us-ascii?Q?bY6cTz11G1fZ2ONmg8xkK6Zfjk8XjF4l/r5kCYt/SkpDBEcHfhqAyGF4rf2m?=
 =?us-ascii?Q?e/rYAkEe1l8sSzRdlrwbkhbaRvz9EjRjX24gbO6DUdCop51Mux9zDDXSDuIx?=
 =?us-ascii?Q?uWnDzW83t3e1ybg0lcYEG2P+KhMyn2flmOdtf/WV9zPN/I3kiNwvcniB3KLG?=
 =?us-ascii?Q?y4BkD+NkMUZlgVImYu5Kw8AzT+/kjfugbbzpsMUEhTmLaw4GoO78vHLzSbJ6?=
 =?us-ascii?Q?xneebWNh0bGZBSNyUoZQ0zrTSZwB5JgAdXWqZfOtqbblNbsZg6z05WV4WvGB?=
 =?us-ascii?Q?o4spoy8MoG8M53se+We9JIUcUZp74h9QEPGv1ru+9h0PCLD8CKGttHrtjFNr?=
 =?us-ascii?Q?Tx2EjDKj++yUAAJG6e3caVF7p5pKjrzCStpEHyYlArk9uOJxDIYN8xyJPdeW?=
 =?us-ascii?Q?eXQHt8EF9PqAW4mqZHwMRLgdD8wLLC6mOPS7NvfllU0JqpMmuT67FbI4/aH8?=
 =?us-ascii?Q?M7fKF1jIoy86EFfRBQUmddkz9aenv1GbBSo+fpXXkn9eIE/mX8JMs1DMvPg7?=
 =?us-ascii?Q?9iphsrq34g73xVE+sm27TMDe7QY+uUBHrTRnUZ3ehGICoFQN0/brFpDaQrvS?=
 =?us-ascii?Q?v06lLi8gr6qH10kmhHd8j7jAx+0n+DQ0zDor1kxq+ATrEkLtO6G8zr6FY8/s?=
 =?us-ascii?Q?A1ydmf8W+guEibeycYqF/ochkg9u4v57doQ+4qyMinxi4r/q3TWDRJuMxEJo?=
 =?us-ascii?Q?6goR3nl7Rrourz84QYG3ORvmS1dHroSfABTGbFDek/gVHP4/TPnvoIgDBwtq?=
 =?us-ascii?Q?mKlpe6pzipIaeH+ayRtlPlIaz4XPXOK7zc3mQ2lJ/X9zducQJ7WtP/KjW24G?=
 =?us-ascii?Q?h2JPsf/B8WVLC82XsU9xM44e8fBmYEkUmH54bYuw6zOcpK5YWCR4Bg0sNMZ9?=
 =?us-ascii?Q?kw4MGgtX4TG2OvRtFLkagddGn2TVYm0nR9W3wkUH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1678932c-e7a4-4160-b5c8-08dcfc80c96e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:28:44.7922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJ3N4aHXW02eJ9WuPvRyoB/arzw+2+u3bbHVzoY3Nf+rnrJVk2VpKPW38sLo8LRJAxsCjsbKxwka0cvN6/aHSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
* No change.

v4:
* No change.

v3:
* Collect Dmitry' R-b tag.

v2:
* No change.

 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04f..b559f3e0bef6 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -117,7 +116,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(bridge->encoder, fsl_ldb->next_bridge,
 				 bridge, flags);
 }
 
@@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -318,33 +315,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
+	/* Locate the remote ports. */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
 	of_node_put(remote1);
 	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						      fsl_ldb->ch0_enabled ? 1 : 2,
+						      0);
+	if (IS_ERR(fsl_ldb->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
+				     "failed to get next bridge\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;
-- 
2.34.1

