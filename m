Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53678CA676
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 04:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED25210E227;
	Tue, 21 May 2024 02:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E2610E051
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 02:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mrz4ZLARi7iCIk2AzWAuw4XcPkQmjAbMA+FQ1qmUITEz1X6ihwQlpOk2H6OXoDyJ0C+RaynvORQ8V436GHafsU75WfQQg3Hue5bkqLHAUmCj2ZG4y+pDDW3x53UKwpeptKnBhgplA5LAvrxXaLWCg3YTlY9j7dfoFQHJZS9MYRi2WLxviVckTMGgYG2SR3uF1EW+pZggxHng9rnKWm7QmVh9dAQyqxKx8wIrJ8hHCMZpARXZbYPh2cV3mxjcOaxL5X/yE/GscYrObjl0bTb3zLlhcCeyNJYIlGp3rnSlT2d254MHWio5ZA0M1eStZ1H5JD/IERRmjqtgNU1PLsFYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRQeh9nlH+L9Jtph5WFyf5IA3DuCg54oBBKn9zKOaxc=;
 b=BOQjGiWceeHt7EpK5nf81huhd4NUOK0o6zGhxUrXYLCCLfPhW/dmmjXjTsgKQS6iEhmnKtWEtUNbNjAsR0rhOyxuBBhT66IMkyGz2xuJu41CBdxVLQDqPs8Jk/pmLGUYbBhdt9kG02rQuHkw3CcufakQqIaT6vJfBFWNY1u3ojZJt1kKoHMRccJSGavUN+EK9oyQWjQWCJzmIGW0kLMRrGIS2jx3UWY0Nva3oifLgKDrJ2tyOtocTI4opvjG+Fl8GGmjik3MjQDKKPpq+BuXK1DIMjWf5OBVNWRf5m/s6bDMfavoC9tXqS4KlTpZoR3RjOVwmp3l3ny5NxeQgq22RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) by ZQ0PR01MB1255.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 02:58:25 +0000
Received: from ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 ([fe80::39be:8ed9:67b7:adc6]) by
 ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn ([fe80::39be:8ed9:67b7:adc6%6])
 with mapi id 15.20.7472.044; Tue, 21 May 2024 02:58:25 +0000
