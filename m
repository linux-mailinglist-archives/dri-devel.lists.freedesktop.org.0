Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC189A5AB8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E01810E413;
	Mon, 21 Oct 2024 06:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Mdr+Da3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956D010E413
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Le0eYUCedBUQiwMOue7fVxW1FC4aDNSuxL0x/hDXtJyYZbS46lyKcU/YSipWPQl4riBLvNDMeWxnDULuYtAEjWU7bNXnTa2XV59hTSBDwrG7iwk4K1N4/JUcfEZ3fNHtgrrx+XNM7mP7IymoKW8sl4PvOYK/weAfJ1AiL5MYJWfy8i/LDuWbNz4DZirnDZSLkEHZYihfyED+/YYcZs01xl5WEf53S/hQoIBordWgvheroKWEmLz4dyHk8K5VlN8EV0WS+hX5ifjueMkGirPk3BKcGZb4xPK8sRjbIqkakvFgmXKU+hM7HKAFz8hA8L/JVGyKSu24HHTsQXXv0V/fRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQM4/MYFJ7rokhH4z/YJqDLp2nV38Ib2IwVQ4T0CMMg=;
 b=SaoYOEv1wOTC+d+BIY7FaGfAOcnop9HjLtm0qvDx+d5e+Nb/8qk5YcPvLfD/v7Vka9mzvYGSVyEkBLqessWc3xOH5JiblBAOFoxYyMNpD4ryg2WqSDcIoklqqnIuBE3m50OADY1X7IwhgPsdAXaAGc2dyQw21tpgYpb/qlyomZjzkS9VZBiqgWIRQ6RVIpeXFtuHGrFAAKeZiWpddD6KQSHVKtQX3jQJlESlf6qzwio8A1BECzAWNmvYxNXfW8PFdK8ZIXwxm0XykrUH24ATSDISxza3MPUZcMBdUYRI07jQsCTr/LYfwJpSJbJaRo9Cf7A1xPNY6bgCoR1Zgs/Kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQM4/MYFJ7rokhH4z/YJqDLp2nV38Ib2IwVQ4T0CMMg=;
 b=Mdr+Da3wPplIpxvLGbwJinZ8STu/uLdVe5Mjl0zE/X0dlxnLj5QxhH5L2bk/HQbLMrEzQpx5s4oJfA3Ywl37DqERQg/SvLUoLFRbgHEzx1NOSgwi3P9ZVyvKYqvLPw67d72+FlzYI1Xc/LkOUsIglWMOW8dLLhla7NLBHvUGRVml+6+OUT1MlARbpGC00jmIEHwC7iUPewLNzdPyhdcBkMxio3v0RuZ0WtHr9m1VUfv57byye1np6fnw6xFTiqoIEwnkRhtvfBJte0VdIF/irhWKxwu9maLY3tUwdspqAq5w8Z1Ko6RPX9Jqo2ImntQ+5IZ4jGk2oqQQlUYF8HKksw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7374.eurprd04.prod.outlook.com (2603:10a6:800:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 06:46:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:46:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 09/15] dt-bindings: display: panel-simple-lvds-dual-ports:
 Reference lvds-dual-ports.yaml
