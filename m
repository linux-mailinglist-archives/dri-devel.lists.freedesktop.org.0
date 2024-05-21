Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FDC8CA98F
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 10:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E17910E317;
	Tue, 21 May 2024 08:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7837D10E317
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 08:04:01 +0000 (UTC)
Received: from i53875abf.versanet.de ([83.135.90.191] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s9KSz-0007vG-WB; Tue, 21 May 2024 10:03:26 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com,
 keith <keith.zhao@starfivetech.com>, Alex Bee <knaerzche@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 keith.zhao@starfivetech.com
Subject: Re: [PATCH v4 00/10] drm/verisilicon : support DC8200 and inno hdmi
Date: Tue, 21 May 2024 10:03:24 +0200
Message-ID: <3222561.5fSG56mABF@diego>
In-Reply-To: <20240521105817.3301-1-keith.zhao@starfivetech.com>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

Am Dienstag, 21. Mai 2024, 12:58:07 CEST schrieb keith:
> Verisilicon/DC8200 display controller IP has 2 display pipes and each 
> pipe support a primary plane and a cursor plane . 
> In addition, there are four overlay planes as two display pipes common resources.
> 
> The first display pipe is bound to the inno HDMI encoder.
> The second display pipe is bound to a simple encoder, which is used to
> find dsi bridge by dts node. 
> 
> Patch 1 adds YAML schema for JH7110 display pipeline.
> 
> Patches 2 to 3 add inno common api and match the ROCKCHIP inno hdmi driver 
> by calling the common api. 
> The collating public interface is based on ROCKCHIP inno hdmi, 
> and it can be resused by JH7110 inno hdmi.
> Those common api are tested on rk-3128 SDK, which kernel version is 4.x. 

as you were working on the rk3128-inno-hdmi variant recently
and I don't really have a rk3036 or rk3128 in working condition
right now, could you give this series a try.

For reference, the full series is at lore:
https://lore.kernel.org/dri-devel/20240521105817.3301-1-keith.zhao@starfivetech.com/

and generalizes the inno-hdmi driver into the bridge model we
have in a number of other places already.


Thanks
Heiko



> step1, make sure the process is consistent with the latest kernel version.
> step2, just remove the interface and add a common interface. 
> 
> Patches 4 to 8 add kms driver for dc8200 display controller.
> 
> Patch 9 adds inno hdmi support for JH7110 display pipeline.
> 
> Patch 10 adds a simple encoder.
> 
> This patchset should be applied on next branch.
> 
> V1:
> Changes since v1:
> - Further standardize the yaml file.
> - Dts naming convention improved.
> - Fix the problem of compiling and loading ko files.
> - Use drm new api to automatically manage resources.
> - Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface.
> - Reduce the modifiers unused.
> - Optimize the hdmi driver code
> 
> V2:
> Changes since v2:
> - fix the error about checking the yaml file.
> - match drm driver GEM DMA API.
> - Delete the custom crtc property .
> - hdmi use drmm_ new api to automatically manage resources.
> - update the modifiers comments.
> - enabling KASAN, fix the error during removing module 
> 
> V3:
> Changes since v3:
> - Delete the custom plane property.
> - Delete the custom fourcc modifiers.
> - Adjust the calculation mode of hdmi pixclock.
> - Add match data for dc8200 driver.
> - Adjust some magic values.
> - Add a simple encoder for dsi output.
> 
> V4:
> Changes since v4:
> - Delete the display subsystem module as all crtcs and planes are a driver.
> - Delete the custom struct, directly use the drm struct data.
> - Tidy up the inno hdmi public interface.
> - Add a simple encoder for dsi output.
> 
> keith (10):
>   dt-bindings: display: Add YAML schema for JH7110 display pipeline
>   drm/bridge: add common api for inno hdmi
>   drm/rockchip:hdmi: migrate to use inno-hdmi bridge driver
>   drm/vs: Add hardware funcs for vs.
>   drm/vs: add vs mode config init
>   drm/vs: add vs plane api
>   drm/vs: add ctrc fun
>   drm/vs: add vs drm master driver
>   drm/vs: Innosilicon HDMI support
>   drm/vs: add simple dsi encoder
> 
>  .../display/bridge/innosilicon,inno-hdmi.yaml |   49 +
>  .../display/rockchip/rockchip,inno-hdmi.yaml  |   27 +-
>  .../starfive/starfive,dsi-encoder.yaml        |   92 ++
>  .../starfive/starfive,jh7110-dc8200.yaml      |  169 +++
>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |   75 ++
>  .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
>  MAINTAINERS                                   |   11 +
>  drivers/gpu/drm/Kconfig                       |    2 +
>  drivers/gpu/drm/Makefile                      |    1 +
>  drivers/gpu/drm/bridge/Kconfig                |    2 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/innosilicon/Kconfig    |    6 +
>  drivers/gpu/drm/bridge/innosilicon/Makefile   |    2 +
>  .../gpu/drm/bridge/innosilicon/inno-hdmi.c    |  587 +++++++++
>  .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |   97 ++
>  drivers/gpu/drm/rockchip/Kconfig              |    1 +
>  drivers/gpu/drm/rockchip/Makefile             |    2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  517 ++++++++
>  .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |   45 -
>  drivers/gpu/drm/rockchip/inno_hdmi.c          | 1073 -----------------
>  drivers/gpu/drm/verisilicon/Kconfig           |   23 +
>  drivers/gpu/drm/verisilicon/Makefile          |   11 +
>  .../gpu/drm/verisilicon/inno_hdmi-starfive.c  |  481 ++++++++
>  .../gpu/drm/verisilicon/inno_hdmi-starfive.h  |  152 +++
>  drivers/gpu/drm/verisilicon/vs_crtc.c         |  241 ++++
>  drivers/gpu/drm/verisilicon/vs_crtc.h         |   17 +
>  drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1060 ++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  493 ++++++++
>  drivers/gpu/drm/verisilicon/vs_drv.c          |  721 +++++++++++
>  drivers/gpu/drm/verisilicon/vs_drv.h          |   98 ++
>  drivers/gpu/drm/verisilicon/vs_modeset.c      |   36 +
>  drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
>  drivers/gpu/drm/verisilicon/vs_plane.c        |  487 ++++++++
>  drivers/gpu/drm/verisilicon/vs_plane.h        |   26 +
>  drivers/gpu/drm/verisilicon/vs_simple_enc.c   |  190 +++
>  drivers/gpu/drm/verisilicon/vs_simple_enc.h   |   25 +
>  drivers/gpu/drm/verisilicon/vs_type.h         |   84 ++
>  include/drm/bridge/inno_hdmi.h                |   69 ++
>  38 files changed, 5840 insertions(+), 1144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
>  create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
>  create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>  rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (85%)
>  delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>  create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
>  create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
>  create mode 100644 include/drm/bridge/inno_hdmi.h
> 
> 




