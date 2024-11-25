Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2989D8268
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E0310E5EA;
	Mon, 25 Nov 2024 09:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jzhJUzK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF21010E5EC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+cOnpoCS8LypjMoAEkRN/k6pnED0yjFkTXbHLqAsUn1flSU+ITxgNX5pXY3UeWKXkHEQDlvOJ5Vg7xalBk1M+2jQA5FCgogFtXIWFHEjWMXm+GQH2q5THBM0VUZhfQdFNJd9RSveSuPxe9XrDGp/qDOXa+6k4vPJ4k1RcGeWyYKqJZsRfKGlWVX47j2VvMc4xGSOwiweu9aL5Oo3TCISbGNzO/5C59x1pIMa3ikFjOoEP2iTE8a4R7HDcHhCO1/WpquMBV21wV0n/wGYNCnnI4thS4BlkPQSG9oIdnj88CqsZM+AXgjj9iD9mUUIhpKBzMU36h2GUmE964giPVPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfjosmjOElM5vcLf8zbCCH2Ii7SeSSEo7yq4Tfpx1h4=;
 b=QiaQ1PttjAhyWDW9/Bp/Lr7IkyxigOwvGUrM5thukk3Cef+BUbJlRTV63aXqZR3SJ/Y0xPWRuNERLzy4UJEyJbXBoWHnqNXoOTTxkhTO2GWctknHe8MRyRrtiJltiZjSM9DWda/mib2z6XABRYPDG0olRad85AtXJXHg0nJP1Ce8AbiIaeCSeyX1m3qhqG1amGRh70thRqETXds5Pd4sJU39lGwOwZzlPLxCDklb5H6NtNiEn66k8YuXHae+FMv4hr9i+rcwjunqzS1wJSSU/o62YvcyMKfffMjQIg20AqV6r7crk9RzGXIE3n3AmXBVQuXEm3ROqqAhr1GxGrr91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfjosmjOElM5vcLf8zbCCH2Ii7SeSSEo7yq4Tfpx1h4=;
 b=jzhJUzK3EXdUgux/fzg706R1m04cUm25kG0ytSzQSEkR/ip3zf92pOr8NIQrJQIZDB5FqHnmNs/fvXehlKx/LzkmowXKoirz4VY/KTeOJsSc+XRGVgm8oN+/Lgmw9pDr95w3eqPlgVPlH1h9DrehDrG8vo/p9A+QdmdrAMIS7lQNRnxS4Ekbtanh/wChXKUDqLNDPm3pTytMa/AKcROWTP00sJ6S7gsHh8Bwm9f079LNlw2WYoSFECRvFtQmbG/gdc3x1TBWp1azMpuQlqsndPmeUfW+oEHh/YGnTGHY4tp6rM62pJqGRj9qpOyvh4Md4L5nSedX/s14OlAwvppxwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7919.eurprd04.prod.outlook.com (2603:10a6:102:c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 09:34:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:34:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v4 14/19] dt-bindings: phy: mixel,
 mipi-dsi-phy: Allow assigned-clock* properties
