Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF799DF91B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358310E1F7;
	Mon,  2 Dec 2024 02:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CA1r/5ZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2057.outbound.protection.outlook.com [40.107.247.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F52210E1F7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:56:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwwprfxJCSqjTkG2ALqJSY8VONDZzTx5qdQvy64lygDDBbZzxp4V/H27lcIDbVQhnLK5/kemmo1/zSJ8o/1Ip1z1KKIBVSO0yQrAuxsvm+NP7s8V06xeccdUrXikOPI96bNMs6pG5W5Evn85dIzDed0EFEBC2caDxlUxtw8G5rcDTHHMejm+rQlhHy10uqA2rha/5h4opL08PklLjeCvu7l9luoDQqBnCHSeS/L44kj0z9v4+v2h04lpQYO+ZRAeZIL+yxZtdlW98RZidkG1RwFJGcsGy/M7fVjOVPz8HFKB04VVG9O43UkADrezZKy8NCykTeBVE1Gm95PtkKIOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Wruif7Paf9JYIcP0c9bIsiPZiesCYMP2EqKOQazKTA=;
 b=VaFLAk05uQswyfKMmg2i5lOJo0UWOd8xltzNijm/641o8rQxqMO980jXWqpbAeuYjv96k5lD9/BEUfhDcuBGodBUc7cNH2WTTVFgYtxWX/Vwk5+L4p8gj4a+LXRQAF7FzhX9ziYZxNOrOsVLM3RmKzmSRPPNcpy+h7Taj/ab0nMAFHNFFiXMcwniQdMtbqTsV8fmyO74wgTuoWP3EawPwxw6z+tgaXQG5b2CE33OEPG59tqrHgbib+Vb/m1uLLgJtxTTJhUehYQfbxT5RTr43o557XLnhDJoICN7sVMSRJERxvwDuGzW8Vq5+iqW1bvVYQrTE0LQD0iLEQ7utucZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Wruif7Paf9JYIcP0c9bIsiPZiesCYMP2EqKOQazKTA=;
 b=CA1r/5ZWbeVF3KirFWzXaE3zYArnmTL4aCQjSacdB4H5/T8Ip0Ta+/xpwnaHU9BFyZqR5JyqTzpXK7153iflxM+r9HOZJ7cezZnS3jy0lUJFiDjBUFOBjQr0Dae/GNGylkeA05xwCfAXHwSko9IG9fLPT7mBwBTsFF1oKgfOxsPaFWx9o1MaTU7ep0o4wevIYIrdLIfytiRyhBNgxNu/UijU+/FormL96fa71isl7+qAtCEI55TCuuGlupqbBigb2Z5qn0SEn5beBBlM4NX725SnuT+nnoTB2nUT9Z1EukjxiZC6ke3yqztuRm2wopZ/8E5DUiseYPHbyEDtMeulBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:56:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:56:33 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [PATCH v5 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Date: Mon,  2 Dec 2024 10:56:17 +0800
Message-Id: <20241202025635.1274467-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: b77b9706-d7f3-428c-a5f8-08dd127cee11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HCZHBd7dmXZCJPvzZNgvuBcCbuH0YwL0JdGawkSjW6PTxgTK4JZ9/5124pGs?=
 =?us-ascii?Q?mNZEym2Z3HZ45Ucuz6+xKQWSFTLqGGSNTMI0zBMlFy5/RkDxRONT5Etw5iEv?=
 =?us-ascii?Q?Gq9Ha+jL4xYNGM6ownXCyLl5FvcxYxq7UTORsy7H3vQMH1JvwquJuRVJd6az?=
 =?us-ascii?Q?XPOYW8LqTgTYHCifjDoD17gNd2toYhQYaF8af5ylDuQW+bUUzxcUE6EySTyj?=
 =?us-ascii?Q?6dIzB9JQa+9ELCUYqj61z4EkghCiXsPuWnK9zi3X58s0Fz1HWMiEjGkVUQHR?=
 =?us-ascii?Q?ZCMXDxt4l0IZMNSufpn3vR90Z6j++nUU94DrHUu2S6OFxCVy9tbtH+8N7lOv?=
 =?us-ascii?Q?p656PWyWWc556DSC5aJ5nuSmISZB7pm6HwL34Ds9//s2KdFtQWxyikVjZWlq?=
 =?us-ascii?Q?aeXwX4FUkd7nC0/QHzV4FGbClk4VVFAEr4F3WUDALLzMiCAODf/YkkbD/PrC?=
 =?us-ascii?Q?p7SkTA+VjDAWNKsjwPH9SRBx5pqxzwBH70Peq80fr30fXCf/AUug5xtr07O3?=
 =?us-ascii?Q?Y/zltM2YaUOIeI1YXPFfvQmHIr8CdJqP5CxH5f+TdW6rd27IkDNhAso5dhid?=
 =?us-ascii?Q?ikAP+DVL4sXzaEpx8jGQghsxho8cU7Zst060EV1VAC8HvWi96igha87G6yI5?=
 =?us-ascii?Q?bU2R18xvPwec7UkyQt73sgqb4B2P+DEXnhCqPvAG4xKE0srzaE4qtBo0bnLP?=
 =?us-ascii?Q?Zc+orB19BtrkacPwk0NlpduOttV3P/J4N+5u1axrHVqflXUYabYA9JD2M6VY?=
 =?us-ascii?Q?HKGSOzZXkhfNr1qUeFEYAPjALCZolzDUx2RBAJbIdHXGfAh69XmJFg+aNP2N?=
 =?us-ascii?Q?udq7ef+EZJpV1f7t/3lmLBCaeVY4CTOi0qup32j+LHBbMITsNTN8J3L/DrFk?=
 =?us-ascii?Q?5Gr5mPdqtM2YEXkZTYaf2t2j1ACB9ibmpcn+BdsoULl96c07RKfG6hRO4kn2?=
 =?us-ascii?Q?QuHQZe9i5MyAbfPo/W8NcxHA786NH1Xzsl/7oH5N3oIAO6QB46Mv6XyxBzmt?=
 =?us-ascii?Q?1GiJTb43z2saZ/bMKp5s12P3yOcuAPTvmB/n/Okor69bqA0z1H+FKABIzEKA?=
 =?us-ascii?Q?ppwb8uCmtPFdVpN265hm0Pm0dEMVP5gufSS9QL0OgGw9cW6Y3pNu/tvB4i40?=
 =?us-ascii?Q?23vKDEGO1tius4Msb1jzVsEeYGSY1oUkT/JtxbPw6CHqOmQcU1QtJuOxcdsh?=
 =?us-ascii?Q?tAsZBcBLsMPH8tfzB51OosRjiLZbc/MtmFFjyVriOEDuWRmktn9kTDYamgqW?=
 =?us-ascii?Q?ssn8F7KWdcUphRhIEndt/zhRJ+E6X5GVCtLBJ1KBud9EZH+1T1mNFxBOOITd?=
 =?us-ascii?Q?6dxdFKVSp26r5K3DSCY9jfOjfr+/6jDQ66sgNsrAqC3hmWugr2NtV1arQtpG?=
 =?us-ascii?Q?7YE1pds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9rE/xcM3e6ZGNpRMShK/bbR/a7bzQCNEJwDaw5uF46DnP6C23VJW8O+JUrBI?=
 =?us-ascii?Q?Tz+JcEhztGF3rIjd0KZDw2+TdcOnRZcizuhoG/FknwAzPC//rUT5ovM9qZ/n?=
 =?us-ascii?Q?p9a0e5cbFF9MKsAvgKndjJ1LkYoCsOfotK6tGOO9/XJE31gqjglHiLM/hMtB?=
 =?us-ascii?Q?6Dqn0v4wvaKApEN2xzudODJ8nuAZ5eqyXVTnpF6gTjCRqasYoy/S91IrlYuF?=
 =?us-ascii?Q?NQKY7g3PaWjg7o+p1reResylGzbSA2AOMY0Cpt4P5hUqqsYQ9TDHbY2VGDE4?=
 =?us-ascii?Q?HwTUczYLWZaI3/Ar66yHwYPjTsawJEac3fbsyEJ9LnJt5e0QM9U6AkYLo/aP?=
 =?us-ascii?Q?IwCF/sHFOGTycpJP5WQ29phG5AV+EUJtquDclUVeSFl4o+xu6i6ywZYtVeHx?=
 =?us-ascii?Q?IHdkel2OVaQ+IgmyYGgUl0fLv/kHNY2+b52TiPr0q2qpC2gyvrG0PQaYKIWj?=
 =?us-ascii?Q?pGcBtKhaNhwlnF+CHITaGzh09lpM2mVTfK87eKKrX/EW+wVQ583WimskIqHv?=
 =?us-ascii?Q?Dh5e6sVjSvT9tJCW6Uj4umsDnK1J6jLcMt5XwDsvan/I/72VjS3MrxHbpU6l?=
 =?us-ascii?Q?9hcfZaQPb2ktm3x1uiEbSANMfpKwYKCLptZipKqRyoxLQJhGby8MFKVmhjHz?=
 =?us-ascii?Q?1vGRVj2B+2ZolnnLZ8VezFbhZSOp++PGgJHMmnQOhCu2l/eZIc1seP/TrChy?=
 =?us-ascii?Q?GboAytGgZpLMLnkWX6VC3+8FrO5e+Ik7ckbcFpbPAT8jh0Q5ICheHYXKlNUU?=
 =?us-ascii?Q?MNtMwY0dxQh5CukTsx1Do33qd2YrfbJb1Q+PRJyYQAkH086lcnHD/Wbx6yZ4?=
 =?us-ascii?Q?kHAaLP7HyMlOADPRvEsK/lVj3q4B3E8+3TllgMM49tN3m6P3Mr96U8aBimwd?=
 =?us-ascii?Q?ZcQpJHCiUHNJo58dTDRj+A4BDfD1jyWziK0er+XEEW612tzxFhw2X8teFshQ?=
 =?us-ascii?Q?QBOmDDplSPWzPJnIKXewD11Owo7reeNpj2iublJWJ8u6Vin3ouCA/0jGAkAd?=
 =?us-ascii?Q?Kx50omO1ttxkRfbrHXpP7b+Le09OmxvrPKRI2sjkkxp1I0kqS6OSp7jpyqle?=
 =?us-ascii?Q?RgEGe/pEl+Ryrdq+wpIL4pBGpE4rT5elVg+8HcWhibn9LpVjduHx40W9X+O1?=
 =?us-ascii?Q?rUnqFPvX3BoQbnBlDvOekaJ0VE5EpbGzUy/tiuweepXtKv/K3V1mwj4XbViK?=
 =?us-ascii?Q?rSt6wMnziag17zMSnuqFtaWHaRG3hkkGTeXPqJQi9lm2iTURcDz5f8mzgvu+?=
 =?us-ascii?Q?96NxvcK4KuVKoXu1RebcvrPZyh3HDhB++83r90IQyG0lb8xe260mMIIXwE8B?=
 =?us-ascii?Q?c1DuA3Z+Y1mINgxYUyU5oDLxNfZdVOD2eTsLsQOBKa23wppcnOyvlduillvu?=
 =?us-ascii?Q?0lHhlCoSDBrk19paxuXwPmoagMgD43VKqSNRHl9HVrdIxueMQjZOzWetoN+8?=
 =?us-ascii?Q?o3VQBMy2H3OfKP8g7xo70Ku4bIUENGwI7X/PkluvqX70ApZ7rpkfvBrcZya4?=
 =?us-ascii?Q?WbBGQ94m8cNNj/mDNaG54TtEHG4aWH73QfPBAQq1xYTCp+tYxQx9a7wsVoaH?=
 =?us-ascii?Q?9QNLRLw6lSJKy6cjbwmKoDXgX/Qwc1BLCAvn498t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77b9706-d7f3-428c-a5f8-08dd127cee11
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:56:33.9056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QragDu6eCL3CQsDIdOIBJzlTqSUWvD5BRmjVsc96JUskriOcS2QY5lVQyMfEEfR0vrYp24HscqIA60Z2g2M9dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318
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
---
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

 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++++++
 .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++++++
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++++++
 .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++++++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++++++++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 ++++++++++++++++++
 .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++++++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 ++++++++
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 +++++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++++++
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++++++
 .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++++++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++++++++++
 .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 +++++++
 .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++++++++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++++++
 17 files changed, 1042 insertions(+)
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
index 000000000000..7f800e72c3f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Blit Blend Unit
+
+description: |
+  Combines two input frames to a single output frame, all frames having the
+  same dimension.
+
+  Each Blit Blend Unit device should have an alias in the aliases node, in the
+  form of dc<x>-blitblend<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Blit Blend Unit
+  device instance.
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
index 000000000000..351692d8942e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
@@ -0,0 +1,49 @@
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
+  Each Color Lookup Table device should have an alias in the aliases node, in
+  the form of dc<x>-clut<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Color Lookup Table
+  device instance.
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
index 000000000000..cae19bc05d6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
@@ -0,0 +1,49 @@
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
+  Each Constant Frame device should have an alias in the aliases node, in the
+  form of dc<x>-constframe<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Constant Frame device
+  instance.
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
index 000000000000..cb0b4a05cfdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
@@ -0,0 +1,49 @@
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
+  Each Dither Unit device should have an alias in the aliases node, in the form
+  of dc<x>-dither<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the Dither Unit device instance.
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
index 000000000000..b382af1de1c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
@@ -0,0 +1,77 @@
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
+  Each External Destination unit device should have an alias in the aliases
+  node, in the form of dc<x>-blitblend<y>, where <x> is an integer specifying
+  the Display Controller instance and <y> is an integer specifying the External
+  Destination unit device instance.
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
index 000000000000..2141e692bc02
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
@@ -0,0 +1,147 @@
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
+  Each Fetch Unit device should have an alias in the aliases node, in the form
+  of dc<x>-fetch<y><z>, where <x> is an integer specifying the Display
+  Controller instance, <y> specifies different derivative names(decode, eco,
+  layer and warp) and <z> is an integer specifying the Fetch Unit device
+  instance.
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
index 000000000000..e1bdcdd893b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
@@ -0,0 +1,47 @@
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
+  Each Filter Unit device should have an alias in the aliases node, in the form
+  of dc<x>-filter<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the Filter Unit device instance.
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
index 000000000000..d784f6e59312
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-framegen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Frame Generator
+
+description: |
+  The Frame Generator (FrameGen) module generates a programmable video timing
+  and optionally allows to synchronize the generated video timing to external
+  synchronization signals.
+
+  Each FrameGen device should have an alias in the aliases node, in the form of
+  dc<x>-framegen<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the FrameGen device instance.
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
index 000000000000..895501566210
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-gammacor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Gamma Correction Unit
+
+description: |
+  The unit supports non-linear color transformation.
+
+  Each Gamma Correction Unit device should have an alias in the aliases node,
+  in the form of dc<x>-gammacor<y>, where <x> is an integer specifying the
+  Display Controller instance and <y> is an integer specifying the Gamma
+  Correction Unit device instance.
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
index 000000000000..50c0c1dacb41
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-layerblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Layer Blend Unit
+
+description: |
+  Combines two input frames to a single output frame.
+
+  Each Layer Blend Unit device should have an alias in the aliases node, in the
+  form of dc<x>-layerblend<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Layer Blend Unit
+  device instance.
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
index 000000000000..8778526e1eb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-matrix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Color Matrix
+
+description: |
+  The unit supports linear color transformation, alpha pre-multiply and
+  alpha masking.
+
+  Each Color Matrix device should have an alias in the aliases node, in the form
+  of dc<x>-matrix<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the Color Matrix device instance.
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
index 000000000000..a724cf960250
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
@@ -0,0 +1,48 @@
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
+  Each Raster Operation Unit device should have an alias in the aliases node,
+  in the form of dc<x>-rop<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Raster Operation Unit
+  device instance.
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
index 000000000000..a1d6673f2a05
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
@@ -0,0 +1,89 @@
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
+  Each Scaling Engine device should have an alias in the aliases node, in the
+  form of dc<x>-<y>scaler<z>, where <x> is an integer specifying the Display
+  Controller instance, <y> specifies scaling type(either "h" for horizontal
+  scaler or "v" for vertical scaler) and <z> is an integer specifying the
+  Scaling Engine device instance.
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
index 000000000000..5403e3359fcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
@@ -0,0 +1,58 @@
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
+  Each Signature Unit device should have an alias in the aliases node, in the
+  form of dc<x>-signature<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Signature Unit device
+  instance.
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
index 000000000000..38d86e3dd6b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
@@ -0,0 +1,100 @@
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
+  Each Store Unit device should have an alias in the aliases node, in the form
+  of dc<x>-store<y>, where <x> is an integer specifying the Display Controller
+  instance and <y> is an integer specifying the Store Unit device instance.
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
index 000000000000..87f02d92d55e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-tcon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Timing Controller
+
+description: |
+  The TCon can generate a wide range of customized synchronization signals and
+  does the mapping of the color bits to the output.
+
+  Each Timing Controller device should have an alias in the aliases node, in the
+  form of dc<x>-tcon<y>, where <x> is an integer specifying the Display
+  Controller instance and <y> is an integer specifying the Timing Controller
+  device instance.
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

