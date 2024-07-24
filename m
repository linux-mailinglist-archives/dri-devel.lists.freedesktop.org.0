Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8980993AEC7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1296310E612;
	Wed, 24 Jul 2024 09:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eivzYkxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926C010E621
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hv+QWO6hXx9ihIg9jbpTAMd3EEx4HMPYz/15tk8WUMxDgOjz65Y1quObu09+A0sc4hG5ILw5jDE98XOcTUmbQhNXmvbtgGvgidzTIZAGr3tqVtEszogy2fyECRO6irGDb8go1w5M7mh78hEZJs2tUaRvaqdQXT9moRStJqjhSRVC92l93yMlcaliBtYetysn4XNg+PBB+N9OAUXM1kQxW9z/eAxhegf4Oa87fldVISj/PPBzvoXQ6bj79QG0BgnZPLQPi5HiH4+2DOGrdUuiuxFKuuMts8VHXrkiChksCOwHHax6oUe+zcHOyoL4RkxrA3BWFrB7LnPrM9FuUhhxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdtFu2iQUcEYEgOm3DWd/BgJkVXUCT/6yfg2jpL2dj0=;
 b=GVxZBJVyyWWfosuOyKWQXZTZIah/pVOWeAw64ChwhG5SiPnWuuQO2QLWuGXXUTa4ReeIb3ks0Z3Ga+VM4/9g2/8xMojwhf0wNBC4tGZ9DoZZSXO8Pw43Emdja5ueRSbcs1RVmP/XbgdXj0933FzIIFoeV7B6eMtUfMXHM3BFn/Yoo8/ehBISpC2w/Qlw8yEUkqTVxrtYpYoNN0Hc1wlkJ7uxl0UC40dRy8G6Bdo8WMrD448c/kZEGwrgSrTrT2z9376yHZmonM5IhF0ZUg6TbOL8RkdV/A9XwaWwwjbW9v5bthDpklNYv9Ql/rO8XOUaekmdd1Ukpag4WEgW5G2qlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdtFu2iQUcEYEgOm3DWd/BgJkVXUCT/6yfg2jpL2dj0=;
 b=eivzYkxx7oKLo1975wAXyjvb5usJ0HBUOYGNVk0QYqiYICXTVMiZbDVFzcg+yPKb3Noa23jasipBqqCDyPKlrT92eFXdDGwWJygFfUmaC40y/BCes2F2gJdTQwn6Ya6fnqXEsFbOvlTv6mdFivHFecZW03rtZUnkw40eWGlQFXeSHHktWStC1BvnqFhcoL+e54MCNotZylpOoH+L52Pib48+IOoIb8V+sEToJd7+bJKw4xr9MN3NdTVa1LkGUZhTUMLbsR46NuOTNfvVDgKZ0jMu5Jzdy5rdk36J7d+0oVWZtq3y4yA91N/snwHzR914IXAhukF1fLwTKaULHmcVfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 09:21:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:21:00 +0000
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
Subject: [PATCH v3 00/19] Add Freescale i.MX8qxp Display Controller support
Date: Wed, 24 Jul 2024 17:29:31 +0800
Message-Id: <20240724092950.752536-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7c0237-8dea-4c01-b4c0-08dcabc1eede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C/YXqYQT4EqiqE5E5qbw8fGg66yr4Su+xo1l0RhFhZDe71rK7XsS9xEL4mxj?=
 =?us-ascii?Q?OwytYpHpsIal3CBY1PuhfTTPmZ9wYg6SZo6rPnjH/y5OsSGV4yGEsnxg+xsx?=
 =?us-ascii?Q?KhmIZ0YQ8EB5N8wd8WxNv/tdndYCVZ0d0NTZALmGoswgesjpWcHRnsBaA6XE?=
 =?us-ascii?Q?ZLCx0dHxuDM0gMCClJPebCzcPy/rHcLJvshunMkSBQ883znoFjIkA0sk9ePO?=
 =?us-ascii?Q?3wkSR8Q4witw9SvzvgJ8ClImh+HFe7QU4vFWRbSIflVB3qQemrWXD/tPleJf?=
 =?us-ascii?Q?u1xeUbdPTqK/tbvDFmJkEODjZaIWd3O7Eo0GrB0QflTXNoRejqnDiUlufuQx?=
 =?us-ascii?Q?MYUBIKmuJSV25R+KgF6YBbOl6vuS6k2W7FwMy9tPft/5F647fAkJig1dhRB7?=
 =?us-ascii?Q?DkTabFk6yTT706Wr1sZ0j0xr91pMa1Bl+mZYxET21MvU+kgV3O623/LlbUsI?=
 =?us-ascii?Q?L3GJYuE67rIIBxHpUMszKXfKIEnlOuP72aQjuLpPN21dna4HwDQSBqq1BnLd?=
 =?us-ascii?Q?voeM41qvx3zMfWjJ1ai9g8vsvAfyziwt6BF7wynrhQsNgwK2T8YEYNcr5gE9?=
 =?us-ascii?Q?b0YZFhx4ckRlIfFZvJHXgq34SPil5ICylYDjYRN7KaVncEQYhITaC8op4EMK?=
 =?us-ascii?Q?cEmqaAb75ZABDa6LId/TedPyFQR/fpHiQJMrCA/K7sVanIVdFaAEpZf8E94V?=
 =?us-ascii?Q?Vna1BYqcv5CN6BwJFwlD9EyhAfxi8pB0sgyuMR25bbjglXwYePmh6TGLLEf0?=
 =?us-ascii?Q?NACH3bJtN/8fJ2il7V+Sz77ime8p/P9tv4aGusImz6ri/2ytCE6B5xqxHb0f?=
 =?us-ascii?Q?teLBjeTRqRkZhk4GCsNJFS4BploUOsa9snW8fcaKPkPE6BHwKjdPsA5COfUo?=
 =?us-ascii?Q?mFdH+By/x7w5Yu8MzX2rq9Mlb7IKGUC0ZOUglCT8/7+DxWtbzk74oMSk8BeQ?=
 =?us-ascii?Q?WNVSD+a598S7muG94j6DOKwjVFJxhR9bK9TEpPJVYK340H8pu9Y7R2cXWAy6?=
 =?us-ascii?Q?clSR4OqKSPw4COLhWwCSdZP4jUGvYn2c7Rx6aGTX+xTfZikThnR6pc2FrRp/?=
 =?us-ascii?Q?TxpIvDfaKX/aQaG3rjcVyrM3p8nLPEmOtLiKeU5PQQwp4sXPDwQU9AH0CXsT?=
 =?us-ascii?Q?jfj3PXBUCVvENmckn2QR9fl1L+3mL8AH7FipDFz5h3932sVUCs/843rIBQp3?=
 =?us-ascii?Q?TjjrgEGUGPkXcVjK+JqCBmmlX8KTSuUJvuhqSX3U+FgZR0PyM5PuiUwISaqD?=
 =?us-ascii?Q?BpmWpGZ+VhdwR4+h+Dh5toOFjb+n0nIelMHJguBEGmrN5n+Xm0t82fidbxTU?=
 =?us-ascii?Q?wvAnHoOt02xSnew2z0jf6BBx7yXboJKv9uTuKIDwlPXxsQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dx0RajycGo+m381TQgCn7WkkERK5awBD1VEp1aaw0vIVHrXv8p/ZhoIfk+Gp?=
 =?us-ascii?Q?RzMIfaWZ3S30wGDNQRo9EX7WAkyIlGrpxi0Hg6Theo0mYv+XquGh4PJzjtxx?=
 =?us-ascii?Q?Rw7xMCjoMIsMkfc2j859xv/5uX0c4GmcM+/6SV0/VOIH+gdEtcKvRv4G1LuG?=
 =?us-ascii?Q?3bfSr47vGFnxGVAgi5ILrDUbi2l2tMoX0i16/gjw+9mX9XbH6uYaHquHwHHP?=
 =?us-ascii?Q?QcThv6rWAxUvKVUQOvvtTK6LZTxw5LzvUxQ4/o5C8kLXqM10G1IaMdsfJxFN?=
 =?us-ascii?Q?u9qZ2o8TsHFpw+Vg5A4pfAUVnthlTvjK28oa87cakUXCmpDES6RDjyw/3915?=
 =?us-ascii?Q?M0566LriGzB31ddLbPAdAWA50uoE57IMG5kzFQ8qWZS02WZbkeffe1yrNXks?=
 =?us-ascii?Q?HEWEmSnNcU4FBuA53O3MZ5XHlYrEzk2jxvn6ZSPbg7XCZDBaCyVFzC78QHwR?=
 =?us-ascii?Q?50SC428Z44lbTU47nEFGinJ1Pg+popFscUwvlt0p5+h0Wa5vzTEUcZzc7aI8?=
 =?us-ascii?Q?q5FU880z0Vk/q38YkN7oiVbzevVrizo+HeYQS/1Fl0j4yFIep1whyQw801Yd?=
 =?us-ascii?Q?82JVATKzpTszQJElR0Dautq2Ny1D49EVKf6NWFXnXdEof07DJ/hyUTkbM34L?=
 =?us-ascii?Q?DdjXDOpFluaavi2BKzZmTsK011SERG1zi0DUauLDc3tL4cHedGsgB2Bh8pbY?=
 =?us-ascii?Q?8o42xOY8VUK4PnTpUnst0VgfuzUqjFPBZjePq+GDkiCdaG52or+/6+9VhC+l?=
 =?us-ascii?Q?ckfAyJw/05DsvLSnVk71FykDrg0LC+Q1Kjoo6GWDT7yA7Kunnw6K9K9dmodK?=
 =?us-ascii?Q?g/HpoK/GMxcXU3sjrL2PIdpRRFb91I9TdRUABNVsazDHfyruFlmUZD6CQFr2?=
 =?us-ascii?Q?lP6Ce0wiMe5kawxd7th4cV9G8YsC3Q9DQk6iYmzMh/m3c7hE20p4WdxVr/BL?=
 =?us-ascii?Q?CPFyECCrw+po9IzKdvexoFmMQXuhu+jNCNaeYGv/6qKQppKouKpyeaISCFLf?=
 =?us-ascii?Q?NNc2kvEFOMdliCX3VyU/2E24SySLAq3gnalKIbjLVAsBRUUMOpfn+ew3uCBk?=
 =?us-ascii?Q?ZpdfGJZXJSyl09Vo5EJzYpugiTBy5+/c2JhywFlPdrnfLJB4vge4BB4DjSRS?=
 =?us-ascii?Q?kzaCydKVshW/G8qqjMzJPeAWaIQ8IZdb91KHYZRsODpcsgaJ7W/XucQ+5fq7?=
 =?us-ascii?Q?TDUzyHLqxmc27VNsmoEC+XtLQEoW8vOzDxhSQ18AT7ABxeTkxmqOx1Z2UY2j?=
 =?us-ascii?Q?q6kdYt9LwFWLXOHineQfVjtfNLq9Ed7wldOZl1TPkNNyrMFnu2kiMuLHUvPb?=
 =?us-ascii?Q?T9OlopvvVMDneVNwPSLX9oMxew6hJS6+fxC4cI7A9wf01Qx1mhQt7nTVOn41?=
 =?us-ascii?Q?1R0uDdpqte7WRz4krgVEfuxb2N0ARDAw+hl5X0yWHuSa2ApGb2VQMpY48Bxv?=
 =?us-ascii?Q?LgEdNFemidTXjuANUbpXJeyZuxIGX8IOThjWoK3E6rBE874VTG0Vg+yUkJ3W?=
 =?us-ascii?Q?aUXlK864AXOYE8FsKUYTkonhuKSCe5soIdWWhaiLXc2+KORODntgHMaofjol?=
 =?us-ascii?Q?v2tlqHCmp4L8+JhOSZVZQYi6H8XlEj5SFpUIoAQq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7c0237-8dea-4c01-b4c0-08dcabc1eede
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:21:00.7460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYdXemxc5G+9d7+BieE/zjc7oNexbkAh8pxoEK7u1ZKyKoqgi0ibBzpuQRz+RnRU9br8le2JO0srnWf/n7IsXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773
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

