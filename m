Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E09AF365
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 22:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405B710E994;
	Thu, 24 Oct 2024 20:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRLOQfGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E510E994
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 20:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729800869; x=1761336869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VklAR/wGX+k0pmjfj3M+iIy1qkP/ubwQqB0DWvZy6Hw=;
 b=JRLOQfGXSafQj3Ckh0xfZhUEP2oNIcLFd3832M4zaaSvSlZuSkTqaRyy
 j5pN0yIgG7J6wf8xxpzdgi+1ks6IiXL+aAAhh0qUgHBPEcyiBtkgyLCX5
 T7xz7QJ3PIVa7jJjOtRNjsiQE77s/rRuX8d8zUBu5aDcs/n9UWz6H3N0q
 RaHAhwFePwRD9eTKDj4Q3r9EBKjBpOl5CmGk3JvahPchXwiiVdLInrZ+t
 UwGbz4h8N/3UtVTRmNMVhHPemyhDkW2PEJ5GzOVjafQEVUKKXn6lAIpJO
 FQh0xNg9qZA7af//IoZ2f6mEk64+KwzxIW5VxqIz7mcuBuo1+I6F88QuA Q==;
X-CSE-ConnectionGUID: DE5HNyc/S9Ox7RAwRhfejQ==
X-CSE-MsgGUID: nMh1WA3EQkKZbzk2+zxt8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29392990"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29392990"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 13:14:27 -0700
X-CSE-ConnectionGUID: EFJSh1mVTsqSo1fDKM2lUA==
X-CSE-MsgGUID: WoK4p1bHT4+stUiif3S8mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85495934"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 24 Oct 2024 13:14:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t44Do-000X2y-38;
 Thu, 24 Oct 2024 20:14:16 +0000
Date: Fri, 25 Oct 2024 04:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 02/37] drm/vc4: Use of_device_get_match_data to set
 generation
Message-ID: <202410250459.OQAldqVP-lkp@intel.com>
References: <20241023-drm-vc4-2712-support-v1-2-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-2-1cc2d5594907@raspberrypi.com>
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

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 91e21479c81dd4e9e22a78d7446f92f6b96a7284]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/drm-vc4-Limit-max_bpc-to-8-on-Pi0-3/20241024-005239
base:   91e21479c81dd4e9e22a78d7446f92f6b96a7284
patch link:    https://lore.kernel.org/r/20241023-drm-vc4-2712-support-v1-2-1cc2d5594907%40raspberrypi.com
patch subject: [PATCH 02/37] drm/vc4: Use of_device_get_match_data to set generation
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410250459.OQAldqVP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250459.OQAldqVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250459.OQAldqVP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vc4/vc4_drv.c:27:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/vc4/vc4_drv.c:27:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/vc4/vc4_drv.c:27:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/vc4/vc4_drv.c:27:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/vc4/vc4_drv.c:303:8: warning: cast to smaller integer type 'enum vc4_gen' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     303 |         gen = (enum vc4_gen)of_device_get_match_data(dev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +303 drivers/gpu/drm/vc4/vc4_drv.c

   288	
   289	static int vc4_drm_bind(struct device *dev)
   290	{
   291		struct platform_device *pdev = to_platform_device(dev);
   292		const struct drm_driver *driver;
   293		struct rpi_firmware *firmware = NULL;
   294		struct drm_device *drm;
   295		struct vc4_dev *vc4;
   296		struct device_node *node;
   297		struct drm_crtc *crtc;
   298		enum vc4_gen gen;
   299		int ret = 0;
   300	
   301		dev->coherent_dma_mask = DMA_BIT_MASK(32);
   302	
 > 303		gen = (enum vc4_gen)of_device_get_match_data(dev);
   304	
   305		if (gen > VC4_GEN_4)
   306			driver = &vc5_drm_driver;
   307		else
   308			driver = &vc4_drm_driver;
   309	
   310		node = of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
   311						       NULL);
   312		if (node) {
   313			ret = of_dma_configure(dev, node, true);
   314			of_node_put(node);
   315	
   316			if (ret)
   317				return ret;
   318		}
   319	
   320		vc4 = devm_drm_dev_alloc(dev, driver, struct vc4_dev, base);
   321		if (IS_ERR(vc4))
   322			return PTR_ERR(vc4);
   323		vc4->gen = gen;
   324		vc4->dev = dev;
   325	
   326		drm = &vc4->base;
   327		platform_set_drvdata(pdev, drm);
   328	
   329		if (gen == VC4_GEN_4) {
   330			ret = drmm_mutex_init(drm, &vc4->bin_bo_lock);
   331			if (ret)
   332				goto err;
   333	
   334			ret = vc4_bo_cache_init(drm);
   335			if (ret)
   336				goto err;
   337		}
   338	
   339		ret = drmm_mode_config_init(drm);
   340		if (ret)
   341			goto err;
   342	
   343		if (gen == VC4_GEN_4) {
   344			ret = vc4_gem_init(drm);
   345			if (ret)
   346				goto err;
   347		}
   348	
   349		node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
   350		if (node) {
   351			firmware = rpi_firmware_get(node);
   352			of_node_put(node);
   353	
   354			if (!firmware) {
   355				ret = -EPROBE_DEFER;
   356				goto err;
   357			}
   358		}
   359	
   360		ret = aperture_remove_all_conflicting_devices(driver->name);
   361		if (ret)
   362			goto err;
   363	
   364		if (firmware) {
   365			ret = rpi_firmware_property(firmware,
   366						    RPI_FIRMWARE_NOTIFY_DISPLAY_DONE,
   367						    NULL, 0);
   368			if (ret)
   369				drm_warn(drm, "Couldn't stop firmware display driver: %d\n", ret);
   370	
   371			rpi_firmware_put(firmware);
   372		}
   373	
   374		ret = component_bind_all(dev, drm);
   375		if (ret)
   376			goto err;
   377	
   378		ret = devm_add_action_or_reset(dev, vc4_component_unbind_all, vc4);
   379		if (ret)
   380			goto err;
   381	
   382		ret = vc4_plane_create_additional_planes(drm);
   383		if (ret)
   384			goto err;
   385	
   386		ret = vc4_kms_load(drm);
   387		if (ret < 0)
   388			goto err;
   389	
   390		drm_for_each_crtc(crtc, drm)
   391			vc4_crtc_disable_at_boot(crtc);
   392	
   393		ret = drm_dev_register(drm, 0);
   394		if (ret < 0)
   395			goto err;
   396	
   397		drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB565);
   398	
   399		return 0;
   400	
   401	err:
   402		platform_set_drvdata(pdev, NULL);
   403		return ret;
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
