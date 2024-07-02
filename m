Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCCA923D8C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1F10E1D6;
	Tue,  2 Jul 2024 12:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DLfeuE9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2040.outbound.protection.outlook.com [40.107.103.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6956510E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEg7wyA7EoRmMzJgjG/Mjdfheecub9BJcqyiHNnRFlcXcbZoegJliAZmld15I375fiGszPcEwY578KmRa98tEN4IXTZmCbC9OtwFk7T8Y1QNS9r6P7ZnRykDa1lRXpFekRrDF7Nhm/y81k84NGy15pJWBbOSx+L0iWZXxVtsLNAt78Lu7xo29c7fBUM0eJJ46tdcqnK+wQUWAM/OdLSqmnqL3fMtzLOaJpTKKq9Yqz7BFvKJj5tUcayM8Ki6lqYnx7YNZqQvf7qAjwA4rjVGL3AnMvECURGPV/HEHEwMYNN/wSzuh7HgRm7muSKMGyM7qFU5K6/9qDP0c2kO36CmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/+A1hLb7I7xiEfHVH7CCWiNn7s3dUujZWHMB1ewwGo=;
 b=L8IOw9tIldJ9BcKx7iOYx7pAy3j7H+gvCV7kLE0gRMk/gyXc/6tEs0gA78fy93qz1/US37hDTNX2HyNefawfwJv0v5eBsOocASf8rm9E16ohyEeX1F85SOwVNfEyuAOeXxY/QT8AY7mRu0oKsGsAQhJvGlKgMTszvrIqObDK+ntOiMMHrivYU6NMjP6LqCep22x0wwbVTBMDKnh6htVRGj3njhmC/V6+ouvLhUn1lFsTO2u/7XNNS17KNDaCrsucZSbmN/9NKVa+p94tBFZl3rftiwE1+EyJWyjVfqI7mLz30nKZeOyekJj7QT8DRUCK2mXLOietGiLWxHH9AYAdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/+A1hLb7I7xiEfHVH7CCWiNn7s3dUujZWHMB1ewwGo=;
 b=DLfeuE9XpUOrkb42ayGloCcnv9nA9Kg3oSGYIvrsdB11MNDUvgizTdUP4SnwCV2GGQx9eVC7wGRoc3XQTXsKbIk4g2ekeOXhAxdfzMBgKf/SojdFU+Gm8+9P1iL2ZBqScd92CxUle1Hwl7gL5iglGQvw8gfd3CPSqBSklqeIJvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 12:23:50 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 12:23:50 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v16 0/8] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue,  2 Jul 2024 20:22:32 +0800
