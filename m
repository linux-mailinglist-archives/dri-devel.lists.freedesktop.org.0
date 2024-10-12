Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57E99B1A9
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 09:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5070410E303;
	Sat, 12 Oct 2024 07:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Bw/nzjZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2052.outbound.protection.outlook.com [40.107.103.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1090010E303
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 07:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQXDsC3jKsl2RvE7V0jI6olPSsRs4BVHN/dz40ApjSlIx14az/nsPjEhbFcechY2XzwYLlCSCPTX38tRf9G8AX9FqFz8IOo626u00Ojn22K0Lxr6mCtS678XB3CaFtu5EFKnruJZpk+fKdZMLW6lQLkY2V/YfTLUAVzHLkizH1mvdaa7llUIj3kBhn2jKKfA/hW6ATg2gsxKtW4yh9La4LZJ4sErnOGeyufPTEpJtRNTsFiMQsEBQBVIYL9moHM2/iK/IMnW2I+6SU5pI+cdjXqLtHw9tmARhqy30JR0jIgHTd13KD6ikwkHoQUwy7x2RfT33uaee6GptyXTWVzfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo8rh7qxgKKkmCv5NfkkyjDjQ2IHc2K4tbNuH15RKT0=;
 b=C32HS2y7GwIgOIjzFWxLRSShAtvG9qTwycwsTYNM+14Sp/ywPVVN2Iwi2lNzZTBhvRkKQw/uilfBogDqbera9Koa8o7X2YnncscxzAdz5lzoGIK3fdCbxLt2cYZTZFTWm6rOulGWEcX14yG093IMPH/UcwRLgDrnV94yFK5pN+cXHF6imwwDN3WhrB9gHKP5u4tuGLS1VdjEXvAJqy8xmCRNZBq7y8CtgovClLYxI84V7Fr8mdkJvAqeLUl4BgCnvTC1gWcUPswJb7y2WRTsY2Yn2cBJpY7CgYYDMi1ic5/ruyW7uoWtKPljuQhJeMfWda6s1LjVHe1K3xblu8Mthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo8rh7qxgKKkmCv5NfkkyjDjQ2IHc2K4tbNuH15RKT0=;
 b=Bw/nzjZ4lW9nFoEPnHeBSaUHyzYZ5AI1JXpvIE53kAdA2GZnPHlew+eEX/TtrAawMzc20sN7nmp1VOkXHMI/TLJJ4tfh5J8ePhmcZ+nRGWy9b/FbhWKVLlAhNKfSlonRMi+a5HIB18ifRXvqvd9RTB/wWkyHIEVgQcar31Wl3I2o9wdFigqufUMrLn8cNYDQoUEwtKhv7ZsEBdHLnw3QkBScxcQNS4thZTnaiuZzc9l4vtmLAzHFmdPyrejiFy0PzrmDN8iT6lHR10gEZNaLJqzrkEMt5/Mm6W1mfAgnprFxhmOuyJcFakLfh1m89KDENYiPqCvQTDRP5+rmQm3NZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 07:37:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 07:37:47 +0000
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
Subject: [PATCH v2 7/9] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter
 cards
Date: Sat, 12 Oct 2024 15:35:41 +0800
Message-Id: <20241012073543.1388069-8-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 16d34607-57cb-48b6-3ee7-08dcea90c47d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AOq3AqRpRZP+9vik+n64Fkedt5EonWLOQJYZc4uue2yGhNMlpHmBI6O1C/AS?=
 =?us-ascii?Q?DtGEhP8HAgbr9JsSeK/exMhrFDn93o3x+is1o+hJSfFDoWdJaXyTnV4Sgtxu?=
 =?us-ascii?Q?l4rPJuNJyjxfWSqjtAjauCaNSDWXv0K6E04XdlwwvHzxBTOCRxxRu37DNkRb?=
 =?us-ascii?Q?Bq5IaLVLPb5K8mirp0LQ2S6Qqn1Bq0kGOzGS0ff/o9+ndZnOi5e33tQTe2i0?=
 =?us-ascii?Q?SPj6adZsr3YxFleClV2WJhf6crKWvlwcjBVsXeA0JH7jq/zackH1CnU2befQ?=
 =?us-ascii?Q?EeVbzdDHBx8GQEmd7T4ErA1g4WGe8IKh348dpoy6D0ks8P0acHcDkv/xYSmY?=
 =?us-ascii?Q?HMQn/OuRe+zkGJ7zvoYLUGBTHakyy7kX5sJEEO2yuedZ1rgTcNUKDSvLbBBS?=
 =?us-ascii?Q?a3sJFMHx3M066Z4h7pe8IZcJNKTgviPAwQjAsl+5r8BfYw1pdmWZmmjHUibd?=
 =?us-ascii?Q?mOOmjDoFscrfdKnQDIDDNUQ95cuAB6r4g2tv5zqskSR355O2Mxv98mM6YJm3?=
 =?us-ascii?Q?gEuiVe2ZvciiF4nhsnGGEBGOKTkFlzyMhIsnIyHtZbN/xJvnMVQHQ98AmPEf?=
 =?us-ascii?Q?FvAdUSKELVMrRjnAACA8P6NtRlO7QWWIxjs36m7WYwBXjeJdjJKYM4XY1O73?=
 =?us-ascii?Q?Le7CUttzu+W+O2OR2/SzlD39YG5xfeDESid05RZcXL5sfh346xvHzvSfjknQ?=
 =?us-ascii?Q?qfmnZL6Gyl8vAZTPinIbdPk669XSmuguttVELY2+aIhbXt8NIZcVD2PXPpBt?=
 =?us-ascii?Q?+ww6v4PgaEvwlAQO8rUwvL7xTeT2y05tIqsdCImbcNp8hJICH8sKS5cFMvz5?=
 =?us-ascii?Q?eA1Kq98+nn+h2neOW+g8ag88a5wQAg8Ytpydwp0wFL5aRDvjbhflble+KllZ?=
 =?us-ascii?Q?q6zy62YEpvZoTTp+rfu/nmIoRh3K+d4Kt2iLejz8w9M4GG1zJUeC7T6Y3/O0?=
 =?us-ascii?Q?p+qdWoLdCeIKwKmDQpyTSOi5mkqPmrmJaQL8vslJ9LM/Uj//bY2k350aPoMh?=
 =?us-ascii?Q?gRek9d7uULegUdD+u8n3UJZ8DItQuq6fl41411rl+VCzq5MJHzPVxdk/kkO6?=
 =?us-ascii?Q?1Fs3Xea/NH8+nSYdaf+NYLrepP7KY4ZgLqNfhgkidaWv6b5jVf5rfdSiDFvW?=
 =?us-ascii?Q?8Ff7tM2H8goaFuymsIvk1EXM6o6BmJIs1SntYr/eggMAIg3xP2bfflj7U1HB?=
 =?us-ascii?Q?zkeJGwIbuOz/XsZHADHywzSsv0MMLyufnq39K3g3FLiKmezBurj9vE2wPhHk?=
 =?us-ascii?Q?z26xZsRiBuqziP6pJ1pRAD8knwvKucMqWnhlxK9pybIfIpXl8iNJPE4hXiy4?=
 =?us-ascii?Q?FqIC3dZdIi8t1EhCg4tP7GV0pP6td6yhzqV1ox1c/2jAQHCR5S2mYaJBNbLf?=
 =?us-ascii?Q?kKpfiaU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CbUHewTtmNaa6UbXOnn7gyCxOuPAG2LB1u4R89QpkwIJWPHs95eHsYMw/JqM?=
 =?us-ascii?Q?qNkSS5UQNzQztRpNqVnsZIPP8CACOCcM2oa3HbBgmmC+7pNOZ7MawDOKe6Ym?=
 =?us-ascii?Q?//DzccNowrzeBDr0nQk4ba8pvGcJAD5Smfu5Y35FBkqGRi+PPfimuAdWBbbm?=
 =?us-ascii?Q?IxI3jdYkgtoB4NFv7x6NNq4Is704aogF6r5UevFqAIK4pSFuFCWv8QnaIXMq?=
 =?us-ascii?Q?WVjhOsff2t7LgdAd9dG24OU9e8MlfpeLgnhizsX1UUe2m5WlInPy+/eJgN83?=
 =?us-ascii?Q?Hia6me1jQ+Du4eziby1H94ohk+VonOvqOiL3eEesBgDjiBHok9jfMz6xe+P7?=
 =?us-ascii?Q?QDFjdDD89Otv1fbrSLuOwZxUw57/EiI/b3t86EGC+Uxl2TFAMgXkYicu05k9?=
 =?us-ascii?Q?H6t+hJX8aUmgFvMNJgb6bCX9r7WXVju6LlsLHC47vNqRhg9ApEJ3OR/SO9hA?=
 =?us-ascii?Q?UXP6R32wbfchOTofbe+k9R64h1BMrBJpHekRQuZbww2P1YvMySat3PATedhP?=
 =?us-ascii?Q?v+yTlYOyQv3PgBllXpfG6VKj8o9goY5cND0/dzXxObjvjRVFpMgAXP655o2T?=
 =?us-ascii?Q?DJZnz6SblZ05udClbCkTLdu5EM5CrqLa7prFvBo0blY2WPutA8JyGF6jF0kE?=
 =?us-ascii?Q?yWWB5b4c36zRcq2MYgKK7HJMmaFKBRl/IgUwlfBRCB2p1Lud7nnIPr/bMND7?=
 =?us-ascii?Q?UoBCcL95P7VU9AKaE+ZsAmnI3K9kSrhpPjZDk3wrgU42pW0laN4xo5bsFXQT?=
 =?us-ascii?Q?4IHpn/ypKpsm0iilLqWO+IXxvFcNPEHYSjoXTu0fVuVKI8eK67xcn/u4ST3H?=
 =?us-ascii?Q?kI4jcnfJSDRO9GEkNOin4jr+XT1aKSwDS6mKUGdQCdxU0KBgLwPhDgSz0w6e?=
 =?us-ascii?Q?TOsYSuD7hHlnDITL2yqvGDkXhchMYDpS6xvNYtV2+pXFmBvU/Uwo+BoaZdsH?=
 =?us-ascii?Q?wfDNAKyDeY+7aUxGJ8ApsKJOjFVaqrKSlSgm2yk0PsMFaoA3JKqe0mYD0P+r?=
 =?us-ascii?Q?QHzFpQXRgljGyUg2aBxCrmCfFkN5DVrJKeYhd7rt0SAd7J3MjwL+TLV3Xzo/?=
 =?us-ascii?Q?Obgjh8bI80Fle7+ycNv+Rzvi/5/rSTA+QdnnuFjBwsgv4KNoC+md8ltOuxjF?=
 =?us-ascii?Q?Nha9nL+/H0loaQJBSEF6c092KiO6rBTB3YsXzSNUr7aUleU7qLM7s14rhE/A?=
 =?us-ascii?Q?rNfLk0WBvHdFxe088zUls8ImA07OexgmpQiTQpiyjWmxDLDEHsh0SrWJV97n?=
 =?us-ascii?Q?7XQksnxf2jmI9etuXEM+uXizZ+6rh+ysFMdiyREaKR5HBolHXqsuBpUcwcp4?=
 =?us-ascii?Q?ktsyXAUS1P/+39Xlow2ZDMcFONT/MgMsWVT+cHD0uxpWzOi1NJD3ufntijwC?=
 =?us-ascii?Q?JJwOfrkXYj4TD5287PpwPkucSQffDPPeu2fV3U8/LlQ7n1jARArzcfV4b7PM?=
 =?us-ascii?Q?uwtIKEY8C1N5GsPw3C/eFb/AI7cQi/w1/KKfaIgRIzBRE6oj4b9dQ+7NOvbq?=
 =?us-ascii?Q?6ol2lCyIrXlDVs8hYC430WWX80yI+Kgsox5fq14Fr7GRWvMuLJk0aQa7Lsgh?=
 =?us-ascii?Q?WO8HbjC2VHNz8OVu4PDVb0BqyTF/KcGh7ZN1w7YF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d34607-57cb-48b6-3ee7-08dcea90c47d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:37:47.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dn/yh1HLspEqdpNO6lbpyA7oU3tBJSLlCvGuP7RPEHyK59LwXpMthqSYUoYtHn+hkb2zAI3KAxS/vU+XGV3IZw==
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
index 9d3df8b218a2..cc4333f49c2d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -196,7 +196,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 
+imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
+imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
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
index 000000000000..757ce878c7cb
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
+		ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
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
index 000000000000..7381dbd0b7f6
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
+		ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
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

