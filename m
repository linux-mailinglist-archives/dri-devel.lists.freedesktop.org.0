Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38B2D555D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FBD6EA51;
	Thu, 10 Dec 2020 08:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140066E3AA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 05:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrKDYN3IL6IUvtltdvv3qaB4PwifSoBQmQa1qWB6QUj07B5DxCndq2fbRhHRIoZRUmsGEB5xMs4bQdcDeM8KlBLIWGFYoG3bU+VntKIntU7INR8i4ZgE5+bCoRA9M0ikDbqm/uAQrWAAKcuTl5WZZpp6xnARwW4uLHsqzzBMjofDhAub08O9V4m67I1Ku2YuWzOa37tnytkW8a366XDDcsgbcwAvDAiRDWdoFvkAZnojvQQgCMjid4zdyj/C1Gt2e2GeeaWn3O5YBchZtYT75dYTJa2MQnHEF+JUmiV7R1PZuvvIhjexbgz10mmWG7uS+gLqT4//ZXzuX+v6RLkUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJvlKGlLu4fJtxSiUlUzfk5oWOf/QBC1lLPprbFKZ6Y=;
 b=hk3Z/VuSJa7q9H/kgOnoSBkdyPOdKjdaTZBAFH3UKE50vOZKzMurQ6LFmV5O1fwUCl4MOFICHSDysQ33cQnMK18Kuh1peOt+Tv6scc/LtcquBXNZ8z545vR52Pqg0HojbG/YBTe6vhyFCR7RZgX5U6a9kNQOOZmeR88tRorNxEd44c2wyCW/IFCBVnbmMI1UoKye+aBGYATNOaV4msFjmYknNBM8ltZGyi+gR/4Z6jxm//E2zNfaqhcSYw+8J7Y2v7ZFzQYGw8X+AWJ9fwa+zd7XbM/YAMdZMW0e4tzALplaES8F4bCdIzseC1ckVhZkYjs7NT7LvPO96LDoqskUDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJvlKGlLu4fJtxSiUlUzfk5oWOf/QBC1lLPprbFKZ6Y=;
 b=dFoevfHIfHjoDC3r4aq8ZoNxX//8a3Mv3oFsunAtIm7xo4yuD60m+iMTe0QjfkPm108WzwnWV26OLNDvN7Nl8bYmCbES0sr44H8hC4ecWAL8ldcSb/wKQ4LcdiEPPPjGk/pw3oUIU/LZNCV0zSu60bmvvxzQU4hgGb4kA95Tt4c=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5454.eurprd04.prod.outlook.com (2603:10a6:803:d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 05:36:01 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 05:36:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Thu, 10 Dec 2020 13:27:25 +0800
