Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC79AFEB8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 11:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C277010EA52;
	Fri, 25 Oct 2024 09:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXvFZZ1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7662510EA52
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729849561; x=1761385561;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZARvpj+4y2gmcRwYkJIUqXAw6D/BozzudJM0om84MZw=;
 b=SXvFZZ1sroJ6Jrx3eNYhf96jwj2GSDiJiAZJSQNpY+fyIvH3A379nHx4
 IXdNQs7AHT3KmVc2mD0MkBzF4W5Pnhqzk2oKcZT1MpiW9ebb6q5ATRvqe
 FZXZoMEmUxU1dO9Twx4wGPcZOe3k7AekMwnsOJRfFc3qI/LeK+B+lyL8/
 5K7tzCIxBjKobvJ3zah4LOCsN0Aqc3WQ55u7EmN/A4JxfH+ySzIAWdFfB
 IKEeSnS1U9bjUus4ct2DbyRGIvmw+q1XzzHJZVSnZp9yMzzDV+vBloPLE
 o+LaOOao4kJ8fNNyuVCWdVQvGT6eVBiXvChcco328e+w5VZ7mZhTyXqOZ g==;
X-CSE-ConnectionGUID: K1DvGM6nSfC+ubzTBkAGfA==
X-CSE-MsgGUID: qtVKGmxdTWS3A80nU5zfOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40129331"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="40129331"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:46:00 -0700
X-CSE-ConnectionGUID: 5UHDvqAZSEqUUNxuUDqGnQ==
X-CSE-MsgGUID: kC3HEjRVT0SmaAYZ8zBJ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="81188264"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2024 02:45:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t4GtE-000Y0T-1q;
 Fri, 25 Oct 2024 09:45:52 +0000
Date: Fri, 25 Oct 2024 17:45:43 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 21/37] drm/vc4: txp: Add support for BCM2712 MOP
Message-ID: <202410251725.ZQplKjRl-lkp@intel.com>
References: <20241023-drm-vc4-2712-support-v1-21-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-21-1cc2d5594907@raspberrypi.com>
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
patch link:    https://lore.kernel.org/r/20241023-drm-vc4-2712-support-v1-21-1cc2d5594907%40raspberrypi.com
patch subject: [PATCH 21/37] drm/vc4: txp: Add support for BCM2712 MOP
config: arc-randconfig-r111-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251725.ZQplKjRl-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241025/202410251725.ZQplKjRl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251725.ZQplKjRl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vc4/vc4_txp.c:513:27: sparse: sparse: symbol 'bcm2712_mop_data' was not declared. Should it be static?

vim +/bcm2712_mop_data +513 drivers/gpu/drm/vc4/vc4_txp.c

   512	
 > 513	const struct vc4_txp_data bcm2712_mop_data = {
   514		.base = {
   515			.name = "mop",
   516			.debugfs_name = "mop_regs",
   517			.hvs_available_channels = BIT(2),
   518			.hvs_output = 2,
   519		},
   520		.encoder_type = VC4_ENCODER_TYPE_TXP0,
   521		.high_addr_ptr_reg = TXP_DST_PTR_HIGH_MOP,
   522		.has_byte_enable = true,
   523		.size_minus_one = true,
   524		.supports_40bit_addresses = true,
   525	};
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
