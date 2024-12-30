Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083F99FE202
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833010E45C;
	Mon, 30 Dec 2024 02:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VO8M9u3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8877C10E2CB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urPtucGXfZ7qqIWyB+gScXK/+jBLhzGwrvgN8Nwa6+q3Z1NQSVi3L3D2PQX15GJJi+EkTb7bTU5A4vkPau1K6SOukRCB+7GQ2dUTVcknBHCMZoLaFY/p7wa9fq0IjT4SklgptmmiWA8BTiLrfwmZD4bYGmsCgaygeSOZYEcQREtXm0DofsR0rDAs62YEElhc98Q0qk5luJaSh6lrvlnSwhwFrzZSLAeqV6oV89h3/WmXBox/2EFg2pknGazYA4jW1iXjpdrtqYx5Ubs5v04bfhfYBkIWnYzaUAquE5uFHT6bxYm5FlQH02jhf8vFfDgSEHIHa/XzAM9PG9s6K5L+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuwO77SfisgKdy1uXKOei+okDOYaw0w+bG0rn/VDpqk=;
 b=D9x4S48FbSw9xYGYgaHjT0NRcbnaOeFbXJzUJwVUcxj/NJ2tFVMtCsX4r79lFZK0tDsF5eLh40rX2KUhK14p1TFunxxgdSG2jIvLVWPlfDQ6TRoiELwVP3ao4Rux8iMttGqdM2irzr1jbhAWreNQ2O59xdoA057uwUz9CE3I/xF8l7T5mH6aHoeNaxHpzwfufqnyePV3lTMgknVu0lk0d7au2uiXXbklBRZ7rxzNJl6K8ktdxeIg1vRww0bh8MZJJzInNHlyURmYhtCrFSNDS9f9//MUxLPOCCTJJb0/O2TT5A3ZjrDWRuXppP5ocliuQDafcWOiKLgBO3wMzJphSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuwO77SfisgKdy1uXKOei+okDOYaw0w+bG0rn/VDpqk=;
 b=VO8M9u3V8r4P9ckIu5U5AH9OsF/ZC8C8/r/kBe/hw4ZtSLj9K2XvW8paAy30L/O+1+WnZ/zRakoiMBJ05HEevAHeOPr0l2h002I5UfvNKHbeon9UFSiH3XtMywJLnlJHSSsU25Hds3tD/8z1tepim3Xl6/rclRZKpxdkKXOBirLOAlQ4zny9B71EUhDTuwRfqYhYX6KHBLCW8r0g9JAbnhhD/gRTy5BCBnbhXHiaUHqDeB2ul26F1h3QO5ERP+Qyn+Y9qKElQ+HqZXeyt/X3t6IaGjGTkCHsXYGemLI4mI1JsAedFhU8W7OLsaQQzN8xlJvq8zay0W9jwKxe+vyeXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:12:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:12:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v8 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Date: Mon, 30 Dec 2024 10:11:49 +0800