Date: Mon, 25 Nov 2024 17:33:11 +0800
Message-Id: <20241125093316.2357162-15-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 063e7c78-9a6c-49b5-cfc0-08dd0d346873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8/Mq2w7DObgPvafs6xtH3nvT0siwJzffztlSGqk1tWZ1iWaGWtbzGyDP0bvy?=
 =?us-ascii?Q?0rzx8xGPps+qwQeushn/1TMJvlGe3AzZ7hqXC6PEkty9adG1eccepufXYNq3?=
 =?us-ascii?Q?v57HJtvPVhNLnzcI9v2PlhRV6bf0aUJbrn4nCO1p1HxvgkuehE8MfRxv8Tsx?=
 =?us-ascii?Q?yIPt9ikKqDPsdd6tGRClRhaUA0UpCDTUn49iaozT9oyGwKpMxRxKyoY9C1QU?=
 =?us-ascii?Q?D8zcl+mQkISiaEq3lyCjQrKHY4XtKSjSm5GhoG6fj7tJrr6IV9cq2+HrF92w?=
 =?us-ascii?Q?QGruJNVIYM2PqB3jaT726UqfBOjD1Mq1sDqExA5CVAf0xtxRfZ27qUIpDHgE?=
 =?us-ascii?Q?L+50mv7SDNctdKR/xbtQsbJUbdZOONg7kBinb3Wcxpdg4fEPZa6ezrywGbS4?=
 =?us-ascii?Q?OWfr8zaWi59Xil55h0sPFxha/pJBuJ1qmis4N9csxnFPWH4ZNqlq4wTLHomL?=
 =?us-ascii?Q?bf1AyKVuOp0wj6yKLgs1P0Te8an2XHVuxWkCBhZPadasgoiqUZN/U3jNELEr?=
 =?us-ascii?Q?z5hGRaSJ5V8++dAYASLtr7XEP/dl4A/ZwOI4v2RNoRNmMDoM2++g7k8JCER9?=
 =?us-ascii?Q?kh3/mHrAiKGs+eX26ix9FBTF0dfSpx9oE90w6hLjunp0wvuCceOXwYSeXDRV?=
 =?us-ascii?Q?iZltNygqs9vow2IAV/B3RqwvS0/IXaS20CY/doWGSKtplulJlN73+m1vaEe/?=
 =?us-ascii?Q?DvoQ7J54MPcNx94KvQisaOln7VKDWIAmQ6MZDZsX09kvpBT68RxDRtxsb09w?=
 =?us-ascii?Q?b+hWN0P02krdecF1jcFvpnkRWvKaUz34uxIv1Y7umEedPo4WfxwaXHUtm3AS?=
 =?us-ascii?Q?zebZnyszG8FK6W4bCCOEHUgq9maDIrkNbtWyq14P/E4Spt/TLjmjrWxpeMNi?=
 =?us-ascii?Q?xr6ogyZmZlsd0TAYF46bn+OKo9m8f7CXA5MNY4xar/MqMiY13E7hJnVPN0mm?=
 =?us-ascii?Q?/br4lR3JkTybNYVxjcBTzeolzI6mr4ZOCSYIRc7HmSpNWIoaVpszHfTUtCr4?=
 =?us-ascii?Q?iywQlPsnaef4NsjzSo/KKOwc1CwFPUinwccIQrocGmuWq6VMFtJx5gmKrHhW?=
 =?us-ascii?Q?u4SK+YfWk2Cu06GIhX6TPAEdnIKyKK1A+Bjbt3ngoLQQCAnYO7kt3L5wmaNr?=
 =?us-ascii?Q?5goFturegAVwS4a6jt1A+x7kWZ+3AVmW0Gu5a2WIkcRNxxO5k8hTsdfcznhD?=
 =?us-ascii?Q?hRkSSLyVQGetolB5VwIECGEd8k/2R2gBKZwnTf9wPkQOUkal5s1Ao7S0M3U/?=
 =?us-ascii?Q?LMlqfAVby9CCsdgvlsdm97ya8LBTGEnqTLnQmGids1JI/zSxyqblucG93aum?=
 =?us-ascii?Q?6RpxmhTuojYqlt2i60WaupT9AGJ1hPktHhDjAvmu+9fHtLzyj9a5/PGgjoWf?=
 =?us-ascii?Q?xRF0qW0q6DCMMWti9hF60Uheef/66JSeGayOvZFp4LqK1DntSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9FE+850snuz4y/plmTJMRBQooEeT1T9sUIPyYMNXhT0Kr43pec95eI+0XE3O?=
 =?us-ascii?Q?xru2zPmIEq/DwGdpDlOIzuxydspKERCpN/9Qc7VeeFu0FRP9Vhp/TM0mHc+P?=
 =?us-ascii?Q?z8IAneGwGOpYt+C2+/YFpeJMvaGN+VgZkCwA/TE+mTI7kBZI4FNsM9ps5ONr?=
 =?us-ascii?Q?Fwyb+BoRZbA8Lrxp1xeCLErBI0eWYVsjReh7kJ/qtis72cT2Y4eXFqG+fC25?=
 =?us-ascii?Q?zmjjUz1wKMvudMprzzN/so/VKwbKUw1CYX0aN6TKJUlwJ0u3KRR7sFQaKL1W?=
 =?us-ascii?Q?hcKrzp4tDQhu44EpBeMJ1G9s+h4Az3zZVmhxPlCUuN4Hz/PbaL8CWWpC/RWo?=
 =?us-ascii?Q?6sEfR7bNK5ILmyGtiyn6GWKVONu0S0emCMgDfz5sAETiaBWPg8XHfUeyuI05?=
 =?us-ascii?Q?mnWPAv2WUdfm1Za3zueX1U3Se/QhTAIWtytOQszyeMvhJDUZRLiZCnRE7sKC?=
 =?us-ascii?Q?K0GsRGsOesnA9zlHbyX0ZVGLBEhAsuUK+6ckjmFLzeI5Ay2sW2h2t7Lqbrut?=
 =?us-ascii?Q?7/Sd0iP1u2aas5ZburnwnI8PEiDAVhhRCRYTcDEMGqk/N1/vHuSVGKsA5RgP?=
 =?us-ascii?Q?v98lf13EzEnhnrs0g8Bnfs9B6il9r1X4IqPasEGztHasF/u6+hLVsYl05Jc6?=
 =?us-ascii?Q?xStVBXK0thALdF6emHG4ap8fTsZNp+hhEKY4CmQbUj3zKLq3mo7CnaCa1X0o?=
 =?us-ascii?Q?M1BtakdjrO52YXSGPFLNAk6Ar9miDLnOescBX/9vkzQCwbZxS+JFK6G/KO5b?=
 =?us-ascii?Q?RO6glyU40O5SQzOcUGA+w1If1bcSg2BkE/mOn9HInUY1VABx10JgFZovxlKp?=
 =?us-ascii?Q?ZtQ4MY1G4jEwLNL4o9zS5O0wiSz/SyNbrhMUZ8EW/lADMPAALHsKu88HcmgE?=
 =?us-ascii?Q?mXPbHao+DlsaxMkaR7Fj5VhYRaKhqija9qu+HCTCpNNiiMLO4v/Nck69gS3w?=
 =?us-ascii?Q?hT8Hk1Fn3ADw6+PRd8sgQzQDaTafdzZseq4/bbIMvBpbed/V8Z2bM9kA60q0?=
 =?us-ascii?Q?m6mX+eOAs+1SLgWacA2sMdrPkLpvBwBM1GjKcZOFVWI06D46jYl9wSgsSHYE?=
 =?us-ascii?Q?B6Lb8bVDiZ5sZ+xdDkXHBaFlGgOtMHAhsZ9n/J5O9ajdMRTvVUWqQ98ZwVaZ?=
 =?us-ascii?Q?/oZZv8CeYV7R44Rmogl9zw+OfxkFVfFpOYaQCBlRDEOQVG7nUaF0TfP8eTx5?=
 =?us-ascii?Q?dO0cHFPgcLvhoEPFJ/U+xBxWeaCuNLuVkew8ttF/0h5bhWW/eDhstuol/3hz?=
 =?us-ascii?Q?LsPqTWZoKzJeVo07z2v9xYw91WGjcdunl9ZSjpni1RLG+pbJTsO5T9a6NqUu?=
 =?us-ascii?Q?fmd697gQsBvXih5Z2W2GtQdwi9S58AU1jVaN0XcYbrG4j9AtZJR3lUqudxfz?=
 =?us-ascii?Q?ktgFiWmU1ITmgC8y1elGv/Sih+cK2iDVfPUuJAbI2Gs3WXNCk6UT6vsZgkKX?=
 =?us-ascii?Q?ytG/Gjxj9h3juo080TH+qKhaQ5e33doEZ63/zgXlku4He4SeyHYPTLpaQ7OU?=
 =?us-ascii?Q?7vFYJmrZh0vGhSr5pNddb3ryl7sRffaYTHlDXAQVDgLFoNY3dOw8bjii7/R2?=
 =?us-ascii?Q?uM3wx3VkBYZPMHzJBOpW+XOqB+sppDjPfnshSTqe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063e7c78-9a6c-49b5-cfc0-08dd0d346873
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:34:50.1793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ku+0zKh/9Klx5qb5dtNDNeIpKQtj5O49sYxTKZtJVW2YTdcjXI7zWP2pUVHXV6rmviQ0vipGMi+h1VguWeG9CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7919
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
v4:
* No change.

v3:
* No change.

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

