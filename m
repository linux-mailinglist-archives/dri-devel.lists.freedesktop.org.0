Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F82D0C41
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA12E89F49;
	Mon,  7 Dec 2020 08:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20063.outbound.protection.outlook.com [40.107.2.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B3389E86
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 03:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtjez6Sl5P1Nmie7mLX6eQJVKWWAmJsQlM4+ruLsUG+lbTCG9brWysU4oVUFI0pp7JYf8pFs6xotWBThfLelvcqnrAVoV/KXW+nqd0rDRHrp/HD4hiHJbzcg5xpaEnhJDLu6dE9hmcNTUN2c7GdWErnKFATvs6nqN6+jatoSaQyMEElVDeS5D7BgjwJGUG6vpbTUmu3JxzRmzcx0NTDsX2hzWfAQZh7QzNCCmKp44T8Yyyccp0ntwvtcZyzgnD0QStlQGLSKdjq6/80rtuseKIoesLkGbn3RVuWE/BKXpEDmzN5FGErCCA3QfQr7DTnpGST+3NlyJ5sG8RCGpuE/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuFvzO9zL2gSbLeYjIBinqM1CcHE17MaGXVTOHgbgHQ=;
 b=j9jBSFcfQaRAz3nsZbS7kbLsyEo4ZSlJfDSTvnF8xR/GxTOdnwDKFBMekjf3tjvXCN+Pg4uTtG0lj4BGw4KkLA8GCSs39KsuQcRpPDkW4V0fNneb26TOVNRI67sfjzC5XVP2DbW/URU0yteBN57ffUCLzpNWOHpAaYfnA5FnDLl+go1HLxJy5iwdPVeKrMTlgo7O48gtPZRnnzsZHfVI9eJaoCmE3gTc9NK8aQFmqYCUnlGRSuecF5tMKx5BEsijtprxjdKw19Q4PfmD5gR/R/OZPDEniFfR7UT0QbIiPEu5iBGNYL7uOnRCTpTyXr/9TX7eW0bCgmwuLiek3PlYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuFvzO9zL2gSbLeYjIBinqM1CcHE17MaGXVTOHgbgHQ=;
 b=aX7udSPc/t8t7FCZjFF/AouuFtL3a6y33YszFL+1i6FxkqLO2iiL6Q8oI2oNA5X6/ESzfYIBEChCBfbfmc0e2kTQGWPyVxc46zrXFyQgjaaLa4Zta5iqiYPMIyQ5XdT6snevuFbYTrRHO+vfJW3RE3oWbQced5AxWew9YS4aobI=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3424.eurprd04.prod.outlook.com (2603:10a6:803:e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 03:29:05 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.038; Mon, 7 Dec 2020
 03:29:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Mon,  7 Dec 2020 11:20:54 +0800
Message-Id: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0085.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::11) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0085.apcprd01.prod.exchangelabs.com (2603:1096:3:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.18 via Frontend
 Transport; Mon, 7 Dec 2020 03:28:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d470bf1f-348d-462e-16ec-08d89a603f75
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3424:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3424D9EEB7C29BAE5AF8A30198CE0@VI1PR0402MB3424.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2D7hfIVEXzBTK5aSYsVr6wIGcV5SesgscsUoFrDKMqQuVlvtZDnSxk/GoQ8ptzL4o6z/hdNOYns0AhnwMFkns3tWwvILWhr82ppOnayFPm3ehsKfLxhtZadJM7cC2idGif5/Y/EpPPcvaOX6QRPbj83AG06DnWR6kxkAoDNTCPS+6YKK35jnbYEMhqzp0BCMBFh2WD2+H9UCYolu9fBREeRGfDdnjId8CuIGAuaQux4HiEks63YOqZBol+kimta2e4y2/xyl4LTu0aJWP7pbrDe8wpg6pGZ0sixiG88PFWK7Wrpe2zv9/oTiIKNVbtce7yoLpZCCW10e740lyFCpJdyypTvxUeS2HNM+cngbn3AKcJiQuxv9wAxhRqZUvMQN35+5LrQjYJDSdK/7DaBG4Z0yvJHkYo+x6ZDm6QGHfn2+fC9Ag41snsHmckN/eQdMibmvSB+yqdBMb0Q5JqCMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(26005)(4326008)(966005)(8676002)(7416002)(5660300002)(83380400001)(316002)(6666004)(8936002)(52116002)(6506007)(478600001)(186003)(6512007)(69590400008)(66556008)(66476007)(2906002)(36756003)(86362001)(956004)(6486002)(2616005)(16526019)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sR61ua2NBaCd3R3KV7mY0a4E3063Ru5A6TzvEeF13fZ6a+vbhG10x/d26b0A?=
 =?us-ascii?Q?f8XzRkdnpO6ymfzoT3o7VYVLZKmM/YmSp+PYueTjtMgs/ouNyTR6uQx/qLeS?=
 =?us-ascii?Q?RqQoQb03XAtxooCJV2fjrFgZ7HTk8dQZCn9IzqqI5BxjrVQoCgprYkzATXAn?=
 =?us-ascii?Q?o0Fff+IfPMaARWc8YSoMkgkgsPX8+IfyvC+ZR0JUamzdCbrFdORS0ER0msai?=
 =?us-ascii?Q?wiDUrE8Xyp92BiOm9BX7R/Qn1eIQJWJ3J4FTHQYMPiMMoHLntsPY6lG2QdZ5?=
 =?us-ascii?Q?CDJCPrK+xSioAdsdGwPfKR0mPlXzglaYZVGTBzYlJKBZml4g+NY5MUrvTjrN?=
 =?us-ascii?Q?wYzcZYLWgwAQjzWg3dabm1AiuZJ/ZdakVOzY5hrVPBXSxGKiO4xS4eYFsYgs?=
 =?us-ascii?Q?TLxVnEVdOV7VE6ega4KVXI1PwgvITuyPWfMAbtx87wYw+dmF4ypCQ0aRtBtm?=
 =?us-ascii?Q?lwY5xx7TTLXtqEJKntaZP3qdgEQ8hHLKtLGzEww3KrfbSWw/b8J7eKCEH1hQ?=
 =?us-ascii?Q?r7gTCBILlvdt3StLSgrSabVyUf9/FBLRPeGrp0HtBcU9S7w9dbjZFH0jJ8GY?=
 =?us-ascii?Q?2/Ijs0XJ03M1cfOpjYSUJIO/Rr4Qn3r/Bzkcu6VxK+LTLxOZMXRjialudvKf?=
 =?us-ascii?Q?GiI/fwuMvRbhtnr/b79VEzbbA9GXdQcjRackr0Uv0KLYhXQk3O0IkEJK/v+o?=
 =?us-ascii?Q?uEwVDSxGne+ZPq0QOVemtDS4U28k/4jOO0LA3XiLtosTpClzmMASJleDiAYI?=
 =?us-ascii?Q?ST+5F5DpQ1TEki1dAnVaqpf0kxE0tEHf1uFSh2olsqT/+dFHD08czyWWB9/S?=
 =?us-ascii?Q?yPs1e1DMlSFCOMj2SP3ZgrVRLBifw2hm/jSCRh7Pvda02w4JBwSFTWU7LnXO?=
 =?us-ascii?Q?jzmo8YwLxygi+lPUd8IFTz6ZgYXutEQh7D79jSo2exeKACCyae0uV4cFgDPr?=
 =?us-ascii?Q?pHZAH+nIG5+RenqhUSe+7QSjZbjYe66zNLArYxN45FX6Fvju1jBgmbm9mD/3?=
 =?us-ascii?Q?qtAX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d470bf1f-348d-462e-16ec-08d89a603f75
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 03:29:05.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAKrLwFmkfaMY4gUYtYRpH6rqA6nVK7TEVZNLbopw48qNAX/g6uJZu4KPaKpEmUNoOxyZgHEnSCJ1XDgdvRpNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3424
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This patch set introduces i.MX8qm/qxp Display Processing Unit(DPU) DRM support.

DPU is comprised of a blit engine for 2D graphics, a display controller
and a command sequencer.  Outside of DPU, optional prefetch engines can
fetch data from memory prior to some DPU fetchunits of blit engine and
display controller.  The pre-fetchers support linear formats and Vivante
GPU tile formats.

Reference manual can be found at:
https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM


This patch set adds kernel modesetting support for the display controller part.
It supports two CRTCs per display controller, several planes, prefetch
engines and some properties of CRTC and plane.  Currently, the registers of
the controller is accessed without command sequencer involved, instead just by
using CPU.  DRM connectors would be created from the DPU KMS driver.


If people want to try this series with i.MX8qxp, clock patches can be found at:
https://www.spinics.net/lists/arm-kernel/msg859763.html

and, power domain patches have already landed in Shawn's
i.MX for-next git branch.

This version drops the device tree patches because we'll use new dt binding
way to support i.MX8qm/qxp clocks.  It depends on the below series to do basic
conversions for the platforms which has not landed yet:
https://www.spinics.net/lists/linux-mmc/msg61965.html


I will send other patch sets to add downstream bridges(embedded in i.MX8qxp)
to support LVDS displays.

A brief look at the pipe:
prefetch eng -> DPU -> pixel combiner -> pixel link -> pixel to DPI(pxl2dpi) ->
LVDS display bridge(LDB)

Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

v2->v3:
* Fix DPU DRM driver build warnings which are
  Reported-by: kernel test robot <lkp@intel.com>.
* Add a missing blank line in include/drm/drm_atomic.h.

v1->v2:
* Test this patch set also with i.MX8qm LVDS displays.
* Drop the device tree patches because we'll use new dt binding way to
  support i.MX8qm/qxp clocks.  This depends on a not-yet-landed patch set
  to do basic conversions for the platforms.
* Fix dt binding yamllint warnings.
* Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm in DPU's
  dt binding documentation.
* Use new dt binding way to add clocks in the dt binding examples.
* Address several comments from Laurentiu on the DPU DRM patch.

Liu Ying (6):
  dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
  dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
  dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
  drm/atomic: Avoid unused-but-set-variable warning on
    for_each_old_plane_in_state
  drm/imx: Introduce i.MX8qm/qxp DPU DRM
  MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     |  87 ++
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 416 +++++++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 ++
 MAINTAINERS                                        |   9 +
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dpu/Kconfig                    |  10 +
 drivers/gpu/drm/imx/dpu/Makefile                   |  10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c           | 170 ++++
 drivers/gpu/drm/imx/dpu/dpu-core.c                 | 881 ++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c                 | 926 +++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h                 |  62 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c            | 114 +++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c                 | 721 ++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h                 |  40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c                  | 297 +++++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h                  |  28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c               | 296 +++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c          | 291 +++++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c             | 221 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c           | 151 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c            | 609 ++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h            | 191 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c            | 247 ++++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c             | 392 +++++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c             | 220 +++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c              | 272 ++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c                  | 543 ++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h                  |  23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c           | 345 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c                | 703 ++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h                |  56 ++
 drivers/gpu/drm/imx/dpu/dpu-prg.c                  | 433 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h                  |  45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h                  | 203 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c                 | 249 ++++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c              | 305 +++++++
 drivers/gpu/drm/imx/dpu/dpu.h                      | 389 +++++++++
 include/drm/drm_atomic.h                           |   5 +-
 39 files changed, 10021 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
 create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
