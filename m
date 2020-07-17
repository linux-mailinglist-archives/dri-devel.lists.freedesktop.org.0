Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9F2236CD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 10:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1F46ED5F;
	Fri, 17 Jul 2020 08:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54276ED5F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 08:18:01 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jwLZ8-00027w-EL; Fri, 17 Jul 2020 10:17:58 +0200
Message-ID: <3c03afff3256ec36e12b9d9408830fbb4853f982.camel@pengutronix.de>
Subject: Re: [PATCH v5 0/4] Add support for iMX8MQ Display Controller Subsystem
From: Lucas Stach <l.stach@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Laurentiu Palcu <laurentiu.palcu@nxp.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 17 Jul 2020 10:17:54 +0200
In-Reply-To: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
References: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu,

Am Donnerstag, den 09.07.2020, 19:47 +0300 schrieb Laurentiu Palcu:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> Hi,
> 
> This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> includes only graphics plane support (no video planes), no HDR10 capabilities,
> no graphics decompression (only linear, tiled and super-tiled buffers allowed).
> 
> Support for the rest of the features will be added incrementally, in subsequent
> patches.
> 
> The patchset was tested with both HDP driver (in the downstream tree) and the upstream
> MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).

I think the series (minus 3/5 and minor correction to the DT binding)
is fine to go in now. So just some formal questions: are you going to
maintain this driver in upstream? If so we should add a MAINTAINERS
entry to that effect. I can offer to act as a reviewer in this case.

How do you intend to merge this? IMO pushing this through drm-misc
seems like the right thing to do. If you agree I can help you get this
applied. If you are going to maintain the driver on your own, I think
you should then apply for commit rights to drm-misc.

Regards,
Lucas

> Thanks,
> Laurentiu
> 
> Changes in v5:
>  * Rebased to latest;
>  * Took out component framework support and made it a separate patch so
>    that people can still test with HDP driver, which makes use of it.
>    But the idea is to get rid of it once HDP driver's next versions
>    will remove component framework as well;
>  * Slight improvement to modesetting: avoid cutting off the pixel clock
>    if the new mode and the old one are equal. Also, in this case, is
>    not necessary to wait for DTG to shut off. This would allow to switch
>    from 8b RGB to 12b YUV422, for example, with no interruptions (at least
>    from DCSS point of view);
>  * Do not fire off CTXLD when going to suspend, unless it still has
>    entries that need to be committed to DCSS;
>  * Addressed Rob's comments on bindings;
> 
> Changes in v4:
>  * Addressed Lucas and Philipp's comments:
>    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
>    * Removed usage of devm_ functions since I'm already doing all the
>      clean-up in the submodules_deinit();
>    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
>    * Removed en_completion variable from dcss_crtc since this was
>      introduced mainly to avoid vblank timeout warnings which were fixed
>      by arming the vblank event in flush() instead of begin();
>    * Removed clks_on and irq_enabled flags since all the calls to
>      enabling/disabling clocks and interrupts were balanced;
>    * Removed the custom atomic_commit callback and used the DRM core
>      helper and, in the process, got rid of a workqueue that wasn't
>      necessary anymore;
>    * Fixed some minor DT binding issues flagged by Philipp;
>    * Some other minor changes suggested by Lucas;
>  * Removed YUV formats from the supported formats as these cannot work
>    without the HDR10 module CSCs and LUTs. Will add them back when I
>    will add support for video planes;
> 
> Changes in v3:
>  * rebased to latest linux-next and made it compile as drmP.h was
>    removed;
>  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
>  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
>  * fixed a a spurious hang reported by Lukas Hartmann and encountered
>    by me several times;
>  * mask DPR and DTG interrupts by default, as they may come enabled from
>    U-boot;
> 
> Changes in v2:
>  * Removed '0x' in node's unit-address both in DT and yaml;
>  * Made the address region size lowercase, to be consistent;
>  * Removed some left-over references to P010;
>  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
>    issues reported by kbuild for other architectures;
> 
> Laurentiu Palcu (5):
>   drm/imx: compile imx directory by default
>   drm/imx: Add initial support for DCSS on iMX8MQ
>   drm/imx/dcss: add component framework functionality
>   dt-bindings: display: imx: add bindings for DCSS
>   arm64: dts: imx8mq: add DCSS node
> 
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml |  84 ++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  23 +
>  drivers/gpu/drm/Makefile                      |   2 +-
>  drivers/gpu/drm/imx/Kconfig                   |   2 +
>  drivers/gpu/drm/imx/Makefile                  |   1 +
>  drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
>  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
>  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
>  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 314 +++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
>  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 183 ++++
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 185 ++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  43 +
>  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
>  20 files changed, 4123 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
>  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