From: keith <keith.zhao@starfivetech.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 keith.zhao@starfivetech.com
Subject: [PATCH v4 00/10] drm/verisilicon : support DC8200 and inno hdmi
Date: Tue, 21 May 2024 18:58:07 +0800
Message-Id: <20240521105817.3301-1-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1047:EE_|ZQ0PR01MB1255:EE_
X-MS-Office365-Filtering-Correlation-Id: 6793486f-8676-484a-ddcd-08dc7941e227
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|41320700004|1800799015|7416005|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 4AczXecf2/nVAQSxQxf7QPytkn2KwbWR2WCOx2sfop3yQiRQ3rQRNPjUyZH1mmO4qnprxFnOdENKrpwl6FMqQz4usxTjZkOkVUskxWdLi5X8kpKjP/sVLWqSH52OY9lhd/gCb50vhoObErYu428dY2EOwJNSjNVTgTKjw2eevguRVbrHj7z0I58DtbzzHBbvh9plXrD3znPyGR/KV5KWpjYuIuhuM3hoGjqS5UjOkmFEHALQJdkr5tMEhwWh2mOouh+wWiyXC8f6Vk9VymCSSC/O9zq3G1FAzQJEeQGrykL1ovq1IaPVGMzL6l3pj30griy0igpKATkN1HVgZb37bkVxb01Vkp19dIsBbB3aUT5Ae3DGyJqkKpeXTrWERyXLZ0BQPpuIVo6hrgib6fU6fp+XD1/EF7RRvRjp5ksEA7Nd2HaDsXh4UZZtgMU+ZSchRCeWi4Le4931FslvJwiCLRXUbOzwiwqpqOsVZAtY4rU2NXJRzFywqY64MrRW/BMc78BU3VX6o7zTokXEajBE1bMozGFj6vW+9pVGKITvaZOAcbk2YJYR5cmUn3Ggidi/+X93ZUdH4MpfuGOR00R/XRWzZOZgtRUK9k2hXNNWoTYbVnzWWkNuaETIE7APfaevOHJfenLly8El5f87qDkCCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366007)(41320700004)(1800799015)(7416005)(52116005)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s0QntV5gAVltFNocsAjb6Udl9/UAUoReW4r7fdU67POye1tZsIeul52vpVSJ?=
 =?us-ascii?Q?6HhdTL8tVmoDUxYBZYMuxXG9ZHPLdi6GpDQCs2QPSSF0QSzgYbsuWH0DfjCT?=
 =?us-ascii?Q?8TA99RoDg2qCvQWThn6E61vUVh3BpOaeybYK3M5qIyob7+XsdDSEHjZSKqJ5?=
 =?us-ascii?Q?iCVykzclhncYEw5UVo/y97rCoLlwYdJX5OYwrYSiUoMg917g66WBM02iEzEb?=
 =?us-ascii?Q?hzyqFjpP4gz0Vc6tQqMPuVG4aY4IEz5DCXTo2q+pYSAKOljisrAg47AMlS+T?=
 =?us-ascii?Q?vzh7C8Z259AyVwsmgopUh2ZjMjdU5R35Ofj+aBqMQ3c7e99Fkm4qb6i9uK3D?=
 =?us-ascii?Q?IE9OY4outXiR9eh3sebZhpc7GOcs83+k2BpsrD2G1fRciOu3yvNjcjpX0ezG?=
 =?us-ascii?Q?KZsHJ8Wcqj5LiDZiGxVngoftO1H5iDmXKhgv1KSvPkrX4ymq3WgyqxkrvHiH?=
 =?us-ascii?Q?xq3nOb+CL5tkjxjDHpoB7DBhB2mBxCs1eGj0nJwBLN1S6Bz+YyGZuqa1sSbq?=
 =?us-ascii?Q?Q9w4TlnsiiLHSo3a35Cw3QQGuzq2q2Q4DFN00+MyGYLIc9O3chLmorxUuyT1?=
 =?us-ascii?Q?Vn/q4layTWNqImD/05Dh4i7wpCxdXIAOhj3XTZA/oH3piSlNmvCfQe1teVgy?=
 =?us-ascii?Q?617pbOAJtqmh2F7c0jizIdqTK39QrZTv46qVpbg6/WUEPreP3VIMWpyUZAe5?=
 =?us-ascii?Q?zt/w60RlkALDF4s+liU2IFA5KWDYRKqbbNQATiVD7oq+I+6x8qh5Q+6HFAmb?=
 =?us-ascii?Q?9qUY3Aioi7x6fDDyIVD2nmOLl1a66y72GYUyh9oH/agMGk+IrG3hqFSqRFzJ?=
 =?us-ascii?Q?cE0fNVCUAngkDNhLykSsw3aft0KYt948bwGw+GJ/y7Nz5p6SC0akAaX9n9ee?=
 =?us-ascii?Q?wCvNVSzIttXYrLZR2H+clYhiP0Vzlq+tUL/T6miJ1qhF+JjEIekXCKCRNYcQ?=
 =?us-ascii?Q?l8thCsNEBxJ5rQ6yM5K2nfLNY0Ry9OYif+/GGXuMi5y64yaInozMohNFk/Co?=
 =?us-ascii?Q?Sbwc++tKqoa9gV+TzCMJ6O8kEUL+e29rw0zz0cZOrGHgsU5A8ddIISpCO44/?=
 =?us-ascii?Q?DgGIuLYeOAlz/+3FRB97eNsUc9q6yxH3PbdsaNbydeKo8iqhG7pThZnizTyv?=
 =?us-ascii?Q?cnExCIjjrUrvq6A/wDO2a1O2NNBfK8iFAGLAE58sJuAofAvzWbBj4Q7IusT5?=
 =?us-ascii?Q?PdGDCiJHE1r2Lvirb8V99kFHT1NotaXsDFh+T/9T+YoZaauEpT8LksqqIPHL?=
 =?us-ascii?Q?n8YmTuN2TMrk4E0C5q5SaPz/vly5g3soGf98ab8vFGxSjKgqjEM2Op74CA4F?=
 =?us-ascii?Q?Sl+KlxutsQ7SEhmszqXaMhadcMpi2z9MAjYQsVZ73BugWuO3qUW/kwNt4VtO?=
 =?us-ascii?Q?q5E0aQbqIC3IW2RjECgiflwTFZ6dVjffvoy3gnlnp66/0OYFSJemK5myKTzq?=
 =?us-ascii?Q?F+jdDeA773YdgJfhhUgPEaZoEfEzuaUK+SsGJClYWbvNCfK46b86K8PTNl37?=
 =?us-ascii?Q?T3VW5ZHhPkah4zOkcUSKtMHoSH37Uf1cG5OBhPA9zEHiqqie0oKMkg5kC5pB?=
 =?us-ascii?Q?zficqJBaIgiyNKWi7lPDC6LW0R/ZGpnYKqu0iru1O8UicTpAHQKBO5q1vkZC?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6793486f-8676-484a-ddcd-08dc7941e227
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 02:58:25.5119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiDc8aGu7aLK6lDIsxsmTVUD0YPkbgRXeY7b+fHHQ+SkaPegSXTBpWGzUCwSYIMOSOXLlSWycodrBIr8kjiiAwGuOG7S0dhZHdwzEyWVMi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1255
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

