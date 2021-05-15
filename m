Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D03814B2
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 02:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C0B6F4C5;
	Sat, 15 May 2021 00:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0756F4C5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 00:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=6qb9JytuavkuiiYtyKf0aMjSAI0uG78GU3bEEUZ/mEg=; b=xxHSVITxPdg6dy2oHj1VTgUxxH
 EyhEtOYLHFbX1yN6PtJ/YaMDTiukp47CDwnGSTY0ppB6RnWyequwalv+5H+ZTEaQtkOEp523um7Kg
 L9QNO758FjwjYe+Tvr7O+vd+32qncfAvxD7lRNjR8GOIGC61iI4z9M/4NnqioeIbGEoYd3pBwrCGW
 Xy20vZwIr/45nRWkPXrFvnDOkgHeOgpWGN/7gFq3Jv+lEz6R5yrUuzq6lMvWpICKbcSUvUf7Um03B
 10TUcnd4Yw/T/xVRrx3VRU/CEqQjkjAZWUdAOkuMR0fT55/MPiMpHvsYkrpID0uSLwbiMFLYbLFML
 D2yDZbpw==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lhiJ8-00CL42-UG; Sat, 15 May 2021 00:37:31 +0000
Subject: Re: [PATCH v2] drm: rcar-du: fix linker undefined references
To: linux-kernel@vger.kernel.org
References: <20210424001214.30642-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bc53f5b5-d602-e1d3-93dc-3444f6944d6d@infradead.org>
Date: Fri, 14 May 2021 17:37:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210424001214.30642-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping?
thanks.

On 4/23/21 5:12 PM, Randy Dunlap wrote:
> When DRM_RCAR_DU=y and DRM_RCAR_LVDS=m, there are several build errors
> as reported by 'kernel test robot'. These can be corrected by changing
> source code occurrences of IS_ENABLED(...) to IS_REACHABLE(...).
> 
> In looking at this, the same problem (build errors) happens when
> DRM_RCAR_DU=y and DRM_RCAR_CMM=m, so again change an IS_ENABLED()
> to IS_REACHABLE() for this case as well.
> 
> These changes fix the following 8 build/link errors:
> 
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> rcar_du_crtc.c:(.text+0x1be8): undefined reference to `rcar_lvds_clk_enable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> rcar_du_crtc.c:(.text+0x2438): undefined reference to `rcar_lvds_clk_disable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function `rcar_du_init':
> rcar_du_drv.c:(.init.text+0x14): undefined reference to `rcar_du_of_init'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in function `rcar_du_encoder_init':
> rcar_du_encoder.c:(.text+0x1d4): undefined reference to `rcar_lvds_dual_link'
> 
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_cmm_setup':
> rcar_du_crtc.c:(.text+0x380): undefined reference to `rcar_cmm_setup'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> rcar_du_crtc.c:(.text+0x1c08): undefined reference to `rcar_cmm_enable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> rcar_du_crtc.c:(.text+0x231c): undefined reference to `rcar_cmm_disable'
> aarch64-linux-ld: drivers/gpu/drm/rcar-du/rcar_du_kms.o: in function `rcar_du_modeset_init':
> rcar_du_kms.c:(.text+0xd08): undefined reference to `rcar_cmm_init'
> 
> All RCAR kconfig combinations now build for me.
> 
> Fixes: e08e934d6c28 ("drm: rcar-du: Add support for CMM")
> Fixes: 02f2b30032c1 ("drm: rcar-du: lvds: Add API to enable/disable clock output")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> v2: also send to LKML;
>     don't change Kconfig "imply" to "select" since not all platforms
>     with DU have CMM and/or LVDS support. Use IS_REACHABLE() instead.
> 
>  drivers/gpu/drm/rcar-du/rcar_cmm.h   |    4 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_of.h |    2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.h  |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/rcar_lvds.h
> +++ linux-next-20210420/drivers/gpu/drm/rcar-du/rcar_lvds.h
> @@ -12,7 +12,7 @@
>  
>  struct drm_bridge;
>  
> -#if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
> +#if IS_REACHABLE(CONFIG_DRM_RCAR_LVDS)
>  int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
>  void rcar_lvds_clk_disable(struct drm_bridge *bridge);
>  bool rcar_lvds_dual_link(struct drm_bridge *bridge);
> --- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/rcar_du_of.h
> +++ linux-next-20210420/drivers/gpu/drm/rcar-du/rcar_du_of.h
> @@ -11,7 +11,7 @@
>  
>  struct of_device_id;
>  
> -#if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
> +#if IS_REACHABLE(CONFIG_DRM_RCAR_LVDS)
>  void __init rcar_du_of_init(const struct of_device_id *of_ids);
>  #else
>  static inline void rcar_du_of_init(const struct of_device_id *of_ids) { }
> --- linux-next-20210420.orig/drivers/gpu/drm/rcar-du/rcar_cmm.h
> +++ linux-next-20210420/drivers/gpu/drm/rcar-du/rcar_cmm.h
> @@ -25,7 +25,7 @@ struct rcar_cmm_config {
>  	} lut;
>  };
>  
> -#if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
> +#if IS_REACHABLE(CONFIG_DRM_RCAR_CMM)
>  int rcar_cmm_init(struct platform_device *pdev);
>  
>  int rcar_cmm_enable(struct platform_device *pdev);
> @@ -53,6 +53,6 @@ static inline int rcar_cmm_setup(struct
>  {
>  	return 0;
>  }
> -#endif /* IS_ENABLED(CONFIG_DRM_RCAR_CMM) */
> +#endif /* IS_REACHABLE(CONFIG_DRM_RCAR_CMM) */
>  
>  #endif /* __RCAR_CMM_H__ */
> 


-- 
~Randy

