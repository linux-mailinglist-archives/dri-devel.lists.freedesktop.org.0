Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935C167D3B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 13:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE17A6E28A;
	Fri, 21 Feb 2020 12:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EC26E28A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 12:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6A6FFFB03;
 Fri, 21 Feb 2020 13:15:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhGsRqo6q9nO; Fri, 21 Feb 2020 13:15:33 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 1978B405CD; Fri, 21 Feb 2020 13:15:33 +0100 (CET)
Date: Fri, 21 Feb 2020 13:15:33 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: [PATCH v3 0/4] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200221121533.GA11663@bogon.m.sigxcpu.org>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu,
On Fri, Dec 06, 2019 at 11:52:37AM +0200, Laurentiu Palcu wrote:
> Hi,
> =

> This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> includes only graphics plane support (no video planes), no HDR10 capabili=
ties,
> no graphics decompression (only linear, tiled and super-tiled buffers all=
owed).
> =

> Support for the rest of the features will be added incrementally, in subs=
equent
> patches.
> =

> The patchset was tested with both HDP driver (not yet upstreamed) and MIP=
I-DSI
> (drivers already on the dri-devel ML).

I've been testing this with the HDP parts pulled out of NXPs vendor tree
for a while so

Tested-by: Guido G=FCnther <agx@sigxcpu.org>

Cheers,
 -- Guido

> =

> Thanks,
> Laurentiu
> =

> Changes in v3:
>  * rebased to latest linux-next and made it compile as drmP.h was
>    removed;
>  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
>  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
>  * fixed a a spurious hang reported by Lukas Hartmann and encountered
>    by me several times;
>  * mask DPR and DTG interrupts by default, as they may come enabled from
>    U-boot;
> =

> Changes in v2:
>  * Removed '0x' in node's unit-address both in DT and yaml;
>  * Made the address region size lowercase, to be consistent;
>  * Removed some left-over references to P010;
>  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence =
compilation
>    issues reported by kbuild for other architectures;
> =

> =

> Laurentiu Palcu (4):
>   drm/imx: compile imx directory by default
>   drm/imx: Add initial support for DCSS on iMX8MQ
>   dt-bindings: display: imx: add bindings for DCSS
>   arm64: dts: imx8mq: add DCSS node
> =

>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml      |  86 +++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  25 +
>  drivers/gpu/drm/Makefile                           |   2 +-
>  drivers/gpu/drm/imx/Kconfig                        |   2 +
>  drivers/gpu/drm/imx/Makefile                       |   1 +
>  drivers/gpu/drm/imx/dcss/Kconfig                   |   8 +
>  drivers/gpu/drm/imx/dcss/Makefile                  |   6 +
>  drivers/gpu/drm/imx/dcss/dcss-blkctl.c             |  75 ++
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c               | 224 ++++++
>  drivers/gpu/drm/imx/dcss/dcss-ctxld.c              | 447 +++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.c                | 286 +++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.h                | 195 +++++
>  drivers/gpu/drm/imx/dcss/dcss-dpr.c                | 550 ++++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-drv.c                | 181 +++++
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c                | 442 +++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.c                | 322 ++++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.h                |  52 ++
>  drivers/gpu/drm/imx/dcss/dcss-plane.c              | 418 +++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c             | 826 +++++++++++++++=
++++++
>  drivers/gpu/drm/imx/dcss/dcss-ss.c                 | 179 +++++
>  20 files changed, 4326 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx=
8mq-dcss.yaml
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
> =

> -- =

> 2.7.4
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
