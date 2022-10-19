Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB96037C1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55D010F099;
	Wed, 19 Oct 2022 02:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD6710F099
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjzJjgikoK9zO8S6uqiw3gLR7uyQ6j3gHCK3OwiAQ9HCJZoREFw31bGHW1/NKsRNb76/BvXdVvZ7apZJ2wGjJyI6y5TvY2zAXv0vT+BGJgujmGG0GAYv698ztm95t+9jk6Emo07wgl9qWm04Ze1FMkcxBbMMXSdpcDpMDNhnrKxnxc+eO8AcwBsWkwViIkVUqyVNuybMXMD/9BcuM+DbIuO2SFT64u86R4TrrwkGSni0TzIDGrNMC4JOhkV92iXdzGa1Wbgkfbm6MAJmVldX9MV96c1dj4tC9lrrfXtgIiKU4PBAdsaLD/d+MAsGZ4F031Sqah/B9y6LyxbNauQZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yrn23BE6BbxgnksoXo5+K+iBwPnwIbGrrDb8mOlNwao=;
 b=CngPEEiCqlgFX92v1EuxUIBeW4UY3CWF0tzpG6aRiOkJktUUlj6vVLlEo9h0JxiW0Ls1Oi+il5FbAwhEhhKSOorPIUNl5CrOsvAu6EEUmuv5Hvi9O8TRpcOa54CvUd+0mdcAz3dDbsm6SiS17MD8fZ8gm5DRclDJLuTKRa6oHMxNoVfnaLLXeKWu/ldCNBEHNEYKAPqqyN8ZQOGsZkdgT0mi2bEXcdI3tSzjUgHwqLt4qRArtsYkfEA/Da+oSWxhFEIhpcC/XJX5fplz/mu6VpOqbx0x4xWiq5W9A/iheB5M+G4bFWfDNVqlnpAS1h+Y8hQuTBr+ycjb8klqRmL9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yrn23BE6BbxgnksoXo5+K+iBwPnwIbGrrDb8mOlNwao=;
 b=rj/YcqdrQdm6FHv3wMlV21m6tmyAmyEPSd+scPO/2iNX3+ecu+bYxeHpk81NhrAVjMbNPGsqq8Xtcc6VYBUPV3jxDQ8e3dyLagyMHgO99bhVBX2wsWmnaj4zHNcUY5ji33eanIt+bKGExDi1Yso11egx+Kbh3l7HS4rC4I5QCx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 02:01:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 02:01:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Wed, 19 Oct 2022 10:02:20 +0800
