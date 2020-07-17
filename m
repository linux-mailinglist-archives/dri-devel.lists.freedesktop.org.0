Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B9223E68
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 16:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F65B6EDDA;
	Fri, 17 Jul 2020 14:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DB36EC87
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 14:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCm8gYI4PxwnMw1UJlSmQ65VosZ1vmxHSBtr1DgNm3FoJ9U27oWnlOOVkn0fDP+ELVVTGhy3noptxvLVjU+Hb+KucIEfdB20b7mQfHYXVL5udpTnqWeAfyrMd4oXhIt57CiTloNl/JyWWTvUrhFKe8ekSFnHG567IPpyt7OH7juL+CxSKgXZJuK/HvWU54LUAphoYp2aYwvb93uVpkNOhI7TWWlUW3FBsA4ADKcqBc/yziO5W5pGSOcuGt2DRlmVjavhjKATKslQv8JNU/KMnhcN3wWsVX6AWlP7qqFdKxBuANBHhf8jbZ/3pj/GaN1CU+mPVnWcURnE8ZZKxUIC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClX19k+2BxAIACd9hxjSjbQ4Yk9bAKHTBZw8Idcd/pM=;
 b=Jkm6SlSgaO3m/M7b9aDF2OMqgkYqn/YoBb9z4M2qHpaaCDxhxXjTZHY2OkdYMpA4dZO9UrSjl+cEgCAV9QJ/LZJIuMaW8M622x9/TuN+6u5vNCQontEMpGUdVorOkJnijPWXYHFi3QaqAa+8JEix0uPxsEivwbIIsO/QmHN/io36bX+mO4z3mCrGbMhMvGSp0GJjhb9e+1ecTGEu/rLtQfzHhVk1Xi8AfOGYphAzlJjIRDXscD9AVXkCeJj5DpVUlqKID+8NU6Bocgh0M5JGUuuIeyrmVyfWeBJvhlZ2YqO/nSCSJnFe4pRUqsaArqCcWH/rEqETGXP6wvZKmjrfjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClX19k+2BxAIACd9hxjSjbQ4Yk9bAKHTBZw8Idcd/pM=;
 b=BlLIIiW5+152QAlXOAYTF/kuU3gVDMoDp3Ruy+XGVQFnYiroDeoFhkgGY7SlffME56PeX0mBKWW+koZsSc9gbKztHnIZ8ZK+u6JcF5Lqudnf3t1V+pSpUE0dciJSnbXM8iI6WcKRyF0WYkzIKu4MAM8X0imFf6FqHZX7S+IkDcc=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6959.eurprd04.prod.outlook.com
 (2603:10a6:803:139::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 14:42:23 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3174.029; Fri, 17 Jul 2020
 14:42:23 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/4] Add support for iMX8MQ Display Controller Subsystem
Date: Fri, 17 Jul 2020 17:41:25 +0300
Message-Id: <20200717144132.2206-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM4PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:205::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.19 via Frontend Transport; Fri, 17 Jul 2020 14:42:21 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9251bf47-f2f0-42ca-93c9-08d82a5f9db8
X-MS-TrafficTypeDiagnostic: VI1PR04MB6959:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB69590BB2F5A4285EA528E235BE7C0@VI1PR04MB6959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qPlhqal1FP5XR6Q/edQp8hz44uFGdR8wbDGad4LBwod+j0CUzqN+FEBewot30SxmI+DQpFdM3DfsTR679rmkMtI4tUBq1mxdki+59AaoYz8SH5ktaPTh2LC3K8zALOzfD7e6TwPjQf2ufax40v6ZxHvUPPw/0Ran5GGr7F6vyLkNF0xGVEELR1Y7CV3mTxiEEbr1cFR70+yzfXF1JZSqFnAfdwrniLoUWxuDYQ7JQOS5EuGkueH5gFtqVtdRB8wd7uLd919H2ts5hGico9BswlEjxPqxiYbHNuLdQVjcXr3WF1G+hIeUAQPWh0SC9rnhVgXv0y4Jk/aRH8Y107Wm474Uz2R0/LvofUbrm2G9lysUQr2H/G1c442QqFczDqGQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(110136005)(186003)(44832011)(16526019)(1076003)(8936002)(2906002)(6506007)(86362001)(26005)(6486002)(2616005)(5660300002)(66946007)(478600001)(66476007)(66556008)(6512007)(4326008)(316002)(83380400001)(956004)(8676002)(52116002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: KCA6QW46ZlTFBQDf0Tkqpe8C2dkrGH7/EW7eWpKwpiB4WXFlV5/9RCJj83o+TqdVl3+zhMn3Z+fwVcsKKX9uREy4q1nL/V2Pfq9TNyduL25KkZKZH+4Fm3EbdOXaViqgfAcUPR1M764E9KwRyYclG4YPPPnTfT3QI/4/Y730Tr36aE270oyq+rR1MoFJ6giiFbfDbc5KNn45LMBTxJmxXWk/p4xY2pmWvF1fukNFdQ740lpIZg9CZr3RSDhpykfrh5AX9gQBYXEdKnQo0WxmMTtX7YfjGU7NL0P0hRIxt52bFMQZaLnjVeDG8wfa93k6DzVBUN39mEld2/0929k9x7Tqrrp8L92Y6n4zBBo6ecLEsE3zIQasHtJ5tm17Rl7B1NWpIiFLflRFXWVBoee/Adg9/+ExprrihDeyUVUsCCIcRbaY590sLZXdOIr9279I1DlViUmjQPHWVLmqNhGtZv4Kfc+1lG8E6vWVAOXZZv4=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9251bf47-f2f0-42ca-93c9-08d82a5f9db8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 14:42:23.3261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/3NoSdsBCHvl//6CwZVTJb3/O2aH99Fua6CVLOcDSS+HIWCnb2fvTQ7jAk1obfbx8dhNwFrngZQdXqhqlzgrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6959
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Hi,

This patchset adds initial DCSS support for iMX8MQ chip. Initial support
includes only graphics plane support (no video planes), no HDR10 capabilities,
no graphics decompression (only linear, tiled and super-tiled buffers allowed).

Support for the rest of the features will be added incrementally, in subsequent
patches.

The patchset was tested with both HDP driver (in the downstream tree) and the upstream
MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).

