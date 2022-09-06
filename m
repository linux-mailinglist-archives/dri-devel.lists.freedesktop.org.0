Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4D5AEEAF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930DF10E05A;
	Tue,  6 Sep 2022 15:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AEB10E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662477997; x=1694013997;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rCGvO6ccyPPJxWuEZsuICJQLGQb8YbWmDASVlzIokmk=;
 b=SKgwaajT0aTyZGKBFok2maFGKXtynYZEVqHJPrIxlfkjQFLXnDJ90NYR
 /am2Yk0CoyihgVVj5xZpg0CAQbSt32s9e/LI23skKWZ4yhoFYr0ycWXSK
 dAe4g6l6aGMpJgtpZCARMtE6FbZTc1OqlqPHk+tH/8PJ7VMQSQPmw33NC
 ZoswERP5Do8h9sTMiBUn8yvAsXPI3Z5L7cHcEsbVHKRaI6Acy5q5xj9Zz
 pquG3ry46bJOksLNhRCsMJY2Z++8A+Pasp+CIlKt8boUyNvkL5avtqqJk
 rL9Wgtr6LmdPMCWrmSmrpnetzfRSlEJKMn/wcZ8S2uKJ0/oTcFCxEK7V1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="382918430"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="382918430"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 08:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="682433423"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2022 08:26:33 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oVaT5-0005Fd-2M;
 Tue, 06 Sep 2022 15:26:27 +0000
Date: Tue, 6 Sep 2022 23:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/8] memory: tegra: Add API for retrieving carveout bounds
Message-ID: <202209062313.buowJWo0-lkp@intel.com>
References: <20220906132823.2390953-2-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906132823.2390953-2-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-tegra@vger.kernel.org, Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mikko,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next krzk-mem-ctrl/for-next pza/reset/next linus/master v6.0-rc4 next-20220906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikko-Perttunen/Support-for-NVDEC-on-Tegra234/20220906-215151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220906/202209062313.buowJWo0-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7e2bd1173420c8e09ec90e3322e059a7350482e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mikko-Perttunen/Support-for-NVDEC-on-Tegra234/20220906-215151
        git checkout 7e2bd1173420c8e09ec90e3322e059a7350482e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/memory/tegra/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/memory/tegra/mc.c: In function 'tegra_mc_get_carveout_info':
>> drivers/memory/tegra/mc.c:124:83: warning: left shift count >= width of type [-Wshift-count-overflow]
     124 |         *base |= (phys_addr_t)mc_ch_readl(mc, MC_BROADCAST_CHANNEL, offset + 0x4) << 32;
         |                                                                                   ^~


vim +124 drivers/memory/tegra/mc.c

   109	
   110	int tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
   111	                               phys_addr_t *base, u64 *size)
   112	{
   113		u32 offset;
   114	
   115		if (id < 1 || id >= mc->soc->num_carveouts)
   116			return -EINVAL;
   117	
   118		if (id < 6)
   119			offset = 0xc0c + 0x50 * (id - 1);
   120		else
   121			offset = 0x2004 + 0x50 * (id - 6);
   122	
   123		*base = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, offset + 0x0);
 > 124		*base |= (phys_addr_t)mc_ch_readl(mc, MC_BROADCAST_CHANNEL, offset + 0x4) << 32;
   125	
   126		if (size)
   127			*size = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, offset + 0x8) << 17;
   128	
   129		return 0;
   130	}
   131	EXPORT_SYMBOL_GPL(tegra_mc_get_carveout_info);
   132	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