Message-Id: <cover.1719903904.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb7c98e-8a9c-4282-1827-08dc9a91d43a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DcoMzTkygPiWxjH6PCrj0xwLrF1Or4Aq48vrSYLXS2PnN63mlO4SdFJJYm6e?=
 =?us-ascii?Q?x7DBDRAuf1jPQx4R1DT/eZJSg98ClIVKawzSOmIm/fWqOLd809fPJCiwNuVg?=
 =?us-ascii?Q?W0BU2i1dQO0ve1Z3f8L2Z70bWQflSfErvLDGbO2uxWfJYyeIBGA/w51PChrT?=
 =?us-ascii?Q?tmMzzuSrtnWOqjjJsMslW0IQmBCew6rylcqqLinatFcEpZuhtZk1e8QdHurJ?=
 =?us-ascii?Q?hoA0So/k15KN+7LC4YJ87q3TIe2Mr9mMmzEy8iQD0SK2haehcb52Gyy5IaWP?=
 =?us-ascii?Q?go483LAX6sDxC1HwVVIEWp1iSVgtHiX+IEYfvSra+O54VZfxqk0wcFS2wHLf?=
 =?us-ascii?Q?ZgzlEFitKp7yhCw89/VnMzAwpIEFvy8msplT5EamILjhhYRtVctqc1SZAmrM?=
 =?us-ascii?Q?ClAv5kFaN73qu21I4htUIJNXAWjPr1afFhRsJn2OIxIqiIRhWO8uNi8Q+66N?=
 =?us-ascii?Q?DbMtuziYXNVPU76LXovHfXpSnFLiPO1WusKI6Ox+9OwBHrngSRNAc/UoAAfn?=
 =?us-ascii?Q?PUsLgf7kV2roxCuQo2Si0MKFRfkFyRm/vON5ctAi0TJq1iugRgiA1g3lhjI6?=
 =?us-ascii?Q?O5dAexPxd7NBsFFXOJujshHoEPpllSBjPea89iX98o10AGTeEWH2N8LYB9P7?=
 =?us-ascii?Q?7zmeO4RhalOqzI2ewJQGHF6vsFwn7nFee1AbBZGdikjlkwHChAQ2z8zUkzcy?=
 =?us-ascii?Q?MnwfOBad/BQr8PEBzNxY8iVBzAV/LlfnrqP6H0Pq6oaHuAHWFcVlJc+L94e7?=
 =?us-ascii?Q?0L98G+hUkd+NPbHy63ddVCoX6c58nbouivDoX603ivXUzm+AA/S49qaMIkVX?=
 =?us-ascii?Q?k6IMaKfmeOxKX3A3HaXAc2DOUoysEM9MvfRknzDp1t3zXBnI7Zm5oo/46h8q?=
 =?us-ascii?Q?dz2ZxJwzL1yZ5V2AECyAiC5bpIc+g/dAgOqnUeD6z0FCZkGGHsSgFVA+ACt+?=
 =?us-ascii?Q?DgNXvrIw9gr4viCjadSMsGbZDHi3yIvzPnIuOPS9CGAjN82TYrUAReFCmofy?=
 =?us-ascii?Q?Adf7UyfqjUsWLPaTjLnaCPFiwtLQhVxFk9NXuLu6NxWRg1CULUd6SQMzWL+i?=
 =?us-ascii?Q?LM0BVEV+AdUfKPJwdsP+h8W+bT6nEtJ/+JObuiiC+esRksn7kFMsQvcEL4zH?=
 =?us-ascii?Q?2VCwXNUxphf2hS4bq8mKr9H4Jn5YG+gXgxqXSRJTAN0qSKfHLWa15xbd0wS2?=
 =?us-ascii?Q?2M3now2T5ZHsTVfNn2ZFrMHXnMKeESnkM258rXB2DVjmVgW+0rS0Cz2RHJJv?=
 =?us-ascii?Q?6KzazAWEVJGLO7Kg0BTRqDl+qSvttTj0eRTueT8Bqpa40o5FGgZlylf4MbZB?=
 =?us-ascii?Q?T+6rlJF/kDjQW3/sg+hAvF2uaiyjAr0FMGJdXQzHeXoQ9aDWhXIDa8DMNi11?=
 =?us-ascii?Q?VKgTONs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VtZgzV+a72sKFwc6rACfxu9pIcRncRly4krdB+DGzepLVCSmjMD1XtHbjr2p?=
 =?us-ascii?Q?7vC7BNMe72ZrlJFrlEkKqYxBbiGe9eddNpquTA9gHQovRf7v9JXUuIrbEClJ?=
 =?us-ascii?Q?vM9GzQEbkElgIj+3nF4NXkPACHzXDwSfUyepNYdtTxdj6sbWZHYgFOaTnVFl?=
 =?us-ascii?Q?uRuSL2Upb+7ZcV5/T6rZrraPgKNoKvV9FcWH1yudWrNSKAWDWbsYmzVeDZdW?=
 =?us-ascii?Q?DedMj2Vp1oWzQ1mY9B2ikQGlXKPA3kzV4tbpODO622qCCDJ4QiYWG0pcqlTW?=
 =?us-ascii?Q?RqHa4Wft0FdyTqf0xytJCtjg04HcwSUqXB5I1uxYXbtu8VVvsHK4rlOvpULP?=
 =?us-ascii?Q?TLBges0gt1O/Eb5UDf0WQTh3ObumfsDDlhUEZz3yRaCi+N0faLpsfHuG3JpE?=
 =?us-ascii?Q?UEkTdkLcce5Kk1v5EdqQzRnoFc/j/4FrWtQs73+LP2xAXPBT+LJHxxcS/slz?=
 =?us-ascii?Q?zIIyCWChWOSzRgVxMeYWgPb/GhkUrALXN6BXe/Qeou8ySRKWse6ndEYueF8a?=
 =?us-ascii?Q?RdJYkZZmZSDzrKv/bjZOlrZEJWARYb9zA/XYPXgYEEYnHT0L3IYrTVn5fJ7c?=
 =?us-ascii?Q?CQ/SAK10ASLMFY8euKND98vVIemlg7S9egFZ90FXlMKMqO7JKq7XyHdl2j3V?=
 =?us-ascii?Q?PCtoSrgsYnpZg18Lpz9MYYp9GLtlwgzYqP+XNz+i+urQuurO+9p9DUBE8JFd?=
 =?us-ascii?Q?aAD9iAY3dXqLwhRVaz46c6TM/pZhaWPBfw0/RTZ3vliBuV2cO4/lr3mrVGzY?=
 =?us-ascii?Q?/Xex4cjE2lI8PodVPDWxX38Rwqi20eaadg0xC65j+1iN1CGcAJNbFOti5M4C?=
 =?us-ascii?Q?Ddx9Qk7VIW3r4VVLufUGJyi2Z/nvTYvQLig4u+C+V9fv+uJQ6TDntijebfaa?=
 =?us-ascii?Q?/nqqkMwn2uNAhm2E4J2StrgyZyTtb32XZLnkbWCcwcZAHj11WyuMqhs4NeKN?=
 =?us-ascii?Q?g/lS+npY1QdYXCuadF39QFUa9AVPO5ib0k60wMWt97GyqcfipAGP7Y1ByZrX?=
 =?us-ascii?Q?flVxPquiaf2vbsWNVY+P1mIXAy0wJwdeG6V2cYbqpQ78OogH218gSjhohtlq?=
 =?us-ascii?Q?RhJuj1bFBTo+rRVipDYzLtv2HbqzU5lWMAjn7kpjBeCttPN087tKi54Pu870?=
 =?us-ascii?Q?OadT0mH+TF4BZ9c7OT+Awz8oIIveqfn8piB7ahGT1hxRVSBj6CZ8ln0hkfdR?=
 =?us-ascii?Q?ooKMH4/i2ZgkE/1DNqpZawZt+i+/gkHE0SKmKlexMGFd3pyNJJK04hV4tZ+t?=
 =?us-ascii?Q?coP8vkbAfb2isJnl5LP4URS6gjNqZurjnlOy1tp5RYzKZ8gNqmCIX7TtYDAA?=
 =?us-ascii?Q?45TuMu/sO5XxUVaP3xdqUnv2+1F5Z7DoWf4ONURchc1eLkxn8EvvcGh2+HMa?=
 =?us-ascii?Q?gA+UzfWjAGY2bdyotOKDUNA8zy32f4fTDOVj+MBY2pQYK4jztxhMjLrXHp9u?=
 =?us-ascii?Q?zGI1xj3YG90v3N0cGeDgGrcYLMttRBkTQrStvZF6GToTxp8xFAMUJfBNnB3j?=
 =?us-ascii?Q?zmat7SSC7V9Tzk3fzFytK4vZZ4Ic8I8pE2faZzQUKIwEsyvhMdUQjpHg17Vj?=
 =?us-ascii?Q?UUVbnXZaRJxRidVv2iakLMW04eK0i9tPldJhzVMG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb7c98e-8a9c-4282-1827-08dc9a91d43a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 12:23:50.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QK81cbeh4UTnUldLNqmrLB6+yemhWMq7Cz0DMVeEueG1wRkTURKOmHtVMQzsQMMIByGRxXVQqCQB5S0uiv7zbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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

