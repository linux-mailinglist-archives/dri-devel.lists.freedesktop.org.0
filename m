Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A5989A15
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 07:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201B810E2D3;
	Mon, 30 Sep 2024 05:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IT6D6yTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430C510E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 05:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltRFRpr99whJwZWy2gJB2OTLzVgprZHSBmu1ZCdMevEFBWmMEZgy3VVKfCf3Qf13d9QuQQJIlirkdD6ouIduKatoP4RLBt9JCueoVb/Kh5BDAXk+uZ2u1459heVVD7Nyg9aaoaL/tQ7ULS2yatWrAuANUh2nkn7D+QVk4HjLLNhNarLHAc0/oyIORRuRW0mfbTKvHnBWN0DuFAIjRNUQ3dfTj94v7cM6nakddk6EhB2XNs5OyI9h1044ZHq9atUhlcq9DrmXCVffGo1pT1iX4skt8HTVkI5ES6pxPCFQ6LwBL5WEp6eRSPRaQ9JYUDc5RxP/aGVLEANLM2MfUIbRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcYY8o3W4qjWey/1ydyJWgGTXEl4ZlHOsrKKk70NEw4=;
 b=t+wzEcbNKFiv5lybK8EMix2FCLdj52ndwzj30NjU1CRFFbrH6SH+QfQMB/CmubVP/UEb+TabHOpZVV9/ZqmS2ONXbC42V8WlYzm8Lo9FS/HBrNAbgaGdr6RhPD/YAnen0GThjqHKaV6Kg6dm79MzBL49m4G6WeVcg8fdwoG2S/V435mUK++fxK+fWwRCmynrvTjRLNGn9VmPjdj78q+WbZrfScKIcIiEUIoZsEk9X+68OUSMXWhIkYqWt9EAdIdEusahvJbP6QhSkcT3JZqz5SGsROBCM0ug5LMToGLofnVmhXAwvA3lYYK5FdVNE78wLk2exA4Cnciihn7X4EK2JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcYY8o3W4qjWey/1ydyJWgGTXEl4ZlHOsrKKk70NEw4=;
 b=IT6D6yTUNors2Q6v0aiyQaaFRNbO2xxccTgpnK/UiHJxS7UwRazJ8qcxU2+4YH6t8VRtBmzjNJWPTRUSTFfSl3nJ5zZ3mPtH3VfqILog6uYFRi9l74dU6RP0Ml3hAmPzkbw3zKT7q6QbnmZYjdhYMg8/6sZE4E6nUJxbHaKa3h5eJaYDEhtzwa9ftEQ1EK+QsslSDcILKQ0ZItYVqlUU5xXYtRUUhmh/KNHjdQm+1vphvuDBEcNCD2xJ5CTdIoGVUjH3vMT2oP3L0DgxRM9WKFTxQ/d3Y8o4uE8JFoqw1EO7ilIwivh0aXO2Rgol0okVhvbOtraAniOtcymBBajuqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9141.eurprd04.prod.outlook.com (2603:10a6:20b:448::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 30 Sep
 2024 05:29:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:29:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de
Subject: [PATCH 7/8] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards
Date: Mon, 30 Sep 2024 13:29:02 +0800
Message-Id: <20240930052903.168881-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930052903.168881-1-victor.liu@nxp.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: c69b02f2-2f90-4a8e-cded-08dce110e922
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KYhQ1RzBDveODGPf3Wry5KTZikod967NvvxtxCJ6OzoFqaoLdbAFaPANvt2l?=
 =?us-ascii?Q?yKTDEkw1Ad+ugmSoYiRMEE33nkRF9D1YG4yW0nPLr5+E1NyAKpKpFcwZxbzU?=
 =?us-ascii?Q?0Z4d9naJ01qdvX8Pagrasz6xMfaXhxUd9uhcRSYO/Q5DKY+COlmVGFkQwdDo?=
 =?us-ascii?Q?nz6K4ePPiqjNkXRMO/T387R2g14XycLP/7/HzejkPRS9Lqj5kpoqXEwARpCN?=
 =?us-ascii?Q?lDj6YceDGgX8O/OT9fWvGWpiysgXsvamABujPNRfeTZsmAV4ub8ejE9z9qFh?=
 =?us-ascii?Q?/BfWvrJfn8ZGmE53ArnLebHEkxYdFbiF9K0wpzX3COeHQBEkOR4nql/IXVth?=
 =?us-ascii?Q?T1QPJhyBiMARjNNtqooMZCdAbQQKZ86fc/znk88T6vJ1+RB+HrZhjsBqmX/s?=
 =?us-ascii?Q?YUS+EeD8L4wfvYUmcFRL9dJGYUwrYvlSklUrmgPsaeikYFUXxCLWdTVwrGu8?=
 =?us-ascii?Q?SkV/MOiOrg6BgIUvDkV1qCsI9hrztqYf+LVNBih0SQ352pCZmpfgPLt1BwZT?=
 =?us-ascii?Q?97PxbMplYcdAg9/riEMGs2jveeziehaFfJsLgSkzwyz1EUU1XL2r7Jy463R1?=
 =?us-ascii?Q?O1bZSBZM/q9SdmN3Nke3rYJJ8V7X9PDtp2yEtNZX6UeB09CyP7F/d94zXSJ9?=
 =?us-ascii?Q?YAtXpGZgMALLMZ7aj+S3qjAPq6QNtpEjD+GBNPwTjsy7t7uS+ZnnWfiWK9Qj?=
 =?us-ascii?Q?+HCQn935aggYALFIvuxr83bHlsUnRbRJ4KvVAy+4LmqTAnd7JyQOHFMir2fo?=
 =?us-ascii?Q?MNcmaSNCtk3WAdUDjmiClwJyASYMRZBz7YupP20X7cgQL8AzJaqZs+mHT3QO?=
 =?us-ascii?Q?a9OO/xUuUMdIzfoDAPOYuw1MbeOH2ANEk1o4VcrXRbT+cLKv72sFHQEND7Ix?=
 =?us-ascii?Q?Lm0jkfgnt4hdgsuyWlXqRxziQbFQDnK8vT/N3z9KVdvz01xHoyYyq6bWV9hs?=
 =?us-ascii?Q?iLTZ+2Qk4SqPmlKOGDvA3dWrsRhVNMeJQNScLA0tTnLiaBq2z0bubZb+e2qu?=
 =?us-ascii?Q?o4EuMSLywPJWJLHHyGhGXYvnzrylKl1lil2CSnHlU6DsvoHxxx2Y580dBtEW?=
 =?us-ascii?Q?4yDVPdRFb8tUHq8vtFPOGwe1F70GLRjYI8MejqOV+XbT4QiAsuQFtHY8WHAR?=
 =?us-ascii?Q?mlMaIecuXIrUFC3CS6yBUqR9EpuUnXPIc6dgEPzZhkK3BK3NBjWMAdCJai2Z?=
 =?us-ascii?Q?bLRMrt1dMD+mFD7+nZyBTkG2nCbTO1xjrjybLBy/XErwR5VmSc/aBjkJ/VyI?=
 =?us-ascii?Q?u2pe3nDSgNNeGFCG0KqOtAKGCaGlb8TdR3/jMsnYp4Unb+lD8pYSOUwHdYu+?=
 =?us-ascii?Q?PiTUD8mzk/kcKuPfZbCzPG46XZ+FhxCp7Sh3DLw6DOMq0iW8okWoBwGmckob?=
 =?us-ascii?Q?ZrPOQpv/vYKFzO1qc9eEQDJc7TeRZWiLX8amOAMIJ6LtMhTfMJADwIl55uW2?=
 =?us-ascii?Q?koVwqTUDvZQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?noBd4zaCA2A0d7RDVovSHECjB9lmbvRFMxwxrvLnZGbY57HZXsoLXPPOYmuj?=
 =?us-ascii?Q?AhANQIWhx1ubWZwXSHTOC/Am+x+l7G3nv0HUrUg6sVJCKLTWxyeSoqEi1C2f?=
 =?us-ascii?Q?tx84s+pdETQhYWiPC1Xxvzq5RknC9P86zDyjfohoGbt0HA+xlAdYx4HrqCTM?=
 =?us-ascii?Q?Wk5XHv4pxVg9C5XG/CBpur2BtYl8hfmlZsuV/gngwu0pe/FBjIgTLMyQEUJb?=
 =?us-ascii?Q?uvrI+lVBTOHA/TgvrqiLeGa+B8F0Nlm0QVRqWOCAwCkU2AG94cvxfPrYpbpi?=
 =?us-ascii?Q?BYydD2VnPfm4q+j2MKmYcRhvcbVRd/g2B2MNitUpDm+1qUYAo3UeI6Zqwc3H?=
 =?us-ascii?Q?zFWr3IpZtONYIZ/LqwrE8piSnBnmW7erMnXmh+Ec3tNjzKSLxV/Ty+8eSqMr?=
 =?us-ascii?Q?i0COxE8NIjqMO8qdCoqWeU+yuCEfIk1M51RTfBBYfam7pQ3YpfW9joYZfCqL?=
 =?us-ascii?Q?dgyv/7kArbnhxYQWepGmjj+XxSYPV5prI6CtnuvgR2n6qT9AOZCOFTNbxccL?=
 =?us-ascii?Q?t6rp26eeECYkO4bNk3xd7wHGD0DnK33f0fTwdJZUoaJHhjAXKtBap0cMb2qX?=
 =?us-ascii?Q?KTt4FJljGoUwx+4mBomMoWA7mF0VUUCUiahud741xFmreH7MpAV5UOOJwGby?=
 =?us-ascii?Q?xEMD0xQv0u98YtyANR0iFVsAaA2ugPJ/l5UtetWw/5DxfnL5kWvXVF9NXgvm?=
 =?us-ascii?Q?7QAw4eaxxereLcwwdyXjO19h5mAjH4NXrm98QrDdKY0J4hvjmNIb03R4fhhc?=
 =?us-ascii?Q?uuZ/JVLhlHiUunVugAxSluRSaoJqwhIQ7xwKzbVXkIqo7/k67qnhtnpjNnYT?=
 =?us-ascii?Q?3LC8gCwgcpIkRyxQa+/PnhMhEaRmWqbjyC/6tBaSIj5oPX+LfOJ9rwRjDAlf?=
 =?us-ascii?Q?nuuf4FGlx7uYJCCdHLyPSG0CV2/7VQPLCM1gHUEK+FKWjM1RqrZXDOsKvdvy?=
 =?us-ascii?Q?URvx7tBegiHXxmeRHrhQHoDyEo28sEQ0QH72PVfQpzpH8zO9CIQnsaPFFCaZ?=
 =?us-ascii?Q?MHZzRDslrwDydtx+eithsvMQKct4dt15VQks2v39ZwKjMu2nEncL/X6Ibctp?=
 =?us-ascii?Q?1j8W+gOuEjwtvVIurj7PoV3o190aQGKu8lEaUTfwMfsAxz7Qx2Zo4b5Lw2BN?=
 =?us-ascii?Q?ba9/v6azqHnPV541cR88oWMUftwNz0HTgot4mNlhlVBee4OIU7gicM+Y9bGC?=
 =?us-ascii?Q?U3yZw1p+MbLHchcvuNSTBhIKg6OkPPjfQeOU/LQbyqBYeV4Z+l4hlg4yJqwc?=
 =?us-ascii?Q?GzbiE7aNu4XGhtZboZ+Bf0Gb8W0e+EJlsoq8cza/Ez9Q6QdgyKI7Kr8VDj/2?=
 =?us-ascii?Q?qbIHcb9LOSwLzIiVPIFC6gGxLGokH9K0kY5kuwuuQMZj/2VPT6ZuordKAbdR?=
 =?us-ascii?Q?jv04slkIjX3dBrhVr/LMeff3z3PvSrxY0CZl17fQupRH326FWPykfIMOki4F?=
 =?us-ascii?Q?bkeTRwxofKrkqX/APKr63N1GjlSWQZs3m0xcPxBVyKbZ6LyPrZgx1jQ0Zdi+?=
 =?us-ascii?Q?A32CdMi6MORFeuAjrgz/g1KeNZuh5nEbxdnNH5ZhzYnQmjDFho2s6mYhuDzr?=
 =?us-ascii?Q?c6TNtfNd0J0YQWy/8rPjikjxAKnFz0hpSuf2MiC6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69b02f2-2f90-4a8e-cded-08dce110e922
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:29:52.8519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: my5wyxFlSlSWbCANggdXIPWElJsE/nk1c3gjFTkFaOVKKP3RzE1eZbKU040QyrFDO4nlDP1YcdAQuTRdmBOhMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9141
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
 arch/arm64/boot/dts/freescale/Makefile        |  8 ++++
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      | 29 ++++++++++++
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso | 44 +++++++++++++++++++
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi | 42 ++++++++++++++++++
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       | 28 ++++++++++++
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso | 44 +++++++++++++++++++
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi | 42 ++++++++++++++++++
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       | 28 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  6 +++
 9 files changed, 271 insertions(+)
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
index 000000000000..c276e084ac8a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,42 @@
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
index 000000000000..7fb38f417e6e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,42 @@
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