Thanks,
Laurentiu

Changes in v6:
 * Addressed Rob's comment and added "additionalProperties: false" at
   the end of the bindings' properties. However, this change surfaced
   an issue with the assigned-clock* properties not being documented in
   the properties section. Added the descriptions and the bindings patch
   will need another review;
 * Added an entry for DCSS driver in the MAINTAINERS file;
 * Removed the component framework patch altogether;

Changes in v5:
 * Rebased to latest;
 * Took out component framework support and made it a separate patch so
   that people can still test with HDP driver, which makes use of it.
   But the idea is to get rid of it once HDP driver's next versions
   will remove component framework as well;
 * Slight improvement to modesetting: avoid cutting off the pixel clock
   if the new mode and the old one are equal. Also, in this case, is
   not necessary to wait for DTG to shut off. This would allow to switch
   from 8b RGB to 12b YUV422, for example, with no interruptions (at least
   from DCSS point of view);
 * Do not fire off CTXLD when going to suspend, unless it still has
   entries that need to be committed to DCSS;
 * Addressed Rob's comments on bindings;

Changes in v4:
 * Addressed Lucas and Philipp's comments:
   * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
   * Removed usage of devm_ functions since I'm already doing all the
     clean-up in the submodules_deinit();
   * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
   * Removed en_completion variable from dcss_crtc since this was
     introduced mainly to avoid vblank timeout warnings which were fixed
     by arming the vblank event in flush() instead of begin();
   * Removed clks_on and irq_enabled flags since all the calls to
     enabling/disabling clocks and interrupts were balanced;
   * Removed the custom atomic_commit callback and used the DRM core
     helper and, in the process, got rid of a workqueue that wasn't
     necessary anymore;
   * Fixed some minor DT binding issues flagged by Philipp;
   * Some other minor changes suggested by Lucas;
 * Removed YUV formats from the supported formats as these cannot work
   without the HDR10 module CSCs and LUTs. Will add them back when I
   will add support for video planes;

Changes in v3:
 * rebased to latest linux-next and made it compile as drmP.h was
   removed;
 * removed the patch adding the VIDEO2_PLL clock. It's already applied;
 * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
 * fixed a a spurious hang reported by Lukas Hartmann and encountered
   by me several times;
 * mask DPR and DTG interrupts by default, as they may come enabled from
   U-boot;

Changes in v2:
 * Removed '0x' in node's unit-address both in DT and yaml;
 * Made the address region size lowercase, to be consistent;
 * Removed some left-over references to P010;
 * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
   issues reported by kbuild for other architectures;


Laurentiu Palcu (4):
  drm/imx: compile imx directory by default
  drm/imx: Add initial support for DCSS on iMX8MQ
  MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
  dt-bindings: display: imx: add bindings for DCSS

 .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 +++
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/imx/Kconfig                   |   2 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
 drivers/gpu/drm/imx/dcss/Makefile             |   6 +
 drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
 drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.c           | 314 +++++++
 drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
 drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-drv.c           | 138 +++
 drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c           | 177 ++++
 drivers/gpu/drm/imx/dcss/dcss-kms.h           |  43 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
 drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
 20 files changed, 4075 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
 create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
 create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