Message-Id: <1607578052-4316-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 05:35:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64d4e862-cc36-4521-262f-08d89ccd7a7d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5454:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB54545D89899F6127E88799C898CB0@VI1PR04MB5454.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQMrdUkBSnj28n5EuEK2rjVaAymFzOkjyMOrvnBW98kXHZpOjN5Zy0ywBcxCb7Ff72RYzPyfIfBRuhjo6VUqw/gb5VPILUVBdTgzMO4Of/Lgo/3Q5g8LkkG48TSk3XUUT8ox3+3wR6E0QybkCC+Co7OKfmGG8s7vtRDNDOEXbXnuUPPNs1WL1NyZX0mi9yO1jmDywalulq/yEA8MbJPZJXeKS9XINOGo85Xu01SE05tnOXKeKXmLQgKFhT/BSddlVICMn7heStOgw2MuP4bZmvWK6bct1BfuoEUaik8IumBh5KY3l107WVZPleY9R8xBe7Fk5O2cyF3t5HbiUHhIwWJWkPXbCOrdhd8NLzdNUmip6qB94q0vhi5kXUe0pLlZ6NtP4kJ7VjyOGAEcNQGPfC75ycZbTD/rJaRoweDAzSfj0IVmozmZQXBE13SmYtJX35/EAjufdzYZSEiMKjuCYPVcTqDTAC0zaO+GrSbZS/mXYZFgC3ffhcMU2fU2X/xl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(7416002)(6512007)(34490700003)(52116002)(83380400001)(8936002)(8676002)(6666004)(966005)(66476007)(66946007)(66556008)(6486002)(508600001)(2906002)(2616005)(69590400008)(956004)(86362001)(4326008)(186003)(5660300002)(6506007)(26005)(36756003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qCcEz0L1a6HKHVgI4r3sA/HikspS2dZSODawbi87ls3ND/mFfCBWgzIN932U?=
 =?us-ascii?Q?sxpOIuEy69sYBc6mN6oywi4rEdnUFz5oDeoX1n2M+QlvvACB6mYzJdwPJdLf?=
 =?us-ascii?Q?+0uw3etZUX19gV70F1Ou0vVXHx3daTH0BCS8jlKpC1zPKz3vgwDI7ZYt3v96?=
 =?us-ascii?Q?zatJYkglUlIXO4V3mJXn661VitoxmINHgiqXNlv9TGRpkQ3eHr7e9FUP7Zm/?=
 =?us-ascii?Q?72FaM0VUJllsBMzErE1upl3Lo9ukqxC4AgoAzKWj3TC3Z025HAa+4lXh1XK6?=
 =?us-ascii?Q?bcdGlJihhKj5KDY8thDTxKQ4ucJlYJOSEhO+vZ+xHVk/s3ay2YqoqaqBW5fg?=
 =?us-ascii?Q?eqYa2EHpz2EvbDi6JC4LfiAPCvwST3pzSH6/s0Vbbnveuc7ozwFpeO6eE0ot?=
 =?us-ascii?Q?c48pcSLcp/6tC1Hjzoo8HYlLjj8y+SY32CxhtEt98JlZqCJ2t0vVKFC+sfxq?=
 =?us-ascii?Q?sqQFOoFWXa+KG7CTdeGBQJ0tCGu1QixAd9/82c+mIZE/XqqdKb9RtZ8oQxxt?=
 =?us-ascii?Q?7pR+t+x5hgn8gPsIL6qQh3HHelm9Ot4yj+r4A0KL+HrKNhMxPYAi0kSroo7o?=
 =?us-ascii?Q?/uhQxlg4YQZ5EzdF6F1HCRhC4wKb5Gq3KuwZWWCo+T2B00WmvtOZbb1Ix3hT?=
 =?us-ascii?Q?LcfLG1sbmY771I3waBIR4XmIxM23M9uOQhFDEDNoa21Ol56bMvcnemMTqWlt?=
 =?us-ascii?Q?aSP4bKsX4yWFEedSTLdGgFf740s0fsENPMhHHQIMqWzJXtHT09gWgBnwJP1i?=
 =?us-ascii?Q?lSEMR5mKizuyyLq1u52+pO+H3KTV6lz1OMd30poP1xUn/RoZbW4xWWkipWme?=
 =?us-ascii?Q?mflYM8LqU4mZ+9bRXY+yJbf+LrEsox63w27FfVi1w2oXNHQKoAIbls/P3/ht?=
 =?us-ascii?Q?fVim9Umaii8FEuOB3Wg+391SCCJyO2OnQuFMM3F/63JhKM1LqTRzxrFpiDDZ?=
 =?us-ascii?Q?+LkPhq+2daiB4JLw4NMlVIsyYUbWqkfQ72fTN0Hp9Q+1bZmEkcL4i2n0IIwl?=
 =?us-ascii?Q?aUl3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 05:36:00.9206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d4e862-cc36-4521-262f-08d89ccd7a7d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J32XrLHXhcyDTiAPbDG7Q+G/vXdOUTzQ2/YC2aela3kRXjd7WQromMkYqyNrBtmBFqUS8mH0hCilGjZZjhUqQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5454
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:39 +0000
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
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
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

Version2 dropped the device tree patches because we'll use new dt binding
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

v3->v4:
* Improve compatible properties in DPU and prefetch engines' dt bindings
  by using enum instead of oneOf+const.
* Add Rob's R-b tags on dt binding patches(patch 1/6, 2/6 and 3/6).
* Add Daniel's A-b tag on patch 4/6.

v2->v3:
* Fix DPU DRM driver build warnings which are
  Reported-by: kernel test robot <lkp@intel.com>.
* Drop DPU DRM driver build dependency on IMX_SCU, as dummy SCU functions have
  been added in header files by the patch 'firmware: imx: add dummy functions'
  which has landed in linux-next/master branch.
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
