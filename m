Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C49FAA82
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0452510E312;
	Mon, 23 Dec 2024 06:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Fb3YkQZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACE210E312
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiD3Uf1Nzf7OczBPC4H0ffO6AeYL8vlx2ad63BtF8bsLeDNk3aVn5TqvRNBt0VracBO6il2RnORsWB62KTwJfdL/0cR1T+cgxJZrUrE9O9Rhvv/GN0/n42XsIkVaO3UfrDm5Fk0QXekUnn5zEwZa9AJK48rig7vLGdwMM/AeAnThi2MoVVC6VisduX8PYKU4mKdCTRVpDefjR1eU2YgOzE2aiHlRB28oc5SXdIcV4OWIFqKr7I4AcXyNDn7L4RDLUnXZAA8XZeDVfuhdLuBP5sFccHTnpzHSqaoEVhl+k4JenaQg7vkd+3h1m2wbVBmp1LsTM0gOE6erR2IlLPwpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAlvxb89twUodqu88p+sanpw3odGCLSdrXeosX2ohD0=;
 b=qNd3Z06qm8xSj05nrg5TxcLo+opP0mLK8sp0vI4YBZqnIeZOFcFxsEcxqqnU2fuMyUdNptLCdi5PObGA4epZH99OAo77Gr5VbQM9dqA1XO+BeyvKhpmfl1yNADfRBbI3Qd/1YukrMnUkwG71VMzgZR4Zb+NKsGvuRy0qwhDub3n5fT0Awuy8YKls0uExtGoq1l1A4F8v+ivR3GfAH66XsG7RbzABxcBaeMDxSweZ+ziU2Ab1mJDXfylBfHGxIHLVaPei1l+z1J6zYGQbSZWH/xWfxuIHry58mTOB2t5IbTPXXcKLqaf7HjvVwRPodxD/q0TsM0vXhShIKAzWtrtplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAlvxb89twUodqu88p+sanpw3odGCLSdrXeosX2ohD0=;
 b=Fb3YkQZRullwJNCjCqo6opvjBp/2yPznSLc98hgZvOINxPcNH2hL7MvfU+2gtvDeF7xfXfskH+869SCwnJq+bb4eMrkYto7BwohnXPDfWF7TwFIkuZS21eCQ2vGvSuRPAvGzct18aPNbqlF6EwSBbbJNwYx2RzfA9XZqsVcshr1KM62k6C/0168KMbRkj0boNu7MRc6htZOlcNJ9JywEgqHRPQJ54FF9dvdQC/Pbr8ZYHLrNk98bbG/gUHuZfL+/rjnCxU9xJp2+L3bIQHTDxMvUqapYZX7xB4UZx07o8yqeTjq1fw1dm/H3fIWlrCrCNo85UdimdU7jH1WmEPs36Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8986.eurprd04.prod.outlook.com (2603:10a6:20b:409::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 06:41:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:41:45 +0000
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
Subject: [PATCH v7 00/19] Add Freescale i.MX8qxp Display Controller support
Date: Mon, 23 Dec 2024 14:41:28 +0800
Message-Id: <20241223064147.3961652-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2f54d0-28af-48f9-00e8-08dd231cde3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yyv/zBnXspPw95mCH+FjIBB4aOXCRe+2n22pA+tC3kQlnmVbNcOPAPZ5L5fD?=
 =?us-ascii?Q?tI3AFFNQjbDM8KmK5/t0E+ys4E5zej/QmZFoEt2QuJrAZ+TBvZYzRFs9L/iO?=
 =?us-ascii?Q?hZl/spsNSMvLdXu2nx8Q9gDelqREGp+povruP4oAbY+MmWVoimAcmihyHDjw?=
 =?us-ascii?Q?ZtfDzytrJoqSyDNFbMYP8OHG4X3UtALFesq03B0qWsJCi1ohjbEMhTIhZV7t?=
 =?us-ascii?Q?hZZ1TewFU/xA+zSpzd4f6W3hARAy6o54T8w30wBEsBXRb4q6ry1+Azk+FZGp?=
 =?us-ascii?Q?eAa0jSfppaufVpt0arCK3fZf1TCEeUm3g7uVTEdPT9YET2RX76QxrRVTu+I2?=
 =?us-ascii?Q?+7ezYFYjlETNJOwoHzvcwd2DgUfLYP0RRqO6GKqxzhZI5R5zgvLQb+ZCWkLI?=
 =?us-ascii?Q?7Vt1a2K3mwxmfXJ2LeCzVuAfrU1uXPukRGgbsVTf8IcdSS0nAKuHwS9JDzl5?=
 =?us-ascii?Q?kSCqiDLAaEZ8RucbsWogXsm9RzfYRZ+Tvz/eRavmUTC92ZfhiqXxYkXbyM84?=
 =?us-ascii?Q?2+oIrxTto0p6G1LdX4TnQnMrQ7G0YG3p986j7KwNJvPgqYUMOxt/+s2V8Gyy?=
 =?us-ascii?Q?TzfyoLd3J+H/A8OMpnuMNSYsp7FwK6kEi/2HkVthQjElqEMDMSX+XDEfr6HJ?=
 =?us-ascii?Q?aoQXkng++FsAgi+xR/T9CXoyMAuyUc/K7chL66VWtOam7umYNm2HfPZnC5lD?=
 =?us-ascii?Q?E09q7o6/9+8RNR5pHaC5R5amewp5j+kwWk+ofUvzI36oDeu5TspOL9dN+TE+?=
 =?us-ascii?Q?ZNVUq5jUcHjyVCa8w2KWql5riKr71La8XgSjRevqXQ2YUJSfBFGkMuq7yxed?=
 =?us-ascii?Q?H/+HuAKcPPQOBWnUOR7J9TR7Bgl2M2Vqd9wmquxTULgaeUeIBR4FvMnpoHa0?=
 =?us-ascii?Q?fTI86IJH6APJbeAk0CtIWrJ8sjIEhmSoOyzwxiLw0J+sE/fbxTus4aUVQ5h5?=
 =?us-ascii?Q?SIWYPa+I9PKCNZTBjTwZvJ+2iI9Mo0Kp7+w+0LmMMeezdn66ITk6DbCTFhs1?=
 =?us-ascii?Q?1I3uf9Dqpdb7HvnJxTdJOfBD2RpDY7U7fonB0yaj7NlL8MY5WfmPnkRhEvNj?=
 =?us-ascii?Q?eWuddtiA0idOiFj2YdUCdyN1eYWJjaQ1oZ8qxPHd2tuyW7PJA8V15K6matPV?=
 =?us-ascii?Q?85UUBDPsB7b9Skxxh5KdEy8cYMkESDkcPOUvEFMVsmhsAyoBFn9Tzin4DTXD?=
 =?us-ascii?Q?jjoD361DIC9MR+9r6IryhS/TBQyPiQ6TzwySXc+ewzsS9dJJE7Q/FW+Kx2Yy?=
 =?us-ascii?Q?rmjFn/hyWDFG5eB5Nsa1HeZDwqSGJsWCO/TXY2x0RLr/yyJ9UEdX9tQ2g/ud?=
 =?us-ascii?Q?l1dARLKTvTI9nakQESq1JEmcNalUcydv0kA8EgJRqih8rqxbO1BarJNt7vzu?=
 =?us-ascii?Q?Xly1X5ORCSJxkfxRFMxPW0yToK5Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cmmvKqz0zqjiSGuIwN2Wk1guhda6QAhGmMBQga4b87rcX5nfuyc/h3dWT9I+?=
 =?us-ascii?Q?PLzvEN1W2/QrGXnD3n/CNgjCkiaEiKtW4pNGK++gtfY0zgH98WsldTCccca/?=
 =?us-ascii?Q?v2Cp4ZO39c5WAAmjRwTYHBn7M7UeBmYQ2ZFs0jpnP8BXCCVzgzpy0Qi2+LzS?=
 =?us-ascii?Q?MsEjcveoyD5uJ4EunAtC+TFFoHVqO33788nwO+p+++NPed9DCgph7VyE1HtH?=
 =?us-ascii?Q?AOBxNp6xgP+8ChGHheFlohNvGEsrD/y3BDSIyLAYLQGpwqXOxtqFSKCoKxMd?=
 =?us-ascii?Q?6XKzpj5IrMHQjolGnLxTtE3QTYjvqENjlmRIKuA4Na2TFF4K5NoturynnE1S?=
 =?us-ascii?Q?aihwd8agNAmsfcSdGRExhGeLUntumRa8x2eMEpE6FUIELyOlZClaWcPfIGVb?=
 =?us-ascii?Q?nAWQD5Yu4f1Za6XHSD96kvv1m5JpTBh5u9eDlwjkiXgJbRG9jvhQYd01aL2t?=
 =?us-ascii?Q?0zB+jbFvMOwGd0Y32JJFzay5tLpyGQ5T2KAE/i6xZszSuvv7tcOZNOllgDZ3?=
 =?us-ascii?Q?sT9bHMJV4hBqrE75M6P0IueurjXhjRplqn7eXpJGZpO/aTdobfdPsK7Am7tE?=
 =?us-ascii?Q?p94Wcf0eMD2FtfvZRG5f59/eEnKyCOOjr4AwUvCF6fN31UDgfJKN03n5ZzTa?=
 =?us-ascii?Q?BKaeazfCR93xchdTLmrUVorm4SfymJd/CgibPGeLZXvBYRepK0fx10sUqpz8?=
 =?us-ascii?Q?e9BvB6CePEKojRguWqbUq337+K552zrpY+BVRAaiaxH/0bUrmzxT29DC1+FS?=
 =?us-ascii?Q?coxQgQfawebRMBihMaPL1jLO0vxlscwbDv1xIwF2VN+S+lkO+G8QVvbmQ7dC?=
 =?us-ascii?Q?s1IU+Shoxg3Y3OPoCZWTMc8bmp9XiSjI9C0wq7EKofRHCt7YT6wqPayZ/UHn?=
 =?us-ascii?Q?wycwKsNQxcgOKV2uOgVOUY3CR8sFWNZtClayWaARAMuT8uMCHG5amGuuz+ht?=
 =?us-ascii?Q?NtWSwYWdV82U8283ojpyesDgTvXOEubjzrF6g4LRb8e2/Ktp4PngRqvnY9n6?=
 =?us-ascii?Q?UCZBRl4GCp2rqjTb40xOZyv7S3tydu7f2Hc/AgyAQW7cgUla3BHLw5OE5rjA?=
 =?us-ascii?Q?xCbDdBoAHu8wL8WZCT9jNVwu6nskTpW7zOGwrxGpvIkSDVOodF7m8tcHMwy9?=
 =?us-ascii?Q?hNt9w9Xaf6Dyxf48Iw7+NLij5VcH3ahaapoilVgtQ1JPkOT8mYI7zrdzFYIB?=
 =?us-ascii?Q?Mw912JWAfgm6BiFsica644cWrwHNFjbY5oEClIa2QyD5z0MEa4sO9N7Z46P/?=
 =?us-ascii?Q?zovrwdmVrxVCFvlxXcmXEylf556iOyLl0sAB0wE2RKk4UX5F61xuHSkqHGDB?=
 =?us-ascii?Q?U7Wmc4JzWu/Vr/N68IjKHdqzC/RMjjw0w45RC4hbyEk5AzS2j7Gt3HuLRWxe?=
 =?us-ascii?Q?TWeKB9Di3NYPr9vy5Wjl+p076eEemHPInEmjjEtgVfsECFyJaCMVxuVcmXJB?=
 =?us-ascii?Q?uLWXltT5FP+shCKGhUZUwlMbsTb4LqVj1FHn2beyCy/P1G/qDJLTIdN8F4ic?=
 =?us-ascii?Q?MXze/+JBysuAyfIgCi9QbKnh7+7VkNeGEGlz39Ahhul5+gThLzi4QdMm2u7H?=
 =?us-ascii?Q?bXsumGtqHxnVGXy2q/XnqUFeazZjYHzlUHLPdhta?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2f54d0-28af-48f9-00e8-08dd231cde3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:41:45.6314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFKEO9QtXOLZq8Nk+XeHJx8dQLeAQ4Cmi+atZe9AB7OYMk5azfmm6a9Nq5DZnYmpgMWyJs3W1G8WUWbp7ZMKlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8986
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

v7:
* Drop using DT aliases for display controller internal devices and add
  instance numbers to display controller internel devices' compatible
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
 .../imx/fsl,imx8qxp-dc-blitblend9.yaml        |  41 ++
 .../display/imx/fsl,imx8qxp-dc-clut9.yaml     |  44 ++
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 +++
 .../imx/fsl,imx8qxp-dc-constframe0.yaml       |  48 ++
 .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++
 .../display/imx/fsl,imx8qxp-dc-dither0.yaml   |  47 ++
 .../display/imx/fsl,imx8qxp-dc-extdst0.yaml   |  76 +++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 +++++
 .../display/imx/fsl,imx8qxp-dc-filter9.yaml   |  43 ++
 .../display/imx/fsl,imx8qxp-dc-framegen0.yaml |  66 +++
 .../display/imx/fsl,imx8qxp-dc-gammacor0.yaml |  34 ++
 .../imx/fsl,imx8qxp-dc-layerblend0.yaml       |  43 ++
 .../display/imx/fsl,imx8qxp-dc-matrix0.yaml   |  76 +++
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 273 +++++++++
 .../display/imx/fsl,imx8qxp-dc-rop9.yaml      |  43 ++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  87 +++
 .../imx/fsl,imx8qxp-dc-signature0.yaml        |  55 ++
 .../display/imx/fsl,imx8qxp-dc-store9.yaml    |  96 +++
 .../display/imx/fsl,imx8qxp-dc-tcon0.yaml     |  47 ++
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 238 ++++++++
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
 drivers/gpu/drm/imx/dc/dc-cf.c                | 173 ++++++
 drivers/gpu/drm/imx/dc/dc-crtc.c              | 556 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.c                | 153 +++++
 drivers/gpu/drm/imx/dc/dc-de.h                |  65 ++
 drivers/gpu/drm/imx/dc/dc-drv.c               | 277 +++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h               |  61 ++
 drivers/gpu/drm/imx/dc/dc-ed.c                | 292 +++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c                | 378 ++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c                | 182 ++++++
 drivers/gpu/drm/imx/dc/dc-fu.c                | 268 +++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c                | 223 +++++++
 drivers/gpu/drm/imx/dc/dc-ic.c                | 282 +++++++++
 drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
 drivers/gpu/drm/imx/dc/dc-kms.h               | 131 +++++
 drivers/gpu/drm/imx/dc/dc-lb.c                | 324 ++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c                | 133 +++++
 drivers/gpu/drm/imx/dc/dc-pe.h                | 107 ++++
 drivers/gpu/drm/imx/dc/dc-plane.c             | 241 ++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c                | 142 +++++
 58 files changed, 8041 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature0.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store9.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon0.yaml
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

