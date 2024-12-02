Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796C9DF918
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E72410E18F;
	Mon,  2 Dec 2024 02:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DnUmn2Hm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060.outbound.protection.outlook.com [40.107.104.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FE910E18F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:56:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR2ZcdCmIImy2kdyYz2PwdGLzwjhja4lRVLDr5v1UWkUUqixVJy4dSCmNCSqJQ7SFGaVdyQOmpxeP6O4TOFs09qaA6PbMpXFpts2it06sfjERq7ozPLjUP1moUvvWD2c+XSU8D2r6V1lT/I3jQEx++pNDNlSh3BGELGDKL6S3m3mgXMhkHLVxw0UOnMmqo91c+4qli+2qyJc/kK6q8OVdR++9SGbtimecxiIGOWkAKQ+/jTUQpo97g3UFwQnppRr5s41LdtYkdOg0eSsM+gIaCxR59iXINlXzgq0GHaPP5u1Q1LfoXN+jQcyBeZ5FUOKUraVaBEU6ov+kqMKnyWDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObvRQ5m+5bvci9F1q+utMkmEwEu8ySvyvYdecGRW6HU=;
 b=a8N+/IguwagB7DDkPizPD68YYlmgGRPmmeiYr0A/J4Mi0p11dWECaRSWpLtXEfkYchsKOYF42y3CeBrW9Ha3revuyPF614a25E7S8OCk7Si0LfDKW5wTKC4G9zxn3dA2O7nIGnBh0ihp07pJ3dY+cnwlunK3P8SeyjApUaRz7dHgfgdJlY+pkfAIwHmit4gP7jAB5jwXE8ap+J8IlO28+OSTnMNESVwp5dCn9KcQLVVEru9md5t7avKIgZRWk8aLHfBpKaXXiLOeu8T+CoD35bHY/ai6sFFw06NlATkbwYKfpKyTmNj4SGgaRu7hcTtgbPBG/uC0p9JjPyOm4oFCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObvRQ5m+5bvci9F1q+utMkmEwEu8ySvyvYdecGRW6HU=;
 b=DnUmn2Hm9eJWNrNIZCTdaK9wiqghBJdXqAcpAz298SPILO7z7GG8XzeIKgN5lDbqEnJ6OcTtDkA8cEaVP/1T+BRO6zXJPGI2lW5a+ECKbGE0QgflxyU8RQ09EkEG17fHMsNUe3DO2lGmeyenat2R1+0cFx6tCsPGRazfxa6UyiYJlg41JSBMIH7i5Roc01U5POgNLnk2SM/uqWeH0arSoFPj7zKj33rdnelQ2FL1enmVQ3r8Z5ES2S5HgqyKpQgLytFf0pNGY1sZdDs0O/UmjIU3kPl0sdBSkTVmDWeZAmYXJUmWayNIpQoxb7BiqtEM5vkEvgxmXoFZTAMP+gSuow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:56:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:56:26 +0000
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
Subject: [PATCH v5 00/19] Add Freescale i.MX8qxp Display Controller support
Date: Mon,  2 Dec 2024 10:56:16 +0800
Message-Id: <20241202025635.1274467-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: cc6d5c2a-eda4-439a-f5fc-08dd127ce975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uJNf/n+ZBu3Mw6lw9oaQqpAWDv8OJs+dLBydE0TVmz0wh/ZjYQrIEAkcZ6dN?=
 =?us-ascii?Q?B5Av22GVf0jDh39R/WmOZ0L/N4R4QL15Va7eifxFV/7FUCBWXfUpsPthWhfM?=
 =?us-ascii?Q?5wQFYeh1pMtEv8YeFoO9zKM6qOjzOpZt33kLR2aVEh0KXBR0bivdEbVl+ahv?=
 =?us-ascii?Q?Rd/mXFbnTIPRPtA2k25Fj2JmzMAdYxDxIccTKRmSKDaWp+cBM7nFUwzQjZFB?=
 =?us-ascii?Q?swI9XByLJOLMDe8BorZtliyWJau6C0alddX759f+zgnUjSvqtkG4NsD8kGLP?=
 =?us-ascii?Q?qvqStpbqrVeX+ev++beMJjdYoHH04KMDHEWiads7W0fLupbSqWcoiQ2m3p3p?=
 =?us-ascii?Q?1iwyXiF0aYNZ6xef6uzOD3OqwtEln82Pj0McXdrKepG3+7kfdBSnGkc1eAGX?=
 =?us-ascii?Q?qJlEtaGDiwLvm74qU3hmKI7+U+Vdnrv4Jas9XJKQWtMbV4osSvmWFguFqq99?=
 =?us-ascii?Q?pH+v7og5fmlZnXE7glXERs6yUn2NR+E0S9oOue50KiDzkp1vgh2zRTPrOA1z?=
 =?us-ascii?Q?2XoHwDUExRkTMD5deOErMvdIoL7aHtUJzcdjzHgplB6bMmpADYJ45BLdjHU6?=
 =?us-ascii?Q?ipVWNy46I48NP1WOWsnOEJ+NJCxTIwVwq9HOUoUdTUvLMri/8EEds4J9hFqF?=
 =?us-ascii?Q?jbXfdzkoSx/5hrtm4E1sunzgRo5rZz0rOecy7GsZ2eGoERPYFt+rEqcvJAt8?=
 =?us-ascii?Q?j1dkXIJE9rPe2tSM1vmnwBAmoIIkfea5tUCmN5ddXfpu3/bzSevT4lUK/EJ4?=
 =?us-ascii?Q?oPNawyze8EKchBS19YGNqn5kq8ZAEv22U3uB/Y/dbLPw0h7okgm7PVbkLwWg?=
 =?us-ascii?Q?X0mtPd34Eakmbx7sZK2KGZXph9mJM/7NJBN1pubfMDXtwoEA57WW0YQtPR7y?=
 =?us-ascii?Q?yTcYWCl9+/ZljFGFqRHLQV/XBTpKTHzw8ySM24iy76iJ5YywwCMnBvQ5lnFf?=
 =?us-ascii?Q?+j6O6t8tS/ZKW+FlJ/whEepZVWuOZgAVyBSU87puE90+owy9pByr6rS7vn9B?=
 =?us-ascii?Q?TWUAv2P0JySrvMDThiMLv0+VOe3HGHoEIdmhUe68RLnSZqM0PfV0e37S/kUc?=
 =?us-ascii?Q?jKwXGQy52gB0Ov/CU6benkGOfOiXjezrXQTZJ8kySV+DXZrzWROfq6Qkrov8?=
 =?us-ascii?Q?8KzikwCC9GApenivcO80R58Oe8WmGrdDzkl/YInqbTVGMpVtnkQlcBcG4Voq?=
 =?us-ascii?Q?9xVEC62PpaNrcVT2FTIjRioAfqH0ZBmE1VR0AUakMmG/2bUua9kSPyTLqsQO?=
 =?us-ascii?Q?PPgFNvhZbTuAVYQNh4QSzHGGQ5ynxNUzOcrTs1WNq9Ilh7BqLrbCEXqePAgb?=
 =?us-ascii?Q?0qUPDyGNNPXCeNypsCuzBooNa0sZ1JnDV57j60PZRDQa7GdgJaKESdEr6CHa?=
 =?us-ascii?Q?qwlg2xg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p7xMSJh8Ng6wha+tPNWkIH2BZZZ6JSn2NQJ99ASfPgeurzU+aevuDa8+mSgS?=
 =?us-ascii?Q?kL40UlEfxnMelFCQslmscS5leRT+KwjJzdhFHz7Mj/otdhI8NUQtTHczhbvo?=
 =?us-ascii?Q?CGG1njF06v6rEiU5uwPxoTNsQ9V84yXNbvGxrBuJ0b4yA3RSof/ni6+b3eOM?=
 =?us-ascii?Q?aZ8mS/9W3NuyK7CY09KOWez5hBS60zNrGZOrR3PcNQR7/PruX+yHTFbBt6ke?=
 =?us-ascii?Q?l445BHMjdB4rVZZwti6my6/xAFtQ/ECNaHyrkMnfIfA/JjgYDrCjpKlMXcTH?=
 =?us-ascii?Q?itoFSQZWAjybu8sy1AYhNYTydQJmISQboHzGbSLLitC7hs4M/bZRdIk3z12T?=
 =?us-ascii?Q?Rydr3cbeeMpYlNrwHrijddrooA2a2bjiJf3vtyYD20fqIJ+BENrjnayAdgjT?=
 =?us-ascii?Q?JGfRR7NO7gxTKKwEW3Ju/M0gKo3qUR4m10WT5lICm52cKZv65SHlbVCAZqpj?=
 =?us-ascii?Q?FEz4VHbnrUPa4GhKDmElk42D3M9/9SRYDIeWLkI/mxK5Ixl0ERQXh7G/f9aD?=
 =?us-ascii?Q?udEtGV6IFOiihsSIO1HOnqVcTZz8E3Abi4YlCOMBEM+SlrUgpiGezr02SvSq?=
 =?us-ascii?Q?3OFI9KkJvK2vAS5Ou7K9EtmB5zaNuhviykDS1Z2P8zZNG0LczuIQCShY1s1Y?=
 =?us-ascii?Q?2kAdzqFVn5aM5Zx8jKDW9TaZnhK0Wps+X4KJC+58EufImj5twRsJoWkE1y1/?=
 =?us-ascii?Q?MOkBZKnqGpo4592T66F1PIPaDX5QAAPNOWgJvXn43Kl4rkEf+XnuJVJAMgfL?=
 =?us-ascii?Q?YLLzN9IdsfRzpW5q1DkD1huvFKCOODmI5NkRb8zVdw6ZklkX9LJYz6V8ziCO?=
 =?us-ascii?Q?El68ZmZof1+XRJFMBLvT2ALLB48skRtzgS/6i42jvGCH4ps55rBzVw3zHh+D?=
 =?us-ascii?Q?lR1utNFPYENK8aPgTl0+n+um+tgjR/tQDaRZdvko4mUM1URLnL3fGSvHTUZ9?=
 =?us-ascii?Q?E67SJGSfb3AV0iMZ2fpVOaYePTEDLBu3PfA2es6AyeNbWUXvR/GzPtXnFf8X?=
 =?us-ascii?Q?arx7SVzz+Wh8w4pza9z6sp5NvIyzJ0sfOXjuYOM7/UKhRLJ7jUqFsSguB5QX?=
 =?us-ascii?Q?CPMoPdn8vaYrIDw3XjA+wAjKqE70ifUhx7p7ultbw6cCXobW6mFn3RASHvHU?=
 =?us-ascii?Q?gAvzNbxpksD7cuPMR7utd+Ox7nYeovFGfCEKiI4Af9cTBvXtZbZYPcrUtXK5?=
 =?us-ascii?Q?ncdKFNVI3fFEbe8Q5nL2rcD7+1aiPeG8G6nNjdvkdajjBiGpRgXDbAkc7uCl?=
 =?us-ascii?Q?nXznPCOBkGiFziVnK73pb9gdu3r4oUTg20K0omPjEg7Gq2VHnBfL3JQ2n7wD?=
 =?us-ascii?Q?MzT0uW9Bwwl+ahtIz07RZKCYBTCY4DA/WLoUGqSLx1hVagTh9ASXSi3hKPFc?=
 =?us-ascii?Q?VOO4rtDy2VV/Ek3pycQlnpL52nERhdkWaXTU28Jr4+UkwFS7vkZYgW+6vTwr?=
 =?us-ascii?Q?r1c8qn8BQxdSIXRtSL/Ur5LYLir0Jao0yuefAvtMGUNH8m4JiHsbyZJK2fKT?=
 =?us-ascii?Q?h6939fX8FY6eQeOF93k5GUTSj5HcRZYL6+9GX+vg6VczECKuyliUCTUFgACj?=
 =?us-ascii?Q?ebB58R3gX6Nkw4jtP9RjsRicTPF8s8vaB8oLVhSx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6d5c2a-eda4-439a-f5fc-08dd127ce975
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:56:26.1300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc91J7B5I7XKGzg5sM8FZ5v+AfuUh924jm9XqfXGS/bjCpe5mpS68nqJmAlV1DKqHLANanrZqI3uHcfk7BURjw==
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

Please do NOT merge patch 14-19.  They are only used to facilitate testing
the LVDS panel.

[1] https://lkml.org/lkml/2023/1/25/120

v5:
* Document display controller device's and some display controller internal
  devices' aliases in DT bindings. Hence, drop collected R-b tags from some
  patches for DT bindings. (Maxime)
* Replace .remove_new with .remove in all drivers. (Uwe)
* Select REGMAP and REGMAP_MMIO options in patch 9.
* Fix patch 9 & 10's commit message to state that display engine driver and
  pixel engine driver are component drivers instead of master/aggregate drivers.

v4:
* Collect Rob's R-b tags on DT binding patches(patch 1-5).
* Replace "fsl,iram" property with standard "sram" property in
  fsl,imx8qxp-dc-command-sequencer.yaml in patch 6. (Rob)
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Inline some small functions. (Dmitry)
* Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
  function calls from KMS routine to initialization stage. (Dmitry)
* Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
  appropriate .h header files or .c source files. (Dmitry)
* Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
* Drop dc_drm->pe_rpm_count. (Dmitry)
* Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
* Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
  Instead, put it in struct dc_crtc.  (Dmitry)
* Call devm_request_irq() to request IRQs, instead of using drmm action.
  (Dmitry)
* Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
* Select DRM_CLIENT_SELECTION due to rebase.
* Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
* Drop unnecessary private struct dc_*_priv from DC internal device drivers.
* Set suppress_bind_attrs driver flag to true in DC internal device drivers
  to avoid unnecessary sys interfaces to bind/unbind the drivers.
* Make some fetch unit operations be aware of fractional fetch unit index(0-7).
* Take DC interrupt controller driver as a standalone driver instead of a
  component driver.
* Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
  struct dc_ic_entry.
* Call platform_get_irq() from DC interrupt controller driver to make sure
  parent interrupt controller driver is probed first.
* Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
* Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
  rebase.
* Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
  register dc_drm_component_unbind_all() action.
* Request interrupts in dc_crtc_post_init() after encoder initialization to
  make sure next bridge is found first.
* Trivial tweaks.

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
  dt-bindings: phy: mixel, mipi-dsi-phy: Allow assigned-clock*
    properties
  dt-bindings: firmware: imx: Add SCU controlled display pixel link
    nodes
  arm64: dts: imx8qxp: Add display controller subsystem
  arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
  arm64: dts: imx8qxp-mek: Enable display controller
  arm64: dts: imx8qxp-mek: Add MX8-DLVDS-LCD1 display module support

 ...sl,imx8qxp-dc-axi-performance-counter.yaml |  57 ++
 .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 +++++++
 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++
 .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 +++
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++
 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 157 +++++
 .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 +++++
 .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 +++
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 ++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++
 .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++
 .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 ++
 .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 240 ++++++++
 .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
 .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      |   5 -
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 +++++++++++++
 .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  34 ++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  28 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dc/Kconfig                |  13 +
 drivers/gpu/drm/imx/dc/Makefile               |   7 +
 drivers/gpu/drm/imx/dc/dc-cf.c                | 162 +++++
 drivers/gpu/drm/imx/dc/dc-crtc.c              | 558 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.c                | 153 +++++
 drivers/gpu/drm/imx/dc/dc-de.h                |  60 ++
 drivers/gpu/drm/imx/dc/dc-drv.c               | 283 +++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h               |  52 ++
 drivers/gpu/drm/imx/dc/dc-ed.c                | 270 +++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c                | 374 ++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c                | 180 ++++++
 drivers/gpu/drm/imx/dc/dc-fu.c                | 268 +++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c                | 219 +++++++
 drivers/gpu/drm/imx/dc/dc-ic.c                | 279 +++++++++
 drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
 drivers/gpu/drm/imx/dc/dc-kms.h               |  58 ++
 drivers/gpu/drm/imx/dc/dc-lb.c                | 319 ++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c                | 133 +++++
 drivers/gpu/drm/imx/dc/dc-pe.h                | 100 ++++
 drivers/gpu/drm/imx/dc/dc-plane.c             | 241 ++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c                | 138 +++++
 58 files changed, 7837 insertions(+), 6 deletions(-)
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
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

-- 
2.34.1

