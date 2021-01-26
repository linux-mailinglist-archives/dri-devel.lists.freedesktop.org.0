Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D230380E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02B16E42F;
	Tue, 26 Jan 2021 08:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C5D89BB3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 06:25:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQHXeAhqYzLERRgXnm1GQprnMlz0ca1GLK3KZmrj6/dEHgy3zeRLUQhbL6UVgXqouSzQeeQQXESdWz6WSYu4g1ywcyqDWD3N2BFOEXzcr8IyyPg19DusGJbuJkYE0OE3J4zuH1fScTatg7t0+nwOSEArklJYgY3g3J9n50FJVUTsAVcM+Cp+x0OjWpAKKogpH2CezzfI07z331YQUAhPkfAz9KtItz6LJ6plqEC3DuxgnWOYHbV6gZPyCKZqsHLYa8aQcf6MSIGp9XgCvkhnNat24PUN0EBos+3ms9fAsK0nkUe5k+G0y39t7ZuHJUgo9f5IiO+JoOJtjXdAs7HtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTybiWpUDidfdS1wuNmXGgcttRiPtZOF5C7YeQ6Srqs=;
 b=m5fJvGPxvjvV8WwXO7lyCoipQM0fD025GOMs/6/Iju/7lLFqLf7VB8WPCGledTLutmsPv7PJLaWBMNpshW6WsRAaLnyunzao7Dov/MRWDfiMcBfbAAIBmU6RSiWR3DNt93ub5WED4DrEYu16X46gYwm1fjnvbgMa6Vqq687H4QgSUMhW0qYKpQT38e+OF619zW5pjZgPMTYJ4MdNeHZJR+XTJQYBr5m3pRIMHi/DwMl6PfoAiMwi/dnBcoLJRr7AZ5hI+DEZKRY6caOFvPo60gPtZKB/HXg6JZSyFurMMGLZhP6ZeL8uPUNbnCovSnDnbDJx1zSzXeeGZBVieiQIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTybiWpUDidfdS1wuNmXGgcttRiPtZOF5C7YeQ6Srqs=;
 b=H9c4W83+mOxPXwpiVuDkGOLvLQxbsGhgU09sXri+TCiygrvvVga9TcPxOX7x9xAaiKnL7QcG6+z+vFckcB46JyT/0n9zExIdmYYphEsQ6FdEvY0+7eQhfnkXmnrEParWKhqjDfA6t7fjIRx+MXOD443dJVZh2I4htGVnR/ZAs6I=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 06:25:34 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 06:25:34 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Tue, 26 Jan 2021 14:14:45 +0800
