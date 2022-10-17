Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E0600A5C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A2D10ED0A;
	Mon, 17 Oct 2022 09:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9028C10ED18
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1Wc0hrkVijQfLWnwf5DsLUD/Nv4P4l0HHUVQwdTSzwIu4CU2UygFVJKEHE1KGWnzJd7rW39Hnx7iw4XV5Eadtqsr7n3+aJ7CtRSyRWMwuZHtTYj7zhIp3zu2c9ap0l0Aui8eFD7UuEKVLNiaBJXXwWMBxA8uNPwrD7QwyTvLqBzNso72kjs/HoiqXr2V1AamolavlNhEKnmnVyJNSYZuy62Gvxo0SGxEwchYXTZ2F5RkTkkxhz7tCeVNJQr+9gNnsW/ebVf4NlLmtJ81cw6TNa/hTh1+KVUyfuWqybmo41+Ig7cwSgwnwDM6J/tRvgZUoRKFHawrjJ14nGb6oRM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJzbardzdH9MIyyMdBeh4hEWK5HyRjpl1wIq7HQgAXY=;
 b=CtCLJOA0A6rnorjdtdHbt4GDKhry5b167fUuWYAz0eunCB0gUYkYbMT4NZ7QHAB3pJWMM4JhRzplHMehrZhYj+0CY+bCYY8reR2DASHEwofgjddLFQ1UNr4RYv7ABYG9mGXoGGMGebiUcp8zdrB71IXXeJsINlwmEm5ZkR73q+yOK0NYTnbf/grXaMkwARe+aZPKQT88oRki210Lv+hnWYxZQLBRKueYu03NlHxaJ93ibxq45livS/wxm11Ys9Oh3+YlfvPBYyAmy+thqmkvCBh7z4IMpayv2f4+l2umCyheVJCJLkhJNz3rGu944uFuviqhLv8ZB0IG1XFDWTl+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJzbardzdH9MIyyMdBeh4hEWK5HyRjpl1wIq7HQgAXY=;
 b=e/nLHaq8aaQLjpW1GJ01qNqp27rAOGvEj6iV16fEjAsn3wxwAwm7np4+RQZLtiO2HfuL9Thwb6xIYBnqBcb7pGKipQZaypts/ah67noQLRs0+o1FEOGykbzan8wE/LyOlmCzLCwfjCOI5mxSK7dbrTI4FXZXxzrkNorYSg1ko2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 09:21:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 09:21:48 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Mon, 17 Oct 2022 17:23:02 +0800
