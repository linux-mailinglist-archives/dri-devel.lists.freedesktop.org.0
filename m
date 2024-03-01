Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E886D938
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 02:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3449E10E856;
	Fri,  1 Mar 2024 01:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn
 [139.219.146.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE8410E849
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 01:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWZmQiVA6IDeMJPxHKDg2PIWI05np4VLBn2wMmtFoY1y/HH6RE4o5pclIbQNV0b2PQPZtQx3U0AA93RdWAifwvwEeZ/33jEmZlAbcnf9MYeOtmw3F97p5zPN6JXnkPcq7EGnPpIASiq9XbS7jok5dYGJd2bzV8pd8q2/v2ZR558RubbPanJZm16GUNu5kVZaYkw5zan0XpVX4c7UaS/Yk9VHeWB11pkJnY3vt8tjcfJEp51TTH7W8dgWf1x2wEldcvn8AABa/8badKzveneMg4x4ToiFfWEPsY6THCIWw6biSu6BvEjUoTUUEay7jaMrQY49cvRcitVtLFDL5bbzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaNyDTvKdSI5ZXeAMRZ6b+VexMfA48M5hTi7Iepd86U=;
 b=Guckj1pzeDhjZHoEPRFHQRKvbTAzoHNZZLG8lXPEKZhEBqLS0yI7iA02Jv+/wLAkmbRprBvn5HmKz68i2vNu7dOw+sWTFOCXoy8l6fu32PUqZhywXT9p8DfGJ3esAH5mImQ/4tuLMqZF/e3xxG3eExGj7I4C/ekpYKOzrT/HSdDqH/LOF820u9WU9I99qSD9K/Rd+ly2A5sZA8r9hjCqI0IBGlk5ffBilDMSilCd4DcKboyT5xKMOtP4xiZMYTsVgtpFAwZk5fDFC3CGPhU2vRLjg1jUgT3GVZ3vDgmrPd4/FE9ehnsrOEO7jY9LfwsjahbUMmaczjea4CNCWNLWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Fri, 1 Mar
 2024 01:52:40 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::db9a:cc7:56ae:de5a]) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::db9a:cc7:56ae:de5a%3]) with mapi id 15.20.7316.037; Fri, 1 Mar 2024
 01:52:40 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, aford173@gmail.com,
 agx@sigxcpu.org, rdunlap@infradead.org, u.kleine-koenig@pengutronix.de,
 sam@ravnborg.org, steven.price@arm.com, bbrezillon@kernel.org,
 changhuang.liang@starfivetech.com, keith.zhao@starfivetech.com,
 shengyang.chen@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add StarFive JH7110 SoC DSI support
