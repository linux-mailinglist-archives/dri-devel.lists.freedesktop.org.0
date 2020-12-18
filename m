Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C070F2DDFE2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1391D89D57;
	Fri, 18 Dec 2020 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BA0896E9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icqRnxqPAFeu7FXfM34O14GN+pFVODH8m/k7iOPA2vT+jB0UY3fgVH1omioS7q8N2FKQkiXkWd5lmVoLLq1rLXPL1FdSTAqKTChabeCPPJiArxTHP5TuQMvtAH72aR5Bsowcgv10KTCn/7Mx0wV8+ZYNOpEz/BWxkhT0INe/8bwjfQmu3s8pFAx9WSc9mcTaSO+hyu6PwygvF2emwe2baGBmgMhVt2kt87IkYeRSVAGnslopYaV5wMJY17rby5gIrSLbEQ5aAojG59246Kta+cJ6y3rLB++ropoTseJAeLtpbwU3frHRrVwKY79foof8Ju4RF90Aa+tRoUx7UTnJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXYBWT5+/0MKA5SjcIVzpnjKBhhR4u2EGi1xI/mKmIc=;
 b=Z61Z+1jMLxbAPXTVOPve+S5RKUpsCdFXniNw56qBUGQzRLqdu/2kJUF+idESyD9BdtZWoMACz0FO64NfGagRrpr6Ri9HTohh5sKEQrO0y+2qgJXmMdfQKc3KIaFwKVNfqvLFMgq5zPJRnqmbkePXSp3bRcqyZ9R8CxunO8vuKr9JwRU7aLDCP2UeNVUlXky7YA/vZLOCJlTo/GpKRWzewr6Fz2eCpm2Esoa8SiG2FMqSe7YGNp39/DcbexTAnpTR7wQF5ZBh3ArDpRHD3/3VKx2gECZWj+BX34gmOU5mnhZwLVcTQMI+PAUepAziIg/nOSGb3opdPPTtQ5tvRQIChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXYBWT5+/0MKA5SjcIVzpnjKBhhR4u2EGi1xI/mKmIc=;
 b=cZs81bT4QPp0A9t80FHFz/KW/XsrDwGjC1WSJCjx+tmZBlovY+4HVFfytWFnWhh/snBe7+VByGGFB5oQCQXZ8yPw4/uqwYb2eVT3VlBDTynETkaflom0eNGzp7sR6/vk+EONq5JKqnGql+fUV0baPLZ3jnVzzsud4QtSW+8FZAM=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 03:32:43 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Fri, 18 Dec 2020
 03:32:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Date: Fri, 18 Dec 2020 11:23:47 +0800
