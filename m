Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9375A001
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269C010E511;
	Wed, 19 Jul 2023 20:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A2310E510
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689799133; x=1721335133;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nYhEumh+BOPNV4pdCZmUII4nm7HLFNrdnhATOnxCVzM=;
 b=GyUwWyrVtAxGmFfiLAPBWZB2UHVItqzzqHVVMj0M7Ns9oF85F0witiby
 s9WsO8vDv2Z9MIvMLvqZ/K9jVSKfZR2fN0mS5atN/scQeKeE6L/qTVDD+
 Ln6fE5GCZxJNDkmqx3T06dtgSX0+oM+WraOebrv9f2++1HeYK2qXwfT+H
 QPmnnpq1qFMPDgN0UWz29cQBHZrIveuyzZS9wlE4AgIbf+5hNkQ52vCB8
 8TqWGr55hwmaES7OvQTlPYKvTvDF8Dmd9l0n+t09RzTSu/P3eTN81VINY
 YgBgmkGmTQH/uqP46owq+4AE7y54PY1AMmULPqM2CCfrXyOvRVR+t1Q8n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346869120"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="346869120"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 13:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="898038161"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="898038161"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 19 Jul 2023 13:38:50 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qMDw3-0005SX-29;
 Wed, 19 Jul 2023 20:38:19 +0000
Date: Thu, 20 Jul 2023 04:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
Message-ID: <202307200456.jGqv0OSC-lkp@intel.com>
References: <20230719095343.88359-2-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230719095343.88359-2-otto.pflueger@abscue.de>
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
Cc: llvm@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Otto,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc2 next-20230719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Otto-Pfl-ger/drm-mipi-dbi-Lock-SPI-bus-before-setting-D-C-GPIO/20230719-180941
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230719095343.88359-2-otto.pflueger%40abscue.de
patch subject: [PATCH 1/2] drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200456.jGqv0OSC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200456.jGqv0OSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200456.jGqv0OSC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ili9225.c:321:54: error: too few arguments to function call, expected 6, have 5
     321 |         ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, 1);
         |               ~~~~~~~~~~~~~~~~~~~~~                         ^
   include/drm/drm_mipi_dbi.h:187:5: note: 'mipi_dbi_spi_transfer' declared here
     187 | int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
         |     ^
   drivers/gpu/drm/tiny/ili9225.c:331:59: error: too few arguments to function call, expected 6, have 5
     331 |         return mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
         |                ~~~~~~~~~~~~~~~~~~~~~                             ^
   include/drm/drm_mipi_dbi.h:187:5: note: 'mipi_dbi_spi_transfer' declared here
     187 | int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
         |     ^
   2 errors generated.


vim +321 drivers/gpu/drm/tiny/ili9225.c

b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  310  
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  311  static int ili9225_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *par,
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  312  			       size_t num)
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  313  {
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  314  	struct spi_device *spi = dbi->spi;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  315  	unsigned int bpw = 8;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  316  	u32 speed_hz;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  317  	int ret;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  318  
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  319  	gpiod_set_value_cansleep(dbi->dc, 0);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  320  	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 1);
d23d4d4dac0119 drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-19 @321  	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, cmd, 1);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  322  	if (ret || !num)
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  323  		return ret;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  324  
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  325  	if (*cmd == ILI9225_WRITE_DATA_TO_GRAM && !dbi->swap_bytes)
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  326  		bpw = 16;
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  327  
36b5057216236a drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-22  328  	gpiod_set_value_cansleep(dbi->dc, 1);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  329  	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  330  
d23d4d4dac0119 drivers/gpu/drm/tinydrm/ili9225.c Noralf Trønnes 2019-07-19  331  	return mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  332  }
b57e8b7661e046 drivers/gpu/drm/tinydrm/ili9225.c David Lechner  2017-11-19  333  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