Date: Fri,  1 Mar 2024 09:52:20 +0800
Message-Id: <20240301015222.93114-1-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0026.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::13) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB1102:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0edc8f-06d2-4b5b-af2a-08dc3992472d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCEgX28s+FVR8uuHX0XyXswP9Fg8qvEHjlDCuWBBk/PFsls6agT6cMrShrWdwRrraRMeJU/XkaGutFZ1Xw4CnRobIxChJS190aHpE34zx2rTCuwb1gc0IznwjDRG3FQmy8nTmmeiUG+gZjt+5rffKc5Dc+seBP5nE2BxVicJF0Mh+4ck3fARIO8UDi420dbQGUN+LyfOmr7cLeCkyr0slY+BDZu2VyDJ1Ss10S37rQKThvdOPSKeN1dqTb2uZATFxAahlHCNbjbzf9HFB9OMNDK/74BswanpJoZJsrdmkMt74AB2LNoPO9zSnlW1JXbgACKHfTnqxRSnAbEoA5lKQEOUtc4wtCqe9sg6fTwURXniVW9oROPbF3IeskPrRrlB2nQiBZSfJ5d2iNeByZ/B4fjTzKOVkce+2/jRwhopN+1v+wUQLJwQV3dVHyPezz54Z7HW4lVew4zXT9XxFx03qb4bJ4SX1IAiehaGpB4X3ZJHHmB1EAqR0PRLohucYtaRBv+WjNCQ+Lds7ws9eNPgDtgvOzxOfuwRSzKvp/KBwwQwlmv1f4CV3J3p0ezhg2M/CecH6NwlhwaDHd9HsS+sLS0OwQeFqzlDDlj8qT0+pRpTiTy11PYxyGX8M5GS6k92
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE; SFS:(13230031)(41320700004)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhlNOc9allVgFSm8ATXdgO71lOGJQiLPWi+318aKvAQahpVaMAtmv8OzqxHm?=
 =?us-ascii?Q?Q/F+y72YTSTLAhkZyffUx6j+BKkNOTZW5cx3ReqdxLVbpskkZT7UKp+eBeCs?=
 =?us-ascii?Q?M0FKHY0wAEgOv8h9PjGnDZ4mIFmqDrAQnH+x6QLZ9KUDi1D+UZhYcYUN9160?=
 =?us-ascii?Q?dHxRW6VU6ACGyFtIO+ZolkBx8VkDHEq4tMoM9e7wNx+A/MFNb6qL2/r94XTt?=
 =?us-ascii?Q?R+CuzAknLWVXY9JbaFwfjtI0gJIKMX6FUfjFhqIeV4m9ZVGVfqseXKyGpmtB?=
 =?us-ascii?Q?awayBHFovtNyeO84OMQ3ZSG9v150a9rIHot0rsnFXpmSiYdqK6qk4EmuhNot?=
 =?us-ascii?Q?DXoUP1bWmIbgtDXRYpzTFQCF6Fbi6VaL6HoVFbbwJ6s2ChbSXDJ4VEFj/FRW?=
 =?us-ascii?Q?FqL2v1IIy6ureuHZMXnWol4dZGcv4ZO0dq0mLYnLoFkbSxeIJvfLW5r30/CC?=
 =?us-ascii?Q?KbAiv6qbo9M12WM9FB3vE+0nKyJbFVvdn45BOMn5RDoutBKz8N6AVioc+Fem?=
 =?us-ascii?Q?wLX5Y2itvLeJRcvggnWQ5UAjCv6WVnPjipKbjn+65pYLBuEHwc7Nl3Sw1Ob6?=
 =?us-ascii?Q?ZtbTUcTa1FLupRXl2HYiDdCtaQM5344udwTiiGaKN5Y7uj2nASa/eLf5P/JW?=
 =?us-ascii?Q?17+BhKK6xTwLhvzcISlbmp9Ip1/aArz5ryXz7eATZ/+4/yfuQf9nIZ2+fyAi?=
 =?us-ascii?Q?WvH6SGSSM9PVpugVhmCgMZid1X9kQ4dglckgc/4bByKtG3GgdPCkGtkivZDY?=
 =?us-ascii?Q?P+VPT+R/4G3/T+6npr5903A18TEL5HnvCEYajsg8Dtf3VY6SU9N4Ggx5QuuM?=
 =?us-ascii?Q?sXtH89Pke8xXVLaJM5TTPd+CBeuIVKqYz4yVgcFFsqji6MV3WyqAZdMgytKW?=
 =?us-ascii?Q?mS5TC56gwfTQ4K8bQr63fQqVlaWJbMjYxb1mpPy7ao+ZamGLiTju6WZcX7H6?=
 =?us-ascii?Q?b3t61qZjYFuZBwTYJFdpvJrV2NNkG4BpPEwLiSbdYjNWGjqRwgE01ZakhAQf?=
 =?us-ascii?Q?kHsdoUpNij27OqEO1ol8E+h1BQmx4cenvW8qye1HSNPQG80UYv+rHlMxrKwJ?=
 =?us-ascii?Q?e9uG417s6JZ/gwlc7UnXyw8fm9eY0Yq4g3i9nq/3bJtTMfOg/sSfJJ6Meljk?=
 =?us-ascii?Q?4d/PNSVQ3xbGoIyo9/Fs8/ppdApBI0aDu13RjA/AOl4FzhXWioMwBDI2QFvT?=
 =?us-ascii?Q?xGLqmjA3rODmkcG+by+OazJw9pAsrMSueHrfzDbiqUUulEs/xR2U8bjaPkmm?=
 =?us-ascii?Q?aXUW2MCnnQ+UWicJTbtwsU/4P7NU6s5bS0lII1viCGBfycWo1fh20oYEChM6?=
 =?us-ascii?Q?KiLc+kLyNjGuD4FHr1chgy3e0p51N5e3Jvawyq0zjs4aGPtBX4+hmyWecDpW?=
 =?us-ascii?Q?Yk7hIO//J4L22XF/yWhdOCqAbhF5ogIjbEvdeAwydGlY4vymLGxc6xArcGMu?=
 =?us-ascii?Q?UtfC5+IZOpS2EFGztOO0w5vImPs77TsYOxhnA5ECI+DT/ygsX2/qt46mvCzf?=
 =?us-ascii?Q?LnlfuBWEvkihi7Axlq/Jc8khUVneS7b3UgP8lmOB2hjHCwJtL+ey/Cq/bXBB?=
 =?us-ascii?Q?E2M+SxOg/Toc7WMuFU5l7LR63KaXqJmmDqkj/H0GH9aVg6JO9u9LRgtk1S2K?=
 =?us-ascii?Q?IASEnGQbx1WOucxs74/bYRg=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0edc8f-06d2-4b5b-af2a-08dc3992472d
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 01:52:40.3745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ioorDlSOlRNlBS6vwqvnjpHNlr3/v1iqZr7LrnPoauftqt+6xJomiQt4zTQGkzPIULAyFNEWa5fvUPsRdynrWzSbt//oyuKGopkxhdgn4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1102
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

