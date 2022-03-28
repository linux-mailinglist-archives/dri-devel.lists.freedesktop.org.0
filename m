Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375004E96F2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E3310E655;
	Mon, 28 Mar 2022 12:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0C510E654;
 Mon, 28 Mar 2022 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648471631; x=1680007631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=++Uu2UoUanLXrVeXYv7D03BB0sBt8ihUCITUBBdCHTg=;
 b=WtdG/fA5c0LnCZvx3El1YbvoZhuzBfBVdLlRi7+HVj0thnJS0V8qX2Su
 uoaJz2gmzF69Ky0w3GLRF54klyKU9xK99AuBdyJKCJYQdUYY5kdUivXbo
 HmItuqJ0O5Sk3kmU9qDUwttk81Ub2nxskdaMgL2YYbbj5f88YdzD/oSiN
 rpumVqd4iQIapVOXJms9I7idMozSL+NRS4cY5hiSo/Eak/OkNHk2vid9T
 QfbUzLi33ag6wybxCATnoBaxE7ijt3HHHC4xG5Ur48zdR7YonPveUfvL5
 Pes86bnWSO83b/jNuJxvToEHz6ZgVUpKDHA3yRRXSKPFuNlS8eOgvRu2c A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="241142513"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="241142513"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 05:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="651990000"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2022 05:47:08 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nYom4-00022L-0h; Mon, 28 Mar 2022 12:47:08 +0000
Date: Mon, 28 Mar 2022 20:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 03/11] drm/edid: slightly restructure
 timing and non-timing descriptor structs