Message-Id: <20221019020226.2340782-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: e86cff44-b1df-47e4-2c77-08dab175cac2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/NmfRELQelOgQCKzrEGpNTy1LeKk2xxX5+dRjVO+GVygSMjAFThMkQ7P1dS0Qje9RQmvjVETCB4eDTx8fQgib24oXnZf3NiHX6bHPfbZDztSpeLIk2TbWHmEZrWmZFT0L1nbV9LxDiMxprZA6rYrK2+FFxpOB8W3RrkUey0xLeSfJy0WTsdJF0ZHRf7EtRq6/CJCGp1LBz49oh/sYRw96bTRzFXyvpVwh3sEcudC+UlWRwGwZ7sK6eDJKAJv9p/LSXX0wN6kX9i85YxDrrv9EtVDXlvGasEJL3IOre2a8y3lCSHBEqHTyO64HBpWp9ZeL81oDwEdF0lGlCSHXuO3IbB+SPgbsjmliODExJb7oXBLSBtIwT5Daz2z4lzVncjz3gzpViv0klsrMw5OCPya1u9XZDWaWpyHR8kMSOej2bEb8dy691vsz4U8LRtFM17OCFaLFuJeCZHaT0GdOwNbxGhZ+VuhcjX9NMUWdBFcsXNldzGPyTBJ2pCPstM1NQbfCbJ5YKerG/KCQsjz3w0HcHfAhcGioRVivAUGcOyADf1eyDL965WoDYLUDUpmkrRdiY51WR5VkfU5PKpvye+ow57xb9FAvwqm5/B3Khsb1kLETeLs0ZCpGRVwIlkej7wcrw6slIwwdYlC9cmk9lR5lu7X7SZpcb5LtbC+q/ZQ2l4xwek8SVN3MuH1EpeDRg2qjwW5KYsQcYAVx4gFpOoVUho6iq4R2t8nhXVIiapMXQLccMGn3lNiZ9s2dFpCRCVwsxGdprcG6vQMVORX7It/xP6a23nQvhnFzS2AWFy6Ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(316002)(83380400001)(8936002)(6512007)(5660300002)(2906002)(2616005)(1076003)(7416002)(66946007)(30864003)(66556008)(66476007)(8676002)(86362001)(186003)(52116002)(26005)(41300700001)(4326008)(6666004)(36756003)(6506007)(66899015)(38100700002)(38350700002)(6486002)(966005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uYzY1GjJhd98PSFo/d3Smft935+gLmM3Yt/WTqdp92LeYUTrzMM3zq3J8U9w?=
 =?us-ascii?Q?VVdBK/UMssjALAaZsA7s8lDCmxEhbT872iN9c6xCZemakWSjvbv7Pi1HdQpX?=
 =?us-ascii?Q?z3Sga2jLXIkfMzH4G8fc1gUTdp9J1x1L/ub7o5BC5DYg0liWV1rWuYMhrtjz?=
 =?us-ascii?Q?24aNqzmfDV0YJ6YvWmOHqXxXkwXSuTVr6F5q4q/LBlLwMFR4NYVBxWkkc29Q?=
 =?us-ascii?Q?mUPC1DzirS3BPwvAQiVqw8mcMqBRDqR6lJaUPjGjAMLUOh1Pi/kvqlvrMWhc?=
 =?us-ascii?Q?qhuMSHs9jntx8pqRU1STlf40YgyCMHxnKZq34LDhMPArYZjWrNObFR/DNUHS?=
 =?us-ascii?Q?0xHm4PMUAmkzwRX0OktbO5MEY0qpzLa1FFJ+XJ+EIKSrEaRPuAGV+spevwZ1?=
 =?us-ascii?Q?l2WzD4ArKd5VJAWRCE9eGBA48gvISkydlUa/6Y9FZa05MKQa1/di4K7xKQn0?=
 =?us-ascii?Q?KfdmIC9xHhkxcWWbyQOSUZiuLi5u5DFIC18KOW19H54dOHr4dIm2RQRl28pt?=
 =?us-ascii?Q?UYC2JdW3Ht7S0tkO6S7WZm75VghJmKYfjjptp+hc3oRXXeO5Sa5XO+Bh3N5+?=
 =?us-ascii?Q?Yz6+ozYyu3Y5FagcTsZTsqlxGBuG/ILXIwOG/s5uljgWsKM5QbSQvJNs5Sx0?=
 =?us-ascii?Q?1Oe443kwhOshs4uySqPMNH33ZausNrdRaXYZqG2YIBhGKspeijnnnfSjrbYN?=
 =?us-ascii?Q?UGKElYmrb81q9xCR5C7/eOjgNC1/MM85IP82RpMHhQ8ZcI7g2pOmk0DeAh1q?=
 =?us-ascii?Q?DgwoQRNeO9nYtDMMqvikOmufAXXEPgWG2cjwsn4OZF0mipf4B8HBU4nTP3m0?=
 =?us-ascii?Q?ceN+8reYV8e2/o0EZae1mVgrYenxYp9ZL+mMz3aKfhA+z4h4nFDAZqerWz5/?=
 =?us-ascii?Q?ft91DridnmDHcZGBOAY3KHKdFzCX/gXP+GscO9jLSudzk+sMdrY0HjoXNeCc?=
 =?us-ascii?Q?UWCJ5VwSbUVF3fz36Lz1LVxGQ597WS9Esl76dcaNS94CowOsAmfB/qIUoG7V?=
 =?us-ascii?Q?GvlDRtXmBZl4umvt6nV+vAXF2EKDr49MUMeYciWDHV4P5v0lt1+bhx/Q+8OI?=
 =?us-ascii?Q?3FTfb/h57c2C5aP3lJ4dGaRP7cNIdGOnq9iOsm06HnvZ5CTF0+ELd5kzm1JV?=
 =?us-ascii?Q?+mkzh1Mf/7A7yX+7jCOZHQEj+SDfvzvSQQ9pSeg8576Fj/R9R7kh/UVkYBIw?=
 =?us-ascii?Q?fwVoZ8cJrASbIl7txc8iWXpOg2huY2m8Jy0SV6Xs8hC25SIKMuJG8WaGTca+?=
 =?us-ascii?Q?hvp7pHYJfCtpRrn6zJeZFz0EZhoxHw1uHLpnm3F2tQYk5qq5RJ2PVFgRMrqR?=
 =?us-ascii?Q?cZCFGUkNq0AumQ0ubCFuFgVJMCEnNiJ0VP/KvucrHhuXOOIEQHCePj7UeUoV?=
 =?us-ascii?Q?B42dXiKcjpt5Zz/vKlYQkjHzB0JAf0Pch/kbJf/TQ16HST/QvI6tiHNKFVPF?=
 =?us-ascii?Q?zVK93OYLCP+rDdZUb6MnMvr7/0nVNpEATQatRlcY92LMvxoWjSaihIdzLPMk?=
 =?us-ascii?Q?DTI9lqHMhm00HM36fS5p8pLk9HqnFTzRyxQO0INrbJS5zI47dSTtsMu80dxB?=
 =?us-ascii?Q?tMb66ZpLS6BADEd6l/1XYXOjrecMfbF4CcJrr8YS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86cff44-b1df-47e4-2c77-08dab175cac2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 02:01:10.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nosRJ3CoVK9pqM5/nDvzXQ6YIFIyoIWBIX5EKI4m4hDx5Pfl1jYraOOj2rIhT+lDfJNxtRC1VqaP5naNcqx2dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246
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


This is the v13 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
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
 drivers/gpu/drm/imx/dpu/dpu-drv.c             |  290 +++++
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
 39 files changed, 10368 insertions(+), 1 deletion(-)
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

