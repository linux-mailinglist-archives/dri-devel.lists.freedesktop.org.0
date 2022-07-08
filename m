Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C6056BB38
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B3A10E8CC;
	Fri,  8 Jul 2022 13:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68D310E7EF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657288554; x=1688824554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y/1W3wKsF7eg34E9XYkPLrY2GKPu/prwdGKF2uv19B8=;
 b=D0nuuPxB4EW0Sph8QTtuVzLRUfgUwo6V1lyKw/gu+A06b7BOLx4OmYIU
 0LolIVSQP3lcAdo81cpIvkvtBIX5/2xMmbvcntR0BCFzAEzdpL+bpNxPc
 Cy5jgy7XZNVuaRqLDhCHxsCXgYbyOnPv6VDFGN4ay/7UUyDiPh0q7ZaOx
 DuBUGVHYjhbQ19/VY9+V8Nx9vkHFCCVm2dhVhAFExYjo4jaY1zsjM5cE9
 M+pUFvxKbAQnmQrnafg8PdSzGEIjGTpSWUdt+iI8wGUqeIcEEb3OIcyx8
 shaCfKv68ocnTDgtiWLnTgqrX9ix4Swg7BgxW1rmPWIolrJrlafuqCS6B g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="345972370"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="345972370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:55:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="626709302"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 08 Jul 2022 06:55:52 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9oSV-000NYK-FJ;
 Fri, 08 Jul 2022 13:55:51 +0000
Date: Fri, 8 Jul 2022 21:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 02/69] drm/crtc: Introduce drmm_crtc_init_with_planes
Message-ID: <202207082132.6HbjEQPE-lkp@intel.com>
References: <20220708095707.257937-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708095707.257937-3-maxime@cerno.tech>
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
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220708/202207082132.6HbjEQPE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3ea20c4eef9608edbd62aa2de918e195c38b0704
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-Fix-hotplug-for-vc4/20220708-181702
        git checkout 3ea20c4eef9608edbd62aa2de918e195c38b0704
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_crtc.c: In function '__drmm_crtc_init_with_planes':
>> drivers/gpu/drm/drm_crtc.c:395:43: warning: function '__drmm_crtc_init_with_planes' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     395 |                                           name, args);
         |                                           ^~~~


vim +395 drivers/gpu/drm/drm_crtc.c

   381	
   382	static int __drmm_crtc_init_with_planes(struct drm_device *dev,
   383						struct drm_crtc *crtc,
   384						struct drm_plane *primary,
   385						struct drm_plane *cursor,
   386						const struct drm_crtc_funcs *funcs,
   387						const char *name,
   388						va_list args)
   389	{
   390		int ret;
   391	
   392		drm_WARN_ON(dev, funcs && funcs->destroy);
   393	
   394		ret = __drm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
 > 395						  name, args);
   396		if (ret)
   397			return ret;
   398	
   399		ret = drmm_add_action_or_reset(dev, drmm_crtc_init_with_planes_cleanup,
   400					       crtc);
   401		if (ret)
   402			return ret;
   403	
   404		return 0;
   405	}
   406	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
