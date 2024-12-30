Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0C9FE1C1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223AB10E2C2;
	Mon, 30 Dec 2024 02:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Cw/MTS/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0FD10E2C2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQVz7ncMF1MTOPKcHdsGN2OHQTLl9ylQ9wCvbBgKKqD/2uzqjXBau0PavWOoe0t3Ho7AnDaSKEEez+7/5TDNewkD9uRaFfUpkrbIAHkaOQlwwmYY6z9+ovvJXgaxhvd1ROpHOJs1XTp3LRj1QItq6/mNz69nn+zHr/7ouuP2YSGn4O6dXM5n8BwtjKUhP6lz8umJiRwY1YGwmySJauFNuqeyGInGL3qHnBnKUgTDDLCnXacbuCwIhrp1047VMdG4JHZVJD9CjqMK2SojTMozuNF4Zhz3sP+rgziH8jk6K36oKH2OpeqSMfcf/QNwJIuOwJEz3wyEoAdQUn5mk5zYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I41gNnszrkQZASBEPT7iFnpq2HJOdfmxrxeoliw2+0k=;
 b=r6f72pQ+uqFXuh/WFkoGFTDAhmKGponvU6RYuPgSoBVTKLPUt0/nqoAl4au3qrJL2XTqaQzRqi0W5FU0PAqGktYwQpMDXnliKd5KVyW7744C88cOLZwWGHLGzYi4Zn8y6kESPtLbLliZmzy5CosNyOBddubMQovfSLy2bRNjUH9xrr8tdSkqrT4u3uOXOI8n3CeWC7IMrvHH6JCRWefNWOeA6kS4QK9dYL1F7XQYT3AI892OLuEEpoYW3VPMkv7vDV7gLCmzwkP+pyq6/LbE0U+1P6YCUEyFz1B8sgLtdXRdDwPKyKWB9ut5iXjfMwx6G3+otC0qERmRtNrpjQpxLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I41gNnszrkQZASBEPT7iFnpq2HJOdfmxrxeoliw2+0k=;
 b=Cw/MTS/0LI1bbPN06BKoyKu1TJlfuvOGdjWHrH0p3ZJKiR5nC8lAM/AWTu1KtUggiwk0hh3Roy+vZyZUpKpTpxtqqiPfSVSctDViBf8wi2KPpo3GVLTIMmiqWvv2IH3aW1VoYeWwyWZqgZDHwhjnWgCHBOpGgaxvdvobALRcVAgMaMBxoUQwCPLGE76CirbkpJBG6rWQbL814LRSF+ISQGoAOQN+a/Y1NqYUA1QXC1hYFTBBPN3dixmWQEsBmM/q/HrOjSqNIxQ7322+muCDkz7YiHkFWV0XP71cf7fO5vy0yVTzxpYOcgngabcrMW7WROpA14/6DPdvuFju5Ez3bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:12:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:12:04 +0000
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
Subject: [PATCH v8 00/19] Add Freescale i.MX8qxp Display Controller support
Date: Mon, 30 Dec 2024 10:11:48 +0800
Message-Id: <20241230021207.220144-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc9074c-a8c4-4a5b-baa9-08dd28775a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CG+M5m5sZtOEV+3B7+F2A9x3mpp8iIGofBP0iDF98UJrfEoSsxQQEdO5VoOC?=
 =?us-ascii?Q?SmOTu/jjnYNkyMlUjCVLuI9GQ7JM3Awd1pajsCVRLVHiL98jTOgfNGjUD2Ln?=
 =?us-ascii?Q?AgAWyic6lE32d3C7yDWCo1/ckqZreT7axXXZwmPSgkFUlsEjLS62JptSHwAN?=
 =?us-ascii?Q?Vzmfi99S4Uo3u4qBgEXqJ+glCEP6oRtXwUF1aZMBA9tSjxS94tsh4+YQO2/q?=
 =?us-ascii?Q?UsIxPQEFlQ9ebz3SP4/tzmPOmWkYDnAWHOaBrXT8MQdEdzuJfUaR6ergNtMN?=
 =?us-ascii?Q?0wvqPu8BM5bAQQ/TvmIok23iwiQ3ZlKwAqOBqCmyPHvIUBcoV2vak+yS7l4l?=
 =?us-ascii?Q?F7WDPNP82Ln0bWOSSaBKqNEuKgypFTVJwX7TdemWxAwTmBcWvGwoaxEN8iQ0?=
 =?us-ascii?Q?nFs/Dyex6vXg7tjiz07ZFSFmselN8slbvZvHtnAjER+nU0e0WOKKpu4lkayX?=
 =?us-ascii?Q?RLekOgEVBU4FpvQ7DiGbRJbRBzqt4S1xq9KWRPTw6oeVAsp1+0M9kbQnXE0Y?=
 =?us-ascii?Q?xtur2Q5/zC06YuW2V/WoPr3he1K5VuZOizzVARSlVY+JdxwvirhhXDufQwI6?=
 =?us-ascii?Q?Sgb+q1Ae2S3s9EorK4szFF2iadPwjYRg3XkhH3QkpAKjNJvoOLW3ulV42HW8?=
 =?us-ascii?Q?Xc8mudQ6NetwZs7YdngczCR/FN91NbhxvFClAHfz1r/bwPeM+7WJzpkE4DoW?=
 =?us-ascii?Q?FFcUWKUsEU5zLPWuQ+wr+2dKk5EnrX92W+1bK1CYPT/w940HynixTIP7/qDG?=
 =?us-ascii?Q?p7x7gliyMHKeP28eYfbh/VaGlHj6kInrGiwO+YHTCb6YtVB9zxwHZHIvi3UC?=
 =?us-ascii?Q?nN0Mabs9Z3FZ1c6Jpnr2ZiPx/ES0g1jbQGcd+NfaQZW+OO70S4Yov9iKBv+3?=
 =?us-ascii?Q?h20v46wprO3LPaC2K8hOSvx0bXO233uyRRJcaDqPR2kI+MvT3YS8I6BFWjlV?=
 =?us-ascii?Q?fXVuRFLRjMQ5S0SW9g6R7LA0rCI2GwWm2B+aLxHH5tnJBlF8gSzhqY0pIN2y?=
 =?us-ascii?Q?4v5VrTJc0xDxzLgM5OI46R9IIgrOdhLUWsAFGsEiKMiBVQvKXQHpdIwY3yri?=
 =?us-ascii?Q?OxnAiTznm1W2qaxIE2QZwuto8qRpb/f95Bq7isg4q6LtmSHLM8AAn/4d1kI5?=
 =?us-ascii?Q?Ow3q51gTRWOqWswBPv1ZjQbZ1+QTmxNZDP/UI0AEPrRRdANi5YoDwVL+YzRb?=
 =?us-ascii?Q?ehiGw2hGkELWy2IYylYhL9l8ugQOF9Nemybqle2ZplV8+pkrGl60G3DCM5/B?=
 =?us-ascii?Q?VFHr9BX5EoxtO4dLcdOo3dLtS9pzaGCYxMhpv48OyVuZvTgdXgJWHGLNkAIo?=
 =?us-ascii?Q?BnYh50gPLPmX01PflC4DvQ104Xh4/CSxVjfT0Uj+niHw2I63jVKxApfWZnPM?=
 =?us-ascii?Q?2EdfCuR7NEO8atrF8qlipH2IDvKk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OCzcO2WZT/iP3YJKmekryef6tPLaV0DSzuh9bEHuy6QWzrUGG3JhkcpLU5gx?=
 =?us-ascii?Q?GlTm3d+ji4oCCPWxykOLMTroiLTVnyzYHBXv3lyvbIVIZgKUrnezkczjUQZk?=
 =?us-ascii?Q?/7Fi6dfqqTtgYFIKj9/WqFS8qSFvsKgcRc4pU1JMCLqA/k++5iSZxKtkZT6m?=
 =?us-ascii?Q?lB9+5zpxUVbZ0kNW3HWa/nYW2Q7uMkAYcxsGnu0tNmXOAHzFNsiCJUBZ7WbU?=
 =?us-ascii?Q?qSNT5w4bTpT7IgIihJEgvGJC19Iogub49PpkJ7hDp7Z942yParid4rVbU2gB?=
 =?us-ascii?Q?zglxJVtSvTAB26ox/W8ejWjjOZwX0Y+5W5QAnRMyrrVbHlJgjtS52uuO2EGW?=
 =?us-ascii?Q?qGu0l/Wq/Fn16upwnvMY5aQpLyE7/LP+u6U3VMT76ROsx4dUdJb/B+zUOz7/?=
 =?us-ascii?Q?Nn+cgGjsjeCqPzPSsit8N4Ych+IgtVzN24uI/uZg813hEhGjf+i6im26vecq?=
 =?us-ascii?Q?3d4CH+a6ukyXZRLdK24xl9yIC/tNYvKG4evdfvmBxrSFCnZlZJfowTu8TGgU?=
 =?us-ascii?Q?7jww4bHZEaLs/+WK+lXzrJGGMj0QDkWUPyn/OBKYsk8xMIV5So11/ZvilBsL?=
 =?us-ascii?Q?NoAdxyNXJERpOS4AOB4FYZwRwbFPcuAaI6qMjSVn25tXQNDp8alCapP3Ud5o?=
 =?us-ascii?Q?6pudm63bxKf+WQ6td8TC/eDzqilq4tJgH87lB4E6Qa6kOt9lPqcu8hWkF+NP?=
 =?us-ascii?Q?YufyjZpYXStcjiammLCW93PNVcIkeTu7dfZqKBwfFq2KuD5VGcE0fhnCvJTb?=
 =?us-ascii?Q?wUuQgUGXYtYci5i6gm/afRBu5rQzhPZNgS2r43Mm1kLLLk/UamwMYA8JALvW?=
 =?us-ascii?Q?5uPQyTb9D5rQ8g0OVnV1NX7bqXhO50T4jTTaC8QXgAJ04qdNHMrR8Wagcin4?=
 =?us-ascii?Q?QAZkKaFUtd06Z4v2g44+VXw9jr3olwPgSZIeUy7RtB1F9Us/uUA2CqLeiHVp?=
 =?us-ascii?Q?Ms2ZABRN8y6a/FTeETiQ3TRIb8RPf0fCYGKj0qfR8nLe5b5uFi5096oHnnIA?=
 =?us-ascii?Q?lQM91sizs+B3ylU+x01CFTr0fL2kLvAdSr6qoOHO8EWhQw9UWozJ/VO1mEDU?=
 =?us-ascii?Q?t6paodF9b8LZAeotrgvPR6tLx6zYeps9cVYHWeLeO1zcggXMs2gZGZvR9iB5?=
 =?us-ascii?Q?bKs6nrTC+p+a86CwNnqrb59lczonw11IRxDHXf+DO1hWzpYTTpl1uSxdanXl?=
 =?us-ascii?Q?rE7EJTKOdO5faRZwmA8nVLSpJnvMJpezREdVj/KSSZoqgkkB9+6Dab7WiAsP?=
 =?us-ascii?Q?+LTeKVW/jMnYONv7Y8LNzS3XHKiaP9lq/pvKGd7A4QqigQQDaCpLDoKnlrVx?=
 =?us-ascii?Q?3G70UzpzRhzHocg7qyUB87EZa1gq1TCSsWmq5Chuya/bzTI4hDaFAoEOPgIf?=
 =?us-ascii?Q?XLph86iiXfPqMCfxA5VBx3VFyzOrTPHk4SnB/o0OkZpiB7YUYssvagVVxSlR?=
 =?us-ascii?Q?svmSQT8HXr5x3kkIJokH5ak05/yjT8mA8PgTUOr4tl1KaICubmdBgNFdflpa?=
 =?us-ascii?Q?Rn8U5aau5U0wFMBBzhjFQ5eqiIpbTw20qjQoeED0vYv+bQnc1QWZm131a9fi?=
 =?us-ascii?Q?ES5tH4y2OWOSwhpBpHYO3rV9FpOaoYNv6LxomGFC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc9074c-a8c4-4a5b-baa9-08dd28775a80
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:12:04.4500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kr/oYjh2TK+Nc2Lkg0GqSrEfHdwJkib8m1EnzHahI90PmFCCLCWvmnykgZXs6n0dYvsavwemwKIT4JLBFJjOVg==
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