This series is the series that attempts to support
the CDNS DSI driver used to converts DPI to DSI.
CDNS DSI is embedded in StarFive JH7110 SoC.
The series has been tested on the VisionFive 2 board.


change since v3:
- Rebased on tag v6.8-rc6.

patch 2:
- Replace clk API with clk_bulk_ API.
- Replace rst API with reset_control_bulk API.
- Use roundup() in cdns_dsi_jh7110_mode_fixup().
- Add assert for txbytehs reset operation by reset_control_bulk API  in suspend function.
- Add clk_bulk_disable_unprepare() in cdns_dsi_jh7110_resume() for deassert failure situation.

v3: https://patchwork.kernel.org/project/dri-devel/cover/20240206065709.108684-1-shengyang.chen@starfivetech.com/

change since v2:
- Rebased on tag v6.8-rc3.

patch 1:
- Modify commit message and patch subject
- Change 'starfve,jh7110-dsi' to 'starfive,jh7110-dsi'
- Add constraints for reset-names and clock names
- Add resets, reset-names attribute
- Correct reset and clock names

patch 2:
- Modify commit message and patch subject
- Drop useless MAINTAINERS modification
- Change callback name from 'update' to 'mode_fixup'
- Optimize the mode_fixup function.
- Change devm_reset_control_get() to devm_reset_control_get_exclusive()
- Correct reset and clock names

v2: https://patchwork.kernel.org/project/dri-devel/cover/20240109072516.24328-1-shengyang.chen@starfivetech.com/



changes since v1:
- Rebased on tag v6.7.

patch 1:
- Changed the 'starfive,cdns-dsi' to 'starfve,jh7110-dsi'.
- Changed the compatible enum alphabetical order.
- Restrict other variants.
- Drop 'dsi_' prefix.

patch 2:
- Optimize the calculation process.
- Drop useless definition.

v1: https://patchwork.kernel.org/project/dri-devel/cover/20231127113436.57361-1-shengyang.chen@starfivetech.com/


Keith Zhao (2):
  dt-bindings: display: bridge: cdns: Add display bridge support for dsi
    on StarFive JH7110 SoC
  drm/bridge: cdns-dsi: Add support for StarFive JH7110 SoC

 .../bindings/display/bridge/cdns,dsi.yaml     |  56 ++++++-
 drivers/gpu/drm/bridge/cadence/Kconfig        |   7 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  29 +++-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |  19 +++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.c  | 138 ++++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-jh7110.h  |  16 ++
 7 files changed, 263 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-jh7110.h

-- 
2.17.1

