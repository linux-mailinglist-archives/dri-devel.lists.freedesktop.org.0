Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888665FB03
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 06:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBF810E05A;
	Fri,  6 Jan 2023 05:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2083.outbound.protection.outlook.com [40.107.6.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048A010E05A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 05:50:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIzrCJVEVloxajrMScWFHPpLZq4i9RbiWR8gsYgIqZUqyb2RDZo07y3EQT//Z6538RXbuqSBmpLA27VZjh/1ZuDFB8oOJzFvlQrLiWnJJu3Sw1O+wzLFsutI8u88+SncBzcAO9WCq+dlAcLglXxBKhWZUYR8EKmWeiSk4rxXtQz/pOio1d1mwNesPf+1Q9cwVGe5J7/G+nFQ8ASVprlWmjYfvv1ZDzFTArD7VPijsgeG8t12w5xJ5rSEu7Gt6EwAEjlubCNgOJYT6/KdhBgjbSe1dTt4yQVbEef/5rXZ6Fl/D2Obei2LkVmEMRWuyE+uwghI0H1R6S03GNw3B4F8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBYIa0/juraQy2CEi5Yl+cuMwazRG4/NRsr7O9TdRVE=;
 b=fdls3QLlnV/W+KlT8XJY1jIgWZ0j1LQLpIBx0fP3tg4xFtKy7vYQMef7WZlU0EFjAkNDGbxexcp+5m2OTW6lRQ+AMWEXmQwo7DI5yej4tPSW6PiDG6OwDoReDScAM2urRNv27zxZey+usz//YOrrBdUEUJUr9/ixtauAVkN40/dLKnaRnP89n0NaxfjOiIx1n21D1xmb5VopnBJBPvY7jx0bUTAuffkkwrPih4kmgq3QpQ1LeOdG6lLf2aPFztLyamwP3IGz3mX7yeQoW4ppqjq6T0FDWfu5PBq/Odg2reNsS3QPfetKXA3+pmURfVplqrJiX1l1+uzfs1/wJ5aiGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBYIa0/juraQy2CEi5Yl+cuMwazRG4/NRsr7O9TdRVE=;
 b=cg2lOLVkg5gdV8/Hk/jOHMsVjywdOv4g1Y0EH7MM1kGU+V7uTqacEjKoTyr5frXv/t8P+c97/BhJ7GC52jG01jYi9B0xFilIaeJ0HSXxvhqVw5nPmOsn0f1Jrr51nAN0KzmsWQr6WDR2GGJhAAPpYhRGsh4RUdhBU2jy5VFPqI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8239.eurprd04.prod.outlook.com (2603:10a6:102:1c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 05:50:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 05:50:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Fri,  6 Jan 2023 13:50:50 +0800
Message-Id: <20230106055056.2883302-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 190b70fa-272f-40b8-74cc-08daefa9da33
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xv2MN7ClelnGugkVl5+mBIs+4RwTkwCgoL8FMYFSd5BwanMbidDD16cuevy+5BonUrxJldy17nLwWrCuWqR1HK/ThrkXAE+Vh4UTBa92ftVXMXf3L4prbU7KbXFBu5XPJ4wBySuAIuz3UDdY13OIBQVqROKIP5Cba9SeEgabrAlp9GZ6kgC5xLcjQ36lNtdvk+kWv3fnF4y2EcB0+G+YxW3uYqqAbk5rUIACdv+5fmXOaBdvtKPptPXAQtbNWIKCw0VtRUfKDva7/AzTHCgSz7DrbDfg0EfV8N1KReat9TACz9+pr+KFXlSo7BwKqUMaYCG3wO+wBxCvI82jnqWJFfSFEIxyyCk+4Y9XuwmLLiEOvaXu0QZKHezKu2izZNiDkFpEcEb8b3jF/kBqGHTBs52B6GsqIf+C0qyEmyW0Yzlnt9SFtNRa2IytXBm64Wj3oNWgp/dGSe47gSfNi5wMHSS5O3maf6vIkm5l40UzvkgWILE7+a66jj9eQIkFEwxKnJZ31wTbDVc09vAkmhe6JdHRLEK8oXuAt8k0kkXj5MBVllp2b0YBpMETalxrcO6ZJ9tgTWBe+MZneY52kQ/8nxKQeaJBlmZX8GTJ7Si/oexAGfvd173Th6dYmGTdy3wUOhUohw9FasKLd5C+idspMyU91saXMTA3KO7LxNiczND/TBS18jmkVwfNsu2tjvSJQtcd5Q7qaBOfqBktZnS7uyYhGGayN/3TuLuBsapPsP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199015)(1076003)(83380400001)(186003)(26005)(2616005)(6506007)(86362001)(36756003)(38350700002)(38100700002)(6666004)(6512007)(8676002)(4326008)(66899015)(7416002)(41300700001)(2906002)(5660300002)(8936002)(30864003)(478600001)(52116002)(966005)(66476007)(6486002)(66946007)(316002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WbprLmRQYyuVRsrl2gDHQnFENantz1FUfNTBV42reeQGa7c3iAoqeP8uU8Pt?=
 =?us-ascii?Q?spYGxK5nJENlqVQQ4S7ZFI2ni+6ZihvcCp3DnbfF7pLCPHlLR69y78OpJKZW?=
 =?us-ascii?Q?OrtUX0+2vnRaiLsrHdpA4J34UbXVR4TQUdGw42RiKAhYw+WuFYZFJrlYgPRJ?=
 =?us-ascii?Q?KUPzGqvj1fPpH0pgsVY70PcGaOquEPNMvp6IW9un9vBDRliF9v97bjsJh3Nq?=
 =?us-ascii?Q?02NMlFyU+PQwOoZMiMmI2sm2qLwFLSdMPf/QAMH8qzk/Fsy5QdHXairkjAfz?=
 =?us-ascii?Q?Kr5QfyVcWCwK+l6DbM/PJ+fJtzWnuMTpr54oZcWQPPG/egp1lwCjU9O2VLAz?=
 =?us-ascii?Q?VoQUISFvhrkHozlAmVcgJsbA9TbSqxHaAIFqNlBfQSz35JM9PR3DX8RSu9sL?=
 =?us-ascii?Q?TLJwGyEM6zW0yblWeNwAVURYLenKTDGiHIlgc6rgCbBXwwFOuTD4H1rNYzcL?=
 =?us-ascii?Q?tr1Lgo7Al6ResXbZlMCvv9Upn+8e6hj6cCubMEwfZgmvaVTYqTTVAtTSzi2H?=
 =?us-ascii?Q?Q3r9qXPd3GLb046KtJs8XtHR79rvxG+DmTHZ4Qibf3gPrSOfJGJY69FrIf7p?=
 =?us-ascii?Q?ZpC/qIAgSYV2KEDwawmdsa40tDXAcYOsvQbfW9fX2DTDWTWPGBnnp/C1lW/v?=
 =?us-ascii?Q?AnBxjWfGNXD6WGxyO7dmFwd8MSqXqeBmAw7Oc85ucxI8sjycmebk4aLbhGNc?=
 =?us-ascii?Q?cecj7H1xuUEIEOaWjJmddNP68id65Q7FIlbnVIfhvVpPZ7gbY3+iuHFwNxf0?=
 =?us-ascii?Q?jcnfKd8apRsHgyQSQgDIwn2vrpzGIt3V3iHNbjpzpQ+//dNX+umt2MaxhvyC?=
 =?us-ascii?Q?gei5/a2Kltz0ChCF4geHT5k5+upKGFc8LYTAA5NHYGsSaVFA+hsZCo160fDP?=
 =?us-ascii?Q?vAdAp1215SYLcJFSqySegySIKyC7IAlntvWM4LSwYU2s/l7kMv3cKoMlo+ym?=
 =?us-ascii?Q?sHzuxgJmDwgU6cDTDx5RTgie64hXGXyN57KZxQDWsHHcpTOXK0llBbOW0y8W?=
 =?us-ascii?Q?XB19Ox7Z/3fD6XRRhZaxYltHb6DGn74Rl4Ht6YB8gbcboLopbMgVP/ib6xtA?=
 =?us-ascii?Q?x6UwndbiCB2qjD+ayLi/9+h1N3zroohJF7EXq+1/S6N0sn9RUWzdjupBrVsD?=
 =?us-ascii?Q?RxewAphC/Z7K5dxiK12opzeEFQau6U7UNrz/Jo3J8aqf1FcoK6JpvBpeRCee?=
 =?us-ascii?Q?SKOWmVHmXo4eNUmhTwuI2u9K0UsKx97dlqSJzU9D1OHW7ob4jQ0eaYEj+Do5?=
 =?us-ascii?Q?Uh+AldmUDsKywmBA8EWiqvPmSJnKWV+o1Ts83uCHgwkSSyHO6wpCmbUVYZv/?=
 =?us-ascii?Q?Ep0DwGWa5PUGEGLytzPCYFL4Bh9+RlT+ihD2HKELO8eg86x6eBmnckya1kf0?=
 =?us-ascii?Q?SntI3DdWB00QumxY+ADejN+Z0JJ0vQbJwM0bxKpmxnamh+ENnHnYtbyD62a/?=
 =?us-ascii?Q?mnf2Cc9tiDzmZBHnSdzsxVSq0aNN57Ue08HMPpoAKFB7xFNoAm9m7isfiqx2?=
 =?us-ascii?Q?ddlOdnlMjP59qk8/Gy+xyl+P++NDYLbYx0EV+RkQlYvFZ6Dstx0XKvgvTMqX?=
 =?us-ascii?Q?mLH2juNHCh5nsqXuicYsIfGYVwHQFlOi82AB8ul/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190b70fa-272f-40b8-74cc-08daefa9da33
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 05:50:01.8319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSMCQyz1Rx/LPHyFDtibQMAk3DMuaeeBos95solPilcvmTdYyb/tjShqzVpL6ix0K0oM7MBlRKryUBf6x4i8Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8239
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


This is the v14 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
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

v13->v14:
* Rebase the patch series to the latest drm-misc-next branch(v6.1-rc6 based).
* Include drm_fbdev_generic.h in dpu_drv.c due to the rebase.
* Fix dpu drm driver suspend/resume by properly get drm device through
  dev_get_drvdata().
* Use pm_ptr() macro for dpu core driver PM operations.
* Use pm_sleep_ptr() macro for dpu drm driver PM operations.
* Use DEFINE_SIMPLE_DEV_PM_OPS() macro to define dpu drm driver PM operations,
  instead of SIMPLE_DEV_PM_OPS().
* Update year of Copyright.
* Add SoC series name 'i.MX8'/'IMX8'/'imx8' to dpu driver module decription,
  Kconfig name, dpu driver names and dpu driver object name.

v12->v13:
* Drop 'drm->irq_enabled = true;' from patch 5/6 to fix a potential build
  break reported by 'kernel test robot <lkp@intel.com>'.  drm->irq_enabled
  should not be used by imx-dpu drm as it is only used by legacy drivers
  with userspace modesetting.

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
 drivers/gpu/drm/imx/dpu/dpu-drv.c             |  294 +++++
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
 39 files changed, 10372 insertions(+), 1 deletion(-)
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

