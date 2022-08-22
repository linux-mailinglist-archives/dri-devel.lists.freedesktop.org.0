Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6F59BAF3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 10:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B69E9AC01;
	Mon, 22 Aug 2022 08:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50069.outbound.protection.outlook.com [40.107.5.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25179AC11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 08:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFJTa3KN84uLYd3FgONbXMLgfIovt58qaoSSx3iTuu/eg+rjD+/zcU0ZX8mj5ROfePqphvD8P7UyDIOX3MCGUwam/H+6y7gmgblrabu0+YH3c/cpp9as43x6JuQmkaKZQ7h4774d6dd1mkAdl2SUA4HwSFdQ9XCkAYEzi6izEjDxiOcSdPHPOMGicHywjaNKxEgvG5uoYyJzmebQOf4ZYCLDluYrMCKaFFdkndUQDIghPn1Uyz/pZz4omyBh+mDtHyj6ZgflwtICQt6ZCwL/qgT7854DcD1wO/sKUqj9H+LdW/le1e5IJlQAiZ7R1cEIlKyCErXd/MMPnVw7ISyeHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqERqvvNhhPN9kXfYiA9SgJMnhaWHMP3NolZ8+lP/Ic=;
 b=azzxznlQaYrM4CukJG/y8c84YT3n09QbAbQD5YCdaSszLy5y24Z7aUoqVu3fatOMA8WvkiaKEiFYqmQDvFksgPiuFsEOJozGXkwiZoiu/mS9kHj3idfRvq+btHzkBIpDrm05rBxrqNlWgI2Mlx/mHUDIdB50C9o6zUOu5teiKMfx+FHedVKQjtARtVHh/HvXb0gw5PJBZ1aCma+HPG/UTF4modooCU/3zh2Wry3wwIjcvb5DcPMtgUCoV29wm9ESlpxD6nfo0+QFh01AwSNS92k1s2UhC3Sowy6wPzvWjmbVXF/OBgMFKElexnircrJwDAltiXuTKQtjmVqsz5SegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqERqvvNhhPN9kXfYiA9SgJMnhaWHMP3NolZ8+lP/Ic=;
 b=d2LJbKP8HV8VFTA/S6g/jruR45VSP+BGcn/wxlNxkMTQheNldhAoAw7CijWzVhBFrfuBULWvRkwxmFmQ/uvLj/zKWxO45h9yumpfhFRmXPe4GurVUHiWXLBkb8PLr7p9mTM9d31X+ScTTm3XK3edsRWR5StVL7ofFkPD/BKqmuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB4865.eurprd04.prod.outlook.com (2603:10a6:208:c4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 08:06:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b%6]) with mapi id 15.20.5504.027; Mon, 22 Aug 2022
 08:06:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Mon, 22 Aug 2022 16:07:50 +0800
