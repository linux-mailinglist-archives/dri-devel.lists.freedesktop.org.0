Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA094E7E22
	for <lists+dri-devel@lfdr.de>; Sat, 26 Mar 2022 01:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4B510E72D;
	Sat, 26 Mar 2022 00:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591BA10E70D;
 Sat, 26 Mar 2022 00:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648254461; x=1679790461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T9WKzF5uUODZK1coRF8zoA8Nl6WzVRin2ZfvLu8VrnM=;
 b=a8xHM0/5L3+HIZs70mrCDlRoYHXJwmWsi3D+potOeFfcYynveH/M1b3+
 FkZcuDeyatNMZ5AdTeMhKbXQeme1UyIvpFRnEi9UaRfpfuuP2A1HQrPSu
 /RJiRnkCWn8GfHHX+9e4LOQax6N/QyHzrOlTHsmI5xWXHElZc7oclCdxO
 2QOJvydZxU/F50ie1wfPARqSwMV/xqpEk9LOzmRTlrCSwXwPppOiXqJci
 +73M6tzZhV4UZHrqqCqXhSPTup8FCwYritfUzRr05enAswSEfgfrdOqzo
 /8jf9q9FJnqNl0YRaTK9YNnbP5vUpjECDElMr3EGKoT478rjMWgrnRCN1 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="257571491"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="257571491"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 17:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="584632109"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 25 Mar 2022 17:27:38 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nXuHJ-000Mn3-E7; Sat, 26 Mar 2022 00:27:37 +0000
Date: Sat, 26 Mar 2022 08:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Message-ID: <202203260844.V9HDSROY-lkp@intel.com>
References: <20220325175251.167164-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325175251.167164-1-zhi.a.wang@intel.com>
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>, kbuild-all@lists.01.org,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm/drm-next next-20220325]
[cannot apply to tegra-drm/drm/tegra/for-next airlied/drm-next v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhi-Wang/i915-gvt-Separate-the-MMIO-tracking-table-from-GVT-g/20220326-015627
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220326/202203260844.V9HDSROY-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/8203f91121efdcc910bde0bc4fe5ea678bdaaa5b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zhi-Wang/i915-gvt-Separate-the-MMIO-tracking-table-from-GVT-g/20220326-015627
        git checkout 8203f91121efdcc910bde0bc4fe5ea678bdaaa5b
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gvt/handlers.c:74:6: warning: no previous prototype for 'intel_gvt_match_device' [-Wmissing-prototypes]
      74 | bool intel_gvt_match_device(struct intel_gvt *gvt,
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/intel_gvt_match_device +74 drivers/gpu/drm/i915/gvt/handlers.c

12d14cc43b34706 Zhi Wang 2016-08-30  73  
12d14cc43b34706 Zhi Wang 2016-08-30 @74  bool intel_gvt_match_device(struct intel_gvt *gvt,
12d14cc43b34706 Zhi Wang 2016-08-30  75  		unsigned long device)
12d14cc43b34706 Zhi Wang 2016-08-30  76  {
12d14cc43b34706 Zhi Wang 2016-08-30  77  	return intel_gvt_get_device_type(gvt) & device;
12d14cc43b34706 Zhi Wang 2016-08-30  78  }
12d14cc43b34706 Zhi Wang 2016-08-30  79  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