Message-Id: <20241230021207.220144-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 9478b4fa-4a75-46a5-cb04-08dd28775f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AmKKNKXOKZD2XIxDdJe6ruRvje5jZsHLcxpmq1hXl7OCL+xRIMQGgYP6wRBq?=
 =?us-ascii?Q?XBPRXD1gVog/1OwIiAupLG8sPv8L9Xh+zQpHtl6ps8lonDOSE1TK4vNjRNIh?=
 =?us-ascii?Q?F+FHC6K6v6SZDkQ8AP7s4UX9nx8RTffG9aiZCX/4pJVu0BuROH3p4mZYme5i?=
 =?us-ascii?Q?/zSUa7TXR1GtQsGR21pKlxc8HUuuupCR2Pz2L7hBYffBt9dRlHJwpi5wln/x?=
 =?us-ascii?Q?48t8asJZAMfAQE4hY1n5RBU9McuL64eaEgkeqoLLd17giqBVoGq/Sc79T1Dp?=
 =?us-ascii?Q?Rw9ybF+wbMX1wP1TbYqMCBRJ3S6XxBzYu5vZ4W6+xwQ1Xsy/e5zu3Awuhoj/?=
 =?us-ascii?Q?yudNbxeSJ/ZOwM7g5FEXVuJsw9aRoChWRcHc9MZyuC10oMiOsa4rdap6E2fe?=
 =?us-ascii?Q?+CKLkNCDWu6WwpJKqjQylZhmgagkpmA+dD0FFTqo3PtfiBK6ZDNuf3mKznRP?=
 =?us-ascii?Q?/nDuy5nageakJYMsJ9ixrckQCunZKdkIMeooolUQKZ8yKIouciopY6hPXKn+?=
 =?us-ascii?Q?6Gi62e5kTQjUyhcB8QL5/pkoTxwd4BmwVKqa6EMs7s+m3X39MM6w0kIdzqFA?=
 =?us-ascii?Q?Zt1LGF0iDGKIqLKwJFSG9PkYzAkCd7cZ0/1Xv6S+nCiilTcRIASAwGt2+mIs?=
 =?us-ascii?Q?NiMYFI7VBhjkpIze4MRTxRTU6/WZPtLlX2fdsr1tJ6jRSQAgHTeDaMIXPz0i?=
 =?us-ascii?Q?2kcbSfpJpZPO6YmeYSUCvV6XYOWhJmpy1GdXl/c8E54lFMP7iPcvE7S3ns+E?=
 =?us-ascii?Q?ehpntIwzK0dwZCuJyCRPxC84gAKxgi+EXfwZc1+SgVS0XXqGZ+rO2qF2566X?=
 =?us-ascii?Q?zHvDhPKMROwkQvn60RTFoXa657shMV3VQwy86t83qgPoDAtXMxiawMZRbJpL?=
 =?us-ascii?Q?4zjG+tRTaah02JtaJqfMbDVAVt8r7DKwOKwbNIER/CiOS1Zcx7txA5Na0d7B?=
 =?us-ascii?Q?c4EuVSXaFdvEAganIOjIYhyeo8grMYX4+twUsGV2icqjHgoxZmxDhMmCEG+o?=
 =?us-ascii?Q?VouGjJgGh1qGnE6mxyBAODQZaKBqwEKeXRLRerF45v5FLV8+l31lllTbOEpY?=
 =?us-ascii?Q?AQo3odEGVJXIF5lqevk3lhNieBS+ybFO6VzsS97osuyz2/LzSYbmApYk/ozg?=
 =?us-ascii?Q?MIf8Mal8alm9GevXwM/81DQoqE73mjgB6ykRek+Ix/Jshn/EmCmACiTgu1no?=
 =?us-ascii?Q?M4K9hg8iMEAnqBo8LarNDONLEyWjC8UUvyzFTOJSGp8DaFjCZTzrzmDw2TyT?=
 =?us-ascii?Q?aV39ABS5ur7QEEc5qhnOv3Dc9Yq6mCYSEA16DLYnKLXC7np8bOzxeF6ZzmkX?=
 =?us-ascii?Q?1vez63e7jKLIToYFe9+8q0NGiquWlwcVVcSDimeLyzoo96xow3siFvqRg8F0?=
 =?us-ascii?Q?OoFPF6G97zqXD9Gmzarb0VPtIpcF8pcGetXNkz+JFrZSdHWUBA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RmvNHJGnfxM5Z+jyU61NTTV2BoCAzw/ZLnsxWtuYm4f7IzFbOlE5MIneEkYu?=
 =?us-ascii?Q?5fJcWNEL/9kp6i9L9uTbiCseqbyLCStCNeDLuuvPWA1/sF8Y1xqBv0QfpDQm?=
 =?us-ascii?Q?JRccAFRLhU8mF3gi3kyvZsSu2SANNOQoRurnYiuyB4QK/Ccb3LdQprb9HwZP?=
 =?us-ascii?Q?TTWyEfsk4PohfpsA+WQCEzl4+gjj4x8TgENuD4WVU7UiY/2gIKeNwCmzhexl?=
 =?us-ascii?Q?cDMKaL7JrFJnqPPMEDzfiGIvAlTXtHDFRQIibamsXH4UaI4hXzrgAzLwfA1H?=
 =?us-ascii?Q?SR3kkPlzDt/pSa3FqG3LVgnZhP9w3vPpn8H8+DxrcWo115RGaJvJkRe1rAK2?=
 =?us-ascii?Q?COzN3ZOicVk2XdCvg34wbTIb9qRqdEsZ7iV5ilhG2PvipVIf435ELcJu4IB0?=
 =?us-ascii?Q?FW1AV/D8pgIPoKWv6yRe/KRinP7oFNbA+pNPLGUbpuwVPCB117uFxYlAsXzZ?=
 =?us-ascii?Q?oYOz4G5kBIUyDoXG4hTTybhEUmQzIypG/tJSjA63/NLHk/qgjLyC/L4SGaoy?=
 =?us-ascii?Q?t6wIrPcb3CcLxm9paeb4ib2OQg2Y5KL6Glr29ut1mLfD0/krmxqoH8EWTCA5?=
 =?us-ascii?Q?q/Txrn4iV7JqBTkmOGWBdfx+tikYtvJivMptkuFcMLoiMiq489M4uk4n+mLo?=
 =?us-ascii?Q?umrs9T4jQG4br6Vcap6+7LGeT1hx5mMR04Jvm/s6Ep0f5M5LkKegHvtT55sm?=
 =?us-ascii?Q?fS7ogs0ETLURxgBMPFj1/b7LAgA8cYUZYaJCmZRImeJlRb3RL/6DqDJMlaQa?=
 =?us-ascii?Q?Pil1r5//pzDokjvaHU99NGGfQdk3KQSpVQfAWMswHxrgbLkYhM++jiOZgIfV?=
 =?us-ascii?Q?XNyAk1sSso+cT3KA0hVA8PULFQyzUxjdglrrSfwMB1LnKit73/ATcdApVwOL?=
 =?us-ascii?Q?DniMWvypKwYiuZYNrqcF6GtDQAjbX0rEfKsgkUD8DoMr+IifaRqYg9ena2D2?=
 =?us-ascii?Q?SmADkTt+uaFAUW3jFkcpPdRFD5Bcb+vfFsYw38nA5esN1s3F8ZVm+3J6nB60?=
 =?us-ascii?Q?O8Jx2nQ7ztlUIrJzJWOcwNabMdShw+9WWhMPCZilZaMEF1Uuzo4sY4f17K3f?=
 =?us-ascii?Q?v05NKhY1TrXEO26N089hFD6Hdp4NB5hDOWn+V09AyQrDD3Rfatmm5zN4zUgQ?=
 =?us-ascii?Q?ok0lZI9VF0zyCqW3gri1sxCHVY/q16Fa/kPs60JfuwEK1P0oa7hmWz8NlR0R?=
 =?us-ascii?Q?54AcB9kBao9cmRE3pzqSuU7jq23qcNaA0oYu4mbzQs5JbIFloiLFfo1gJHj5?=
 =?us-ascii?Q?CQXYGAOT6Dmay8NMw9DawUUVkIglo77uHQXFxTGzhGE6VbZD5LlTVbbbzSW3?=
 =?us-ascii?Q?UtzxtiUwAk7WGllOrlGtIRXV4UYzDtRKLpoTm92GEXv/7vyg2Gk5pwy5PlDr?=
 =?us-ascii?Q?RmTjpyFGt11Bt2oJLHmlFEBAkBnbgVZb/GRU+XdMlvfbuqIZ94iHi2CWFsEt?=
 =?us-ascii?Q?lX6sbGdFMuArm5YV0nx4+RtyH2aIOYogC0g0hxvoPJIP1ePfVyjCTlGMHJOB?=
 =?us-ascii?Q?z5RFO3r7Nb+Zm7Ri1Et+OZrYd4m22hRXroMySP9jU5IKZde5Xr8NgG67684H?=
 =?us-ascii?Q?4PeXEjm7nkLkXq2A0vxh2rCekUrFGmE7XCWq16S0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9478b4fa-4a75-46a5-cb04-08dd28775f24
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:12:12.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyRuqW9QtMPghioai8HlYigtmXj8Vbg7q3ZGOVh5HFR0iWqAhpJ/dSiTiS5EqwEd9oAcqVfPFqmP9kOAU7hUfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
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