Message-ID: <202203282023.nkTeTLA5-lkp@intel.com>
References: <04c8140a780dc02155a16d8acc64dbce756739bb.1648458971.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04c8140a780dc02155a16d8acc64dbce756739bb.1648458971.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip v5.17 next-20220328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-constify-EDID-parsing-with-some-fixes/20220328-171858
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: mips-randconfig-r005-20220327 (https://download.01.org/0day-ci/archive/20220328/202203282023.nkTeTLA5-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f538c9296c54ce8f878432153584a68939ffc111
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-edid-constify-EDID-parsing-with-some-fixes/20220328-171858
        git checkout f538c9296c54ce8f878432153584a68939ffc111
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/tiny/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/gm12u320.c:478:18: error: 'struct detailed_timing' has no member named 'pixel_clock'
     478 |                 .pixel_clock = 3383,
         |                  ^~~~~~~~~~~
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
   drivers/gpu/drm/tiny/gm12u320.c:495:18: error: 'struct detailed_timing' has no member named 'pixel_clock'
     495 |                 .pixel_clock = 0,
         |                  ^~~~~~~~~~~
>> drivers/gpu/drm/tiny/gm12u320.c:496:23: error: 'union <anonymous>' has no member named 'other_data'
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:496:41: warning: initialized field overwritten [-Woverride-init]
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         ^~~~
   drivers/gpu/drm/tiny/gm12u320.c:496:41: note: (near initialization for 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:497:23: error: 'union <anonymous>' has no member named 'other_data'
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:497:57: warning: initialized field overwritten [-Woverride-init]
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         ^~
   drivers/gpu/drm/tiny/gm12u320.c:497:57: note: (near initialization for 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:498:23: error: 'union <anonymous>' has no member named 'other_data'
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:498:57: warning: initialized field overwritten [-Woverride-init]
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         ^~
   drivers/gpu/drm/tiny/gm12u320.c:498:57: note: (near initialization for 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:499:23: error: 'union <anonymous>' has no member named 'other_data'
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:499:61: warning: initialized field overwritten [-Woverride-init]
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             ^~
   drivers/gpu/drm/tiny/gm12u320.c:499:61: note: (near initialization for 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:500:23: error: 'union <anonymous>' has no member named 'other_data'
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:500:61: warning: initialized field overwritten [-Woverride-init]
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             ^~
   drivers/gpu/drm/tiny/gm12u320.c:500:61: note: (near initialization for 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:501:23: error: 'union <anonymous>' has no member named 'other_data'
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:501:63: warning: initialized field overwritten [-Woverride-init]
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               ^
   drivers/gpu/drm/tiny/gm12u320.c:501:63: note: (near initialization for 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:502:23: error: 'union <anonymous>' has no member named 'other_data'
     502 |                 .data.other_data.data.range.flags = 0,
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:502:53: warning: initialized field overwritten [-Woverride-init]
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     ^
   drivers/gpu/drm/tiny/gm12u320.c:502:53: note: (near initialization for 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:503:23: error: 'union <anonymous>' has no member named 'other_data'
     503 |                 .data.other_data.data.range.formula.cvt = {
         |                       ^~~~~~~~~~
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
     495 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         {   }}
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         { }}
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         { }}
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             { }}
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             { }}
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               {}}
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     {}}
   drivers/gpu/drm/tiny/gm12u320.c:503:59: warning: initialized field overwritten [-Woverride-init]
     503 |                 .data.other_data.data.range.formula.cvt = {
         |                                                           ^
   drivers/gpu/drm/tiny/gm12u320.c:503:59: note: (near initialization for 'gm12u320_edid.detailed_timings[1].data.pixel_data')
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
     495 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         {   }}
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         { }}
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         { }}
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             { }}
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             { }}
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               {}}
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     {}}
   ......
     505 |         }, {
         |         }
   drivers/gpu/drm/tiny/gm12u320.c:506:18: error: 'struct detailed_timing' has no member named 'pixel_clock'
     506 |                 .pixel_clock = 0,
         |                  ^~~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:507:23: error: 'union <anonymous>' has no member named 'other_data'
     507 |                 .data.other_data.type = 0xfc, /* Model string */
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:507:41: warning: initialized field overwritten [-Woverride-init]
     507 |                 .data.other_data.type = 0xfc, /* Model string */
         |                                         ^~~~
   drivers/gpu/drm/tiny/gm12u320.c:507:41: note: (near initialization for 'gm12u320_edid.detailed_timings[2].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:508:23: error: 'union <anonymous>' has no member named 'other_data'
     508 |                 .data.other_data.data.str.str = {
         |                       ^~~~~~~~~~
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
     495 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         {   }}
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         { }}
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         { }}
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             { }}
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             { }}
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               {}}
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     {}}
   ......
     505 |         }, {
         |         }
     506 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     507 |                 .data.other_data.type = 0xfc, /* Model string */
         |                                         {   }}
   drivers/gpu/drm/tiny/gm12u320.c:508:49: warning: initialized field overwritten [-Woverride-init]
     508 |                 .data.other_data.data.str.str = {
         |                                                 ^
   drivers/gpu/drm/tiny/gm12u320.c:508:49: note: (near initialization for 'gm12u320_edid.detailed_timings[2].data.pixel_data')
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
     495 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         {   }}
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         { }}
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         { }}
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             { }}
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             { }}
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               {}}
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     {}}
   ......
     505 |         }, {
         |         }
     506 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     507 |                 .data.other_data.type = 0xfc, /* Model string */
         |                                         {   }}
   ......
     511 |         }, {
         |         }
   drivers/gpu/drm/tiny/gm12u320.c:512:18: error: 'struct detailed_timing' has no member named 'pixel_clock'
     512 |                 .pixel_clock = 0,
         |                  ^~~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:513:23: error: 'union <anonymous>' has no member named 'other_data'
     513 |                 .data.other_data.type = 0xfe, /* Unspecified text / padding */
         |                       ^~~~~~~~~~
   drivers/gpu/drm/tiny/gm12u320.c:513:41: warning: initialized field overwritten [-Woverride-init]
     513 |                 .data.other_data.type = 0xfe, /* Unspecified text / padding */
         |                                         ^~~~
   drivers/gpu/drm/tiny/gm12u320.c:513:41: note: (near initialization for 'gm12u320_edid.detailed_timings[3].data.pixel_data.pixel_clock')
   drivers/gpu/drm/tiny/gm12u320.c:514:23: error: 'union <anonymous>' has no member named 'other_data'
     514 |                 .data.other_data.data.str.str = {
         |                       ^~~~~~~~~~
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
     495 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         {   }}
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         { }}
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         { }}
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             { }}
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             { }}
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               {}}
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     {}}
   ......
     505 |         }, {
         |         }
     506 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     507 |                 .data.other_data.type = 0xfc, /* Model string */
         |                                         {   }}
   ......
     511 |         }, {
         |         }
     512 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     513 |                 .data.other_data.type = 0xfe, /* Unspecified text / padding */
         |                                         {   }}
   drivers/gpu/drm/tiny/gm12u320.c:514:49: warning: initialized field overwritten [-Woverride-init]
     514 |                 .data.other_data.data.str.str = {
         |                                                 ^
   drivers/gpu/drm/tiny/gm12u320.c:514:49: note: (near initialization for 'gm12u320_edid.detailed_timings[3].data.pixel_data')
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
     495 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         {   }}
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         { }}
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         { }}
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             { }}
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             { }}
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               {}}
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     {}}
   ......
     505 |         }, {
         |         }
     506 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     507 |                 .data.other_data.type = 0xfc, /* Model string */
         |                                         {   }}
   ......
     511 |         }, {
         |         }
     512 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     513 |                 .data.other_data.type = 0xfe, /* Unspecified text / padding */
         |                                         {   }}
   ......
     517 |         } },
         |         }
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
     495 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         {   }}
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         { }}
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         { }}
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             { }}
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             { }}
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               {}}
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     {}}
   ......
     505 |         }, {
         |         }
     506 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     507 |                 .data.other_data.type = 0xfc, /* Model string */
         |                                         {   }}
   ......
     511 |         }, {
         |         }
     512 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     513 |                 .data.other_data.type = 0xfe, /* Unspecified text / padding */
         |                                         {   }}
   ......
     517 |         } },
         |         }