v8:
* Drop instance numbers from display controller internal devices' compatible
  strings. This means switching back to patches for DT bindings in v4. So, add
  Rob's previous R-b tags back on patches for DT bindings. (Dmitry)
* Get display controller internal device instance numbers through register
  start addresses of the devices in patch 9&10, instead of compatible strings.
  (Dmitry)
* s/shdld/shdload/ for IRQs in patch 9/10/12. (Dmitry)
* Drop dc_plane_check_no_off_screen() from patch 12. (Dmitry)
* Drop id member from struct dc_de from patch 9. (Dmitry)
* Add dc_{de,pe}_post_bind() to patch 9&10, to avoid dependency on the
  component helper's way of implementing component binding order. (Dmitry)
* Add dev_warn() to dc_lb_pec_dynamic_{prim,sec}_sel() in patch 10. (Dmitry)
* Drop lb_links[] and dc_fetchunit_all_fracs[] arrays from patch 10. (Dmitry)
* Collect Dmitry's R-b tags on patch 11&12.

v7:
* Drop using DT aliases for display controller internal devices and add
  instance numbers to display controller internal devices' compatible
  strings. Drop Rob's R-b tags on some DT bindings patches. (Rob)
* Drop using typeof in macros and explicitly define variable types in patch 12.
  (Dmitry)
