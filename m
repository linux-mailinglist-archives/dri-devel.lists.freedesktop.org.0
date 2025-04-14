Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB3A87657
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788C410E458;
	Mon, 14 Apr 2025 03:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gXRhxKRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BC210E240
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6C22AaWFpGtk7d5aaU9ed5nhEjauDUvAlOySVr/0Jsf65gl+t85ci3FBIhnnNQV3QbjnuIaVPP9LcUAU2beqbmvwc9Rea2y3+i81S+tQjQd3fpAI6DxkF+Ih/jt+yI287Q7vTwF/7eyFV4zVCNRfJGEU2Op1UMNDi46KupBIewtmcRU5aPMt7WsW7Ul8gEsaMvlcMp2l9HM7or4i9Fzfti/L9EcGEtIESyxXNAHd2W4zAeNmanCg2ffgVRoBd3vhmaI6TwUbKjw757CpilczzKT2WuPmqkajoXBzSBCCoJ9FUr0gxlhWvu5HA3tHF48gwmrrlmp5V//sTvV6YtpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuWuswF3VSqyV5nJYsVQ7kP6Mv9vX8F7JyUIZIzBIdM=;
 b=KCWMmHSkrpp4X2YcRrRZwmHvyd9g2W2yr0Yc+o4CZ+3h8+KYFJDMKIYk2bmApWLRlklLcIJRrPjyu+US37Jb6ZL5NkUYEeBKK6ncZXhXDvl/UbupWlomWZQLzYWkRha5PWxwurozMf99bdvun6wEalRGHAZlFXHMUSRth/pbC8Bg0BaK4jV4pWnC99d2e81XDwxkB/Gf+10Z8qQsekcmLIYZ98DkWG8mVsP3Aex5/V0GCrl9aukK1ebcVgXZ0rb9OmPtvcnzJj9hLDmalUeWTEBHqm3nxSckfBDsrUb95tKKtSYUdHyE6WaRjFfXg7WeaW0PgtX30CIXhXGE0W5NFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuWuswF3VSqyV5nJYsVQ7kP6Mv9vX8F7JyUIZIzBIdM=;
 b=gXRhxKRW+M4t5oGGylwCyJjQQozo60Sj/2zA5dqR37lRNxnMKs3kjy6qNWg06d4jvI9Uo2721SefIvMIavAqOPejfiV3yOVJ5GUKb5BHtEvMUswIuoHY35uhSC2NaeuBa410mLV7FCLJu68DAisOQIA0plhy2Ofi8tIqhgIN5pfSt5hQA07mdQpKHO2+BvShEDD+OY1jJ9DdyWNL3bBvCD9Pmcbxj5gmGWc1Vr+PCHLXl1X4fw6tWsgYxpeWvSxXgTw2IAOwcYSHGBYu23hpOGZuaKuhQGOPVqaycsLgGCTjxZX745Sq6Xcf/08jXIdsDYAEjtluKnLQU3REMP4mxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:49:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:49:26 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller support
