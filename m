Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C199B1A2
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 09:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6525610E1D8;
	Sat, 12 Oct 2024 07:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="C+sZZA0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2086.outbound.protection.outlook.com [40.107.103.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FFB10E1D8
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 07:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOkk+DQdvLkw+nrunFdw3ApS/S6RDi3fOu8GScaJgjrGng9221NW7GgpiYcXofkhIbkpe1+51J2DjtN2XBYoE42ehDp2voDuc+T8NBAGkLAtyb3/x3/bM809QhH2/VLUC3Y1Ucm++72HhpKhaDuM3giJAw+nVrbDumNwHPqK17TfcHNGb8+M2dADvOizOrHuO03FnXbMj2dnsmY5p3v+TrUIxJHDOKnSEfkfPb38NeOsfY0z1HIV4ar/fFJE2us6IGC3lDj621NuZ/dS3Zyo8GJ7R8vObeBN/aqUPY+Q/1bEkdx9gUkcDhaWrDEDjNG73aEtDrUHC+vkPhW1YHJViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBZVQJTOrU/JnRQT+7SOzdF+c+EY5OzZfSCgS64pO1c=;
 b=h7KX7F5EPWNu8Gm7+EyXzE856IlaDvzM295P3NS4ztoIfz3DaCdW0KIhAP4yafzcbKpRq2bDtkP9Cq/WwZ12OUUgRlsHj10SKEYudLiKIM/C1umWRJtDRrJVhYIZ2ATPPNPK8KYIr/3IP+IGWfpddwOA9ZYZA74+EmmN1IbgfO6z/mh0c4NMXS9OiqF1HKO+3RMPud13js8niMYS1xJtgiVeByLCX1CqcEIhWp2L5JHvLYFXyFhW3CCQY71f85NIpMB4QbuQTzlsx25Y1pez+87qoXJ78Bt000IUpSA8gMNORygi2WRYv3vM9VdOujJBeTktNiPPfNJU9o5/nIx7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBZVQJTOrU/JnRQT+7SOzdF+c+EY5OzZfSCgS64pO1c=;
 b=C+sZZA0cplY5hQU/bhy07KDxmHJiaLfYBQPgfbuduY0yNtANaYfaBBFlQYOidGsGMWrEFrJNEEGA8ycWaKldQ1bKWA/ebyUgDh8FvCSEk6Yf0df2EXU3yumUYMWJ5IVddBvXFO3AwfXX/KiR8PejdoXYwtS6XkRyyu7JvhxZduOXxUS8tM5sq8ZjMII4nRI8GiUahkEpt2H93yDi5RMNlf7ZROMfzS92+kvM0iKH6tD/l9FKPQhcjffBhbIUmzzdl5Wby3lxWf+31Xa1jktzIK7X9ou0jZdb7VvV69CL6Yo9EqBjnyrWjyIfy+nFxH6HKN0x8k2ZpGI6Ar+vzCk+VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 07:37:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 07:37:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: [PATCH v2 3/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Sat, 12 Oct 2024 15:35:37 +0800
Message-Id: <20241012073543.1388069-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012073543.1388069-1-victor.liu@nxp.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6238b6-8869-4669-c5ba-08dcea90ae70
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v1+4rSWeRfR2zNZ2VxrPxb7zlqAt2o5qBxCwhFXY5tvKana8RaoS1NLFdkz+?=
 =?us-ascii?Q?SWvtNN0FzNBadwoZ0lyh5paWTUEToNv+sDsUxcd/z/XylSQ8eVpVD9OEwQDO?=
 =?us-ascii?Q?3fvAXrdKej0guFDv/HhvQ932VIgNXNmIbtGQV5edPv2hevMJXMlVuhrvF5sf?=
 =?us-ascii?Q?JZ5YwLI36LxyQVTnyx/c7RLXsCuwCXgUyhYWAEE/KIkXyC/v8cLm9QmxQwpH?=
 =?us-ascii?Q?ZHG069fOdGuSY6orJLFXiuyLA8wgwBJVtQbdnfQoDQOjjK67h/Hp+T37aKJE?=
 =?us-ascii?Q?NftQ4lxyTnbTasXYpTaW8y5scbDwCnFVBAYQAHiRgX0Oyzb1PfgrijuWjgq3?=
 =?us-ascii?Q?tACD6wXx3WuE18Xl0grCcteEzm2ozwvhRjAVkfLraELbXEuWceZcwgLse6RU?=
 =?us-ascii?Q?pDg/0d7TQRM8S/MlDsR1mijSZh35x6/400smYgJs4J7I/TWvikzTEvOSGLJm?=
 =?us-ascii?Q?4yngEBb6f45kHQO7WfcJqB5dwvugYeW2v2TdQXJNlzqCZkHkNy12+JIlYPow?=
 =?us-ascii?Q?oaLecprM1MkUwgTqX5J8MUQBzfg6W0rSfHg4fBH++Lx5DjEv7iK2YXdrre8a?=
 =?us-ascii?Q?vLjc7/xb29jLb+oiUwcMQA1M+fM8jW+QGMtWu96rIwllWdhVh+IWYkyQgRqt?=
 =?us-ascii?Q?XpZ4lkuKrV4jWY+FhJOUJ2eCWdDZr0lqZPy+AHd2CjBShrcsZD6n3zBzZJYw?=
 =?us-ascii?Q?602yBaEHo7/6+Q7uw/jekXjYFQTEdIAippQSRABt8PMcauX/jp3LdSEmvxNX?=
 =?us-ascii?Q?hDa217jaQL5HSiZIFfg3iWp/TfEiLFmuBHwksVX5LV/+cMPlQs24U/kvnRfb?=
 =?us-ascii?Q?h0fIq6PrdE4c1RZ/t183BT8tn845rjQ6IO13nvFbVkw5KspVkOg7E4DnBZYs?=
 =?us-ascii?Q?l9FZ5Np932pYzEVaf3E+dQNXSTZdiq35ADNzU1bmKjjvBMlAHbuxc+8CTW4v?=
 =?us-ascii?Q?nO2tZW0Y2NyZLqKiY0KZnuSyyMif2S6eASFqolDhTcfTowubVpF7uk0h8JJq?=
 =?us-ascii?Q?SPGylvkt0+k2spZQroMEMYusp5MLmluKuxVh/GkTyhXTqXlMHh6xiyqnCaaf?=
 =?us-ascii?Q?br+a6EabB+fts7NuprE1ai+f1Op5r+bqURYXO/Zhc7c347LQ3EtZjNQZWbUQ?=
 =?us-ascii?Q?DI0InfkesDmnO5U0nrj8pt4r/xqLZVjPC6n7RSxm7ijq38y/KUt0F/njitOR?=
 =?us-ascii?Q?5LoSOoUArKglRPexFm2axJ0juYcwOZYrCJLeFRsW9OWFmjSkcIoDY5kRYAeR?=
 =?us-ascii?Q?VeqvC1FBlGho+i+4n3V6hiZqvI0ImFA6O+e/qQ7PjVnKaaFvTUD04gRYJavY?=
 =?us-ascii?Q?rj+cgkq9SUkmR0ELaMouNi5YWyGbdHZr1P/oQAGISTMugA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Ep91U6uiqSQuAl5wxiuntU+lUUwg745ZyInXhR4bODPkk8u4SG2/T19xnXV?=
 =?us-ascii?Q?HBrcKK+pQwW50tly8f+wQ/vrY+Vfald6mk/TIquhtKttY8CRLYsWNkjKHfeh?=
 =?us-ascii?Q?7+r3/IJIRIm3q9gCwOc9aQyi7EKnUhZqRkOhkx5wJStDYLe4gq9WkOdtdVcU?=
 =?us-ascii?Q?oOE/UB3PzZDgGw1j9/TdzEpOOLnMgVYtDRAK+cco4+/m072NX/snoSH3Yjsy?=
 =?us-ascii?Q?dm1ah6BHnH3NEK6Rly3Bl5H3R5tqZEwjij9oSKpaEKT74oW6Uf8/X/rDCueH?=
 =?us-ascii?Q?boOX3tawUrgLZqS4CGzUb43S4GA1K94kqLbs5Bwzvq41gAsXbg1Xic6soa8X?=
 =?us-ascii?Q?fNR8yOvd2IBA13NJMc2+b1j7/Ph+NJmy4FTeQqeJNco9/8xd0ou2yzCzHjaj?=
 =?us-ascii?Q?4O59CK9FCUad4fFL8ddoOrVFXe+EL6lGiUfk47SGOC32im2kb1EslqC0E+wW?=
 =?us-ascii?Q?GgiR4caMjiaBC64Ms/tXb45dNvQCcyoD0kWumPHK27U0hM0/I+v36jXm+1Fh?=
 =?us-ascii?Q?UPkQORmc0PyuLZbW+2o7b2dGtlHl3cNQ/wkFmWLL+5+53FKFR3d0oUcGUR7i?=
 =?us-ascii?Q?m5UuoJICtigL+vD4l2nMoHVag0KWRM68L304l1T5yfhQ6HRY0/hdtjEzo0F1?=
 =?us-ascii?Q?w0SkTGdOheb8te1R1SR0g1TUgqTRSpJFxbOk4Pra1HZTI7vEzslOSZC0fK/x?=
 =?us-ascii?Q?UbcuGSD5Iyr0ahaS9nPr/rVn+SaipPdS0VygCFBTVrlbJFlQmWBwU4Vqj3ZE?=
 =?us-ascii?Q?NgKmf8tibcIimiR5O0Kitp+tyV2ZviXh2gF095CvF4RfHmhScEfXsmUd3WAr?=
 =?us-ascii?Q?ahkOiCEfmgL6MiB3qbekwd/2WtoV5im1ZcBDxtbQNdZOHaNyFfIaluIhXYka?=
 =?us-ascii?Q?e6UWvqExLGw6xjEOAL1BhRhL32UOJwvYQgXuxN9s+S5Y94zsOq5Nbl8gZvu+?=
 =?us-ascii?Q?p0MeEjpSIowzCx5xgNgMz4UIfEICOD4G0EFu/O+dGXeyHspdPOagOKVwsEJ8?=
 =?us-ascii?Q?f5YjYQq0EOnqfjRcYuUI5F5nxG048HClqasieX/qdFuYyH1R4665x76RmDyk?=
 =?us-ascii?Q?58/JXdhLeexQcTDxKh+CJPFuCIUIQ1vTMkrR31EaswH/dR3OmQPUeZXCLDA/?=
 =?us-ascii?Q?xmVP17md8Wn3duDZ7CBkBCQmVgHiWvMbEr5cE64YvkKiEBrNYZFBJ9noCaUS?=
 =?us-ascii?Q?h1l9FHFFK4Yz6FGEsQy03e1WWvHUvtrrlc/2Z1MipT8UcjNZw0IfPxa1Ec5L?=
 =?us-ascii?Q?x785CfjvnKYDgBymmfzqy6MlrzZ9RXLZyQm5XD24/H0/6eCFtq32nR2ailG7?=
 =?us-ascii?Q?84Pk0DlMeY6NSrQZXoNrvdB46s5Hncuc4EMlDQbfyLSHUn+hDcmmiiZFqlwk?=
 =?us-ascii?Q?toI2t9YFqtPnbQQTwWWPzF2SaKXZ6GxUWVYZKBkUwqzm2gnj14XClL5Sq6K8?=
 =?us-ascii?Q?PPBtyFu5h4oJ08Rp+wdefUOs7Z0C8F26x3/W3mt/Loded/jZGtRj7kQNIWFc?=
 =?us-ascii?Q?xcXUr/wJWOLYgkv2lxC77+4lqF3oo1LdD8qD8QGk4314ezq+Dx2wOLtOUe1+?=
 =?us-ascii?Q?wr4gkQUIC2tbNT4R/Zk3bATuI931rCitAWEXZ/6W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6238b6-8869-4669-c5ba-08dcea90ae70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:37:10.4398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgWzLlYo5cMcrpBiTMMWGFEwZiBJ6mCMTn7JXb3DOkRcKDwy/bJVUXw99ZF12PWzNk6wxVbSfiQpMjLvHz5R8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
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
---
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