Freescale i.MX8qxp Display Controller is implemented as construction set of
building blocks with unified concept and standardized interfaces.  Document
all existing processing units.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Drop DT alias documentations and add instance numbers to compatible strings.
  (Rob)

v6:
* No change.

v5:
* Document aliases for processing units which have multiple instances in
  the Display Controller.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
  fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
  into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
* Document all processing units. (Rob)

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
* Fix register range sizes in examples.

 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 +++++
 .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++++++
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++++++
 .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  45 ++++++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++++++++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 141 ++++++++++++++++++
 .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  43 ++++++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++++++++
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  32 ++++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 +++++
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  44 ++++++
 .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  43 ++++++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 +++++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  83 +++++++++++
 .../display/imx/fsl,imx8qxp-dc-signature.yaml |  53 +++++++
 .../display/imx/fsl,imx8qxp-dc-store.yaml     |  96 ++++++++++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++++++
 17 files changed, 963 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
new file mode 100644
index 000000000000..095e65939fba
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Blit Blend Unit
+
+description:
+  Combines two input frames to a single output frame, all frames having the
+  same dimension.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-blitblend
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    blitblend@56180920 {
+        compatible = "fsl,imx8qxp-dc-blitblend";
+        reg = <0x56180920 0x10>, <0x56183c00 0x3c>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
new file mode 100644
index 000000000000..21d42aa11b52
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-clut.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Lookup Table
+
+description: |
+  The unit implements 3 look-up tables with 256 x 10 bit entries each. These
+  can be used for different kinds of applications. From 10-bit input values
+  only upper 8 bits are used.
+
+  The unit supports color lookup, index lookup, dithering and alpha masking.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-clut
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clut@56180880 {
+        compatible = "fsl,imx8qxp-dc-clut";
+        reg = <0x56180880 0x10>, <0x56182400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
new file mode 100644
index 000000000000..94f678563608
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-constframe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Constant Frame
+
+description: |
+  The Constant Frame unit is used instead of a Fetch unit where generation of
+  constant color frames only is sufficient. This is the case for the background
+  planes of content and safety streams in a Display Controller.
+
+  The color can be setup to any RGBA value.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-constframe
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    constframe@56180960 {
+        compatible = "fsl,imx8qxp-dc-constframe";
+        reg = <0x56180960 0xc>, <0x56184400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
new file mode 100644
index 000000000000..8e4468d91836
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-dither.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Dither Unit
+
+description: |
+  The unit can increase the physical color resolution of a display from 5, 6, 7
+  or 8 bits per RGB channel to a virtual resolution of 10 bits. The physical
+  resolution can be set individually for each channel.
+
+  The resolution is increased by mixing the two physical colors that are nearest
+  to the virtual color code in a variable ratio either by time (temporal
+  dithering) or by position (spatial dithering).
+
+  An optimized algorithm for temporal dithering minimizes noise artifacts on the
+  output image.
+
+  The dither operation can be individually enabled or disabled for each pixel
+  using the alpha input bit.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-dither
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dither@5618c400 {
+        compatible = "fsl,imx8qxp-dc-dither";
+        reg = <0x5618c400 0x14>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
new file mode 100644
index 000000000000..dfc2d4f94f8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-extdst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller External Destination Interface
+
+description: |
+  The External Destination unit is the interface between the internal pixel
+  processing pipeline of the Pixel Engine, which is 30-bit RGB plus 8-bit Alpha,
+  and a Display Engine.
+
+  It comprises the following built-in Gamma apply function.
+
+  +------X-----------------------+
+  |      |          ExtDst Unit  |
+  |      V                       |
+  |  +-------+                   |
+  |  | Gamma |                   |
+  |  +-------+                   |
+  |      |                       |
+  |      V                       +
+  +------X-----------------------+
+
+  The output format is 24-bit RGB plus 1-bit Alpha. Conversion from 10 to 8
+  bits is done by LSBit truncation.  Alpha output bit is 1 for input 255, 0
+  otherwise.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-extdst
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    extdst@56180980 {
+        compatible = "fsl,imx8qxp-dc-extdst";
+        reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <3>, <4>, <5>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
new file mode 100644
index 000000000000..97fb6a4598d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchunit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetch Unit
+
+description: |
+  The Fetch Unit is the interface between the AXI bus for source buffer access
+  and the internal pixel processing pipeline, which is 30-bit RGB plus 8-bit
+  Alpha.
+
+  It is used to generate foreground planes in Display Controllers and source
+  planes in Blit Engines, and comprises the following built-in functions to
+  convert a wide range of frame buffer types.
+
+  +---------X-----------------------------------------+
+  |         |                           Fetch Unit    |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         |                                    |
+  |    | Decode  | Decompression [Decode]             |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Clip &  | Clip Window [All]                  |
+  |    | Overlay | Plane composition [Layer, Warp]    |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Re-     | Flip/Rotate/Repl./Drop [All]       |
+  X--> | sample  | Perspective/Affine warping [Persp] |
+  | |  |         | Arbitrary warping [Warp, Persp]    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         |                                    |
+  | |  | Palette | Color Palette [Layer, Decode]      |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  | Extract | Raw to RGBA/YUV [All]              |
+  | |  | &       | Bit width expansion [All]          |
+  | |  | Expand  |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Planar to packed                   |
+  | |->| Combine | [Decode, Warp, Persp]              |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV422 to YUV444                   |
+  | |  | Chroma  | [Decode, Persp]                    |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV to RGB                         |
+  | |  | Color   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Gamma removal                      |
+  | |  | Gamma   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Alpla multiply, RGB pre-multiply   |
+  |  ->| Multiply| [Warp, Persp, Decode, Layer]       |
+  |    |         |                                    |
+  |     ---------                                     |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         | Bilinear filter                    |
+  |    | Filter  | [Warp, Persp]                      |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  +---------X-----------------------------------------+
+
+  Note that different derivatives of the Fetch Unit exist. Each implements a
+  specific subset only of the pipeline stages shown above. Restrictions for the
+  units are specified in [square brackets].
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-fetchdecode
+      - fsl,imx8qxp-dc-fetcheco
+      - fsl,imx8qxp-dc-fetchlayer
+      - fsl,imx8qxp-dc-fetchwarp
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  fsl,prg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Prefetch Resolve Gasket associated with the Fetch Unit.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    fetchlayer@56180ac0 {
+        compatible = "fsl,imx8qxp-dc-fetchlayer";
+        reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
new file mode 100644
index 000000000000..5c54d5179ee3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-filter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Filter Unit
+
+description: |
+  5x5 FIR filter with 25 programmable coefficients.
+
+  Typical applications are image blurring, sharpening or support for edge
+  detection algorithms.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-filter
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    filter@56180900 {
+        compatible = "fsl,imx8qxp-dc-filter";
+        reg = <0x56180900 0x10>, <0x56183800 0x30>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
new file mode 100644
index 000000000000..9d1dc3a9de90
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-framegen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Frame Generator
+
+description:
+  The Frame Generator (FrameGen) module generates a programmable video timing
+  and optionally allows to synchronize the generated video timing to external
+  synchronization signals.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-framegen
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: int0
+      - const: int1
+      - const: int2
+      - const: int3
+      - const: primsync_on
+      - const: primsync_off
+      - const: secsync_on
+      - const: secsync_off
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    framegen@5618b800 {
+        compatible = "fsl,imx8qxp-dc-framegen";
+        reg = <0x5618b800 0x98>;
+        clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+        interrupt-names = "int0", "int1", "int2", "int3",
+                          "primsync_on", "primsync_off",
+                          "secsync_on", "secsync_off";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
new file mode 100644
index 000000000000..25ad85742912
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-gammacor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Gamma Correction Unit
+
+description: The unit supports non-linear color transformation.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-gammacor
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gammacor@5618c000 {
+        compatible = "fsl,imx8qxp-dc-gammacor";
+        reg = <0x5618c000 0x20>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
new file mode 100644
index 000000000000..2a6ab8a0ed7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-layerblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Layer Blend Unit
+
+description: Combines two input frames to a single output frame.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-layerblend
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    layerblend@56180ba0 {
+        compatible = "fsl,imx8qxp-dc-layerblend";
+        reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
new file mode 100644
index 000000000000..d773389dd0dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-matrix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Matrix
+
+description:
+  The unit supports linear color transformation, alpha pre-multiply and
+  alpha masking.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-matrix
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    oneOf:
+      - const: cfg      # matrix in display engine
+      - items:          # matrix in pixel engine
+          - const: pec
+          - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    matrix@5618bc00 {
+        compatible = "fsl,imx8qxp-dc-matrix";
+        reg = <0x5618bc00 0x3c>;
+        reg-names = "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
new file mode 100644
index 000000000000..7115950ecae0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-rop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Raster Operation Unit
+
+description: |
+  The unit can combine up to three input frames to a single output frame, all
+  having the same dimension.
+
+  The unit supports logic operations, arithmetic operations and packing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-rop
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    rop@56180860 {
+        compatible = "fsl,imx8qxp-dc-rop";
+        reg = <0x56180860 0x10>, <0x56182000 0x20>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
new file mode 100644
index 000000000000..66c12948ab09
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-safety.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Safety Unit
+
+description:
+  The unit allows corresponding processing units to be configured in a path
+  leading to multiple endpoints.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-safety
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    safety@56180800 {
+        compatible = "fsl,imx8qxp-dc-safety";
+        reg = <0x56180800 0x1c>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
new file mode 100644
index 000000000000..76cbe11a6364
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Scaling Engine
+
+description: |
+  The unit can change the dimension of the input frame by nearest or linear
+  re-sampling with 1/32 sub pixel precision.
+
+  Internally it consist of two independent blocks for horizontal and vertical
+  scaling. The sequence of both operations is arbitrary.
+
+  Any frame dimensions between 1 and 16384 pixels in width and height are
+  supported, except that the vertical scaler has a frame width maximum
+  depending of the system's functional limitations.
+
+  In general all scale factors are supported inside the supported frame
+  dimensions. In range of scale factors 1/16..16 the filtered output colors
+  are LSBit precise (e.g. DC ripple free).
+
+                       +-----------+
+                       |   Line    |
+                       |  Buffer   |
+                       +-----------+
+                             ^
+                             |
+                             V
+                 |\    +-----------+
+           ------+ |   |           |
+          |      | +-->| Vertical  |----
+          |  ----+ |   |  Scaler   |    |
+          | |    |/    +-----------+    |
+          | |                           |
+          | |                           |
+          | |                           |     |\
+          |  ------------- -------------+-----+ |
+  Input --+               X                   | +--> Output
+          |  ------------- -------------+-----+ |
+          | |                           |     |/
+          | |                           |
+          | |    |\    +-----------+    |
+          |  ----+ |   |           |    |
+          |      | +-->| Horizontal|----
+           ------+ |   |  Scaler   |
+                 |/    +-----------+
+
+  The unit supports downscaling, upscaling, sub pixel translation and bob
+  de-interlacing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-dc-hscaler
+      - fsl,imx8qxp-dc-vscaler
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    hscaler@561808c0 {
+        compatible = "fsl,imx8qxp-dc-hscaler";
+        reg = <0x561808c0 0x10>, <0x56183000 0x18>;
+        reg-names = "pec", "cfg";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
new file mode 100644
index 000000000000..c495822fdc80
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-signature.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Signature Unit
+
+description: |
+  In order to control the correctness of display output, signature values can
+  be computed for each frame and compared against reference values. In case of
+  a mismatch (signature violation) a HW event can be triggered, for example a
+  SW interrupt.
+
+  This unit supports signature computation, reference check, evaluation windows,
+  alpha masking and panic modes.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-signature
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: valid
+      - const: error
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    signature@5618d000 {
+        compatible = "fsl,imx8qxp-dc-signature";
+        reg = <0x5618d000 0x140>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <22>, <23>, <24>;
+        interrupt-names = "shdload", "valid", "error";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
new file mode 100644
index 000000000000..42d1b10906be
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-store.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Store Unit
+
+description: |
+  The Store unit is the interface between the internal pixel processing
+  pipeline, which is 30-bit RGB plus 8-bit Alpha, and the AXI bus for
+  destination buffer access. It is used for the destination of Blit Engines.
+  It comprises a set of built-in functions to generate a wide range of buffer
+  formats. Note, that these are exactly inverse to corresponding functions in
+  the Fetch Unit.
+
+  +------X-------------------------+
+  |      |              Store Unit |
+  |      V                         |
+  |  +-------+                     |
+  |  | Gamma | Gamma apply         |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Color | RGB to YUV          |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Chroma| YUV444 to 422       |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Reduce| Bit width reduction |
+  |  |       | dithering           |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  |  +-------+                     |
+  |  | Pack  | RGBA/YUV to RAW     |
+  |  | Encode| or Compression      |
+  |  +-------+                     |
+  |      |                         |
+  |      V                         |
+  +------X-------------------------+
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-store
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+  fsl,lts:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Linear Tile Store associated with the Store Unit.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    store@56180940 {
+        compatible = "fsl,imx8qxp-dc-store";
+        reg = <0x56180940 0x1c>, <0x56184000 0x5c>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <0>, <1>, <2>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
new file mode 100644
index 000000000000..7a3b77ea92c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-tcon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Timing Controller
+
+description:
+  The TCon can generate a wide range of customized synchronization signals and
+  does the mapping of the color bits to the output.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-tcon
+
+  reg:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: video output
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    tcon@5618c800 {
+        compatible = "fsl,imx8qxp-dc-tcon";
+        reg = <0x5618c800 0x588>;
+
+        port {
+            dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+            };
+        };
+    };
-- 
2.34.1