* Add a comment for disable_irq_nosync() to explain why _nosync in patch 12.
  (Dmitry)
* Inline dc_crtc_check_clock() in patch 12. (Dmitry)
* Use global drm_dc->pe in patch 12. (Dmitry)
* Drop dc_crtc_disable_at_unbind() from KMS driver in patch 12. (Dmitry)
* Add kernel doc for struct dc_{crtc,drm_device,plane} in patch 9/10/12.
  (Dmitry)
* Define common IRQ handlers separately for each IRQs in patch 12. (Dmitry)
* Rebase this series upon next-20241220, so drop date entry from drm_driver
  and correctly include drm/clients/drm_client_setup.h.
* Fix regmap_config definitions for display controller internal device drivers
  in patch 9/10/11 by correcting name field, correcting read ranges and setting
  max_register field.
* Get instance numbers from device data(compatible strings) instead of OF
  aliases in display controller internal device drivers in patch 9/10/11.
* Collect Maxime's R-b tags on interrupt controller driver and display drivers.
* Trivial tweaks.

v6:
* Fix build warning by expanding sizeof(fu->name) from 13 to 21 in patch 10.
  (kernel test robot)

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
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   7 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dc/Kconfig                |  13 +
 drivers/gpu/drm/imx/dc/Makefile               |   7 +
 drivers/gpu/drm/imx/dc/dc-cf.c                | 172 ++++++
 drivers/gpu/drm/imx/dc/dc-crtc.c              | 555 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.c                | 177 ++++++
 drivers/gpu/drm/imx/dc/dc-de.h                |  59 ++
 drivers/gpu/drm/imx/dc/dc-drv.c               | 293 +++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h               | 102 ++++
 drivers/gpu/drm/imx/dc/dc-ed.c                | 288 +++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c                | 376 ++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c                | 185 ++++++
 drivers/gpu/drm/imx/dc/dc-fu.c                | 258 ++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c                | 222 +++++++
 drivers/gpu/drm/imx/dc/dc-ic.c                | 282 +++++++++
 drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
 drivers/gpu/drm/imx/dc/dc-kms.h               | 131 +++++
 drivers/gpu/drm/imx/dc/dc-lb.c                | 325 ++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c                | 158 +++++
 drivers/gpu/drm/imx/dc/dc-pe.h                | 101 ++++
 drivers/gpu/drm/imx/dc/dc-plane.c             | 224 +++++++
 drivers/gpu/drm/imx/dc/dc-tc.c                | 141 +++++
 58 files changed, 7930 insertions(+), 6 deletions(-)
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

