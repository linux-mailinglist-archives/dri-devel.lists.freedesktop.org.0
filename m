Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F23B5A02A1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3770E14B352;
	Wed, 24 Aug 2022 20:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6358F591
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 03:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661224168; x=1692760168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tHINCusW1xr9wyTEQFYHoBqNpNqS3pZAVUeIOoov8K0=;
 b=JdBQTYlhKMCADCuLEuwMWoTkY5vqne9CnUQP4jagckZ/R9Fy3zvsbxqB
 M+pCElvDKfBt+3dKkQbMW2jhs15cYHpuygJ4Kz58tvULO1qPZjQ2H2sA+
 FVqKibliI1fSjoSb79McrEM48jZbeDBEUQykpazIQwGnV2Oknh8wz+exM
 wrmFVESw2cAogIgMJDzGp0KELyp3yn6mzqOGJZ/fyOJFvmeAFKRdKZBrj
 kZgtgKYFXKI4LU0b6uCUopZjcuBGWPU8sG4tW2wXM0jxXj/Nvc/WsFHW5
 eSVB3J0maN/2zE/UTGNwahtjgT9b+DeS4228IFiO4hYzRsmW2IKHhsWDe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273330689"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273330689"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 20:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="937290718"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2022 20:09:25 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oQKI8-00015h-30;
 Tue, 23 Aug 2022 03:09:24 +0000
Date: Tue, 23 Aug 2022 11:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm: rcar-du: fix DSI enable & disable sequence
Message-ID: <202208231031.hFwNDAuL-lkp@intel.com>
References: <20220822130513.119029-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822130513.119029-4-tomi.valkeinen@ideasonboard.com>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pinchartl-media/drm/du/next]
[also build test WARNING on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/drm-rcar-du-DSI-fixes/20220822-210756
base:   git://linuxtv.org/pinchartl/media.git drm/du/next
config: riscv-randconfig-r042-20220821 (https://download.01.org/0day-ci/archive/20220823/202208231031.hFwNDAuL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project abce7acebd4c06c977bc4bd79170697f1122bc5e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/d037472981c443d699c022aa91c5335f686d82ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/drm-rcar-du-DSI-fixes/20220822-210756
        git checkout d037472981c443d699c022aa91c5335f686d82ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/rcar-du/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:10:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:10:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:10:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:615:6: warning: no previous prototype for function 'rcar_mipi_dsi_pclk_enable' [-Wmissing-prototypes]
   void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
        ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:615:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
   ^
   static 
>> drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:654:6: warning: no previous prototype for function 'rcar_mipi_dsi_pclk_disable' [-Wmissing-prototypes]
   void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
        ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:654:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
   ^
   static 
   9 warnings generated.


vim +/rcar_mipi_dsi_pclk_enable +615 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c

   614	
 > 615	void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
   616				       struct drm_atomic_state *state)
   617	{
   618		struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
   619		const struct drm_display_mode *mode;
   620		struct drm_connector *connector;
   621		struct drm_crtc *crtc;
   622		int ret;
   623	
   624		connector = drm_atomic_get_new_connector_for_encoder(state,
   625								     bridge->encoder);
   626		crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
   627		mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
   628	
   629		ret = rcar_mipi_dsi_clk_enable(dsi);
   630		if (ret < 0) {
   631			dev_err(dsi->dev, "failed to enable DSI clocks\n");
   632			return;
   633		}
   634	
   635		ret = rcar_mipi_dsi_startup(dsi, mode);
   636		if (ret < 0)
   637			goto err_dsi_startup;
   638	
   639		rcar_mipi_dsi_set_display_timing(dsi, mode);
   640	
   641		ret = rcar_mipi_dsi_start_hs_clock(dsi);
   642		if (ret < 0)
   643			goto err_dsi_start_hs;
   644	
   645		return;
   646	
   647	err_dsi_start_hs:
   648		rcar_mipi_dsi_shutdown(dsi);
   649	err_dsi_startup:
   650		rcar_mipi_dsi_clk_disable(dsi);
   651	}
   652	EXPORT_SYMBOL_GPL(rcar_mipi_dsi_pclk_enable);
   653	
 > 654	void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
   655	{
   656		struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
   657	
   658		rcar_mipi_dsi_shutdown(dsi);
   659		rcar_mipi_dsi_clk_disable(dsi);
   660	}
   661	EXPORT_SYMBOL_GPL(rcar_mipi_dsi_pclk_disable);
   662	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