Date: Mon, 14 Apr 2025 11:50:09 +0800
Message-Id: <20250414035028.1561475-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad83e7d-384f-4dc2-1140-08dd7b075a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ijbyNxG37cHae9yUzSRBBkAnwcdO+/E0G9CL5R4c5SCa4f6xRarb3ws7TPfK?=
 =?us-ascii?Q?Nn6bCCHC15Vh9o3TwKblz78USrhP+VMlV3fKuw6kDF5X81W5scaD+k1fCtJA?=
 =?us-ascii?Q?9sIqrDx0P7T9qlIOKWVK7GkMPE7jaJHPmkVOL5B3o5Ynmj/7P2qYy6soHj1X?=
 =?us-ascii?Q?RmYqQXohNj27S80kwKqr+CnSw26Gxzr5duzlD7ZHPN5L9gCRUoIvBqXOYV0D?=
 =?us-ascii?Q?gF6nLbYSY743uJZcS3LFaLF/8CLXiBr9V+6CKF2t5YDF8ey8skMxM9Weqp8R?=
 =?us-ascii?Q?+z36BPX+7kIpocLHuxtCx6WU3Sg5r+fBQ03Nk6ZHP4N68OHJSTHhlmItRHJY?=
 =?us-ascii?Q?nQkPULTayi5XUAcL+F29H1K4qxDfrduu/9MremXjew//cj26jBVLVmcIjHa/?=
 =?us-ascii?Q?p3hghf/LQnrBrPoovnnKHWq1S1VHNq7+O4ml7FAzwEf5OgdrBWhyhpGTen6X?=
 =?us-ascii?Q?Ff2FvyYcFNOKzx/n/XYW9xcLYkn0/siSqstaNmq1vm8aKFGZQSHvbke4GK4l?=
 =?us-ascii?Q?e0tbdBCIHXDi1cDUp1bRgiRKPFRT4Y7oAUxLJPDPBAD+04UOjXPmVN0+2bFt?=
 =?us-ascii?Q?8BacsuHVyr1gsHge73qfMQ1OFz4Yh2vdV1YjcH8wEoa0+NHNIXmjM0ogf8Ku?=
 =?us-ascii?Q?PZtt0Adtlg7ZuKVLe90PRoDt1W6RuB4wZ8fWzzGFHeVMSB9+AN/1BfKHRYxo?=
 =?us-ascii?Q?MLpgHkBsTPO0FIQ6iVwPC5fqZXP2jtEf74eaNz+3KWyVac+/EXmMViGL5XnL?=
 =?us-ascii?Q?0c06c/u9c9WUwEQgFJHl2MaSYhqlHbvtoy2XhLdam0jn93DeGa7p//mn2mBn?=
 =?us-ascii?Q?ZJqJKDgGh/Haj4o0gBAdLfSLlMVHvXeD1aRc42gAdNM5NUCXg4CDGWMIXunC?=
 =?us-ascii?Q?8s5e+mTR5d+sNPgtNGSW/2eHmCXHu1Yml3SNtN5+tkXSRb6wSEnlK51K24PA?=
 =?us-ascii?Q?jtfvBqvcPLV2jSZhPpxOgtDq9pZOBI2YQg764zxSPFDAwtPhZzQRlDInyAmq?=
 =?us-ascii?Q?S0GwtXIQwnlphGDXMiVjDAKNxLlAIpvd1oRGNAYGDJkg2gKHwD7wKfVSrOtl?=
 =?us-ascii?Q?ftZVZONy3ATHLI5RAFZJkkl1J93nFhm/Y7WYq31t50MLFf5n19GN1LHJkbZE?=
 =?us-ascii?Q?lqAonyt9Gq9dePI/AD4m0+YK85NHPIWI+usRDIz8RFPYdpp/iieqANmNmHtj?=
 =?us-ascii?Q?umsgSNpUjWsvoozGeE00HiRWUirKMWXP8m4ylC0cYvDTM6D7fmIpMhmW/ckJ?=
 =?us-ascii?Q?bzngZ/3m7i5kJU6SRTcj15q0IMAOYQelNRjgw4YzLHUCDKD+WtcEyor/cUvF?=
 =?us-ascii?Q?akZ+X6WIRqrykmJnci1+S6fnRKt3Z2vZJdyZuquf5t1knuXCCWaSdI088rCq?=
 =?us-ascii?Q?mPFOemDXhoWahibfK6d9jggVBtBvff+Ib4mICoJhSod3USjuYizVZeYC6vqw?=
 =?us-ascii?Q?QR9ly9alAfc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q22ekceFFWzPueEdXcU4X322FJOsoq5TofcGaAQ5dqX0PgxWUkZ4srpqSX0+?=
 =?us-ascii?Q?KruXsHKYXeqnh+aunIsRLrgaqAr/C9maHwrbXlHZEPpVZDb9zNzjHC3DyYbo?=
 =?us-ascii?Q?0wnNmfiFO9AuwSJZvunCHOChpUclgfbpopxdsBpGCOlnE7OWvLzZGDmVRpu4?=
 =?us-ascii?Q?sCK7B9czFXgYyjuB9i4UEd8ZIoBvdop52HHwqBjWk94ub4+pSddaGCQ+158m?=
 =?us-ascii?Q?4wKxFzFf4AQr3g6rXnHGV4LFw0QrP4Xh3bB8ZI1ycOsH1+5FJfBFxEgrBbNq?=
 =?us-ascii?Q?gelXsHW1pUB4BVumNNmQ82JoTImHXE2KfgtrkGv4R2SWrsrnq+g3VTUxL3wS?=
 =?us-ascii?Q?+xACW3WpGnIpNoL7xjv5q7WW+52hlk5E1E7d5XNbkZSiTUI9WkggJoPYPR6y?=
 =?us-ascii?Q?oWhR8dfZNkHntEgN1wZAp7Z3SLF92BYBCw8CV6AOxvhFrpvwBz1OtHRtZUY+?=
 =?us-ascii?Q?A+KAfrUgIfG/FxUo+b7e4G7L9T/u/ZuFIj3QFHXVQmT1ZJu+CVsa0P49jHBb?=
 =?us-ascii?Q?IixONpQNXCDCHLLyDbQoeFTAd2jCwPIZPN4AVSFnTnAXgaJgDEp38v+PAJwg?=
 =?us-ascii?Q?sXj1FRUX71ST7GUI76WCFTgolt07a8KD4iJH6jIBQgEcOlCeiqnRK6xgivw4?=
 =?us-ascii?Q?x168CwYi/a/vBsuaIl+bSXGH90O3OVdmFT5wHN0ndZN74M2vJtWdDSekF8Pv?=
 =?us-ascii?Q?3Xqq+kRRqbQEXzCADfJPsY4GjhwWvuP/kgANsWctXkVVugrMGvnwCGCrue2m?=
 =?us-ascii?Q?2spnuDbW8/7hKlx5Zp/p9znjr+zW4cI53sBVZZE635opjwWf8KnsfKdwTP/f?=
 =?us-ascii?Q?Hshn7zPK4YcUcnGKU4Ciol7NmF2V/fY09npVXOFi+P98WMgggbcxkac43CD9?=
 =?us-ascii?Q?byQ35tHp4hTT+bATClcjOEScx2fyPZH8VRRTFMmYWbjD/tGj5makB1THPkVw?=
 =?us-ascii?Q?4Hg/45spIW2dmShHygJ95nN51uDck3nBJ9iKhsKgtHZYv/wFG4vUJW0ddNCA?=
 =?us-ascii?Q?LILW49UPYCuQGmrcIByDLQiPR0wddKnWx+sqBjdp+BqEQkiqKVMdc9HodIVs?=
 =?us-ascii?Q?VtbFgBpTR9OEjYVrM8Zyme3cy7KMSFxK4lt1k7Ba6GtvJUy9yLmzLVGtpRkI?=
 =?us-ascii?Q?ffUzMHrUTM3YGzVEJnRyF8Ugdip6G/YkJW46zfd2O79Eii2h4+92G9VSgZDN?=
 =?us-ascii?Q?KPr+cmaHnndXLN3QN6aydKP1Yzr0QWA/GKM1fVu5at+uG0V0qsnk0btikv02?=
 =?us-ascii?Q?cfjMWUgMEmaXxDTFHiDC1M1nyAJrKYgLE6WKaI3iRlsI/JSgJLgjRNFebHbz?=
 =?us-ascii?Q?nPT09cAYJnqRha/dUR8i/5/XZIGkQrraB+wUtnWBX1se/ds4U5iOYnCUCw97?=
 =?us-ascii?Q?hry18aHo+nSQhdnXbjieKLK0ZAzB7fDlXckWiZ1FDDNa5AVZUuqVbBWiaxE+?=
 =?us-ascii?Q?f8K6T7lOyEZ32aVJgb1NyjUv5i1PHhFLQnfpY+/qKHn2Mvq2JvW7OV0bnIfz?=
 =?us-ascii?Q?M3CdwzT2MLH+qzmWLwL8S8XkziWvTb8SyFlFqf1cV8bcuDv6BvqaslvJvlao?=
 =?us-ascii?Q?zBPD8ugI/eYzWeUYcwoucoUZVdZEuHRlPfPsCEAp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad83e7d-384f-4dc2-1140-08dd7b075a14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:49:26.8014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hQo4IXQqlZwvexnhqAGS1anRVcUGwi6x6aYZWNBw6x1aXZOCqHM8It+Kt82ODjXGKlqMU045LpRJWIONSR6CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803
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

Maxime, patch 1-13 have already been reviewed by maintainers, can you please
consider to land patch 1-13?

[1] https://lkml.org/lkml/2023/1/25/120

v9:
* Rebase on v6.15-rc1.
* Collect Rob's R-b tag on patch 6.
* Collect Dmitry's R-b tags on patch 9&10.
* Collect Maxime's R-b tag on patch 13.

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
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
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
 58 files changed, 7928 insertions(+), 6 deletions(-)
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

