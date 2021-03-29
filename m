Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488D34C398
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 08:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8F6E24E;
	Mon, 29 Mar 2021 06:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130045.outbound.protection.outlook.com [40.107.13.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4D86E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 06:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbB1lsr8AjWJhaHXqPjYgK8qbZqLkIvMhcVbv7bW8kNn56GPaAtlL51lH1Wef0/0AJiQ+fuezmnoUmazOxppQL6BytaY3yRgOfpVFbE2FgQFJpSqhN+29zM0G9t6ISTxCwQt+PHNcGEAeQZObaAS9pBLeyrSUBIk8C0GBlSR6or32X749jPmMrB5IG2rMteKughROe+6I8vyfDKO2K8ZPhhC693RMklyxza41UomDTtxE4o8yYvFMVagwSv8buwLYwKWnV3IIuRbqZpqJfN7WbiPJsPyH8N5ieiTCdav/3r6XQ3vdxbk7NbY3j1fdFLYexQKDE/rjXKmiPfODvLrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Denr+Y4z2xMJRypWZvrC2OMY3iqXdvGZXx56XrL2608=;
 b=UwnkmIC8csartbxTCcsOA4875bF5qWbgKsaGwAdKfZgBH+LDIbqD9npeo1UJ/zvSAv038qqlahsXYkCJOmAnnHD1ro37QfNPF71OzQRsTkWtt0NvJX46r9KTT1iYQWH8GvXdarL1QqtEacoF1xVgN5YdRo6TZLw7JQVuR4shcB9BKT2+qJo/88124fUrH7L8yV3xYI9xxurqF90okORo5PRH0PmEgelzLGIf7QqwsjLqVZqIq1aDcQ+qyEWXyxJZc6d4Fxc9ur7SeCIJk0/B8ZRVAfn5VrXVvMuCjGT669jS777aJLgYdPfEgFlVl7RWfzglA1bJt7vjURnogjRuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Denr+Y4z2xMJRypWZvrC2OMY3iqXdvGZXx56XrL2608=;
 b=q8b//OXUsBHGKsI2Mv2/WknBEcx+wGFnFwhza4/+067Vy2M0p2eri82HsMBIhriVJeGT6k94cVv70L2euIe3xgoVpn8M568NQoMtG5nRAPiAOzm76cTIRRgM7Riqq9EVmpycb9b/HJFBx/A0k8R9YqJvbohlt/2bvV6yY3LPuwk=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2320.eurprd04.prod.outlook.com (2603:10a6:800:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 06:12:05 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 06:12:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Mon, 29 Mar 2021 13:57:20 +0800
Message-Id: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 06:12:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d667a412-40ea-46b5-e160-08d8f279937a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2320:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2320BE43002F56F0582BACE3987E9@VI1PR0401MB2320.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJOixgH3YlIf9pyLnBXJhf1sxhfGH+joBsntWb3Z/LntRbpfQseMykaunZnNdWRcJZn+UEi64hZ8f1mrjl8BwPsjhBx27pzLhi2TLkclGFkgQVjVxc/akCHV/OViyuHHb65s5qjeQJkrPBe62u+kmQZwgATTEYcAPwsPothfExiDgxjjiQA7t3UZ2s/KBYRq6ddu8YiHwLI1uF8msrPmY1PVp+TSAm5jGo68GU8mJ0pzOzcBEZ55Ha4ptAoy+Ks4m8EAY8FHNI3H7BsSzNrwEqaONwY1nB82hC+noyXzY/tqac+pt4OSXPoFU8jfs6uPvqWXZjGcIqCQWbwEqAhH4dE6ywlpXMZ+dD3VBqz2WIHAe+2GEDAGiBAq7+eE0XopPnXh+WM8hDkR3qC2WKOQuFZaa2gfLT4ab+/x1SmhpjGAV9xq2rMWW7OMLfOHs6yiHVsqym932ten85PHOymBiR0wBxbtBuRc054y6yPtuVhnfpbMz+5LDK55OHCXq6gTwOAaDC+yfwmTyJsnLUIa98+GZ/8l6igQTNe7ltPG9kQ/kRAm3SdKIFoy/b8F5sAnAll0NRrYqNE46sbZT8tSfAa850PSHmqFheQvgPDVOdG8g1fNTmz29rHuKkYETzeDhBX6WEbhvfzI6UezIG9o/GvxfdZhF40QAZ13tKsQt3By9xEX8Y/DGfjnnE1TFWr4tyoyI48zVLmFNjCoLWnlYhrPSfIvn9f4tqDRmN9PGKcoRoA2Llj+SZqVy3qZC9fKdRS97A2VAGRy3MXnmGLUKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(186003)(16526019)(6506007)(7416002)(83380400001)(36756003)(2906002)(956004)(52116002)(26005)(69590400012)(86362001)(478600001)(38100700001)(316002)(8936002)(6666004)(4326008)(6486002)(66946007)(66556008)(66476007)(6512007)(5660300002)(966005)(8676002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nd7FdaEor6DhTW8Fjtv7Pd7HQltzEsDPdCAQR7nCEOl9LFKg8izLdws9ftfU?=
 =?us-ascii?Q?Q1MPlgRP6/3CIBF0FQnq3iNrfJyS56T0yVyV7cLjzyKrH/j2TnJYdOA3y29m?=
 =?us-ascii?Q?AZg/784mOXoQ0klvGl9YzApmKsXGdOyVylYtLSVRh/7Fo+Ke20dR8P5FUo7W?=
 =?us-ascii?Q?KJHQC5W6fUnaAsarkd9yOGQFN24ztD7ATEXPhOALKiFZLgQt4r4/QXHfkG8F?=
 =?us-ascii?Q?SkhpfkhLpSfiOK2dDZqBcwXQOaZUrtDLp5CvcgLDGJ/FLNUzUfneNxeuB/G0?=
 =?us-ascii?Q?I4FZU5CCYBpk5cXmCR1ecI3huXuauD4EtdzEuza7OjntmLUGFi7zPVGRt1fc?=
 =?us-ascii?Q?UW9TAULAzGp9LqkvNI5IT569lHFN9HadEb7OJmVUcyJLS1yaHYtjJPqQA6uP?=
 =?us-ascii?Q?Jws6klhwCtX9dILw4mCJPDOT2pz4efYYuloliVP0T7G/zsq1g90gxnDABStL?=
 =?us-ascii?Q?SLDgYVBKCwXviiH0QHG5yFosB7QH6fDH6nEeYGFe5BoEeiU3929TtW+cYe6E?=
 =?us-ascii?Q?KG82p29/n2EOWC9LRCBQR+ntay3759tZo5uLRhCaqc0g9Cpoz3eo3QyLhXLR?=
 =?us-ascii?Q?BFndlCuMLsRlu0L5jJh4AaNh1Yr28jgiuJAj/hyJUXV573wAdx6/s08tcujW?=
 =?us-ascii?Q?NmRd/Dsptcd0Vn4UymaWCo4UZnG8AMNya730vmNOzDk5SB0s7KCD8JiIHeZN?=
 =?us-ascii?Q?ofk0E8FHCPCeAiecC+plM2bhd0sMJ6e8S2m+KinxiQBALRYei6j31k7Y/S9P?=
 =?us-ascii?Q?S/WDJ5uRfkFo/iNhN/wFSfkk+rIVoWTBgWTboj7PduAtY9oF7uA8GBfFbZhY?=
 =?us-ascii?Q?XJ4nDLKF26IAbpyelDcqvgw3THygwTQHP5e0YEeKzLEefknkXmOcUg4Tu9Bu?=
 =?us-ascii?Q?NjjJLH5MXtgu8SFCWGre+kvcsyA+STTuVoogMcFpQX0YgRptM3hIJr2fMwmP?=
 =?us-ascii?Q?/duySvXxbM99620bdv+WF8Fk7uWLlO9VzfbZcgmAUtbdn1w5/TTNw/ItLitO?=
 =?us-ascii?Q?/3e0qaJ8+C63cwcq48r1ohJvoIi5PbvQdFuptYWR4vUIJJW+fYaSRhCXWjsg?=
 =?us-ascii?Q?6Rurua8k6OQWWQ+MvlktL7AgIiZNhL6eRxnd8bDhELLHDXG1pEpdN4HfdhUA?=
 =?us-ascii?Q?JA5xYeSHbhi4Lozjj7Q3fVm/NDsouKvtR3RY4ZUWHv65RU8D9CGioYJaQrPe?=
 =?us-ascii?Q?f8CjuXdKaYAfrjWlBIR/H6gcQhlaCLmzfHoBKIBhJelSvMhsT2EHKkV59I8+?=
 =?us-ascii?Q?AaSCG0T4LbHfemzNxv+l2h1rJXVtwVrxVFUygXil5i9OAV+uGTIo88YLyHlz?=
 =?us-ascii?Q?s1gJcH0pVJEHeVcD/JOr3lC4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d667a412-40ea-46b5-e160-08d8f279937a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 06:12:05.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enFgUlurygw+/lmH+PPcyIqoS42iksvC31/v5kgjSjS/MesL9tKecwUEqL7QUOz02/SlFWSXetsJIKrn52Qh9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2320
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
 kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This is the v9 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
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
conversions for the platforms.   And, that series has recently landed in
Shawn's for-next branch.
https://www.spinics.net/lists/linux-mmc/msg61965.html


I've sent the below series to add downstream bridges(embedded in i.MX8qm/qxp)
to support LVDS displays:
https://www.spinics.net/lists/arm-kernel/msg882438.html


Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

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

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     |  100 ++
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      |  387 ++++++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |   60 ++
 MAINTAINERS                                        |    9 +
 drivers/gpu/drm/imx/Kconfig                        |    1 +
 drivers/gpu/drm/imx/Makefile                       |    1 +
 drivers/gpu/drm/imx/dpu/Kconfig                    |   10 +
 drivers/gpu/drm/imx/dpu/Makefile                   |   10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c           |  171 ++++
 drivers/gpu/drm/imx/dpu/dpu-core.c                 | 1047 ++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c                 |  967 ++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h                 |   66 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c            |  117 +++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c                 |  723 ++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h                 |   40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c                  |  292 ++++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h                  |   28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c               |  299 ++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c          |  294 ++++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c             |  224 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c           |  154 +++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c            |  609 ++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h            |  191 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c            |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c             |  395 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c             |  223 +++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c              |  275 +++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c                  |  540 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h                  |   23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c           |  348 +++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c                |  803 +++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h                |   56 ++
 drivers/gpu/drm/imx/dpu/dpu-prg.c                  |  433 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h                  |   45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h                  |  231 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c                 |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c              |  308 ++++++
 drivers/gpu/drm/imx/dpu/dpu.h                      |  385 +++++++
 include/drm/drm_atomic.h                           |    5 +-
 39 files changed, 10369 insertions(+), 1 deletion(-)
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