Hi,

This patch series aims to add Freescale i.MX8qxp Display Controller support.

The controller is comprised of three main components that include a blit
engine for 2D graphics accelerations, display controller for display output
processing, as well as a command sequencer.

Previous patch series attempts to do that can be found at:
https://patchwork.freedesktop.org/series/84524/

This series addresses Maxime's comments on the previous one:
a. Split the display controller into multiple internal devices.
   1) List display engine, pixel engine, interrupt controller and more as the
      controller's child devices.
   2) List display engine and pixel engine's processing units as their child
      devices.

b. Add minimal feature support.
   Only support two display pipelines with primary planes with XR24 fb,
   backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
   when necessary).

c. Use drm_dev_{enter, exit}().

Since this series changes a lot comparing to the previous one, I choose to
send it with a new patch series, not a new version.

To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
diagram and represents the whole display subsystem which includes the display
controller and prefech engines, etc.

With an additional patch[1] for simple-pm-bus.c, this series facilitates
testing a LVDS panel on i.MX8qxp MEK.

Please do NOT merge patch 14-19.

[1] https://lkml.org/lkml/2023/1/25/120

v3:
* Collect Rob's R-b tag on the patch for adding fsl,imx8qxp-dc-intc.yaml.
* Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
  fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
  into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
* Document all processing units, command sequencer, axi performance counter
  and blit engine. (Rob)