Message-Id: <20220822080756.37400-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b7d28f1-87c6-4104-e688-08da841540d6
X-MS-TrafficTypeDiagnostic: AM0PR04MB4865:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: blBM5869AjgxURoD2t0bZHIuQbOF3qgyUtX4/Xt1H2B6HoZrjjw/Ul4oq3K6z3WEyV2moCt5GFT0rYy9Az6SW34Q+e2Icssc0oiQbpQIuU1HGtptiMi058Ji7SIjs2tl+y2h5umECpBRs6jbr3eIvbRKTcKj/sGM+xo/s7hWNVmjeayjsJ8EyQZuqNnvMBgK7+az23/vjezuEmduadLkjDajoEIUDW+uJGt//9dlFcQxW8vCda5w4pa1uQvhUz8xEoBEtaGPmi+baxex9YXc+46IV7ArX1VAH1e8CU1U/pI/yXNCAzjQHYBFRwqrTn98TRDEKdxx9j5O4Ia2QptKTbIqRHa9Y70X9e/jmhoPL30DWJolxoyMK9cGcY4+ayttkqV8WzibW72xvS9DRRdWs9K3MhLjKyUKoBd+DHJaCF7RPVyAxzP+ye8b0YozBpg6yUMA4V7Ii3mf0JvPh1ZQNHEIxcbXbSHlzu0b6lKY77DbHYmb7UmhqE/sf6BpmcvNaEmA4IHtU9mHPFLJXCfcfoJKU8aeSHZbtoJx6fDlDROfDKBvN4i6GgShU7xXmaBltgbf5fgNjcUD29e27ehsLmOuq1IQUm9+V9Msc84zHNc3wCY7zVK4MSnKb2jGOe+80VotX+1EHvUqQa49ZGE/K1oYY/U/KaUedGF/dAobW6B+/SFkqZAAKL/AClamul+6+QrI+0xBCBoqt9JY2fVzUP540GcgPMSbs1xWIYGIZymbjr55RbMnaYwGzD+zYqToHSUl/WdbJBzbP3rSa4ZZJEkTPe0Eet5k7/V6i820/OU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(6512007)(6506007)(316002)(6666004)(26005)(52116002)(6486002)(966005)(86362001)(41300700001)(478600001)(38350700002)(38100700002)(2616005)(186003)(1076003)(7416002)(83380400001)(66946007)(66556008)(66476007)(8936002)(2906002)(36756003)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q0RgGvnNZ7GqHxXwW4JMzEPgZ3OL/+qcJ1PuxFj6g6xSaTKBfCjAFVtO23As?=
 =?us-ascii?Q?O4C5sZ6puqAPaqPngF1JifxRD8/3f8FgQh2Kxw/YULZI147kXK8nalT58A3Q?=
 =?us-ascii?Q?ES03qkWVqlnrTKnqLfKGIYiFPaCiQ/QNeY4a4rN8hszk2Gqr0uNV1Vu+AKpw?=
 =?us-ascii?Q?b5jZLSazSReTsiYBMafPDPuuGtfA+TIbgf1nsNyoYT65IVMwhmgMW2+H7/q0?=
 =?us-ascii?Q?ay9qN9zmZI+pau1hAd9r875e0G7GthMpB0XC4dIP9bq5kp50vNJw1k8a5XcK?=
 =?us-ascii?Q?h41nvW5i1f0fqllCrW1GqJhUGQ6AWLd1AZxU29/0btWhAOzGPIe5q/9CkpVf?=
 =?us-ascii?Q?GjmgS0bCXcW+9fxlHy3fW3J1XhnhmZQ5ekdrbt7eK4U53ifCLbKN2XdaS6hq?=
 =?us-ascii?Q?dAPmfUuuRwSoRWz1sGnhU7Yn0wbXo0AdjaU5Aa1hGR2fZR/ulTwBE9d5bmJm?=
 =?us-ascii?Q?gPGmMEpH3cSnvhk8PN+dmY73T8FH2nQKIItZtNLaDaZwA2F0o9xFuhYrn43U?=
 =?us-ascii?Q?YAJOaDj1VLbbTr4TlxoXWaHjFpHX0Ga3DXXdHNYWbBAXtx8YjR8xiOo5Oi3q?=
 =?us-ascii?Q?zEZcvBr8KZ6SeAukt5hIsJU6XBlIbbT/g0evE3sLKp5qMDE0NxX18v52KonR?=
 =?us-ascii?Q?o50uCM/NaU5mz16QqMlvTf0hK5mOGPvjgxAPXUqfVZFwtI/+BPQ30ziM1xj1?=
 =?us-ascii?Q?zDiJp9QELMTqmhC7qvwbCXpjvl7kT4ndpBuNH/z5t6DYih/MsUgFrf7TpoOT?=
 =?us-ascii?Q?7vePbNaKMrkDqpig8xWsR0sZ4pJDdkhztKyuyU2hhHPoyjyOft3P1TiIXpI7?=
 =?us-ascii?Q?U4gyu973JTzRbj9Hmiao2eyrUstcYoPXGQwdd+ZhA/BkKvdjtwGj+BZX3qHH?=
 =?us-ascii?Q?3Ou3IDPvVFdp1omGTDX+BoQ1LfeDJf/deUMlQJ2Ah1v0RTnoM6U32BYjlphN?=
 =?us-ascii?Q?fIdfMTydMVNCryw1e+PPOaOSoBoD3ahJbhJA35AMA9o9KOK2nEPkXf34NigR?=
 =?us-ascii?Q?ggXEnfyaQ5H4kPKkoxpEtacNpNG9Y6EwNCdU9tfehIQ4vO+91l1f3NXvS2DQ?=
 =?us-ascii?Q?PzI576jn0rePxJeZiK9854RIHSEXNA3utJSbFSAAeJkxGiqas4TSpDBpJYXn?=
 =?us-ascii?Q?dVx/HnS8+UPwDxGuNbKqQAEaXpbcP08J9L/blfsY4HUmDZfZcAlCV2Y6vrTU?=
 =?us-ascii?Q?tfVh7l3TZfm5hkRhW1PSk6NZJxqwLADJGX3kfl+XSMxFwlUmPhaUGIvEmIcF?=
 =?us-ascii?Q?toaYfbbzKJo6HqeDS5CXTv5fJQ9GjkfI1gbDpkV5L9B9mtCwjKef9+OJgEyB?=
 =?us-ascii?Q?YNcvSm4I8B5OOOFB+VIroAqdXgBqyQ/+4B1A+unwcOrM1ai5tmLHD0MvN0Me?=
 =?us-ascii?Q?roH6hno353KVoq2LdMCqdS8K/lQOndd+sZAorvvZe67GVyK3jzXtN4A9ut/I?=
 =?us-ascii?Q?7+IXBpdNRRWmm4amxcXyA2xpGGofB+b5/b4y2Pe4BwDp8KOu+J2HWQCaZ7Jo?=
 =?us-ascii?Q?rpmz35TjUXCzhVYX7udDHgyI1Tn99Fhv/htsSGkalLow3Qhcaa9CATx/xk7p?=
 =?us-ascii?Q?d9Aj9GZ709P4md55az1F1kexFoiTzGqRQi8ZUj2F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7d28f1-87c6-4104-e688-08da841540d6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 08:06:45.0069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYyk8crhVAWs5ZwwjKwyEOrtr78fdozwekVkA448dc83E1qgYlJRfeSBzUHP8I8TvkhdRevwx9AuLnZ0bc6wRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4865
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
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This is the v11 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
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
 drivers/gpu/drm/imx/dpu/Kconfig               |   10 +
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
 drivers/gpu/drm/imx/dpu/dpu-plane.c           |  805 +++++++++++++
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