This patchset sits on top
Dmitry's 'make use of the HDMI connector infrastructure' patchset ([2]).

The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.

The patch set compose of DRM bridge drivers and PHY driver.

Both of them need by patch #1 and #2 to pass build.

DRM bridges driver patches:
  #1: drm: bridge: Cadence: Creat mhdp helper driver
  #2: phy: Add HDMI configuration options
  #3: dt-bindings: display: bridge: Add Cadence MHDP8501
  #4: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver

PHY driver patches:
  #1: drm: bridge: Cadence: Creat mhdp helper driver
  #2: phy: Add HDMI configuration options
  #5: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  #6: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ

i.MX8M/TQMa8Mx DT patches:
  #7: Add DT nodes for DCSS/HDMI pipeline
  #8: Enable HDMI for TQMa8Mx/MBa8Mx

[2] https://patchwork.freedesktop.org/series/130888/

v15->v16:
Patch #2:
- Remove pixel_clk_rate, bpc and color_space fields from struct
  phy_configure_opts_hdmi, they were replaced by
  unsigned long long tmds_char_rate.
- Remove r-b and a-c tags because this patch have important change.
Patch #4:
- Add DRM_BRIDGE_OP_HDMI flags for HDMI driver,
- Introduce the hdmi info frame helper functions,
  added hdmi_clear_infoframe(), hdmi_write_infoframe() and
  hdmi_tmds_char_rate_valid() according Dmitry's patch
  'make use of the HDMI connector infrastructure' patchset ([2]).
