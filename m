Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F340786D84
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335D510E524;
	Thu, 24 Aug 2023 11:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9327410E524;
 Thu, 24 Aug 2023 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692875701; x=1724411701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CtK1R/zQ6fsYubBUoIg4emRPJbgoJXj1/hZIVxAHWHw=;
 b=YV2t4b9GBw7eyuX+blxqXajmwmtTo5M2Rl7RAckpOS0/sJbgtylhmxBT
 a5Euql5mGEiTs5rfQVOTfcPaQiCwC+3dSTwHo7fog4ClDmSTaO4Sn0p1L
 BZr/7pJ6qfX8xUgjwAotyb/wewVf/Lt8je4mbOEIanLypEGs7Kfl+VoO6
 94BiTfdP7zJeOMGKL0JucRAPP/pdw1SPIZSvOt+/ftcROnOOGV2/PwTge
 66SLppA3u9kYnopxjJBnn/yhKyjU9etfBQnhHCCmrTjNUn1oDaCY1FqXB
 fxQULUG2UU+PhfeGZvapI6BuaIWytLk0AX2a+/foe4v97i6EVKJcgqb8D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378164704"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="378164704"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 04:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766502137"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="766502137"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 24 Aug 2023 04:14:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qZ8IX-0001ye-2N;
 Thu, 24 Aug 2023 11:14:48 +0000
Date: Thu, 24 Aug 2023 19:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: Re: [PATCH v2 5/6] drm/panfrost: Implement generic DRM object RSS
 reporting function
Message-ID: <202308241850.UjqyDaGz-lkp@intel.com>
References: <20230824013604.466224-6-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230824013604.466224-6-adrian.larumbe@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrián,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.5-rc7 next-20230824]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panfrost-Add-cycle-count-GPU-register-definitions/20230824-093848
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230824013604.466224-6-adrian.larumbe%40collabora.com
patch subject: [PATCH v2 5/6] drm/panfrost: Implement generic DRM object RSS reporting function
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308241850.UjqyDaGz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241850.UjqyDaGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241850.UjqyDaGz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panfrost/panfrost_gem.c:210:8: warning: no previous prototype for 'panfrost_gem_rss' [-Wmissing-prototypes]
     210 | size_t panfrost_gem_rss(struct drm_gem_object *obj)
         |        ^~~~~~~~~~~~~~~~


vim +/panfrost_gem_rss +210 drivers/gpu/drm/panfrost/panfrost_gem.c

   209	
 > 210	size_t panfrost_gem_rss(struct drm_gem_object *obj)
   211	{
   212		struct panfrost_gem_object *bo = to_panfrost_bo(obj);
   213	
   214		if (!bo->base.pages)
   215			return 0;
   216	
   217		return bo->rss_size;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
