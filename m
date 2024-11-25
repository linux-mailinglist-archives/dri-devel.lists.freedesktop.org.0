Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6519D8250
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE0110E3AD;
	Mon, 25 Nov 2024 09:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HbG7q94a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2046.outbound.protection.outlook.com [40.107.247.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A807110E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bz/Rwu5WQDiP5wAStuXqxmdVLlGli1c7K+Z/8wHCHVg2QXW1adUm0QWxguzsrlidMbvBvIqtuXAfePXZSxXmrIqrfe+DgrvPXJJeWm3sS3LwaDk6HXuqTdB5OMw/x8yNATheEQssJfDe0IdAnhqgEwiY580bGD2EoOgAdZS2ujk5XUuG9QdNwhhB7mTdZQm+rkv9tHwJ59pXZlC1t7rtKD/GnoLBjmQIw/xSWqvPhHRomYXKTHmbgBj2xXVtO7I3NQpac8GrMtYnaUJQW3fGudHN7Xa0MHrRFw1ck4AZ4X3aSVbsdBu+fbXnDeK8EpdVaPFUFNYFOs6pwnI34kX4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbTRIkNKxBUYUCHInmYYTdAAzu8R1X07jHmCvZj07/0=;
 b=LwRQ97saVQbKYEvpnEiYOSUS076doIRv2/P4TP4fm03eTWTlzQKgqsCrJ849TlzxERoLxEHHYXcj1CadGWPgQHFzJvqzr6L130tgaDj0Mpjl7oghl0cymnT9xJ6Fj67q2szfPOC/V7xTP4HVUU1YoFu+RSNFy+d5uFT843GA5VkgnlhGV5jfW0e85FjGSsEdzQxCsf0ioDu7a8ZGi++aMiW56dnF0cl7RvIFwQEmlnXxIbQl80fHDw7I4WBlMZv1DupsjgojZr5jgAj9SwAIbKE5lsfVgX5UCImHbhcBd6bwvALz6xPtiVJoZiP0QyATMmoH2U+GRLxdohrZ7Lb/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbTRIkNKxBUYUCHInmYYTdAAzu8R1X07jHmCvZj07/0=;
 b=HbG7q94aYHYNN/eR4zwOrKmVIkunq13r29kwV8LEhhw5I+1W0dJB2xhEuVT/cDnIfIkYTL/2ufnPh1rdEvKc4KcROv3ltCg6LMY9QWTB4uGBNYJj0Pjw+qtKDsaoR1u9XA4IcQhS6m3gKwgQR9yYYJ3I+LCTzH76TwrR659xOfcPhGNTfxhW1pOMknROWyTRuG51uUbdcWqIHfDzPBo4Ktguujt2WUXI9vuWlGoVO1FFWt+2h89iRWQqAq0Mr3+7J+UxruBO4q43MTLo19fi1+2q02KoyS3c2EQmkHW9wiyl1wJtydb2iwhYB7bBb/7Q5bu59JSmpW6NmuSW4inBwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8970.eurprd04.prod.outlook.com (2603:10a6:20b:409::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 09:33:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:33:07 +0000
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
Subject: [PATCH v4 00/19] Add Freescale i.MX8qxp Display Controller support
Date: Mon, 25 Nov 2024 17:32:57 +0800
Message-Id: <20241125093316.2357162-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c5afd5-3c4f-4fe5-7169-08dd0d342ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AqsX+n2mcmKYvCGHyHvZrJgVVEHK4Ic8ZeDadlxdqtrLl03ONox41L88vdOZ?=
 =?us-ascii?Q?RU2uvPOnYKybWJur82ttYM0mxsto+NIVLkNWEBlw2s9SRtEihx2d/kScVc8d?=
 =?us-ascii?Q?es9zkDy41Ltz7j+bdiAIcyBsNTRFsJVJsO3LWFNhginbbz6An6qW8pWd/4zT?=
 =?us-ascii?Q?/cfcmXnwWjD2bj/JNmBvQ22I9QUbpchBhrynJBryAWA5C8P0fU9vBtnpnoqn?=
 =?us-ascii?Q?yT4PS7tkXWGdqwwPcmhGe20PD37SDXn/gPfSDhkdRqzKRTL/uS89RjidpmnX?=
 =?us-ascii?Q?bYOJmY50f6sH19tQyrcUR2/jMBna47h8qkXQbTKc7JGtvCrfDlqsNUKelP5h?=
 =?us-ascii?Q?qZAp+d4APeES+xA8fWSoPeuOIKBuGQzfMN0osZZPcqq1EYcfi14uggyN2B1+?=
 =?us-ascii?Q?PoR3SsSpmvlEgKR3Vajc6JSAIiBe4d5inDabP7uADKg6MdNwsqpGpvwuxFln?=
 =?us-ascii?Q?31MUkW9q/Rd3qiOn2tD6O/UZkAMaCqjBy4PnAdp7qd9DVszy06vXvQNuuq9r?=
 =?us-ascii?Q?b8ji9ixzP0hyJmej1ybwmgNGRSZlJz01oG+MhWRZwFEwbzLjW8lPSYPLRvu3?=
 =?us-ascii?Q?b3Ae5kQaqMhg6DccJvrylTO5y4iuB4PfI0HHonzeqPoFKuJO4jq156aRP+er?=
 =?us-ascii?Q?UWobSK7xA4di4L4gWJg+WB61v5agmeSsoNi1DgZyhDiEwHzh4/ebc40et+Ea?=
 =?us-ascii?Q?6LoHHzuDKC4yTdXyh/Aj22ylAE1eT7QTZ+DOC2Y8MUveW+A1u8tfe1hYXPKz?=
 =?us-ascii?Q?C5E93sVlqMmCHa+QMMZw3rMYP9HdQlqMVrELUZgVJq0JynZnyzhg25zBYnvc?=
 =?us-ascii?Q?Xe2UhL35lasxKhLPD2sVwlEOW1P2+0DuSIUbgJn761DND3juYmi7/WUPkZfr?=
 =?us-ascii?Q?jaqU83jN6YAIUeT8VcBjQFocrcUjTJGbPT5w3xiPEsxMb7lXhKxZ6hs4+JXe?=
 =?us-ascii?Q?7pmJjrweWuSDkVBs2cg7ykQoiIf21UOKtwPzpUPnj0WXYqsGKvJDy08tos5I?=
 =?us-ascii?Q?lPr4jX1EaS939nx74LZcMHlS5NKKbDix4zaVoeXtn+i4uYh2s1EEjSLQT8AV?=
 =?us-ascii?Q?DuMKQsmLAB0BMjs2DVV8pQc08JL6FbYVM8VR8foJfjsLUE5jg/cLI/y5+/JW?=
 =?us-ascii?Q?Ye9LhoFZwVrZnyFbKeenb/z8j5oE+dQbePKm2K3bi0TVv4peKsuUGUQHeTmi?=
 =?us-ascii?Q?LISB0+T1akaEfcEWU/6JLZPkWLuUpdYcYpmNb1WSPGXK63cb5/E67Dhc8iVA?=
 =?us-ascii?Q?bp+tkewOJKO3UqmUFL+b/eWeOWkukGgKcIXixDZ8Im/N2aj6sUuFMkWIifAw?=
 =?us-ascii?Q?W5JFwfSrIMgLXmNwJyfufAnCMsDwBgKu124g9xkA7MY+sWSX+4hreSahVidR?=
 =?us-ascii?Q?qUHVxYI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rYYrFCDiTKypQ+9VD66taWuALo9DBB6QVzqPXRzgL6Sum/nJQ68yCwFw1b49?=
 =?us-ascii?Q?m51v8mOybotJXD1RDtb7vuxCmXgIEANKDt8x2g8CcwU1IFDmXEUaXhDjEu9Q?=
 =?us-ascii?Q?+X7/F1K0AAveY2rwEv8KPT1z6bd9ZUq7cs7Bjkl5dQvfQCHxbPJUFSEWlyiB?=
 =?us-ascii?Q?C6SAvR/ArchjFnBEyhX1rruvLIIcrSga6rttlNBYY7uOXVpQMvEbBXgDkOrB?=
 =?us-ascii?Q?0E+EuLp++g3VH3yfQIFGzEm5I7fWu5oi5NclI/jJHzzX8bn/8OVCkX3Y6UQY?=
 =?us-ascii?Q?5UrJMNMpijKGA9Tm9SDN+40gL648g+88WZVkylZK0m+LiJBT1Sx9LSJ7unkh?=
 =?us-ascii?Q?J3wsTUorwjDfVHKP9IPSPEAdp9dvO05ueJE0ptVG0hQxz7Hap/Na1R3WavKZ?=
 =?us-ascii?Q?hJNcgAb7Cn+FkkoxNC+F45zu7X0UIsHc0MJVXd7mNC4pT4FiTChkS2k2ZIZq?=
 =?us-ascii?Q?oJ6HeP3eZQD+4wEPqL7oLwTQb4Iiq+UWmUbqv5h+ZVX3E6bov/0Ne2Mtc3nf?=
 =?us-ascii?Q?A0xCFI3+yxt6rzYnR603mjMJFACtKGUP7GIE8PGrj7JbZviMRSULL1feZDsX?=
 =?us-ascii?Q?2qVmABXDdVpTCOefxzdKLeRNXXyS2GGGr7olQUoh6Yjl9GF7jOclSXTb5Ags?=
 =?us-ascii?Q?qH8x9VnJL/iyNoNdcuCzcqOUaCsGiEer14B8dI+iGtUTlaJE48dwFkvikMCf?=
 =?us-ascii?Q?++CbyKcQ9bT3ZQzfDxnUzV3AhAnIv3KCv3WTrTueMNbKW10Zf8uG377JZ4nQ?=
 =?us-ascii?Q?Hs6oI5q7Y3m/yeymoDq6QrINldWDAbDAgwPiUsgkXCgdxZ8udqGbJjEoXd18?=
 =?us-ascii?Q?6tlH6hc9Wa8nxPBG4GnEZOlns5vblcb69tvRUyVDjRQAXjXory7KFq76yV2e?=
 =?us-ascii?Q?Qd2386Swmx/TdeAKjOnIg198HIh1VayqySpZzUpm0lwI2PA/2etsRjnlefZ5?=
 =?us-ascii?Q?+c0MIFZO/eWZfARURvoQ1B3e0RM75rcMH5EBxGEvQMkHVlafQ+7YuQqr/LDW?=
 =?us-ascii?Q?zlRnhPkjEI8UL4/H0x2QdcKDHQuLgvcS7x3m+/dgtSkrsxKDXumUhYBnRIpJ?=
 =?us-ascii?Q?VWReL1BC9Spzc7syhsi1wv3PHrt2/R/Uu8s2+0XZKlk3kIz5/pKF3bwsUzep?=
 =?us-ascii?Q?b2zmWV3Deg1TpzQdf2xsAz1lIlJce+aAhs4Q4X5IEHn21DnSyzHO2duSmlRc?=
 =?us-ascii?Q?CwCGL4dCseAzOyQMvViAF0BqFotSR/Sm72M7r0jx+W+0Rt/GvAiH2qTQX1Kv?=
 =?us-ascii?Q?MULGabjpyury+soJdPtmHE4/7kUwKZELMEqsVHvEc4PA+WTze4mLom2JpZKX?=
 =?us-ascii?Q?9dhqx9PsX7HZ1tmPyMvdvcDDl3Na3aDWCBZYsxqqBqfe+K6WoZqDzvIOt9oV?=
 =?us-ascii?Q?xVY7+tO9pPKW1yVRKLhc3Aax30BbUpHV9j/3qY11NtRSb8CLl5eCdRXyQBjm?=
 =?us-ascii?Q?JLpNZi0fM3Z90LXQZaPH1JLjdmB7mptyZ6tWcalqFrDrNgF1CoW0CWC7TaNS?=
 =?us-ascii?Q?MZmsYKqPp1G1Mi92zFbemJmH53Hf1b9XmP2xtUhEqprSfS5Y3tmWQi7zAOMT?=
 =?us-ascii?Q?Wz04s9f8a0+UkcvDsClD4T+rJvRGMW4Se61kzH5k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c5afd5-3c4f-4fe5-7169-08dd0d342ae3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:33:06.9005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81GRxYRLllcO0xdOpdpo0bl2WLcXF9FYeXabvTgpZJqE1iJgTe+jwZsWVgcyNGmdJVgrYKKBIhhSlk9rf6fyOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8970
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
 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 ++
 .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 +++
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
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 ++++++++
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
 drivers/gpu/drm/imx/dc/Kconfig                |  11 +
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
 58 files changed, 7747 insertions(+), 6 deletions(-)
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