- mode_fixup() is replaced by atomic_check().
- Fix video mode 4Kp30 did not work on some displays that support
  LTE_340Mcsc_scramble.
- updated for tmds_char_rate added in patch #2. 
Patch #6:
- updated for tmds_char_rate added in patch #2. 

v14->v15:
Patch #6 + #7:
-  Merged PHY driver into a single combo PHY driver
Patch #7 + #8:
- Add DT patches for a running HDMI setup

v13->v14:
Patch #4:
- Rebase to next-20240219, replace get_edid function by edid_read
  function as commits d807ad80d811b ("drm/bridge: add ->edid_read
  hook and drm_bridge_edid_read()") and 27b8f91c08d99 ("drm/bridge:
  remove ->get_edid callback") had change the API.

v12->v13:
Patch #4:
- Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
- Fix build warning
- Order bit bpc and color_space in descending shit. 
Patch #7:
- Fix build warning

v11->v12:
Patch #1: 
- Move status initialize out of mbox_mutex.
- Reorder API functions in alphabetical.
- Add notes for malibox access functions.
- Add year 2024 to copyright.
Patch #4:
- Replace DRM_INFO with dev_info or dev_warn.
- Replace DRM_ERROR with dev_err.
- Return ret when cdns_mhdp_dpcd_read failed in function cdns_dp_aux_transferi().
- Remove unused parmeter in function cdns_dp_get_msa_misc
  and use two separate variables for color space and bpc.
- Add year 2024 to copyright.
Patch #6:
- Return error code to replace -1 for function wait_for_ack().
- Set cdns_phy->power_up = false in phy_power_down function.
- Remove "RATE_8_1 = 810000", it is not used in driver.
- Add year 2024 to copyright.
Patch #7:
- Adjust clk disable order.
- Return error code to replace -1 for function wait_for_ack().
- Use bool for variable pclk_in.
- Add year 2024 to copyright.

v10->v11:
- rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
same as the other mailbox access functions.
- use static for cdns_mhdp_mailbox_write() and cdns_mhdp_mailbox_read()
and remove them from EXPORT_SYMBOL_GPL().
- remove MODULE_ALIAS() from mhdp8501 driver.

v9->v10:
- Create mhdp helper driver to replace macro functions,
move all mhdp mailbox access functions and common functions
into the helper driver.
Patch #1:drm: bridge: Cadence: Creat mhdp helper driver
it is totaly different with v9.

v8->v9:
- Remove compatible string "cdns,mhdp8501" that had removed
  from dt-bindings file in v8.
- Add Dmitry's R-b tag to patch #2
- Add Krzysztof's R-b tag to patch #3

v7->v8:
MHDP8501 HDMI/DP:
- Correct DT node name to "display-bridge".
- Remove "cdns,mhdp8501" from mhdp8501 dt-binding doc.

HDMI/DP PHY:
- Introduced functions `wait_for_ack` and `wait_for_ack_clear` to handle
  waiting with acknowledgment bits set and cleared respectively.
- Use FIELD_PRE() to set bitfields for both HDMI and DP PHY.

v6->v7:
MHDP8501 HDMI/DP:
- Combine HDMI and DP driver into one mhdp8501 driver.
  Use the connector type to load the corresponding functions.
- Remove connector init functions.
- Add <linux/hdmi.h> in phy_hdmi.h to reuse 'enum hdmi_colorspace'.

HDMI/DP PHY:
- Lowercase hex values
- Fix parameters indent issue on some functions
- Replace 'udelay' with 'usleep_range'

v5->v6:
HDMI/DP bridge driver
- 8501 is the part number of Cadence MHDP on i.MX8MQ.
  Use MHDP8501 to name hdmi/dp drivers and files. 
- Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
- Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
- Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
- Fix HDMI scrambling is not enable issue when driver working in 4Kp60
  mode.
- Add HDMI/DP PHY API mailbox protect.

HDMI/DP PHY driver:
- Rename DP and HDMI PHY files and move to folder phy/freescale/
- Remove properties num_lanes and link_rate from DP PHY driver.
- Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-phy.yaml
- Update compatible string to "fsl,imx8mq-dp-phy".
- Update compatible string to "fsl,imx8mq-hdmi-phy".

v4->v5:
- Drop "clk" suffix in clock name.
- Add output port property in the example of hdmi/dp.

v3->v4:
dt-bindings:
- Correct dt-bindings coding style and address review comments.
- Add apb_clk description.
- Add output port for HDMI/DP connector
PHY:
- Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
- Remove unused registers define from HDMI and DP PHY drivers.
- More description in phy_hdmi.h.
- Add apb_clk to HDMI and DP phy driver.
HDMI/DP:
- Use get_unaligned_le32() to replace hardcode type conversion
  in HDMI AVI infoframe data fill function.
- Add mailbox mutex lock in HDMI/DP driver for phy functions
  to reslove race conditions between HDMI/DP and PHY drivers.
- Add apb_clk to both HDMI and DP driver.
- Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
- Remove bpc 12 and 16 optional that not supported.

v2->v3:
Address comments for dt-bindings files.
- Correct dts-bindings file names 
  Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
  Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
- Drop redundant words and descriptions.
- Correct hdmi/dp node name.

v2 is a completely different version compared to v1.
Previous v1 can be available here [1].

v1->v2:
- Reuse Cadence mailbox access functions from mhdp8546 instead of
  rockchip DP.
- Mailbox access functions be convert to marco functions
  that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
- Plain bridge instead of component driver.
- Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
- Audio driver are removed from the patch set, it will be add in another
  patch set later.

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/cover.1590982881.git.Sandor.yu@nxp.com/

Alexander Stein (2):
  arm64: dts: imx8mq: Add DCSS + HDMI/DP display pipeline
  arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI support

Sandor Yu (6):
  drm: bridge: Cadence: Create mhdp helper driver
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add Cadence MHDP8501
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         |  104 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   51 +
 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |   20 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   68 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   11 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   20 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c |  304 ++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   |  330 ++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   |  367 +++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |  700 +++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   |  595 ++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  403 +----
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   44 +-
 drivers/phy/freescale/Kconfig                 |   10 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c  | 1340 +++++++++++++++++
 include/drm/bridge/cdns-mhdp-helper.h         |   97 ++
 include/linux/phy/phy-hdmi.h                  |   20 +
 include/linux/phy/phy.h                       |    7 +-
 20 files changed, 4120 insertions(+), 375 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
 create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

