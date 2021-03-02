Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5644732967B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 07:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA83C6E8BB;
	Tue,  2 Mar 2021 06:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00069.outbound.protection.outlook.com [40.107.0.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72516E8BB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 06:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abgWYHcTMxs5SWV9/XlJyNoCL/iXKQRYCE1s2TheNT/RmJm01Uq+QdKtU09uM+ZvByWb3CN8eae8IYhBoeMucnAtF86PXocHta/DtnHS3IOIf4S8a1y+TMP5CEo6bhf/gy2+JOmzk/flWvjONsEgn93KuWE6eW50ATgwq6tnNrUZNpwlJFQ3h2baUItjdFEDhXKFwh2CrulmUyWtTWIysB/ZYJpW5T2O00BVcRqeZNL4VPdAON4Dgd+qdD8FKCs1xoxgaaNSBiOXe037PSiVS04j7bhO4f3d1mSRZ+CI80G4MKTioPDEp2hQnv7WWyuTQjxjktxDqazaTCBmK0UVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/UaJ2LdyFSufRCMYwgtw/v6eRjZWU5rzfwAn8S2wzo=;
 b=AFLKc9YVpZkv7ZRJVJSAmsevgDo7nshgm0MUlNcOsZNUFkoAmfjE6OG32kJEo34gw7QAsGUzTHZ4p/1nC+yjIXgqHGTcJjxczT0SBrYP9orn3FdMwRyWMpqkt2MlPtsdgv6ncoiICNbRA5HDrdZfC4TgF8fUbqmEb4cdk2ScoTJ/g+vasgwpJqXTmpt/lAocozapEqKPKAZrLKio6nmZxP6Tpqr7+ol12UJowmWw+8dVTD1pQ4Vvpsb+ULpCnf95836xsOXtD1MKjwIcH+g9Mxebmr/MGptGiaf9lCz9LpCTejd2Tc2QvqbR7GKdxK/ueLL0cwUzzn5AXLklSKhnbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/UaJ2LdyFSufRCMYwgtw/v6eRjZWU5rzfwAn8S2wzo=;
 b=bJl7/8gbDevHXGvmKBKqV/eQil+OmVHYfcgGPYBOIfXMxvk1tGnuFeduAn2RyQVJtgQ1q6GyJh3nmwvBcRzDHBjsFsgUDa/jdTCWTUkhaFHedCsMabzvhFBY8OEfckWgAKzKf++hUY5aQyO2RKjgmTejuLE30H5I6c96O/4PLdc=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 06:46:03 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 06:46:03 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Tue,  2 Mar 2021 14:33:10 +0800
Message-Id: <1614666796-19374-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0191.apcprd02.prod.outlook.com (2603:1096:201:21::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3890.28 via Frontend Transport; Tue, 2 Mar 2021 06:45:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e2b93366-a532-4e68-0dc1-08d8dd46d900
X-MS-TrafficTypeDiagnostic: VI1PR04MB6816:
X-MS-Exchange-MinimumUrlDomainAge: spinics.net#7446
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB681612D71902380FE4645F5C98999@VI1PR04MB6816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8u/SVKtr0CoyiNwDUUzs+KDQJERmMJZfa+8FHNBXizy0pCHT68EIZKd1ETyAACVbRP//UWGGfthG/QWBlGLIpqLc2DAa87bp/Y3xQZIEmdy7YOp55a4yyQG0cTExkEXpXBqAwZRxQ8ywX2LOF6Vsp/QyaClFwNskOnNoRiRU58TJ09Odzvch0Nzn3mRRf4tNo2qwb+9+Ng/KXY1YFG9QrRFl4uwXNBfHmjdOFHEKCrOfWlU0wEKz3XJ07gNTvEK7EXUTqZH1SFz5QO4qLlgIKCxzxH/40ANPB7GJ7n+q12wt/LMlmgwRqXDrii/Xl7blGwiXC+WxpBEpTUZ4kWy/8qbUC/CSYGNxHquEchkXXQFTdBJQMxHDVghiDTDDq15a+12Cz74t9hOXUSp9s5FPqkyd/Ye+ZDBDtmgbNjnqC7BDbZ6Q/yOQQY4x0rsP4KABz4N1nWAwI6RQJLx1OYQRnv3AGl8WXkJTQ0tSHmcXc3fR1VpOkbWLo9/5GM2eBgcdCeyiY+WEqbH28G7MrnJ/9X4LAR4znYE1UuVT3Swo4pBr+JgcatGkt6nF1MlkGgpfQ85JBmAyu8nySwY64GE5J+4xgm/pU9g8eu9BXzpHpi6FIP0/BktMvyeJLErDP9x+JbBTdmHtUUoDP0oNK/9jpsCkDJrhBtAtLMpAuqCS6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(956004)(69590400012)(66476007)(16526019)(52116002)(83380400001)(186003)(6486002)(966005)(2616005)(66946007)(7416002)(26005)(66556008)(86362001)(36756003)(8676002)(6506007)(6512007)(478600001)(4326008)(6666004)(2906002)(316002)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gkbxjusgYRIFeERqA2TbZJpUcTP90Mt6FRHT73jz19zG1c6WHu8h8xUj65cO?=
 =?us-ascii?Q?AIiwU34OzyFTLosgKeNYyLtd5bN7Z3w59Kv6iTrQM/hT3MtTGG3VMDepAExM?=
 =?us-ascii?Q?kcUqFHCmAxgf2xxIb2IE6JflxXuX9GD/qbwsq9g0APWezvMW+nD4SscHXmO4?=
 =?us-ascii?Q?mKzymEYtlvTPVFDXXigwij1s8xFq1Fp28evFOSEURGqsYAaChR8Alk6lLoV2?=
 =?us-ascii?Q?ACoC/Uxn0scm8Zn0nqS43YUCLU04XcQhtE3HdXpcfCtTVA0GpJ2/6PjZ1Dyp?=
 =?us-ascii?Q?xKyfZ6u67x2JIkLFMCcc7VmP+ahzKooIMNFcfo9rAGPqd+6XMwM5FTWtD7P2?=
 =?us-ascii?Q?MOAYqw+n4Xid75EJzCLQzNAt0SGPm6eI/9y/Yn/wOFdzGAAWtqTAoAhjxoZv?=
 =?us-ascii?Q?HExSmkjWxdmkc3EsZAiFxJcWC/KsE8ya56E/AJXpFX8Iy3kcKPydx8Qe5HXM?=
 =?us-ascii?Q?v4VvWMqJpLTW95xziYiw3GFI6OdtRzWF+/9cpormrTiXo60246l2PgAW2jCp?=
 =?us-ascii?Q?fBOWKyoM8Nf9lX3WzyOE1Wc3FZGvkSQc7uoQxPwB1XRtMOlo3nQJy1JcDwBt?=
 =?us-ascii?Q?HLG5ku39DEOK8yvy7WDlhpEHg4bzeGflEr2i3BAiEKHybR9VD7c+69t3T3a5?=
 =?us-ascii?Q?RmXyKEzHnNNTNhkvXnIhUxqkwinDgFUE+Rn9yzOXySpX7ktsmiViQ6s6SiwG?=
 =?us-ascii?Q?D3bn6JtHuobekZdAQ+2WpoTTaD8EGHILT8avpDI4Y9VLQl+AMRBFUPTja6o6?=
 =?us-ascii?Q?6rnvouWwYP2HlRrls2fGl2xsBApF767GO5DVUKP8XB9pJzGgGLfrJ3FR8gNj?=
 =?us-ascii?Q?E2/5DYLf7YX0Q/OW3UeaBBYzWCHpcj1x7kH9Sm0ZNxXgl4WpSr0R0UjiUFQj?=
 =?us-ascii?Q?dNwAwY5gi69Rj5W5JpiB9VfJo5TUzSuI/DTlhC3I6jNP+colO7Lwpur/Rf+l?=
 =?us-ascii?Q?1VpIoQW29Jp72FJ27YPU95RTxRNjK4KoTL5jUa7gnDqOjuwuXHbS8iP5OnKO?=
 =?us-ascii?Q?Z1DZlhe/wSlBEsH/waGcXCKzrRhS0CWpIVLcm5lg0Nm308Hkd52hLXWKx3ls?=
 =?us-ascii?Q?HDPqYOR+BCsTPtAUbUF2/ZcX1skcUJmAIrW2+tI1AW6UqDZHGFK9qL+eHUAb?=
 =?us-ascii?Q?UrKosvceMYhiDL7zLVGxr8s0L4mLi8h45MtAMkO0+umLoRVKnUf8w/7JcIjr?=
 =?us-ascii?Q?gGG9C40FRSshBpcmz0xtg/yWmdQdi/wfnLXdwXW5AOfwmBz/OE9HlQghc23U?=
 =?us-ascii?Q?G06A38QdkihVPRZBMgrteCtlmE+h28sXRVKjtHP47W5dtiw1dBhr2oiwmAzu?=
 =?us-ascii?Q?pMoGi5Dw8m/a4g2hQQEpEg7l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b93366-a532-4e68-0dc1-08d8dd46d900
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 06:46:03.5271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jUARTdft6JYtjdPJL3TubZ0Fsyj/4a0D29T5R78VvLggFQ7hckBw86kxm/IVKuuyRryQ5vFZiM/bUhMJHCljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
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


This is the v8 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
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


If people want to try this series with i.MX8qxp, clock patches have already
landed in 5.12-rc1, and power domain patches have already landed in 5.11-rc1.

Version2 dropped the device tree patches because we'll use new dt binding
way to support i.MX8qm/qxp clocks.  It depends on the below series to do basic
conversions for the platforms which has not landed yet:
https://www.spinics.net/lists/linux-mmc/msg61965.html


I've sent the below series to add downstream bridges(embedded in i.MX8qm/qxp)
to support LVDS displays:
https://www.spinics.net/lists/arm-kernel/msg876784.html


Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

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

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     |   87 ++
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      |  387 +++++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |   60 ++
 MAINTAINERS                                        |    9 +
 drivers/gpu/drm/imx/Kconfig                        |    1 +
 drivers/gpu/drm/imx/Makefile                       |    1 +
 drivers/gpu/drm/imx/dpu/Kconfig                    |   10 +
 drivers/gpu/drm/imx/dpu/Makefile                   |   10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c           |  171 ++++
 drivers/gpu/drm/imx/dpu/dpu-core.c                 | 1054 ++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c                 |  967 ++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h                 |   66 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c            |  117 +++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c                 |  722 ++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h                 |   40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c                  |  292 ++++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h                  |   28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c               |  299 ++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c          |  294 ++++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c             |  224 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c           |  154 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c            |  609 +++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h            |  191 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c            |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c             |  395 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c             |  223 +++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c              |  275 +++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c                  |  540 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h                  |   23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c           |  348 +++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c                |  802 +++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h                |   56 ++
 drivers/gpu/drm/imx/dpu/dpu-prg.c                  |  433 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h                  |   45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h                  |  233 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c                 |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c              |  308 ++++++
 drivers/gpu/drm/imx/dpu/dpu.h                      |  385 +++++++
 include/drm/drm_atomic.h                           |    5 +-
 39 files changed, 10363 insertions(+), 1 deletion(-)
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