>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around initializer [-Wmissing-braces]
     464 | static struct edid gm12u320_edid = {
         |                                    ^
   ......
     478 |                 .pixel_clock = 3383,
         |                                {{  }}
     479 |                 /* hactive = 848, hblank = 256 */
     480 |                 .data.pixel_data.hactive_lo = 0x50,
         |                                                   }}
     481 |                 .data.pixel_data.hblank_lo = 0x00,
         |                                                  }}
     482 |                 .data.pixel_data.hactive_hblank_hi = 0x31,
         |                                                          }}
     483 |                 /* vactive = 480, vblank = 28 */
     484 |                 .data.pixel_data.vactive_lo = 0xe0,
         |                                                   }}
     485 |                 .data.pixel_data.vblank_lo = 0x1c,
         |                                                  }}
     486 |                 .data.pixel_data.vactive_vblank_hi = 0x10,
         |                                                          }}
     487 |                 /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
     488 |                 .data.pixel_data.hsync_offset_lo = 0x28,
         |                                                        }}
     489 |                 .data.pixel_data.hsync_pulse_width_lo = 0x80,
         |                                                             }}
     490 |                 .data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
         |                                                                    }}
     491 |                 .data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
         |                                                                          }}
   ......
     494 |         }, {
         |         }}
     495 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     496 |                 .data.other_data.type = 0xfd, /* Monitor ranges */
         |                                         {   }}
     497 |                 .data.other_data.data.range.min_vfreq = 59,
         |                                                         { }}
     498 |                 .data.other_data.data.range.max_vfreq = 61,
         |                                                         { }}
     499 |                 .data.other_data.data.range.min_hfreq_khz = 29,
         |                                                             { }}
     500 |                 .data.other_data.data.range.max_hfreq_khz = 32,
         |                                                             { }}
     501 |                 .data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
         |                                                               {}}
     502 |                 .data.other_data.data.range.flags = 0,
         |                                                     {}}
   ......
     505 |         }, {
         |         }
     506 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     507 |                 .data.other_data.type = 0xfc, /* Model string */
         |                                         {   }}
   ......
     511 |         }, {
         |         }
     512 |                 .pixel_clock = 0,
         |                                -
         |                                {{0}}
     513 |                 .data.other_data.type = 0xfe, /* Unspecified text / padding */
         |                                         {   }}
   ......
     517 |         } },
         |         }


