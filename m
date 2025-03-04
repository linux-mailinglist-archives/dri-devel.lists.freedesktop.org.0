Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BBA4D62B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 09:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E0510E041;
	Tue,  4 Mar 2025 08:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aeT0v531";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2087.outbound.protection.outlook.com [40.107.249.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2E910E041
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 08:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlvppSbLGB91k2+wXzUMBnkQzyUBw9L2MSldjrmBmwJz2rwS3NjRJO6xenuU7t1UetvWoU4fD9jAEZ+uFwP/AQcccWvkLf/cEH8nkJHoVzcqdwILblyfdRtJDouWM9oTErQvtfg8lQdG8OT7bZHxeDNg3n82V0ato1+Y47UUkBbH5PB6v2hnirlIP9KKXxAu24tHU3Qf7+M7HP6oequdxlDpzt+0MdfA7fmklJ4tyBff6GMaNdwKN7e0vhIjimFzoSnsgnOStPZ34tZ6dPw4etkGtCOk3WvZWhM6jSh7LGocU9UK92k/aKoI9La/qUdZDQo2d0i/z8B3lIoHgTVogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4Jm7+1/bMXeSHR72Kk85JSPA7j7pmFZWvbFtx+nkgk=;
 b=n7OV2OCHiHuQYIcLX12IXGuYjvQKgF/aZicfOULiDNBMVwFjxa1rLchy9BzkOuYm/wz7oXInlp4ISz6/WONZLOytzam0ywC+8iPPCkZwh2Uk1sh54cjbZlXPwGBqrd0AXYD5z8QFGZg7V26/qmE/kL+Xb1bqOjeWHBFYffoWQVwCaZW31Af224HGJDyNPe2m8DDTHTTeYqLl7R1o/lURetLJDUl5Aow8MMeYCEI3COqByre495sMriXH724VEYwa+E79j4RFwtwa3jTlt1QkV7+dM5gn5s7b2v9RvfNm2VRi9tezDk6u0sc3v6q/Yc0ZFlctlimJroyDEwtDPPlYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4Jm7+1/bMXeSHR72Kk85JSPA7j7pmFZWvbFtx+nkgk=;
 b=aeT0v531BJf0ddjsFmNnD0CVifVmRCAgl0TNu1ogEU0zRzoJgWivXUNSb903VlR2ey6inh7V0XWT/QeMKtsYwUqESG8vvjFFW52dGE+SHlPywoZWrEVtYLeKZA0aFxsN2j0QMHv+CrSV7Y2lp8yvhCmArTOe3W77Zs2ZtfVqog5jKMl2j6i0rd9FC2wzs12avueOJ3dedbpoz1XNGlSUuKe18mK+AWtnhLBL4XhD56dkx0Ag8QWeUJj8dcXyllymG6YmyBXWCK7yEUr0JP3dnuYkikksg8PTe5MuvnFanLR71CUiL948Ia1NAPR8dye7QT03QxH2uZNIJ2gkacbvpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA2PR04MB10311.eurprd04.prod.outlook.com (2603:10a6:102:413::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 08:23:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 08:23:47 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, peng.fan@nxp.com, alexander.stein@ew.tq-group.com
Subject: [PATCH v5 0/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Tue,  4 Mar 2025 16:24:32 +0800
Message-Id: <20250304082434.834031-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA2PR04MB10311:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fe2333-5186-4428-cc73-08dd5af5e2cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4w9NOPyTM7SyGKgjY3hw7J4URfBSpOvmMyiQojfjwq59otZ4xLLyin0R/zrF?=
 =?us-ascii?Q?yMuhtnA9A6+CVMOG8pzvL/mOyYN7QFBpdmyPLEeSeoUPV2VTQ1veSRn5ldOh?=
 =?us-ascii?Q?6V+iCLb4ZIG4Vs8nMKgsvDXJI2G8VZQVybRbzT9/dwVPCFsQ+o4876biZk9a?=
 =?us-ascii?Q?96wPyk9jGisoWoJzp3oXqvfzLPFGtPXzdJz7Xr4VMYuQtb/iCg3Hl4gHLB9+?=
 =?us-ascii?Q?zUiPPGeKq9xgaCQFQdQcvWiBxvAp5BMQhprorw9tg+ccd1Oz5BsYxamm9dhw?=
 =?us-ascii?Q?JZAMNsTRm6Pld8gBmcf2FcG9vn3FueEaB8ySqwEy5NsldlLz+mqJ8zoxe21/?=
 =?us-ascii?Q?p5DRbmvDgiJjwJd8xrs3PEPygVqraSSGhHYZkFAR5hl7Vu81in+kNmXBdFic?=
 =?us-ascii?Q?t/blcakaEbrjyNkNPQl/NvFQBIZk1AvNX03Qt/WgejBtYebdYTq+rKECBAjX?=
 =?us-ascii?Q?frWCEDVx5/igLLCA2direvyGDDvQ1qZ6J+Eufhszu/bgiFEVwMzcuIdYrn8z?=
 =?us-ascii?Q?i5TlOlWXoMIlRCHo/KmQMANdrwOIVmYAUUm4l8rnW3wJqQXKR7oLVZJ7xZpC?=
 =?us-ascii?Q?9oHu55BSzDNCMpRpbdnODRX7LNfL/l3wxJ+Tp2617NY1FmezenaJ4oEeFmqC?=
 =?us-ascii?Q?uVv+EKeJUcz2xvCZsWB/Fwt0B/n/i9BZ8z2PEU3y0pURSYDtXkV0emY0jD85?=
 =?us-ascii?Q?pqRa6IUDUvWrDe8ToQ7/RsGf8wJqjnoz4yH3AbxG8b1Ek6bsIWPaPW/BEw4s?=
 =?us-ascii?Q?piaeXexBXx3Gzg01bnyxXCV8CcObeqwRzymz5/EfzuXoJoJ+QnZicmW2gpLp?=
 =?us-ascii?Q?JddjI5IgtelAl6snR1mVelzJjfGgzDGe0sTq4CQZQ3INt7GZJE0FpduTozC0?=
 =?us-ascii?Q?CJQUOSa2LId/wLn248fjSB4Is1ozxAes6mLqDljN+gztjKIR3QS90dTfaRZo?=
 =?us-ascii?Q?nY/BJMC0lPee58QDq/t6ZBTcsoZNdYsKSvL8sbfhdsJsd8ot3y8CxYzlPLZJ?=
 =?us-ascii?Q?shwa6AAfNxTA8SpsSrFdOsPjGF5Kh44LFtSD1pvox8OraqOugwMq4E3B+qog?=
 =?us-ascii?Q?r5c0Zgi3sj+02WZyN4mSXE9vGMS3Nipz7YVyJLZ+swrRMV8czwZKvQwDCxHE?=
 =?us-ascii?Q?D5mbRB1tEOYZNd5nkg/Q966KG/UAnTutzJ7UHgkWxzE6z2hSHJ8dSkZpcNGh?=
 =?us-ascii?Q?aI+LHo6NrGTvOpQf4OtbHKKLLawd/nRH4p/KMkg2iMpmdOqkIBNu6WRJdO4h?=
 =?us-ascii?Q?5gYdjWjvuH+zT5RhWUdPKunu5GwKIj+JKEOEVyzuzZensbpV593rvM+6PheD?=
 =?us-ascii?Q?utJVu/ISwWayI8zgSCUdcJse/DE79+TnrbUojpXWqqSO6FL3lLmsl8sdeBRF?=
 =?us-ascii?Q?aLdJplb3woxUaKJuUgPbFrHg+LY61GDIIOqlO3EqL7fJ6UkzSHRATSRiRcPw?=
 =?us-ascii?Q?l5nvgJosJu1ZUQVDhJlUTdOCCPQlAMTW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RczLTn1TUd7J/93smoQghDOLJ7JQWMbmAhncvyYblErTGpkd59ikWKwuEq33?=
 =?us-ascii?Q?ygtDrHmAHNFnpYtquZt4fCMq/NMaZuT+HR9UVl13swY6WlW2m3CH6Kwlh28Z?=
 =?us-ascii?Q?OkFYprUDhqoFR6hjmIPtucP84/Ni21bMwY/gOMwxZsTI18gDXLo1xOUvZJpk?=
 =?us-ascii?Q?73I72qejRC1/clx1jQwHDY44ML6bxeZ2+E7PinDbBwd33CEQVVB5wDdQ/2b9?=
 =?us-ascii?Q?qzbNeH1T6wMrzaZbLBUBeKcH0Imzg6r3AeL2N/8F4wR42P6PQO6AQdSdjy9/?=
 =?us-ascii?Q?Erbtf50hpzZE2RIywNXMRY9f5C4X8sJnOsLq061hFnyKqcldU+BALnWGI6pZ?=
 =?us-ascii?Q?5G4pBxfGHFp0Cs/LUTsTmnMHmia/0ZbcRB3vpwEfdjn+CoATnhKBOSxqMkHz?=
 =?us-ascii?Q?Sy3z02YjjY7zvaTjtKwnzNTsl4KljFgREXlZwXdVAopRCDfM2zs0hZuii1ya?=
 =?us-ascii?Q?OIkHMxFFxKvZPDlwkyTvjXOdtxqlpBEqufC5o2q6/ZsiVKYI6RlDuawUpU0u?=
 =?us-ascii?Q?+B9INdWMEcFtl3e2lz4tP7L7s7twKKdr8TqR2ZkHnN9MjQ/4ccY3EJK1wqhY?=
 =?us-ascii?Q?ykAuprALQU31xGJ1m1s0JDnsP75KkqqH3e0OpiyvXsKXRo91Gqz+gBl/5Y/D?=
 =?us-ascii?Q?2jlC3GTN4FqqzH/RbOkqH5We8WuAkiFzlvYwThSAoKSmE/EFqDsRA1SKVm33?=
 =?us-ascii?Q?vGX7cQkPQt3KymKpI9+WfY9TXF+TfbKd6ppET0CUJVM113AgMo+VeX6N9m1H?=
 =?us-ascii?Q?4+lnNCfYN4BrctNqi/c7rcL1oyRyeVj0lEmjH7GyoMtge2ceAde3FVthdtk3?=
 =?us-ascii?Q?Q3S7+69TbuQeAURXvFp3ZJe1O12GcKduK9eWxg/Atv8Kp5iAd/8cXBWyisYS?=
 =?us-ascii?Q?WlX4hN4U4wzCjljeD2sUjWWjkLyCfTc9oHrXzYu1GJ/N+mkFVnlI/ThdkdQU?=
 =?us-ascii?Q?feyvmjaZ5s4XRQR6t8iHhFOhD5/0oYNaeD2jzAVEV66LK7p3CPrbyp3RxEnO?=
 =?us-ascii?Q?kCvf+5MJ4QZ/q7min4QtpWUKKxlGL3Moo2F4wnUZEQC7Ns+7MrxdWpo62eQk?=
 =?us-ascii?Q?KQrtvGofKnKjF0+VgntrCHqSIMHQaWaOojGBwo8kNAL9oqqPddn3kpviqO8k?=
 =?us-ascii?Q?Y/qMil47hBtLE9axY/eTJB21uEcg5iZDImDQ51B+i2zvDpCfcBUgxGboK8wh?=
 =?us-ascii?Q?SWtCu07j0DN7uv/h6SJqSjO+lE+ZZhUHmwuLvJ1oc1JH/yCDen5MCdpQqmew?=
 =?us-ascii?Q?kYwcYo6jcnwCHisWlgLhsdDT4yJceDXA5gI44d/WTlpms3XZmJSErjFJdW6Y?=
 =?us-ascii?Q?9IPzHZDBdUXAiQtAlK77uULszT9CPvsnG8BcG5ORI+Xb4vNZStw39DiigSUm?=
 =?us-ascii?Q?UEyjY895+zEV4iLoERtRw8ZSLbigf3+gdYkpqDpvJ0GNN0ALybqbbrwKkLHN?=
 =?us-ascii?Q?9HSqVZ1e+t0TsU3Co27MNXuhtdadmk8Uv/yss/0CUfmd78lacHB2KJl4WE0W?=
 =?us-ascii?Q?0skDnIrZjn8tdLlc/ZmswRP9tjb3xImoidcJmGPZk8CqHCRqnnNoEbPxRDE0?=
 =?us-ascii?Q?Agu9mLbJCnPBZJ67oP84gW7spTKuv8o//SRb1y5p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fe2333-5186-4428-cc73-08dd5af5e2cc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 08:23:47.7457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1M3Ylc9ECq3vF2RgeSukjxuSIUoq4AP8+NE5c4RF8rpsTx4WM5fAmdMOU8OybxWBoawio6Wqbzij52Cfjv08w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10311
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

This patch set aims to add NXP i.MX93 parallel display format configuration
DRM bridge driver support. i.MX93 mediamix blk-ctrl contains one
DISPLAY_MUX register which configures parallel display format by using
the "PARALLEL_DISP_FORMAT" field. i.MX93 LCDIF display controller's
parallel output connects with this piece of small logic to configure
parallel display format.

Patch 1/2 adds NXP i.MX93 parallel display format configuration subnode
in i.MX93 mediamix blk-ctrl dt-binding.

Patch 2/2 adds NXP i.MX93 parallel display format configuration DRM bridge
driver support.

v4->v5:
* Rebase the patch set upon next-20250303.  This causes the drop of .remove_new
  from patch 2/2 by using devm_drm_bridge_add().  Also, this causes API change
  for imx93_pdfc_bridge_atomic_enable() in patch 2/2.
* Update year of copyright in patch 2/2.

v3->v4:
* Use dev_err_probe() in imx93_pdfc_bridge_probe() in patch 2/2. (Krzysztof)
* Drop MODULE_ALIAS() in patch 2/2. (Krzysztof)
* Update year of Copyright in patch 2/2.

v2->v3:
* Define i.MX93 parallel display format configuration subnode in
  i.MX93 mediamix blk-ctrl dt-binding. (Rob)
* Resend with Conor's R-b tag on patch 1/2 and with the patch set rebased
  upon v6.11-rc1.

v1->v2:
* Set *num_input_fmts to zero in case
  imx93_pdfc_bridge_atomic_get_input_bus_fmts() returns NULL in patch 2/2.
* Replace .remove callback with .remove_new callback in
  imx93_pdfc_bridge_driver in patch 2/2.

Liu Ying (2):
  dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and
    example
  drm/bridge: imx: Add i.MX93 parallel display format configuration
    support

 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     |  68 +++++++
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c       | 186 ++++++++++++++++++
 4 files changed, 263 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

-- 
2.34.1