Message-Id: <20221017092308.249665-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e60c733-e055-4ecf-d8f0-08dab02104b1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3EP/kK3N5MaeejwT5NLQohUHvMYJakZ77JyeCkrAWH+idK0LUIjVSkK5L7pr4JikX6h7i3aS64eoHi1So6Bi0r6yc/QbSY1B6oyf4dUK1vhWS7/dBLmv5fVYdkWviLTPjF+2ukkcM3O71+emXsuK7pFZ2gJXcNl3F9c/v+lJpkbQUYmmXjG+dx8z1BBcRC008z+YIxBfC0euFv4Q/foi95wFqIawwz0JV3J3G4OffIagcmf9UKu0y3C+QaZV8+JK95WOJ5v/T7TWB3mcp3z9DSRFgmKTZNk7bmJPpSf6SowZLIIq8w4gbFTC4u63AO/USIrfogQT27cwvulaVHt9YEanYCYPSVJg5tVjBjBFOKbDrSL3h/9+8SrV/mInE88HHkM5mEUbYLlqk0cfcMfS7bOuFbjVV/wn5ap9SY4Fm6k5H25KiB/1KVlkPCcBswobHf1wkDJzs0RpNeFOdxeYBVC/OjoWfhGs1Alw0s8JBK1NwR7kG4mnNyO+B6T+SYNCDA+M4c2FcR3CQSgQNfEQNbdNCaN4hSeyeaJhQg+2d0wB0i62D6rrNXSVZgkb6epfpD61+aJCILnoTK9cdvVv5MT8tZhEtzMcXSs5X9pANOgZyBAOC+akyLShUp4yEyuF4zG2K3G9dJSaZNCodUL2Z8Tbq1UpmvzvqN0uVG6McC4ECM+5y/55HVnAWBh5CBXCHL6AI2GSLDCENvPXGxymBZ0ndmHOrkXoqVVloaLrTXI9ZcAyrCEqzEG/GIZNfO0/PNIUXtyMVXOSs64ALFmpXRLtQQqwOZ/jtH8nr5hJqh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(36756003)(66899015)(38100700002)(38350700002)(8936002)(5660300002)(83380400001)(86362001)(26005)(6512007)(6666004)(186003)(1076003)(2616005)(66946007)(7416002)(966005)(478600001)(6486002)(316002)(66556008)(66476007)(41300700001)(8676002)(4326008)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Poyt+KkgtFLHoWy3DWcutTcJXScEtytZ/wBEXNlxTCbv9rWqlL/d0z7kN/uz?=
 =?us-ascii?Q?9+d1zBVeuYcmFmSOI63keErnzmZntlCct0TnD5LM2fRTMKYffWEQifnveHp/?=
 =?us-ascii?Q?iJcxyjswLKkUcCVuHcGGUNFXo8CUYuJAns8U7c46OcsLAA5qznwki+PHGqJg?=
 =?us-ascii?Q?XFmLiUrZ2eReFw3GO1ExeX9Z2OOAzvrfxMReGmQbQM0ZokvMX0P0kMn9OQni?=
 =?us-ascii?Q?icGHgNydt1LpuWm+OEJ+nP9cwhP5c4GpecJ0AS7Cal0PsRAvf6UEfcegVFDv?=
 =?us-ascii?Q?JT+/fAUepOuzuqULcvSKL1pzZk+5NdXKuKdJqDFBXaHQeESZqEoDNuROvEKp?=
 =?us-ascii?Q?lxwV+D9dpFf8UbHvF+/7bLEZRWjtZVw96BHBL6w2gsp653uCfa1EoyfOm5ri?=
 =?us-ascii?Q?lHOmilglfTukpIt3YyHLLocCmgBA9vNHfYF4ZOBrOTNrPUapvTBp5oNQbPey?=
 =?us-ascii?Q?FNI1THgM//7jyydhoWJ2YEOMQs+jzi+EkF0GZ4gF92RlyqjxgkfU4hCM6M1t?=
 =?us-ascii?Q?3YpfB7n8YaUQnw1NvcyHL5BX5CNZf5mNdZbWLNxLkgdhFCm7q9vPE5qUPyUk?=
 =?us-ascii?Q?eVnaR8Trsx/cxf9lkut4RXKBFSMQotIB2yTXe+zx/XcwTq0GUyddZdKW/KaN?=
 =?us-ascii?Q?ix6a1Z/ZQvQF1VHRCHfUUy316DOkcd6FTJR+JDhZRx9h9jo8uHoVcLFwh6Gc?=
 =?us-ascii?Q?TydS5CWySlAI8pBGSZJ3uwaKk0bYzHdKr/MQOXv97qx4KTOQzImGYJd9+5B3?=
 =?us-ascii?Q?8BCS/F63j915IU2LJ+CWeDWg20H8dxFgB8k39smBTYdzqZ2wLgq4G/DquFai?=
 =?us-ascii?Q?lyD8OOP0+ezv5N93MClHq72Fcm3aJGMArqAfl6fSn2pTnrbgZz3rj6Qbp1yy?=
 =?us-ascii?Q?4uID/Nbt4ioOef5M0O+PD5JiAoP40opiWumZEIhWD4R8Uuwp1zo0eR7O+8WN?=
 =?us-ascii?Q?6NeDPFfuoAEas8438QBXVCz2eRq+AWVj4CAdZqLI6oTGW7tXHuVWtFzF3KO7?=
 =?us-ascii?Q?BfbvKa61I0l0wXnNBPR1R+BMDZt75tv7rkCMRjAu+lRC9D+XWGcXZJRYXxfm?=
 =?us-ascii?Q?33P50NIIIvP83xhia6Ta+dYXiR3H16gZzqu4y/uhwJVXN8uUnUxjpdNc7LoJ?=
 =?us-ascii?Q?KZEQAju4wKbnuxOVZkoI/8scbHF0cH/783J8Ns044SnKwM8mV5tpCZ/W7U/L?=
 =?us-ascii?Q?RbKQignRjLgaf8jIUlvc0MMI1q8D5rkfQhr3qEwjjtQx6PUEaTES0Kl77+on?=
 =?us-ascii?Q?m8SZjCzQ34QsMuTVvtmTF1PANiUsZoMf98d7Lv6gV/PUpAqYZ7psFDdJCkFa?=
 =?us-ascii?Q?5z6yG2JFHxjkUEGr5nBm0vvSSrIMue8QmVVxuQLCUj323JwXFfSrlQORqUEP?=
 =?us-ascii?Q?+fzvz9bFNXOnliAPtQG5wBWU/C/JWpYKceq/PzclV3suVgQth8Ol75z/qVFK?=
 =?us-ascii?Q?Itl+YnJITdNTO8bqQ8B4Yh8pxpYuPrKepseVFKNE9VuEOkScJDKH4du5IdB4?=
 =?us-ascii?Q?+ytJpY7532ihNJOX5EXFXmjc7E4IWmSjbe2C9PutCqmSpkJe0DoUwDLO8iL4?=
 =?us-ascii?Q?+7RDmdu4u/JPdaDpiztMjqzov6rV5o5GNHwRxTK/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e60c733-e055-4ecf-d8f0-08dab02104b1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 09:21:48.7863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvuwWKT9Gn8JvEOPPsnqq0pRGudL1pDuK9pRzeJ138HHpcErZ5jomTsETbs9FzaBnk+1leGlH2Oeu4tR7qoDsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This is the v12 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
DRM support.

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


Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