vim +478 drivers/gpu/drm/tiny/gm12u320.c

e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  457  
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  458  /*
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  459   * We use fake EDID info so that userspace know that it is dealing with
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  460   * an Acer projector, rather then listing this as an "unknown" monitor.
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  461   * Note this assumes this driver is only ever used with the Acer C120, if we
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  462   * add support for other devices the vendor and model should be parameterized.
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  463   */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21 @464  static struct edid gm12u320_edid = {
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  465  	.header		= { 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00 },
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  466  	.mfg_id		= { 0x04, 0x72 },	/* "ACR" */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  467  	.prod_code	= { 0x20, 0xc1 },	/* C120h */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  468  	.serial		= 0xaa55aa55,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  469  	.mfg_week	= 1,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  470  	.mfg_year	= 16,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  471  	.version	= 1,			/* EDID 1.3 */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  472  	.revision	= 3,			/* EDID 1.3 */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  473  	.input		= 0x08,			/* Analog input */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  474  	.features	= 0x0a,			/* Pref timing in DTD 1 */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  475  	.standard_timings = { { 1, 1 }, { 1, 1 }, { 1, 1 }, { 1, 1 },
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  476  			      { 1, 1 }, { 1, 1 }, { 1, 1 }, { 1, 1 } },
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  477  	.detailed_timings = { {
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21 @478  		.pixel_clock = 3383,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  479  		/* hactive = 848, hblank = 256 */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  480  		.data.pixel_data.hactive_lo = 0x50,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  481  		.data.pixel_data.hblank_lo = 0x00,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  482  		.data.pixel_data.hactive_hblank_hi = 0x31,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  483  		/* vactive = 480, vblank = 28 */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  484  		.data.pixel_data.vactive_lo = 0xe0,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  485  		.data.pixel_data.vblank_lo = 0x1c,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  486  		.data.pixel_data.vactive_vblank_hi = 0x10,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  487  		/* hsync offset 40 pw 128, vsync offset 1 pw 4 */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  488  		.data.pixel_data.hsync_offset_lo = 0x28,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  489  		.data.pixel_data.hsync_pulse_width_lo = 0x80,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  490  		.data.pixel_data.vsync_offset_pulse_width_lo = 0x14,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  491  		.data.pixel_data.hsync_vsync_offset_pulse_width_hi = 0x00,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  492  		/* Digital separate syncs, hsync+, vsync+ */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  493  		.data.pixel_data.misc = 0x1e,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  494  	}, {
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  495  		.pixel_clock = 0,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21 @496  		.data.other_data.type = 0xfd, /* Monitor ranges */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  497  		.data.other_data.data.range.min_vfreq = 59,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  498  		.data.other_data.data.range.max_vfreq = 61,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  499  		.data.other_data.data.range.min_hfreq_khz = 29,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  500  		.data.other_data.data.range.max_hfreq_khz = 32,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  501  		.data.other_data.data.range.pixel_clock_mhz = 4, /* 40 MHz */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  502  		.data.other_data.data.range.flags = 0,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  503  		.data.other_data.data.range.formula.cvt = {
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  504  			0xa0, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20 },
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  505  	}, {
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  506  		.pixel_clock = 0,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  507  		.data.other_data.type = 0xfc, /* Model string */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  508  		.data.other_data.data.str.str = {
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  509  			'P', 'r', 'o', 'j', 'e', 'c', 't', 'o', 'r', '\n',
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  510  			' ', ' ',  ' ' },
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  511  	}, {
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  512  		.pixel_clock = 0,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  513  		.data.other_data.type = 0xfe, /* Unspecified text / padding */
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  514  		.data.other_data.data.str.str = {
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  515  			'\n', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  516  			' ', ' ',  ' ' },
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  517  	} },
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  518  	.checksum = 0x13,
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  519  };
e4f86e43716443 drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07-21  520  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
