Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E19C8379
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 07:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2253610E7A5;
	Thu, 14 Nov 2024 06:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="S7VeXms2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2080.outbound.protection.outlook.com [40.107.104.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E4010E7A5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 06:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nbbse1Vf1IcdA1RUCPdw9OJUQvmIvEY1Y33XSQv5C2YmcN2LEmUlxNcVR8fzATQlk9EfPRQ4gs/V65s/QpqmfdS8kzCVkBBmYxa1fGkLxqkqnV8oYR6VFMeo309MZCYq4FikoEYnDJQy9vQcPafnaiFzxJETVNXhpsubmGiRyE/88E0w5leZqZjhvD+0kbdmCIhD/4Gv/RG1X3O6/CbDDkQtEbqzaMj3oWGvuZL0dbn6+9KgDN83gmYWrWffGLpSJYt7A46oonAsr5v9V+2Lur4cWtL89zGPzeXcdM4XD3pPWrLNWcNK6uiq22sTWRymVCZ/+h2vTvzcm86sd+h/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh2mPtEwOgrZGXRnEgtKxUVGiAWQLjMQ1OzcFne4f8Q=;
 b=xqYFqZalddFTrjL8J1awNiK6iO/ZSVV/XYMcACZhwqQIj+qWNmFjpJHX/iRL1J3HpaVbbrvqpLaBK3vS5vcbaX2PSLN2VbWaCEpV9roj7U2vQH4dhkLcJdlgHdG/BESEwrh97A0y5SLPMt6GJns1Qs+9s4JZ2tBYpThr8anjExzXUngfhEeFbFBsWB3k6pGhNRFDbWl7OHIEVAzLMrefye2BZtvOvbWp7C8FOO/xcuZZThanpQotDWXp9kmy3Ebx1nIOMowWV7dLxcOnoC5k4jl3+nK6xMT42z/A1tmRo/UK/Wid8Pb4OWhF4DKZSzUCBytVb1B2uz8/5WL1e++2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh2mPtEwOgrZGXRnEgtKxUVGiAWQLjMQ1OzcFne4f8Q=;
 b=S7VeXms2FFMDrnw6qJqdt18utE+rsDvOx3504++HHYJNH7390Ac9taiGaZ/8qvpVzNuu5D5wj66izmDzJmkztUkbi01F0TKb/RPQ8lq3e5ZtmaYG4uxvj9J5BETfMZp+g2cQbzvun9rI/wNVrH6wwHIBcNAMWTBVc/DXE3rXqeFkO9hBDc+/Ei07Vg3BTKJJ1WFCdLipnaqHO90xW0129UVkJtAxe4+dllDm1Dqckmdx2XDaDE88UaKqkWMty1jC8m30SMlGJ/R9rrZbD+0cwjFeGKCF1HQ112DBDJrv92VkUXKU/Sp4fb/eWtsGZ0PVD10hB8oh/YW1l8+Kf6LSNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA2PR04MB10278.eurprd04.prod.outlook.com (2603:10a6:102:408::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:58:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:58:56 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v7 6/7] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter
 cards
