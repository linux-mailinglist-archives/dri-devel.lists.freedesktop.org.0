Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4255185F7
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 15:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B36910E6E5;
	Tue,  3 May 2022 13:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB79D10E6E5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651586027; x=1683122027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+7MRD21UXQTn46jpfe43DgegKNoYgyj1mIZvFSrHfuE=;
 b=hNwFQoJ3RHmLhZAwfcqqsQfm0JNgciFEapXdW9VOramWLNiexsASdEN2
 r9OznO1T+qp4XuqukAErHhrgy+DET1Rb5A0NSUFe34qkOzBbT/1i4zAKU
 5RZf2vax3luckTu5ftS7N3Ln/6KfT7KNuaV8oeowht/bvUTBd7fTCau3V
 t5Yu0Ac9lYWD+IA+Adqx9V9OUT4UK9APIIgZMMgryR852Q6bwfOLkGFEo
 zvwZKqiRtahCTRgksJzhtfQ/jO9onSzFyegEIfyIRJJF62usjbr/iMEoi
 mXZFBzN76Y6naqCOZeJX+c6vCXK0UVHdIHEBsaoD5LlSItaRKzmpHNu6O w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254943460"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="254943460"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 06:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; d="scan'208";a="810666014"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 03 May 2022 06:53:45 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nlsyG-000AW1-Cy;
 Tue, 03 May 2022 13:53:44 +0000
Date: Tue, 3 May 2022 21:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Message-ID: <202205032134.wMMUQ85T-lkp@intel.com>
References: <20220503121341.983842-14-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503121341.983842-14-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20220503]
[cannot apply to anholt/for-next v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-vc4-Properly-separate-v3d-on-BCM2711-and-fix-frame-ordering/20220503-201745
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220503/202205032134.wMMUQ85T-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0db44bd12236a0a64cf67bbef6b11df5bbe37134
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-Properly-separate-v3d-on-BCM2711-and-fix-frame-ordering/20220503-201745
        git checkout 0db44bd12236a0a64cf67bbef6b11df5bbe37134
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_crtc.c: In function 'vc4_async_set_fence_cb':
>> drivers/gpu/drm/vc4/vc4_crtc.c:865:57: warning: implicit conversion from 'enum <anonymous>' to 'enum dma_resv_usage' [-Wenum-conversion]
     865 |         ret = dma_resv_get_singleton(cma_bo->base.resv, false, &fence);
         |                                                         ^~~~~


vim +865 drivers/gpu/drm/vc4/vc4_crtc.c

   848	
   849	static int vc4_async_set_fence_cb(struct drm_device *dev,
   850					  struct vc4_async_flip_state *flip_state)
   851	{
   852		struct drm_framebuffer *fb = flip_state->fb;
   853		struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
   854		struct vc4_dev *vc4 = to_vc4_dev(dev);
   855		struct dma_fence *fence;
   856		int ret;
   857	
   858		if (!vc4->is_vc5) {
   859			struct vc4_bo *bo = to_vc4_bo(&cma_bo->base);
   860	
   861			return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
   862						  vc4_async_page_flip_seqno_complete);
   863		}
   864	
 > 865		ret = dma_resv_get_singleton(cma_bo->base.resv, false, &fence);
   866		if (ret)
   867			return ret;
   868	
   869		if (dma_fence_add_callback(fence, &flip_state->cb.fence,
   870					   vc4_async_page_flip_fence_complete))
   871			vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
   872	
   873		return 0;
   874	}
   875	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
