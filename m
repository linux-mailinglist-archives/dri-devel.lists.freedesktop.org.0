Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C1681B14
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 21:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7315D10E036;
	Mon, 30 Jan 2023 20:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24810E036
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 20:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675109138; x=1706645138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VKb8R11OxfLcejF5LTOBSiutJwK4R//zzesvOaGRsQs=;
 b=F3PwK1r43BCWGzbsN5njN96AsghrKEP40lcyRjsZGNS5SIWocFs/IrhB
 UkFeFOV+2NJ2RVs5zEm+/cIMapU+Fl+x7YTSku5lf8vAbzGRIcLIdTGGZ
 Kkfr4Cgj9w1IuKJIfHmsHc1Uf/PBzFRdsOb3gYWum5IHAj3NdGLS+FoYk
 hM1jepavKhUIH4PUgmlv0UHEACK1TYPLGA+lW8bcJwOKixZ9GB/j/RiXR
 BhBGmO8dW6FsOo0hIz/DHDiRxy8kkC1JTobLE8qm780woBjEgljRRB3+z
 +cCxwSc/wV4CdTwEGmEr7xh1kgMOgFZmf3xkCLaJBc0rtS57jhR4gy0oy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="315621830"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="315621830"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 12:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993012432"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="993012432"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 12:04:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pMaO2-0003sM-0g;
 Mon, 30 Jan 2023 20:04:18 +0000
Date: Tue, 31 Jan 2023 04:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 6/6] drm/debugfs: Make the struct drm_debugfs_entry
 independent of DRM device
Message-ID: <202301310330.jVo5mu9t-lkp@intel.com>
References: <20230130123008.287141-7-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130123008.287141-7-mcanal@igalia.com>
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
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maíra,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip next-20230130]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-debugfs-Introduce-wrapper-for-debugfs-list/20230130-203549
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230130123008.287141-7-mcanal%40igalia.com
patch subject: [PATCH v2 6/6] drm/debugfs: Make the struct drm_debugfs_entry independent of DRM device
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230131/202301310330.jVo5mu9t-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2b098c9687b25368fa4a9e128963a13723aace67
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ma-ra-Canal/drm-debugfs-Introduce-wrapper-for-debugfs-list/20230130-203549
        git checkout 2b098c9687b25368fa4a9e128963a13723aace67
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_vram_helper.c: In function 'drm_vram_mm_debugfs':
>> drivers/gpu/drm/drm_gem_vram_helper.c:961:40: error: 'struct drm_debugfs_entry' has no member named 'dev'
     961 |         struct drm_vram_mm *vmm = entry->dev->vram_mm;
         |                                        ^~


vim +961 drivers/gpu/drm/drm_gem_vram_helper.c

6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  953  
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  954  /*
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  955   * struct drm_vram_mm
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  956   */
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  957  
6454c853ce9fa8 Maíra Canal       2023-01-30  958  static int drm_vram_mm_debugfs(struct seq_file *m, struct drm_device *dev, void *data)
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  959  {
6fd80729f14e3f Maíra Canal       2022-12-19  960  	struct drm_debugfs_entry *entry = m->private;
6fd80729f14e3f Maíra Canal       2022-12-19 @961  	struct drm_vram_mm *vmm = entry->dev->vram_mm;
9de59bc201496f Dave Airlie       2020-08-04  962  	struct ttm_resource_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  963  	struct drm_printer p = drm_seq_file_printer(m);
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  964  
9de59bc201496f Dave Airlie       2020-08-04  965  	ttm_resource_manager_debug(man, &p);
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  966  	return 0;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  967  }
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  968  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