Verisilicon/DC8200 display controller IP has 2 display pipes and each 
pipe support a primary plane and a cursor plane . 
In addition, there are four overlay planes as two display pipes common resources.

The first display pipe is bound to the inno HDMI encoder.
The second display pipe is bound to a simple encoder, which is used to
find dsi bridge by dts node. 

Patch 1 adds YAML schema for JH7110 display pipeline.

Patches 2 to 3 add inno common api and match the ROCKCHIP inno hdmi driver 
by calling the common api. 
The collating public interface is based on ROCKCHIP inno hdmi, 
and it can be resused by JH7110 inno hdmi.
Those common api are tested on rk-3128 SDK, which kernel version is 4.x. 
step1, make sure the process is consistent with the latest kernel version.
step2, just remove the interface and add a common interface. 

Patches 4 to 8 add kms driver for dc8200 display controller.

Patch 9 adds inno hdmi support for JH7110 display pipeline.

Patch 10 adds a simple encoder.

This patchset should be applied on next branch.

V1:
Changes since v1:
- Further standardize the yaml file.
- Dts naming convention improved.
- Fix the problem of compiling and loading ko files.
- Use drm new api to automatically manage resources.
- Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface.
- Reduce the modifiers unused.
- Optimize the hdmi driver code

V2:
Changes since v2:
- fix the error about checking the yaml file.
- match drm driver GEM DMA API.
- Delete the custom crtc property .
- hdmi use drmm_ new api to automatically manage resources.
- update the modifiers comments.
- enabling KASAN, fix the error during removing module 

V3:
Changes since v3:
- Delete the custom plane property.
- Delete the custom fourcc modifiers.
- Adjust the calculation mode of hdmi pixclock.
- Add match data for dc8200 driver.
- Adjust some magic values.
- Add a simple encoder for dsi output.

V4:
Changes since v4:
- Delete the display subsystem module as all crtcs and planes are a driver.
- Delete the custom struct, directly use the drm struct data.
- Tidy up the inno hdmi public interface.
- Add a simple encoder for dsi output.

keith (10):
  dt-bindings: display: Add YAML schema for JH7110 display pipeline
  drm/bridge: add common api for inno hdmi
  drm/rockchip:hdmi: migrate to use inno-hdmi bridge driver
  drm/vs: Add hardware funcs for vs.
  drm/vs: add vs mode config init
  drm/vs: add vs plane api
  drm/vs: add ctrc fun
  drm/vs: add vs drm master driver
  drm/vs: Innosilicon HDMI support
  drm/vs: add simple dsi encoder

 .../display/bridge/innosilicon,inno-hdmi.yaml |   49 +
 .../display/rockchip/rockchip,inno-hdmi.yaml  |   27 +-
 .../starfive/starfive,dsi-encoder.yaml        |   92 ++
 .../starfive/starfive,jh7110-dc8200.yaml      |  169 +++
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |   75 ++
 .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
 MAINTAINERS                                   |   11 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/bridge/Kconfig                |    2 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/innosilicon/Kconfig    |    6 +
 drivers/gpu/drm/bridge/innosilicon/Makefile   |    2 +
 .../gpu/drm/bridge/innosilicon/inno-hdmi.c    |  587 +++++++++
 .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |   97 ++
 drivers/gpu/drm/rockchip/Kconfig              |    1 +
 drivers/gpu/drm/rockchip/Makefile             |    2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  517 ++++++++
 .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |   45 -
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 1073 -----------------
 drivers/gpu/drm/verisilicon/Kconfig           |   23 +
 drivers/gpu/drm/verisilicon/Makefile          |   11 +
 .../gpu/drm/verisilicon/inno_hdmi-starfive.c  |  481 ++++++++
 .../gpu/drm/verisilicon/inno_hdmi-starfive.h  |  152 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  241 ++++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |   17 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1060 ++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  493 ++++++++
 drivers/gpu/drm/verisilicon/vs_drv.c          |  721 +++++++++++
 drivers/gpu/drm/verisilicon/vs_drv.h          |   98 ++
 drivers/gpu/drm/verisilicon/vs_modeset.c      |   36 +
 drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
 drivers/gpu/drm/verisilicon/vs_plane.c        |  487 ++++++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |   26 +
 drivers/gpu/drm/verisilicon/vs_simple_enc.c   |  190 +++
 drivers/gpu/drm/verisilicon/vs_simple_enc.h   |   25 +
 drivers/gpu/drm/verisilicon/vs_type.h         |   84 ++
 include/drm/bridge/inno_hdmi.h                |   69 ++
 38 files changed, 5840 insertions(+), 1144 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (85%)
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
 create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.27.0