v11->v12:
* Rebase the series upon v6.1-rc1.
* Minor update on Kconfigs, struct names and macro names for patch 5/6
  due to the rebase.

v10->v11:
* Rebase the series upon v6.0-rc1.
* Include drm_blend.h and drm_framebuffer.h in dpu-kms.c and dpu-plane.c
  to fix build errors due to the rebase.
* Fix a checkpatch warning for dpu-crtc.c.
* Properly use dev_err_probe() to return it's return value directly where
  possible.

v9->v10:
* Rebase the series upon v5.18-rc1.
* Make 'checkpatch.pl --strict' happier for patch 5/6.
* Add Rob's R-b tag on patch 3/6.
* Add Laurentiu's R-b tag on patch 5/6.
* Add Laurentiu's A-b tag on patch 6/6.

v8->v9:
* Use drm_atomic_get_new_plane_state() in dpu_plane_atomic_update() for
  patch 5/6. (Laurentiu)
* Drop getting DPU DT alias ID for patch 5/6, as it is unused.
* Reference 'interrupts-extended' schema instead of 'interrupts' for patch 3/6
  to require an additional DPR interrupt(r_rtram_stall) because the reference
  manual does mention it, though the driver doesn't get/use it for now.
  Reference 'interrupt-names' schema to define the two DPR interrupt names -
  'dpr_wrap' and 'r_rtram_stall'.  Accordingly, patch 5/6 gets the 'dpr_wrap'
  interrupt by name.
* Drop Rob's R-b tag on patch 3/6, as review is needed.

v7->v8:
* Rebase this series up onto the latest drm-misc-next branch, due to DRM plane
  helper functions API change(atomic_check and atomic_update) from DRM atomic
  core.  So, dpu_plane_atomic_check() and dpu_plane_atomic_update() are updated
  accordingly in patch 5/6.  Also, rename plane->state variables and relevant
  DPU plane state variables in those two functions to reflect they are new
  states, like the patch 'drm: Rename plane->state variables in atomic update
  and disable' recently landed in drm-misc-next.
* Replace drm_gem_fb_prepare_fb() with drm_gem_plane_helper_prepare_fb() in
  patch 5/6, due to DRM core API change.
* Improve DPR burst length for GPU standard tile and 32bpp GPU super tile in
  patch 5/6 to align with the latest version of internal HW documention.

v6->v7:
* Fix return value of dpu_get_irqs() if platform_get_irq() fails. (Laurentiu)
* Use the function array dpu_irq_handler[] to store individual DPU irq handlers.
  (Laurentiu)
* Call get/put() hooks directly to get/put DPU fetchunits for DPU plane groups.
  (Laurentiu)
* Shorten the names of individual DPU irq handlers by using DPU unit abbrev
  names to make writing dpu_irq_handler[] easier.
* Add Rob's R-b tag back on DPU dt-binding patch as change in v6 was reviewed.

v5->v6:
* Use graph schema in the DPU dt-binding.
* Do not use macros where possible in the DPU DRM driver. (Laurentiu)
* Break dpu_plane_atomic_check() into some smaller functions. (Laurentiu)
* Address some minor comments from Laurentiu on the DPU DRM driver.
* Add dpu_crtc_err() helper marco in the DPU DRM driver to tell dmesg
  which CRTC generates error.
* Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() in the DPU DRM
  driver as it is done in dpu_drm_probe().
* Some trivial tweaks.

v4->v5:
* Rebase up onto the latest drm-misc-next branch and remove the hook to
  drm_atomic_helper_legacy_gamma_set() from patch 5/6, because it was dropped
  by the newly landed commit 'drm: automatic legacy gamma support'.
* Remove a redundant blank line from dpu_plane_atomic_update() in patch 5/6.

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

 .../display/imx/fsl,imx8qxp-dprc.yaml         |  100 ++
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml |  387 ++++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml |   60 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/imx/Kconfig                   |    1 +
 drivers/gpu/drm/imx/Makefile                  |    1 +
 drivers/gpu/drm/imx/dpu/Kconfig               |    9 +
 drivers/gpu/drm/imx/dpu/Makefile              |   10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c      |  171 +++
 drivers/gpu/drm/imx/dpu/dpu-core.c            | 1044 +++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c            |  969 +++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h            |   72 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c       |  117 ++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c            |  715 +++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h            |   40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c             |  292 +++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h             |   28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c          |  299 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c     |  292 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c        |  224 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c      |  152 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c       |  610 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h       |  195 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c       |  248 ++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c        |  395 +++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c        |  223 ++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c         |  275 +++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c             |  542 +++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h             |   23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c      |  348 ++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c           |  804 +++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h           |   59 +
 drivers/gpu/drm/imx/dpu/dpu-prg.c             |  433 +++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h             |   45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h             |  231 ++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c            |  250 ++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c         |  308 +++++
 drivers/gpu/drm/imx/dpu/dpu.h                 |  385 ++++++
 include/drm/drm_atomic.h                      |    5 +-
 39 files changed, 10370 insertions(+), 1 deletion(-)
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
2.37.1

