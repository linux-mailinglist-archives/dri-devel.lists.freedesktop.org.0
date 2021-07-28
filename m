Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CD53D8C4C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 12:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189EC6E880;
	Wed, 28 Jul 2021 10:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF7B6E880
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 10:55:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 778423F;
 Wed, 28 Jul 2021 12:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627469741;
 bh=k8e6Of3Na/D4mn2xaNQsBDYUIoiRHZgVG9Nt/bZ/3RM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QpnuF1a1VCs83maRG72YHbYS15gCACgzI4QG5vqLdqRG73vMJiX2/VyKDr/xBZjcf
 yzijuhxZ78cGVCiGcgBWuB8lOE+6Sfi3MG+2nnJ2MFC8bzVJWjQdoG3d7vS65RymVf
 +Nco6MOGEq0iHhwXvknlZKu1jeGpHxEHrkZSHbT8=
Date: Wed, 28 Jul 2021 13:55:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jackie Liu <liu.yun@linux.dev>
Subject: Re: [PATCH] drm: rcar-du: crtc: force depends on cmm
Message-ID: <YQE3p7e14nQeI/oq@pendragon.ideasonboard.com>
References: <20210728084240.566677-1-liu.yun@linux.dev>
 <ca54fd2a-0436-d12a-5d90-bc3ff0b691b7@ideasonboard.com>
 <3f8127f2-69b4-0faa-bee8-5f6c6ed10606@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f8127f2-69b4-0faa-bee8-5f6c6ed10606@linux.dev>
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
Cc: airlied@linux.ie, liuyun01@kylinos.cn,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, kieran.bingham+renesas@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jackie,

On Wed, Jul 28, 2021 at 05:34:38PM +0800, Jackie Liu wrote:
> 在 2021/7/28 下午4:58, Kieran Bingham 写道:
> > On 28/07/2021 09:42, Jackie Liu wrote:
> >> From: Jackie Liu <liuyun01@kylinos.cn>
> >>
> >> After the patch 78b6bb1d24db ("drm: rcar-du: crtc: Control CMM operations"),
> >> the cmm module must be included in the crtc. We cannot remove this
> >> configuration option separately. Therefore, simply linking them together
> >> is the best solution, otherwise some errors will be reported.
> >>
> > 
> > Yikes, I'm sure we've had plenty of problems with the config options on
> > this module. The churn alone makes me wonder if it should just be part
> > of the overall module to simplify things... but...
> > 
> >>   rcar_du_crtc.c:(.text+0x194): undefined reference to `rcar_cmm_setup'
> >>   rcar_du_crtc.c:(.text+0x11bc): undefined reference to `rcar_cmm_enable'
> >>   rcar_du_crtc.c:(.text+0x1604): undefined reference to `rcar_cmm_disable'
> >>   rcar_du_kms.c:(.text+0x768): undefined reference to `rcar_cmm_init'
> > 
> > Those are guarded by #if IS_ENABLED in the header.
> > 
> > So from that - perhaps we can assume that the config attempted here was
> > a built-in DU - but a module CMM which wouldn't be supported?
> 
> I know you want to keep CMM as a module, I might think it’s too simple.
> will rewrite the patch.
> 
> >> Fixes: 78b6bb1d24db ("rm: rcar-du: crtc: Control CMM operations")
> > 
> > That fixes tag is missing a 'd', but that's trivial.
> 
> 12 characters of sha is enough.

I think Kieran meant s/"rm:/"drm:/ :-)

> >> Reported-by: kernel-bot <k2ci@kylinos.cn>
> >> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> >> ---
> >>   drivers/gpu/drm/rcar-du/Kconfig  | 8 --------
> >>   drivers/gpu/drm/rcar-du/Makefile | 2 +-
> >>   2 files changed, 1 insertion(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> >> index b47e74421e34..bc71ad2a472f 100644
> >> --- a/drivers/gpu/drm/rcar-du/Kconfig
> >> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> >> @@ -4,7 +4,6 @@ config DRM_RCAR_DU
> >>   	depends on DRM && OF
> >>   	depends on ARM || ARM64
> >>   	depends on ARCH_RENESAS || COMPILE_TEST
> >> -	imply DRM_RCAR_CMM
> >>   	imply DRM_RCAR_LVDS
> >>   	select DRM_KMS_HELPER
> >>   	select DRM_KMS_CMA_HELPER
> >> @@ -14,13 +13,6 @@ config DRM_RCAR_DU
> >>   	  Choose this option if you have an R-Car chipset.
> >>   	  If M is selected the module will be called rcar-du-drm.
> >>   
> >> -config DRM_RCAR_CMM
> >> -	tristate "R-Car DU Color Management Module (CMM) Support"
> >> -	depends on DRM && OF
> >> -	depends on DRM_RCAR_DU
> >> -	help
> >> -	  Enable support for R-Car Color Management Module (CMM).
> >> -
> > 
> > I suspect the issue lies somewhere in this config that the CMM is not
> > being enforced to be a built in when the DU is built in ?
> > 
> > 
> >>   config DRM_RCAR_DW_HDMI
> >>   	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
> >>   	depends on DRM && OF
> >> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> >> index 4d1187ccc3e5..76ff2e15bc2d 100644
> >> --- a/drivers/gpu/drm/rcar-du/Makefile
> >> +++ b/drivers/gpu/drm/rcar-du/Makefile
> >> @@ -5,6 +5,7 @@ rcar-du-drm-y := rcar_du_crtc.o \
> >>   		 rcar_du_group.o \
> >>   		 rcar_du_kms.o \
> >>   		 rcar_du_plane.o \
> >> +		 rcar_cmm.o
> >>   
> >>   rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
> >>   					   rcar_du_of_lvds_r8a7790.dtb.o \
> >> @@ -15,7 +16,6 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
> >>   rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
> >>   rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
> >>   
> >> -obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
> >>   obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
> >>   obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
> >>   obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o

-- 
Regards,

Laurent Pinchart
