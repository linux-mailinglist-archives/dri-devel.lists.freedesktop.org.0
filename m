Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320FF92F7EB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F16710EC83;
	Fri, 12 Jul 2024 09:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KGrLuyjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013014.outbound.protection.outlook.com [52.101.67.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C1B10EC83
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:25:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWFTo7/SUri8pHBDL5u6NcdWaHTjj3yZmPNTnzL9jttlRXJyNFxs1vi8qd7l2qEX3M1uiFeum1fwv3vYPJlxnz2PeQ0InVQFHvKjeQ+TQKmpbBwc4loZhk8O0biEgoD+AX5be4C6kpN5tLHyb4x/Z8fC1F1HzRUEJ546N8rIqtqPieBYvJ2VRR/XwH4yG/EXeFXkrc1MiZuf4VWbJxFZXQxewDckQFaFUO1RgTVa0otQSq1hv9WgksFQ0SMjlLHFoeqPiZ+CT4bbdMgbDxtmA26CWeMyIxUaZWzGIwj7Tg3cQ59KQXckLHYhi7dvzm21i/2fAqgo7SJt9/E/7kSsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsoR27EhRa5ewkvw0yxDrD5VodoM8LHWAQwUfmEwT3g=;
 b=u9gdjuEMlEaHWnkaIN9dTWrRAZtCKypO7cH7d6dqJbA5SfWHyeX57X9s/ffq4xzRlgaGrSupbIUoBWRFPSTEnRUyetfAfgy7oJhRM/RxRTbtCG7SuZlnETpG/qfNjqaSOnZr1B03i+s6OcYOcA2sXbR12wPEB7OYORNnnl0LV1VjPvOIbXLKAIcFMipRCMlFid1z8dPw6fSsnD/WY0nvJJ7gLRp6VtH0LeCGifQ3SPKlVsos2fhiVWsOIx+I9zyxRWvYWJe6GYAUmbV59grZ8+fx1uOuUVUA9bPva21TSAm37nXBKhSBt2i7NLrX154L8QjBXdY4Bi7b+ozzkemXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsoR27EhRa5ewkvw0yxDrD5VodoM8LHWAQwUfmEwT3g=;
 b=KGrLuyjvjJsJ6KvJuUTBwrK3lXcqjKgVC6qtlyiIKmNaYrD0p4E1DbbDek0ZRxcFveNjD0qhfgjPmQDloi0uXYQLb3OTcZrdhUIU2xXQuz0/Gm8vS/xisVhUuxodvQgUpZb5RXBaOtuFBE/Ikh6Q/xpeqQZjywvcUGd/I83KO9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:25:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:25:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [DO NOT MERGE PATCH v2 11/16] dt-bindings: phy: mixel,
 mipi-dsi-phy: Allow assigned-clock* properties
Date: Fri, 12 Jul 2024 17:32:38 +0800
Message-Id: <20240712093243.2108456-12-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 8190bacc-1a97-400b-bf98-08dca254a1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tDfoTL3lu8IgOxnU6v8CSDZ1278s5s8VTKfVMNZQKJwKc7igUnUDrcJEWDg7?=
 =?us-ascii?Q?7DA6hT0UsVTCzVD3jXW6dFEcLE5/Twu0niUcw64KiPV+YZ5gsmhOmXrZaswm?=
 =?us-ascii?Q?k1VA7oBR03f6i9REQxOou7FBMnRRANFsHNwGKYXqcgnUpZE79mS2BOuxrVgZ?=
 =?us-ascii?Q?OFL2Z8Gm8daWB7s8+ddbks7dw4aoPZpnyVwSu7nYQIbnuiExBu91uMuH7Qo8?=
 =?us-ascii?Q?BDx+X1J4IcuvOEi36t2QVN83iKv0f9h9KeZ2QOC6vgVxW1CdFggX/664x9no?=
 =?us-ascii?Q?JA2oyRADNa//4wddviOVolJFZ9HdWi9Cd7+TIsG/VCY5sfArACND3f0T5X9w?=
 =?us-ascii?Q?KBeto9ZhrIvLEv4SJZQNwEth+AFx0gqr0N9CtAKmiEXaYO9HwIuGh6nux5Gm?=
 =?us-ascii?Q?Dmd9N08eBjsFKTlUMoqirwrTys3z8gXhY9HjS26eE6XF5bxJclVGgyFIAtki?=
 =?us-ascii?Q?Cqeoir0hnxlCiHaAnBypquxTBj+IABreUUaIl1soImAS5H4Ve6aMlzCYrtMx?=
 =?us-ascii?Q?EZAKuGxlL+IVEcK/6/V19WaQdna0bhQ+kXFXIdG8IqrcRkQptE1uaY+4h8Uf?=
 =?us-ascii?Q?fW9moehIUVHbbBlANlTfx7KHo7t+dHQkWobolpTRQ8apNOT1pM0NoJIzmMLg?=
 =?us-ascii?Q?q9qBvrodE30aH6ZQ3Yxxn/NmbSKI+/Wxa9f28BHpO2uPD7qhqbjvlljOOxaG?=
 =?us-ascii?Q?FebgpH5+dI5wfsJQek9hypx4DEUckXmFhJUX1xjJVIWsNGKOlNkNLIAm57IX?=
 =?us-ascii?Q?wxLjYDVlh4Boc/8iXViWB5+8EEmAY0wzf8XFu4eGhyAohLtEXPa7UpAJHN8N?=
 =?us-ascii?Q?SaQOnhyvWznILKgtOvTvIjAUkRGh+f4ThmUSWFDZ0P8/lAV67tTmMjd3QiJ3?=
 =?us-ascii?Q?Fbenv+Btw2CdcqsIVdciSLhjEnFYaWi1Vq3lWfvUN5/kQO/+j2qA65nB1nKz?=
 =?us-ascii?Q?ppBs0o/oOAXj0wRUtpCux0HAzfmvYC9m/dp+akY/ow40ycNw9RaVLqDpFtu7?=
 =?us-ascii?Q?m3/bCRoTxkfcdE1BomxfO0hENIYTlD5lJE0GKWZrPBIxggkRkoVCkN1L8y/6?=
 =?us-ascii?Q?mX+p05Rfyg+/SrIMx/HAW5Vq2dfbQYaS/1fUr0oxg0Mhj346K3ZFBslNKYp1?=
 =?us-ascii?Q?xbJE6usJZZjDKzOKnbV5muocOgly1GTXbdgKnqUtOg+MrxQmoiWKsGc+Bvhm?=
 =?us-ascii?Q?wctRRfTuUeVEM9qShI2VOW9MPSC6ck9Xmr7dRvVYT4tyKd3LK+JaUnEYrV80?=
 =?us-ascii?Q?WYIRWiZ9Ivzk3qQsPdKCHPFCgCbVhgzC7c1j9d9VEqCm9lxkAM6kkTbQ3zMV?=
 =?us-ascii?Q?oJJoYhRcifXIk9PumXetSoTqOzVIB7Nv9Slnk/9avw92rhDbXLY3Px/25QDr?=
 =?us-ascii?Q?dwLMSa6bJeER9CEKReIxL4QrHrYwE6hCfe15y8CrdMI4LMjRHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3r0PmHzy2kTToMQUIK8gKblvsxySfq67jsLnyh3WTQxeOTVx22WPoDkDDJCN?=
 =?us-ascii?Q?cOBTSIT1tJdu/LEu1JECEvjEL/qJwIEmRZlIKLuTgaGT/fRxKp9JPJj4heep?=
 =?us-ascii?Q?VM+zOPKWMpAjBQZjmX0Wh9uf1Oon8cK/pzp6m7TR6nYVOvlyTIXVfvgJIGnT?=
 =?us-ascii?Q?GXrRKhh+nBKhY1uGODaV4RikwgXijpRzLyXjMttr+JuBrCoUwqrRs7g5mRPV?=
 =?us-ascii?Q?pbQlny4SSbEjO/37VzQZg3b3xFHswMPxU9tjlzC3tuFuK7M0GpBrRczBRXLi?=
 =?us-ascii?Q?WrNEi6qNyhsDrW+XWpbMVaTrfzq97htbrtKFw/7QdgUBpsUP5o0J2I8IJYRY?=
 =?us-ascii?Q?IBKGqOEbroSmXdsPw0MXPu8WUH5JZj89/ITpK/Tu9VJnB4qa8GH+tpUmM2zj?=
 =?us-ascii?Q?9C03QnE/85gP24PsHIQLEURXiyR+LL7Z2v1Euw1+hI1x0eVI7QcWcuL1rM9G?=
 =?us-ascii?Q?CHk0D4EIIICEJWwHzRMBcEpWSOPhSO4gO5h3OeXUnve7wOZ3xKxtF2RQhbuS?=
 =?us-ascii?Q?BztpZA2gaHA1xxkqzjyFmEy5IZMPnaVj+91A4PazMz8rulj0EqzWYunWbniT?=
 =?us-ascii?Q?WQhvQpsfEMXIBD68FkRM6KSejY4vM1XekKy3nNrlLpLAQ/n1Dvsiuh35R0XP?=
 =?us-ascii?Q?TlYqrhbr5AIgV1GVjm3wF2n8WW9sICUKcQoI0m/wIs/YvdMJm3rWDtZ6qdpP?=
 =?us-ascii?Q?brFqfjQuqg4N03c2XGmohBnbMgymO0S1GC5FuBMJDkHxUa9oji8p0bC0bFu3?=
 =?us-ascii?Q?gAeQgJ7pHc66NWegpKM1aShQf7456Yti8NaeiZk5sEk6vLzVRKopeWPBGKGu?=
 =?us-ascii?Q?cwWAuRdqOFGLvSdQ8d/QSrq8hd6Q7EPuJenNXAmZ5auLHjCBQFsIjRImFG9r?=
 =?us-ascii?Q?OVN/1YDHR8/xUBSPHWxiARgMUoREFo0+QA5nt30UqjIA9ssxwsJAZ15cJIeo?=
 =?us-ascii?Q?nnjShTQJIlXSWLGw9PjWDGB8N8y+vFneqPub2aGNJBl+UjT5oqKcGkX82vBT?=
 =?us-ascii?Q?NT73qPqctsPjw/PaO+8ZmQMU4TWcz06G/L1+qm/9wB+QgzBTQrp+HQ4pArwJ?=
 =?us-ascii?Q?+e7zUUrdPsy/Jrik5uPj5JJsVhwjY2aby4eWTIAho0JtvZR63Mqz7xih5Wgb?=
 =?us-ascii?Q?s2ZJHtMB8ADpBli+UjXmvX7PTshEJLh0U6TsqTH5oAgMcqElxKO5im/ZEUaz?=
 =?us-ascii?Q?kPWz5YFC3ym6AWjUMhtLWUH6Gc2E1sei+sv57twqoHk9yDtaBPJNO3yMq44w?=
 =?us-ascii?Q?1nCJknV6YHdXBFWyhNEyaQUxmj+jFWU4zDZIbsFV+UoKOZPSLa4y2iEEpDU9?=
 =?us-ascii?Q?ecZi3Wli1yTiB5/WLy6LDeS9zYz06D1NU927HEAQZz/NdQiB4Se0y8D4lFOR?=
 =?us-ascii?Q?Z3MfONHA6EOwhpbH5lvU+GvFvhGwXkX1JYI78s+DawZoKCzAid0lZYCuGms4?=
 =?us-ascii?Q?BNGsBTByuikVbDXrRZEMXiE8HbRkI6o7wmsOAzS89DJHvTwzBmsgv6ogE+oF?=
 =?us-ascii?Q?gBMmIO0FId9FMt+nXF9ZcBHpuAfALu6fyLuPAdFmCRCnYwVCGo9Q6naNVZhC?=
 =?us-ascii?Q?1L16FR2xQsljWz7ObRe5T3NmR8bWY8JXcXJSBGf8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8190bacc-1a97-400b-bf98-08dca254a1ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:25:55.8281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxKxg5xP/cKl4JAMrE664mdo8U1PZu13TC9qKvMWYWZcW9iQ1JwAANx3SZfStTkL3WLlg6nAzF2YYf7kdpmNxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242
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

assigned-clock* properties can be used by default now, so allow them.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* New patch as needed by MIPI/LVDS subsystems device tree.

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml          | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
index 3c28ec50f097..286a4fcc977d 100644
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -72,11 +72,6 @@ allOf:
           contains:
             const: fsl,imx8qxp-mipi-dphy
     then:
-      properties:
-        assigned-clocks: false
-        assigned-clock-parents: false
-        assigned-clock-rates: false
-
       required:
         - fsl,syscon
 
-- 
2.34.1