Date: Thu, 14 Nov 2024 14:57:58 +0800
Message-Id: <20241114065759.3341908-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114065759.3341908-1-victor.liu@nxp.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA2PR04MB10278:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ab1ab6-7e25-4349-f767-08dd0479ce52
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r3vOW70kZcI/KwViHK5ljKobJJg4EFmGbYv9dB+pvmtrkjC8NeoB1WqWxYON?=
 =?us-ascii?Q?HjrsAytsEZ1QtLutetfhQSXIe9judb6qRvp9PnPfu7KPpdnaR7SvRSGNKp6z?=
 =?us-ascii?Q?MLcfYVY8d0semrvkQhbKbnEYlW0pPua9Pk9aXrbPNzZmJp2xOZAi2gowoZWq?=
 =?us-ascii?Q?jb/iqU1dHCMfu9D4Ab8LD4kH7h21jEIqV0qg5eHLEtWNA0FOnUr+578a/wjd?=
 =?us-ascii?Q?F6AXxgXd25jzvmT0GTwWSa5MH3cT7XZ9XnXXWBxG3+Ce84QsHQ3r+kLrLgYX?=
 =?us-ascii?Q?liMNHl/IQ/Qf7Zo+bqxucN4CZ96VbkvI/QiDLgmz3QGa6gbDLJ9sRwSSHKwH?=
 =?us-ascii?Q?1+2lfLVjYYz1/yL39pemAKcBiVfDIuTDfgVDeNhiDwY0H+sFRk0V84f//SZc?=
 =?us-ascii?Q?3whDjcgTzpWDE9aCrRDiC4ljyHfumR3ovdelU33O/XTg7+YWibqguKMTPBdt?=
 =?us-ascii?Q?Lxyy6az3qmpm6512L4T/iVxKegvdtxd6DK1ISwsJbeh6zSyCJWJRhxF5/yUp?=
 =?us-ascii?Q?GcQjRg+vbuKaPQX+JT5LzV/mPjOP9GU0hPn+S3HaqCzSF3ZNHfzd2wEaPpCT?=
 =?us-ascii?Q?I2m3rK/d9LciE/7MEwpRjEa2+sm8Tifl7MqXTmyuHqa3aVh5r19TzMxkUNlB?=
 =?us-ascii?Q?Va1IP/GSSWxa4m8AX7+cbbAYXEqiEZU/EV9UPHWpZqObxOcuhJjL+1ve0D/A?=
 =?us-ascii?Q?/C8TVYhn08g+iIEJGXK8uDvkcmbmZpKJK2yUrCIxrE3D4Ox5gMPHPgkh84FH?=
 =?us-ascii?Q?eOUaLH+7c0XPFnZSI4qjs2Asrbh3rxPUr9VkpalQgPI4GRMfwtD388CY/KxR?=
 =?us-ascii?Q?M6o1zCyhwUKlKqkg3o4nBqE344uFvoVBHt5Vf8RvHc6tMVVff92TC0rWGoAq?=
 =?us-ascii?Q?5kTGlulcfCEaC6KoDwBgNWW43so2M9exKAfMUQ+tEz4Fg+3TcmO7Thn1oTkr?=
 =?us-ascii?Q?XieOWii3EpLyJg8hxgUA5iFixLcmgA0Er/Nl38/gSNgo+RpZUkosai+9GWaE?=
 =?us-ascii?Q?PQxRkRAhJpbUiP0PY4Wji55LtPHiJXt+OQkj0hRSgt0RKdjPGUf6yw+4MpB+?=
 =?us-ascii?Q?e5TTWDCcSATHt7eBFQZJ+GSuhPPzibbB2isTNF2FT8vIHpf/vl6Ojb1t0uC4?=
 =?us-ascii?Q?pXvMH+mqIdEDJkIv123ihJpU8XXuuEvLuV3D29LoVgQq7dteW6WCgZOVOkp3?=
 =?us-ascii?Q?5VA01M5URszN7JsoQcIwFJgnHAPGZlY8ii44C8LyLKmDqcfiouAdYrPzXIxa?=
 =?us-ascii?Q?GFKy5iESlyLuI+gVylE5wRad3GyclG6lBfJLys8FDZZsRN97xu92GrcpADye?=
 =?us-ascii?Q?OBAgbhpq9r30rG1ZcSeh8zh7qRJu/RH5m3IKy7YKIl3asmJCfVQ3OXQZ0IuY?=
 =?us-ascii?Q?OKic74Clptkk4SW0bCBQ7C0eDDsf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MgkYIXGuaUU6mqgE+11xmYr/6BeHHNBlJUPx+iLk9NHXTgPfmQKjx0gEkZrT?=
 =?us-ascii?Q?I+9qyKoVKbTjCezpzujh7KtaJyxMqUoXfgDnK5Dd2XSqdWiN+FSCl3b7jCNc?=
 =?us-ascii?Q?VisxX4zSqTIKy7Cz5qS09omU78J0ps7VROe4xbtkpQ2T/eV2jOdtlrNbrFuT?=
 =?us-ascii?Q?oclErx1ej1SnJl7E/fPGQBcKvVgndvHTDS1qFMgbBLN4I4pLJQybqRu8DPiF?=
 =?us-ascii?Q?zPL+hlcCnubf45qvdn7yY5R2KOqdc6djNpmwGTaoJuYv7mSTt4rob7PdhClQ?=
 =?us-ascii?Q?M7sL7RM93C/fkZNjZrEAxFqryynJl1PLyctEtVs0n1+pU68xfXPNPip+GZcJ?=
 =?us-ascii?Q?5dBVguzyal90hbA2S+QGi2MZocHNEG652vEbVu5m54wApVR0SRcUrsr7hGwZ?=
 =?us-ascii?Q?GKExemeiB6NU5Kv1G5nFnxz/eOVecdkrofkZEAmzI1aPQ7AUC2jEz6uUB1oX?=
 =?us-ascii?Q?RPH1pbYiu6HTVclvDDBurb+4IdInK4qOpj8PUAg47Lq2nS9HeMxENb3vmlVj?=
 =?us-ascii?Q?dFUOpTMt4ZLtMRofWZ/b/FaJtEpgaM0W2UaBYjbp0lFapoEPr7M8Ha2rjbZn?=
 =?us-ascii?Q?Oo9m+d6Bqhvo1x/Ql/KELElg6iMCguPdKbymavFjXNqV2uGZt31+U8MLNfso?=
 =?us-ascii?Q?SMUnZfL5bVSYuvL4O+62uXTA9eqUprH7LDYbqXJUrhD6/OpLgAxVRyJxg6pU?=
 =?us-ascii?Q?qleiclbtEY7yKcfKmuFr/lqmXNaJUV3PmhmzcasF2fQm1xKQE8Tg3/pkta5Z?=
 =?us-ascii?Q?0Ye3mDegYXNBQpdGswoS1rP0He3tqw1GZXpytBIxNsz18FAzUn1rI88Ze7mc?=
 =?us-ascii?Q?z2zEZu3u22Bk/ThamxTJsbpL4Ovp5+Jb0iOa3R+ya86q1yaQW/dBMQSLWhfH?=
 =?us-ascii?Q?vLzQFKVFiIKny0aD/gEgpZRE8hviwoeC1ivdxP9Exvsb7YCJ19JW84DLx9RX?=
 =?us-ascii?Q?5aT97LYv8ntDZaR93X3T5waApj9a+lOYacDBpaUQ1n5uTQpfLl9r0sQ3rRgd?=
 =?us-ascii?Q?eH8bBg9rhVf0TO5p7vgwkDwR2QEbcymI0aIhZGAWuNo+uUQUF5AqOlDO1PnC?=
 =?us-ascii?Q?41qIk96Gl7Eq89zfcAg3sFhzKKIvKyleVhWzKZcUGt98r/FIz4LdDHm63LMy?=
 =?us-ascii?Q?Qxann4Efc06jVTtJsak/x8gdq52qN9eFDQByfh/81tZvfdWo8Fq+0OLXYSdY?=
 =?us-ascii?Q?eEJYuW6qWekApOvD+4R3cdHiefxDrNPFk94YVYd8D9KOYkuzjFrugt9kuD5l?=
 =?us-ascii?Q?DDGRFTCFEsNhcwNyJ4bBrwpWbQciVG5IW/EFAIfClbVpWz1MDQdSvAGH2BIv?=
 =?us-ascii?Q?a2B5biBhqEoQzQXIE+3rgc5Mw1JPRzAzyxzbY9OhU6KTsz+2xNupWPbttzNp?=
 =?us-ascii?Q?3t0ST46dd4u/U+EoFGuzXRwiK+vaFxyfXWppvzFkktYxSY011Zr0uiHhL1le?=
 =?us-ascii?Q?lwY0YaN1R20s3cKa7ZazkFzLY5Z7wbaFjSdrCndM2WxRkgxI3l365nRwm+4j?=
 =?us-ascii?Q?znwBDcz+u0r26MULVnaHRryHmHkz/TY8VGpLM07nI5eRpTJV2sv099dCjCdE?=
 =?us-ascii?Q?cyYx6g1dFtyzRVcOBbHBYBl+rssqTj1ZPjqUv4Bu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ab1ab6-7e25-4349-f767-08dd0479ce52
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:58:56.0121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXTx34OOdfcdkrsiKnz2RPpDXtXsE+AiMueey2gKrtcg4O/hs3rzy+gYSesay5EvhF4wDmuIGJJlhrghl3XIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10278
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

One ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.

Card IMX-LVDS-HDMI supports single LVDS link(IT6263 link1).
Card IMX-DLVDS-HDMI supports dual LVDS links(IT6263 link1 and link2).

Only one card can be enabled with one i.MX8MP EVK.

Add dedicated overlays to support the below four connections:
1) imx8mp-evk-lvds0-imx-lvds-hdmi.dtso:
   i.MX8MP EVK LVDS0 connector <=> LVDS adapter card J6(IT6263 link1)

2) imx8mp-evk-lvds1-imx-lvds-hdmi.dtso:
   i.MX8MP EVK LVDS1 connector <=> LVDS adapter card J6(IT6263 link1)

3) imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso:
   i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel0(IT6263 link1)
   i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel1(IT6263 link2)

4) imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso:
   i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel0(IT6263 link1)
   i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel1(IT6263 link2)

Part links:
https://www.nxp.com/part/IMX-LVDS-HDMI
https://www.nxp.com/part/IMX-DLVDS-HDMI

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* Rebase this patch upon next-20241025 to resolve conflicts when apply.

v3:
* Use data-mapping DT property instead of ite,lvds-link-num-data-lanes.
  (Dmitry, Biju)

v2:
* Add ite,lvds-link-num-data-lanes properties.

 arch/arm64/boot/dts/freescale/Makefile        |  8 ++++
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      | 29 ++++++++++++
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso | 44 +++++++++++++++++++
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi | 43 ++++++++++++++++++
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       | 28 ++++++++++++
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso | 44 +++++++++++++++++++
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi | 43 ++++++++++++++++++
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       | 28 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  6 +++
 9 files changed, 273 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 42e6482a31cb..e2e828b352e7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -211,8 +211,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 
+imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
+imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
 imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx8mp-evk-pcie-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..44b30e9b3fde
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	lvds-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "J2";
+		type = "a";
+
+		port {
+			lvds2hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
new file mode 100644
index 000000000000..4008d2fd36d6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			it6263_lvds_link2: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..6eae7477abf8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mp-evk-imx-lvds-hdmi-common.dtsi"
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_en>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&reg_buck5>;
+		ovdd-supply = <&reg_vext_3v3>;
+		txavcc18-supply = <&reg_buck5>;
+		txavcc33-supply = <&reg_vext_3v3>;
+		pvcc1-supply = <&reg_buck5>;
+		pvcc2-supply = <&reg_buck5>;
+		avcc-supply = <&reg_vext_3v3>;
+		anvdd-supply = <&reg_buck5>;
+		apvdd-supply = <&reg_buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds2hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
new file mode 100644
index 000000000000..9e11f261ad13
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
new file mode 100644
index 000000000000..af2e73e36a1b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+			dual-lvds-even-pixels;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-odd-pixels;
+
+			it6263_lvds_link2: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link2>;
+			};
+		};
+
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..8cc9d361c2a4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mp-evk-imx-lvds-hdmi-common.dtsi"
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_en>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&reg_buck5>;
+		ovdd-supply = <&reg_vext_3v3>;
+		txavcc18-supply = <&reg_buck5>;
+		txavcc33-supply = <&reg_vext_3v3>;
+		pvcc1-supply = <&reg_buck5>;
+		pvcc2-supply = <&reg_buck5>;
+		avcc-supply = <&reg_vext_3v3>;
+		anvdd-supply = <&reg_buck5>;
+		apvdd-supply = <&reg_buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds2hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
new file mode 100644
index 000000000000..527a893a71b2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index d26930f1a9e9..68e12a752edd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -938,6 +938,12 @@ MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL         0x400001c2
 		>;
 	};
 
+	pinctrl_lvds_en: lvdsengrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0x1c0
+		>;
+	};
+
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B	0x60 /* open drain, pull up */
-- 
2.34.1