Message-Id: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:4:7c::36) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR03CA0108.apcprd03.prod.outlook.com (2603:1096:4:7c::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 06:25:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ebe4e434-1dd1-46ac-c8b0-08d8c1c33002
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2973ABD1593D47FF1751466C98BC0@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6IqD47xe33brjAx+ycie2JjgQ6d2lyB/pgMeneVABJQTQCY3geVc82MmeR6fB3ePkF3iaW6PUEGvAmPMsIX1yw8WDbYbABHh7DoslWpPYd/tqqSJhqcyWU8MZJXO4a72J36G947PcvrN6YKQI4m4w2d9iSaxlt5vhKHKzSfgGLEFqBxFLY8RuYVBnAcIPqWZIr28eZovciXhrhEf6EnplB/t1u9t/IDQMu9sm2fz5f6/DdIhFbybZ6CleePpdRW9EfZyRRSJcyp8lwzhTYSEyKSrkZVmZEnQXAza/J/zb0A3rOw09xbdXizSbDUb9tFj1ZCkl1TBK9n+hKuS8pReEI3iJvpnShJhhWvzpH+4oMpBLNc8HdrtPq2raD3IRrHmm53EY/NNaxaGlppfl49SiVvz+CK3vQHiuPkox1tbh4NfVoo13hkrMd9jJOFKfemZ/Wwk6AOGbGcDD3UaUTXfBgNi74APCXxm3geGaYFpjbx26cl5MXQ1e+rKKDVJp3pACe4jRjoHNTk91o9WFFulTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(6506007)(83380400001)(4326008)(6512007)(86362001)(2906002)(52116002)(478600001)(956004)(2616005)(26005)(186003)(966005)(16526019)(5660300002)(8676002)(69590400011)(316002)(7416002)(36756003)(66946007)(6666004)(66476007)(6486002)(66556008)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?c43rFhKh6UZY2Yy59GNLGKwe9bYldntp5QSICES7FEprOlb+e0FSsrUsxhZ+?=
 =?us-ascii?Q?jtkw42OfK2xvAj8od+56TTlnUu27DYJglzpfy9OWb/oTWXwmv9h8kJo6V1nk?=
 =?us-ascii?Q?u6CWOwdRGVGC3VVMgYqti3vGCfmCjGC7FjuEjEvLrstto76Z6R4FQ0YZ4qVG?=
 =?us-ascii?Q?l5X1w0xCxr5Xi+9kE+xSbl1SEnrxfmClOtp8V/PhkjnF8b2qxNhZhnSTDafX?=
 =?us-ascii?Q?L5jzqoVDloSvyUc44fJzJOHK6EQZpykAUdA1G12ZBe36F+po4vMfJT73NR32?=
 =?us-ascii?Q?Y8kwUf7yFGCqIfmd3c9b3QPl3Igr2dpMuGuiafyvYLIQxJ9Qk122XYljHJ0k?=
 =?us-ascii?Q?1HBGFmr/XL3GNF4p65F8SXizBxWf4xLMkmGRgDpy41Z/ppWy7IzCQVMeRvQh?=
 =?us-ascii?Q?KycGS3CbDIMNG404ECRfMocfZd1FMkLgWInl8jbF2+uZd4mvkNlOwAkwKidV?=
 =?us-ascii?Q?S/GTxI52LptTc0BgQRJCRXNbWLKmqTcWX4kEM6BeHOYrpi1f4UKtOhsfqOWT?=
 =?us-ascii?Q?8V/TezVQoXBc/dV/n1d1H/lUxvljj7tAzlXEJvzZMQUtw4GCSMj0ptNZqaUg?=
 =?us-ascii?Q?RHtzg2fXC6q/VQ9y7eNO6QztMSXgG35Gl2JkyRgMW726V2u99DdrQMawxFAK?=
 =?us-ascii?Q?KVXcOv86J0V1b+l9DyjO7xGtWcy7Cn7FdFHMZnkV58wARMqr89p7SbN5HNsJ?=
 =?us-ascii?Q?Ur4Lpe9p7l4F5IMudxzrdYacVnsBOU6xFTY/rTk7MLSh6lUp1K20KNYcIavL?=
 =?us-ascii?Q?+vG7W7kmZWc6+l5wKbHAQ5ucCkJh2oJGe5j0jnTWyXvAAncCQ1TvoHWowTmD?=
 =?us-ascii?Q?2BcieFCZqVLCA8ixe17ri9nC3IpLwB/8IVxCojVsAy7XWJMxZ0ZuxYLFil1D?=
 =?us-ascii?Q?3zKwiSTL/rhdPHMpK2AzU6Ljl2n/6O3oAG8nucOsj/z/+RLLmYIf2CbRu7Vq?=
 =?us-ascii?Q?jgYym5AQNulSD1ID0P9ijoyPvyPxrCicKESngi2/R8iSCpzuN7Jk23f8bGtp?=
 =?us-ascii?Q?oLQ9dYVQNUFbRg3hOy+LiC7hMqrku8y090o4+OKJAWx4ETTK/EebXOmT/SQG?=
 =?us-ascii?Q?huYR4DC8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe4e434-1dd1-46ac-c8b0-08d8c1c33002
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 06:25:34.4225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pr7uh/VhX7iKiAoSMzE/pGAfUlnGo+st0vw6/mZlpflio2Sjyzsy8ctBkcxRIagkIBgQVFmdn9vnZP45bqqM0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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


This is the v7 series to introduce i.MX8qm/qxp Display Processing Unit(DPU)
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


If people want to try this series with i.MX8qxp, clock patches can be found at
Shawn's i.MX for-next git branch, and power domain patches have already landed
in 5.11-rc1.

Version2 dropped the device tree patches because we'll use new dt binding
way to support i.MX8qm/qxp clocks.  It depends on the below series to do basic
conversions for the platforms which has not landed yet:
https://www.spinics.net/lists/linux-mmc/msg61965.html


I've sent the below series to add downstream bridges(embedded in i.MX8qm/qxp)
to support LVDS displays:
https://www.spinics.net/lists/arm-kernel/msg868239.html


Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

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
 drivers/gpu/drm/imx/dpu/dpu-dprc.c                 |  718 +++++++++++++
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
 drivers/gpu/drm/imx/dpu/dpu-plane.c                |  799 +++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h                |   56 ++
 drivers/gpu/drm/imx/dpu/dpu-prg.c                  |  433 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h                  |   45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h                  |  233 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c                 |  250 +++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c              |  308 ++++++
 drivers/gpu/drm/imx/dpu/dpu.h                      |  385 +++++++
 include/drm/drm_atomic.h                           |    5 +-
 39 files changed, 10356 insertions(+), 1 deletion(-)
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