v2:
* Drop fsl,dc-*-id DT properties from fsl,imx8qxp-dc*.yaml. (Krzysztof)
* Move port property from fsl,imx8qxp-dc-display-engine.yaml to
  fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
* Drop unneeded "|" from fsl,imx8qxp-dc-intc.yaml. (Krzysztof)
* Use generic pmu pattern property in fsl,imx8qxp-dc.yaml. (Krzysztof)
* Fix register range size in fsl,imx8qxp-dc*.yaml.
* Use OF alias id to get instance id from display driver.
* Find next bridge from TCon's port from display driver.
* Drop drm/drm_module.h include from dc-drv.c.
* Improve file list in MAINTAINERS. (Frank)
* Add entire i.MX8qxp display controller device tree for review. (Krzysztof)
* Add MIPI/LVDS subsystems device tree and a DT overlay for imx8qxp
  MEK to test a LVDS panel as an example. (Francesco)

Liu Ying (19):
  dt-bindings: display: imx: Add i.MX8qxp Display Controller processing
    units
  dt-bindings: display: imx: Add i.MX8qxp Display Controller blit engine
  dt-bindings: display: imx: Add i.MX8qxp Display Controller display
    engine
  dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel
    engine
  dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI
    performance counter
  dt-bindings: display: imx: Add i.MX8qxp Display Controller command
    sequencer
  dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller
    interrupt controller
  dt-bindings: display: imx: Add i.MX8qxp Display Controller
  drm/imx: Add i.MX8qxp Display Controller display engine
  drm/imx: Add i.MX8qxp Display Controller pixel engine
  drm/imx: Add i.MX8qxp Display Controller interrupt controller
  drm/imx: Add i.MX8qxp Display Controller KMS
  MAINTAINERS: Add maintainer for i.MX8qxp Display Controller
  dt-bindings: phy: mixel,mipi-dsi-phy: Allow assigned-clock* properties
  dt-bindings: firmware: imx: Add SCU controlled display pixel link
    nodes
  arm64: dts: imx8qxp: Add display controller subsystem
  arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
  arm64: dts: imx8qxp-mek: Enable display controller
  arm64: dts: imx8qxp-mek: Add MX8-DLVDS-LCD1 display module support

 ...sl,imx8qxp-dc-axi-performance-counter.yaml |  57 ++
 .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 +++++++
 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 ++
 .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 ++
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++
 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 +++++
 .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  45 ++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 141 +++++
 .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  43 ++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  32 +
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 ++
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  44 ++
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++
 .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  43 ++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  83 +++
 .../display/imx/fsl,imx8qxp-dc-signature.yaml |  53 ++
 .../display/imx/fsl,imx8qxp-dc-store.yaml     |  96 +++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 +++++++
 .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
 .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      |   5 -
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 +++++++++++++
 .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  34 ++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 +++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  28 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dc/Kconfig                |   8 +
 drivers/gpu/drm/imx/dc/Makefile               |   7 +
 drivers/gpu/drm/imx/dc/dc-cf.c                | 157 +++++
 drivers/gpu/drm/imx/dc/dc-crtc.c              | 578 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-crtc.h              |  67 ++
 drivers/gpu/drm/imx/dc/dc-de.c                | 151 +++++
 drivers/gpu/drm/imx/dc/dc-de.h                |  65 ++
 drivers/gpu/drm/imx/dc/dc-drv.c               | 275 +++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h               |  54 ++
 drivers/gpu/drm/imx/dc/dc-ed.c                | 266 ++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c                | 366 +++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c                | 136 +++++
 drivers/gpu/drm/imx/dc/dc-fu.c                | 241 ++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c                | 149 +++++
 drivers/gpu/drm/imx/dc/dc-ic.c                | 249 ++++++++
 drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
 drivers/gpu/drm/imx/dc/dc-kms.h               |  15 +
 drivers/gpu/drm/imx/dc/dc-lb.c                | 300 +++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c                | 140 +++++
 drivers/gpu/drm/imx/dc/dc-pe.h                |  91 +++
 drivers/gpu/drm/imx/dc/dc-plane.c             | 227 +++++++
 drivers/gpu/drm/imx/dc/dc-plane.h             |  37 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                | 137 +++++
 60 files changed, 7598 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

-- 
2.34.1