Date: Mon, 21 Oct 2024 14:44:40 +0800
Message-Id: <20241021064446.263619-10-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb1bb5e-af6c-4375-50f4-08dcf19c270b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dkpvb2WiVrpVRh/Nriz36DvXrPI+c3d3kYq7YBMD5VEzotM0AfemvMo+UPnO?=
 =?us-ascii?Q?miGNPJ2Tiruxlwgk0pZY/qBn1KEPXOQE81pUVqehZYFG83Mm3s78dlrfTF/q?=
 =?us-ascii?Q?2Bn34JWLYggnUn8MKhitXeBGncs2gZ4FLBFw2qG2uqJr7R7GqF3Cumwe5YaR?=
 =?us-ascii?Q?aGSmXxLLM14JQXo2z1H8piYkrDb4u244kYUfR0fb0B3icAs1M6O7yRbQX/DJ?=
 =?us-ascii?Q?OfQ7YdyOngg17DIXDKv5lVq7F43UEmW4csgOqxt0OJqQXjWfGrPckTFYaTjL?=
 =?us-ascii?Q?ZCQfC1RY1mIdonelrn9SHPRaYidtvIhozZ+ZR78DnetdXL+9AxAhr3o4/UWW?=
 =?us-ascii?Q?tmBfGPcd0OW5wT/Q71nLksSmXAdKXOkKQ2tJ8l8NLk+7xb4BRcUahj1BjHoy?=
 =?us-ascii?Q?RwJkO759VqAPHk3IMoz1lFx06iCPat7e17TUedcx9rWUhmADxxjWC7Dm7D7Z?=
 =?us-ascii?Q?HHdxLhEdtUEu/VybuxZ4jKNU1ee4f5NQDnCjWBeEMRNYdNllqAoNO/9L5GYV?=
 =?us-ascii?Q?TmGvpA4iaf+QXwGDi7JjkerHv1wjqoCXbzXepTmrueZdSmSWK1HOgqXTyARD?=
 =?us-ascii?Q?IsyWOsmlaaGFAMBn6/VMkU6Qrb9syyPjjPOzec3dqV2RvAQIsi0SGx7fw3Ee?=
 =?us-ascii?Q?XNqEJu58GVuK0u/snhwGrIPsbEcjixG0VGmXraux60S3VTzif9rziLPWLkhC?=
 =?us-ascii?Q?wEZqe2HppQlhpGCF0wbhMj9jo453lzevosMEy8DAqq34yAPim9J33bQM4vFx?=
 =?us-ascii?Q?627klr6a7EGIZ6tnE/uV8qlOdJdUeGUXtz0NcBgQy0Vx8cIkXIP8uIrVRfZ2?=
 =?us-ascii?Q?MjjDgX1QCcB74uNAbyyUfh+vMRntvsDD0gHd31jehOCwbsECMZMoa8hOV/jQ?=
 =?us-ascii?Q?r+wp0biKTgOIhE5u2ta+RsKmEcQ6VhogkqHa3fdHCPruH/k9B2FZjGBj52pa?=
 =?us-ascii?Q?MEv3u99cuqopPNF+EkuW4val7cKxMoX+oD+NQyiqLBxxkpLULwYhIeTr0unb?=
 =?us-ascii?Q?ilEMAKhuN7iRsV2oYChwohRydQS2gL1PMgiWH4pCro7YLhjKPcTtcZ+Z41vF?=
 =?us-ascii?Q?mBwD7jqVFSbap0U2c62RziwQjR83Ku9veBqhvAUKrr5MJyTWjuVi53MvgXmH?=
 =?us-ascii?Q?jJuuG/waaPScYxbEUiMQegteBVQZx/cELyNWyJY1acD8T+kC9keChGPCC3Zf?=
 =?us-ascii?Q?dnZcvEb3TS89PGlITCtBFR3aAVUoWStnYg6tV3IKgy0mdCQL79WgDB+ov1az?=
 =?us-ascii?Q?7KhHd7G07lK2jgDUwR2MtoOT62nURJOliHOtQX5khs4Nqsm8PIp5bsd4D5+W?=
 =?us-ascii?Q?bvj8xO/RsXlaId7GWTKsxVIyDawBM01vDKYxDKTbwqYGf7zCELQNfpyqcurp?=
 =?us-ascii?Q?bzvHk1I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nIfdF1oM4ZC6F0BLM+Zx0onK2AWqsmOh3MetT4pra56tPpHQXFvsOkxBBcC?=
 =?us-ascii?Q?16NaAemTIOGEvLQEEQUmWd7ZQAQk88sKtPjGWCYVwqIcOpJUYvqAPzYH2Ata?=
 =?us-ascii?Q?2ubXPaSZn0jugezD1eyCxrwzwx0ueiDXZ73+/9bENxLfwI1p0W8k33lYr4UF?=
 =?us-ascii?Q?ba3wG3KJSwv9pgWy1T2NkB5OldWnB2Tkulx80igv6Dydf44bIFYymBJbhuuj?=
 =?us-ascii?Q?Bg7sEdM8T3VXhjDxWqVeU/hicsCwAI7kL01dI8hYHtfc5ZQCqiUHz82ZW+qU?=
 =?us-ascii?Q?iVmHtKyN2v6zi8BMlQBnf4a7H8EZcxtbIREy7CbUxu5DpluQEMpt1VHW4Ca1?=
 =?us-ascii?Q?JpuxauhcwBRCpyyWWfX7sr8+e3KYrf481ReqnOPwBxWJWlLiQ1pzEkDAJooo?=
 =?us-ascii?Q?0ajqQEJhaJNAmdmO//7IsxcmRlbTGwh8E2mtw10PWLCmNZTBjMFWT8R4NonY?=
 =?us-ascii?Q?P5qvxSRLTs7wZJctvSIw3qCjMK4SqeZJ4mYCJBmlCMY789SAZm5YzEEzg0U+?=
 =?us-ascii?Q?xHbZ1G7RbnpFn/pTVTYnps6QmYfM/LJPCV0PjxmIVHSk+Pc+JvPWybFFqkP+?=
 =?us-ascii?Q?ApLExzTG3/lZrd/dBCP4TtDWuF2R4zrdn905TxbPOXQuLN0QuaL1Nbr/K+OA?=
 =?us-ascii?Q?mrJxbZbKyWL1vvh7TPlnH9XnCXiVXs8yPEKk4zT+4zphPLW6ER47XMV5RHby?=
 =?us-ascii?Q?LkAscJGkpZvFj//AnpLCqoqTTvjTDXeVgs5MMmbHjnoh8OThOlq2NnhRad0p?=
 =?us-ascii?Q?TW4uhGh7A5xmccsMdeh4nLt/2OqiZ/UPoRSGH0u1Pkft+O2YiLP4+qcrsdbq?=
 =?us-ascii?Q?wInsBk2oEjOlYS/o6DZX7Emj6983H81YE6wKlDnRDpLSNT11cjWKwu8WP3fT?=
 =?us-ascii?Q?zlnao+dAxr4NRgEoWmKrchysZqPodRWTLIz0JWfDiouzH+SGjZeer80rcBbE?=
 =?us-ascii?Q?WRRBnvivjdqZ5Vye5OFK1c1N8UornFjref0jlrareaQneSSMew3DcxxLqKUE?=
 =?us-ascii?Q?n4kKtCgeGboezO/IAsISbrHzYfjrhJg8WL4/xcDX9l2T8RsZVmlhnumgZlC8?=
 =?us-ascii?Q?pI2EVvneGUw/BjHy402stP3a6kXnRNJCpfcRbaitut8U2okorHSGpSzH0Dyk?=
 =?us-ascii?Q?JJow9QG/DeuV5rfW986yVy/EsFE+Fg59hVrvJnU/r9AqibH4swK99MsTDIAJ?=
 =?us-ascii?Q?RV+lxA850ekbDkrOQPD4C1MJOQ7DkwN2ygf1Fcn3U/VKqRdh4nvW7/G6PV2/?=
 =?us-ascii?Q?IbpkWXDEuJ5HBqvZOL36zBlGguyBk3RYz+j1C/bIa5GgEmXaEdtNo/K9Zl5Y?=
 =?us-ascii?Q?77OOAxjOeNkc2oMymvA5VfhahGilWMkhsG8LlkAWFyrqWRivka8kw39k68sd?=
 =?us-ascii?Q?ZwWfACqGR0tNI5J2uoIdMQiwNc7W64mH6m7+w8NYX9eB0Um8Xp1lCEalKXD1?=
 =?us-ascii?Q?ccd2STOGGfrExsCiUvNlDHQlfq0A1EzY2vio0wVCGXDB4G6FrOfGljM0tvmW?=
 =?us-ascii?Q?AXXYb5kK4+yUpF9ry1Iuzz7ENSymftkWR7X1AMsvQW0ypsKtRUHXDs2zIhlN?=
 =?us-ascii?Q?xHW0IUi+fIOWi+EOwa1QSa5kRvz/0Zgrk09xTwvn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb1bb5e-af6c-4375-50f4-08dcf19c270b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:46:55.6994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmV0ib0lyiknYjwoHV0B5QGJF1mP/Upr2/OfhlddJ1nCAad8s4tjBAq3BgN/a4O+NsPP7hHk4sFELmscz7i1JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7374
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

This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
documents dual-link LVDS display common properties.  Reference the ports
property defined in lvds-dual-ports.yaml to save lines.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* New patch.  (Dmitry)

 .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 10ed4b57232b..e80fc7006984 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -22,6 +22,7 @@ description: |
   If the panel is more advanced a dedicated binding file is required.
 
 allOf:
+  - $ref: /schemas/display/lvds-dual-ports.yaml#
   - $ref: panel-common.yaml#
 
 properties:
@@ -55,28 +56,10 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The first sink port.
-
-        properties:
-          dual-lvds-odd-pixels:
-            type: boolean
-            description: The first sink port for odd pixels.
-
         required:
           - dual-lvds-odd-pixels
 
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The second sink port.
-
-        properties:
-          dual-lvds-even-pixels:
-            type: boolean
-            description: The second sink port for even pixels.
-
         required:
           - dual-lvds-even-pixels
 
@@ -88,7 +71,6 @@ unevaluatedProperties: false
 
 required:
   - compatible
-  - ports
   - power-supply
 
 examples:
-- 
2.34.1

