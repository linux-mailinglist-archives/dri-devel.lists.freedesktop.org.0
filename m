Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E94FD29F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B49C10EBC6;
	Tue, 12 Apr 2022 07:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0843810E9C9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649748382; x=1681284382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5OyqKZ2t12lVTvKw/fJWrzDUz4nPfGALPPcWHIJFgN8=;
 b=foUSQxINNwZ5YLHEkUWhKQjzqPpHoJze6bUMk1/8EZO9TDZVulowEplr
 2T7LTGAU5S36RChxhKhlIV45jtdRG4LmS4Ncf2cClLG7x0vAH2rOQTfE8
 JfjEnVXOqviULzauuz1U3Y5vEw5lpXG12HJN7OnAiVGgZGjKCzbw7j0Kp
 ThI/DiJaHzKPFuEeHskRiurqzaJZsBCCnfgL7kHQYKtxvrvZjj7m4GqLD
 CelDz7O8I6JbkzWdcMA3xdmtCGlVGuUjq+VoBtrqPqIcmBO/+S0h7xPIM
 gictYcS74WsN2ZmDJ4pvGapWg0vaAjjQgLiQ6zcKKPl7QSQouGVfHjD2e g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="259893988"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="259893988"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 00:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="644602157"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2022 00:26:17 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1neAun-0002cr-5k;
 Tue, 12 Apr 2022 07:26:17 +0000
Date: Tue, 12 Apr 2022 15:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 11/15] drm/shmem-helper: Add generic memory shrinker
Message-ID: <202204121523.qVMxOvZg-lkp@intel.com>
References: <20220411215937.281655-12-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411215937.281655-12-dmitry.osipenko@collabora.com>
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
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220411]
[cannot apply to drm/drm-next v5.18-rc2 v5.18-rc1 v5.17 v5.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220412-060325
base:    d12d7e1cfe38e0c36d28c7a9fbbc436ad0d17c14
config: i386-randconfig-a005-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121523.qVMxOvZg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/683ba8a9d72ba7770a61a9266a2b33949f3874f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220412-060325
        git checkout 683ba8a9d72ba7770a61a9266a2b33949f3874f2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem_shmem_helper.c:289:11: warning: variable 'new_state' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           else if (shmem->madv < 0)
                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:292:46: note: uninitialized use occurs here
           drm_gem_shmem_set_pages_state_locked(shmem, new_state);
                                                       ^~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:289:7: note: remove the 'if' if its condition is always true
           else if (shmem->madv < 0)
                ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:278:2: note: variable 'new_state' is declared here
           enum drm_gem_shmem_pages_state new_state;
           ^
   1 warning generated.


vim +289 drivers/gpu/drm/drm_gem_shmem_helper.c

   273	
   274	static void drm_gem_shmem_update_pages_state_locked(struct drm_gem_shmem_object *shmem)
   275	{
   276		struct drm_gem_object *obj = &shmem->base;
   277		struct drm_gem_shmem_shrinker *gem_shrinker = obj->dev->shmem_shrinker;
   278		enum drm_gem_shmem_pages_state new_state;
   279	
   280		if (!gem_shrinker || obj->import_attach)
   281			return;
   282	
   283		mutex_lock(&gem_shrinker->lock);
   284	
   285		if (!shmem->madv)
   286			new_state = DRM_GEM_SHMEM_PAGES_STATE_ACTIVE;
   287		else if (shmem->madv > 0)
   288			new_state = DRM_GEM_SHMEM_PAGES_STATE_PURGEABLE;
 > 289		else if (shmem->madv < 0)
   290			new_state = DRM_GEM_SHMEM_PAGES_STATE_PURGED;
   291	
   292		drm_gem_shmem_set_pages_state_locked(shmem, new_state);
   293	
   294		mutex_unlock(&gem_shrinker->lock);
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
