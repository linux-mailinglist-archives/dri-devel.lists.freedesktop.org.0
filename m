Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C456BBEA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6214410E28C;
	Fri,  8 Jul 2022 14:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7973810E305
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657291737; x=1688827737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H332VslLDdX9SyJVYOVrR3iF5cKaLj6SovHTPUBxKqc=;
 b=MRDgF903uE4ZpscuAZ2UdGdQKDUAuWBFz8HDCLzohedMFc7HNbOz58Ko
 raEtAlF4MisewtF5k5+r7nkCtmvxP4p58kjR58vr3ukn2Php9TQd/lMxT
 qGrgNsE2RjlKC3nyjFrDSJDV/53pkhmEGa1yK+8Q5mtlzKJv39/mB3R8R
 eAbp9edYjxXOJHP1RXHiMpqNR/LgKQxDppcSdmbl9y5XGW0VBkemUangC
 +iKfFgfZLXoNW4L4FIpDV06s+HO7J+YUl9JCPIvyszaZc7nMyNW03FBkO
 PX4xoeTWrWyxPEUi/BsN99LHfC3cmspH8ZA5zgGZWnMPnPgEVw6Ld2Mvn Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285037001"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="285037001"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="840325285"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 08 Jul 2022 07:48:54 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9pHq-000Nbi-1i;
 Fri, 08 Jul 2022 14:48:54 +0000
Date: Fri, 8 Jul 2022 22:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 03/69] drm/encoder: Introduce drmm_encoder_init
Message-ID: <202207082243.30UtKZMS-lkp@intel.com>
References: <20220708095707.257937-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708095707.257937-4-maxime@cerno.tech>
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v5.19-rc5 next-20220708]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-vc4-Fix-hotplug-for-vc4/20220708-181702
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220708/202207082243.30UtKZMS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/02fc9586cd9ab6a11b41230834118acd02445e31
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-Fix-hotplug-for-vc4/20220708-181702
        git checkout 02fc9586cd9ab6a11b41230834118acd02445e31
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_encoder.c: In function '__drmm_encoder_init':
>> drivers/gpu/drm/drm_encoder.c:228:9: warning: function '__drmm_encoder_init' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     228 |         ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, args);
         |         ^~~


vim +228 drivers/gpu/drm/drm_encoder.c

   215	
   216	static int __drmm_encoder_init(struct drm_device *dev,
   217				       struct drm_encoder *encoder,
   218				       const struct drm_encoder_funcs *funcs,
   219				       int encoder_type,
   220				       const char *name,
   221				       va_list args)
   222	{
   223		int ret;
   224	
   225		if (drm_WARN_ON(dev, funcs && funcs->destroy))
   226			return -EINVAL;
   227	
 > 228		ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, args);
   229		if (ret)
   230			return ret;
   231	
   232		ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
   233		if (ret)
   234			return ret;
   235	
   236		return 0;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
