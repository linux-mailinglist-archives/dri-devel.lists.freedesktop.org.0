Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D590825DFE
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 03:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D5110E088;
	Sat,  6 Jan 2024 02:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90B610E088
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 02:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704509716; x=1736045716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yUmZnDJRZn5RASncUMPR1NFagiYl3Oo7miAodR6tHP4=;
 b=CQ1GQim2jfMp6ZPxjyvtdTy2Dg4E9ucmX0ZHQTUqSrN1oVVujP8V2bt0
 8c9YTLHDQZadptnZLF1r+xMKEcfU05aaAsc5jLsKnG3bxuz6u9DBSdH+f
 AA6DW5oczij7LsxQY2Z8nJA8O1w7brgzGivl9bCGO1YYf/pyY8yDThpV1
 bCAJQlKt7pPaRuc27Sgx5PkbVAn2wMX19WiaNH9MxF461USSCk822RjyH
 AmQoqX30rHKEHF809KwMfPNZgfTpbhjCkteza0CU+bbQ94VGu3xRqB1m+
 Nt5NojQXPCnlKeV9KSNXBAT+rzwJiqX87QHbOWWIAqGXJsgl0GGHtZpwV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="382598291"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; d="scan'208";a="382598291"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 18:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="815117020"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; d="scan'208";a="815117020"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 05 Jan 2024 18:55:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rLwpz-0001xE-1W;
 Sat, 06 Jan 2024 02:55:03 +0000
Date: Sat, 6 Jan 2024 10:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Subject: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
Message-ID: <202401061003.lNwFS0D6-lkp@intel.com>
References: <20240104160301.185915-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104160301.185915-6-jfalempe@redhat.com>
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build errors:

[auto build test ERROR on 50a3c772bd927dd409c484832ddd9f6bf00b7389]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20240105-001038
base:   50a3c772bd927dd409c484832ddd9f6bf00b7389
patch link:    https://lore.kernel.org/r/20240104160301.185915-6-jfalempe%40redhat.com
patch subject: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
config: mips-gcw0_defconfig (https://download.01.org/0day-ci/archive/20240106/202401061003.lNwFS0D6-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401061003.lNwFS0D6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401061003.lNwFS0D6-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: drivers/gpu/drm/drm_fb_dma_helper.o: in function `drm_panic_is_format_supported':
>> drm_fb_dma_helper.c:(.text+0x2c8): multiple definition of `drm_panic_is_format_supported'; drivers/gpu/drm/drm_drv.o:drm_drv.c:(.text+0x1104): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