Message-Id: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0118.apcprd02.prod.outlook.com (2603:1096:4:92::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 03:32:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71c1a8d4-54c5-495d-d42d-08d8a305946a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2816:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2816D3F81825174E0CFD9E7298C30@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2haXQ1zP6odvYUH30Sh1NKoV8JDtuB4iBiF3F1Uq7jxR5DXm5gZiivZNIx9AIk4mKzZt7j4QK7oAX5V7G8HsLznfd/HJJXdnbE5CSmxj12zY7l4V73Z9UCbWjqNas39wW1FlMrh0AdKtaVuNtEr3/5d9Hd6BkKFncgFXr2EdQXjsLDMeSj+HAs/0X4kB4OhbnMyqQD/k+8zPxJrFS5eMC6GK3b436Ba+PYHK+s05AtBYBkNYlhCyqSSqGA7Px9pWMFdkaI33DZdMtfKsYHqH06A6N/dUG8o15LYd0s6Lz4gd2Y3N/aElv7matcV29F62DeesUNpWbPv+JqE+gx17hR4xB6QTLgBiJ2MDeJKHVmrcFjungF2p40zL1WbCo93bceleF4d65/NwRN0Y1eyZKKXWQhstCwH3UQNO83bH6weMRo69P0CXD+3NrcpX+zW4j8zP8FY8V7tuvmk1fBfLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(66476007)(52116002)(478600001)(5660300002)(6666004)(36756003)(316002)(2906002)(6506007)(4326008)(2616005)(66556008)(6486002)(966005)(6512007)(16526019)(83380400001)(69590400008)(66946007)(7416002)(8936002)(8676002)(86362001)(26005)(956004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?usW1q8RfTqN3CWkdTRVdLVYVgc6zEPSjW8qan4rumwXF/SY9Ep8zTefmqmAG?=
 =?us-ascii?Q?xGvNTp/Jpx8UNOSipCTpBDCfcK+1EOtqGEafwN6h0iHPAm8EuypQImOcgp9o?=
 =?us-ascii?Q?WgwvO8pQbEa9QNjkk/FDLK1qJ/EvNTm0mxef6RfFWC7wuCww9ZurvSv5lGJR?=
 =?us-ascii?Q?rEdfpENKwGHcgcT6+Ho2PyHxTueqGm5IkM9Mz3YjEqRBPNhQoKBUwwqmDPbI?=
 =?us-ascii?Q?GUTZKiGtMyZ+p3/fve3Q9Dzl0Z08t4BiwZWJkgJ4eXDcKQo1QgE13dvR0gRI?=
 =?us-ascii?Q?wLS5GKNgwpkEA0eKcn5WKZPDcYMWkl0liny4BC9RcL1e8uU7V+QflHTthgXX?=
 =?us-ascii?Q?NDRJsXaaxLRVL6W5fqXrxReqdEBNlPrIy0IqxcYJlhWVaq1VmIFkE/cTFl5s?=
 =?us-ascii?Q?tmBmzWZS0+4DH98gvZhVjHpb6TS2HZL9KnCyErLLcQD798nHGKg/xJQ4LvfH?=
 =?us-ascii?Q?6yUEzBweWRdc2+Gan03rUx/V2mQri4fhgy0oNjyQvDB/mah5l2rS1d5wEHhi?=
 =?us-ascii?Q?7UF50Z2JqwSMqAJGwwS4zwnRHoYHakekcncn0R7krMNoBa5oVUe03IYgSGMm?=
 =?us-ascii?Q?SA6Vlb2L1nhigUDAkYddnDxpRNcsvWWPN3gd1N6HcDVQ+vWGDnL0MAXAM/oX?=
 =?us-ascii?Q?SY8pmEgF+eb88aQYBGeHfr1ecPrsVe6dD17X0amE3xXNyCgvj3zHFbkB4AqS?=
 =?us-ascii?Q?lMKRsgJ2eTfuTXODDMaNIoDyQ2EgOLpVvNb2v6T8KJCcRKZ1xhVgnDrckABA?=
 =?us-ascii?Q?+lifj5bSCNl8eKMA2sqNxy0RjStiupJ2+BJ1j4ywlV4MzLiY59WpYhpOW5QJ?=
 =?us-ascii?Q?gQgL7y6Qsi5iNgR7KzUwRdiUYBzuAkHGfxjO1bm6ZprK+LOK5zReeUitHZ2R?=
 =?us-ascii?Q?31G6OVnL6mU2lIUiP5fWFd82pieJafDsLC4OUaEItyYC6MOYnn+RvX3l2ZCn?=
 =?us-ascii?Q?uy0fW1M+vTiV994X8I1EOtfz8hmA3S115aGLSCzDXDGInIVDOetcgqjZ7wUy?=
 =?us-ascii?Q?8FbT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 03:32:43.1459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c1a8d4-54c5-495d-d42d-08d8a305946a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgUm7PZEZiwjyque8kgU+VV/Hl1daLHNeUPt51jzGe2ThKgV/Iyg8GoggXxspTRTqpy0UzAT/x+lPoaG3LMHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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


I've sent the below series to add downstream bridges(embedded in i.MX8qm/qxp)
to support LVDS displays:
https://www.spinics.net/lists/linux-media/msg183650.html


Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.

Welcome comments, thanks.

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
 drivers/gpu/drm/imx/dpu/dpu-crtc.c                 | 925 +++++++++++++++++++++
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
 drivers/gpu/drm/imx/dpu/dpu-plane.c                | 702 ++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h                |  56 ++
 drivers/gpu/drm/imx/dpu/dpu-prg.c                  | 433 ++++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h                  |  45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h                  | 203 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c                 | 249 ++++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c              | 305 +++++++
 drivers/gpu/drm/imx/dpu/dpu.h                      | 389 +++++++++
 include/drm/drm_atomic.h                           |   5 +-
 39 files changed, 10019 insertions(+), 1 deletion(-)
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
