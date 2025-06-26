Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFAAEAACA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 01:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F54289C5E;
	Thu, 26 Jun 2025 23:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eR4eaI9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD7589C5E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750981386; x=1782517386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=urZl6JTvJf0apVJYt9mU6sqER8QXulKfZ2pqNl0VDWg=;
 b=eR4eaI9Ji7nw9bj+7EcYfecw1PjHou3cQC17/Q4SGz7hCjUPrFo+w87s
 wpCmyHESiiryx2dW8br3Ezo8vFqbbu04vW9gzaVIJ5Qe8/YXh+cxeKwzV
 hpNAUsj5YGPO5CuHZJi8tMQpkhO4Kk6h1iISu3DKQlirfDTMBNn8Lo3wp
 lHszSqOUlkL7Jp+YiA5EeJaEQJqw56LuKZ5fpuPFZgn4QCsRaSFR/b55E
 tpuiTbgP7ECM6nlswPPj0dm6MAa8u5x74fDI2aAvQYm23bWPsY5E/RKgH
 hHspHGePDnb62Ljm50w4UbfVYRIh2VzxIi9qKXjP5zL28FClSxU3rqqD4 A==;
X-CSE-ConnectionGUID: zRcNeOe+QS6SP0jYL/+FzA==
X-CSE-MsgGUID: DS989tjOQ4uWMwQXlCbmVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53373333"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53373333"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 16:43:04 -0700
X-CSE-ConnectionGUID: m2O60cNASlipTnztUvc2bg==
X-CSE-MsgGUID: 4k/IXgdbQv6+NtWf8J3f4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="156946019"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 16:42:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uUwF7-000Vde-0V;
 Thu, 26 Jun 2025 23:42:57 +0000
Date: Fri, 27 Jun 2025 07:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 22/32] drm: renesas: rz-du: rzg2l_mipi_dsi: convert to
 the .attach_new op
Message-ID: <202506270718.iCW6cHYD-lkp@intel.com>
References: <20250625-drm-dsi-host-no-device-ptr-v1-22-e36bc258a7c5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-22-e36bc258a7c5@bootlin.com>
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

Hi Luca,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1174bf15bd601f17556f721798cd9183e169549a]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-mipi-dsi-add-sanity-check-of-lane-number-in-mipi_dsi_attach/20250626-005002
base:   1174bf15bd601f17556f721798cd9183e169549a
patch link:    https://lore.kernel.org/r/20250625-drm-dsi-host-no-device-ptr-v1-22-e36bc258a7c5%40bootlin.com
patch subject: [PATCH 22/32] drm: renesas: rz-du: rzg2l_mipi_dsi: convert to the .attach_new op
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250627/202506270718.iCW6cHYD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270718.iCW6cHYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270718.iCW6cHYD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:11:
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c: In function 'rzg2l_mipi_dsi_host_attach':
>> drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:712:33: error: 'device' undeclared (first use in this function)
     712 |                                 device->format);
         |                                 ^~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:711:25: note: in expansion of macro 'dev_err'
     711 |                         dev_err(dsi->dev, "Unsupported format 0x%04x\n",
         |                         ^~~~~~~
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:712:33: note: each undeclared identifier is reported only once for each function it appears in
     712 |                                 device->format);
         |                                 ^~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:711:25: note: in expansion of macro 'dev_err'
     711 |                         dev_err(dsi->dev, "Unsupported format 0x%04x\n",
         |                         ^~~~~~~


vim +/device +712 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  686  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  687  /* -----------------------------------------------------------------------------
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  688   * Host setting
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  689   */
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  690  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  691  static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  692  				      const struct mipi_dsi_bus_fmt *bus_fmt)
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  693  {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  694  	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  695  	int ret;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  696  
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  697  	if (bus_fmt->lanes > dsi->num_data_lanes) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  698  		dev_err(dsi->dev,
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  699  			"Number of lines of device (%u) exceeds host (%u)\n",
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  700  			bus_fmt->lanes, dsi->num_data_lanes);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  701  		return -EINVAL;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  702  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  703  
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  704  	switch (mipi_dsi_pixel_format_to_bpp(bus_fmt->format)) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  705  	case 24:
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  706  		break;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  707  	case 18:
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  708  		break;
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  709  	case 16:
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  710  		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  711  			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09 @712  				device->format);
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  713  			return -EINVAL;
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  714  		}
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  715  		break;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  716  	default:
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  717  		dev_err(dsi->dev, "Unsupported format 0x%04x\n", bus_fmt->format);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  718  		return -EINVAL;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  719  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  720  
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  721  	dsi->lanes = bus_fmt->lanes;
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  722  	dsi->format = bus_fmt->format;
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  723  	dsi->mode_flags = bus_fmt->mode_flags;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  724  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  725  	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  726  						  1, 0);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  727  	if (IS_ERR(dsi->next_bridge)) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  728  		ret = PTR_ERR(dsi->next_bridge);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  729  		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  730  		return ret;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  731  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  732  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  733  	drm_bridge_add(&dsi->bridge);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  734  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  735  	return 0;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  736  }
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  737  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
