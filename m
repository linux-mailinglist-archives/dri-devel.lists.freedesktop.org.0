Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F882BCAA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063110EAB2;
	Fri, 12 Jan 2024 09:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D8C10EAB2;
 Fri, 12 Jan 2024 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705050462; x=1736586462;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nKUQ3YVcdL48V6oYTbglzQHnBPG03i5cSW8m97SIAj0=;
 b=NYOY6btzVKIY0fD+d1kZb4N3ZZ+pjAus0xsJNsYORVeXzfOR6WxPoTVI
 r22OEoVVZIx4Wn4TBf0rmWU7nTTTP6oNLk9DJorO7p5Yln1KxW3QLO76x
 IRuY5laaGvJxzsNDI0bfggyILx/gfytacroqCxE5XiSdEbqeDuFIKga4A
 mKrDMxxbgeqZ0i5pSTUj6+hPSy/yh8INQXba79RGGmg3xEYDH8xgHVS5i
 KG4hNdK8hPcngAJJ7uOvCuJlnshelSL2BzCEFAwJzZPaxrSR+HP42zDJE
 gZccdn9W4uesp91AMt3Aip3wEyXzntp+emdMWI1yC17Ih8RFvLjTqqO5V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6491194"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6491194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 01:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="24944433"
Received: from kklimes-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.38.5])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 01:07:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/amdgpu: prefer snprintf over sprintf
In-Reply-To: <202401121126.i9VGrvMb-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula@intel.com>
 <202401121126.i9VGrvMb-lkp@intel.com>
Date: Fri, 12 Jan 2024 11:07:33 +0200
Message-ID: <878r4uudgq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Pan@freedesktop.org, intel-gfx@lists.freedesktop.org,
 Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Jan 2024, kernel test robot <lkp@intel.com> wrote:
> Hi Jani,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7 next-20240111]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-nouveau-acr-ga102-remove-unused-but-set-variable/20240111-014206
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/fea7a52924f98b1ac24f4a7e6ba21d7754422430.1704908087.git.jani.nikula%40intel.com
> patch subject: [PATCH 3/6] drm/amdgpu: prefer snprintf over sprintf
> config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20240112/202401121126.i9VGrvMb-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121126.i9VGrvMb-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401121126.i9VGrvMb-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function 'amdgpu_gfx_kiq_init_ring':
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 8 [-Wformat-truncation=]
>      332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
>          |                                                             ^~
>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:50: note: directive argument in the range [0, 2147483647]
>      332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
>          |                                                  ^~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 16
>      332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      333 |                  xcc_id, ring->me, ring->pipe, ring->queue);
>          |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As the commit message says,

This will trade the W=1 warning -Wformat-overflow to
-Wformat-truncation. This lets us enable -Wformat-overflow subsystem
wide.


BR,
Jani.

>
>
> vim +332 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>
>    306	
>    307	int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *adev,
>    308				     struct amdgpu_ring *ring,
>    309				     struct amdgpu_irq_src *irq, int xcc_id)
>    310	{
>    311		struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
>    312		int r = 0;
>    313	
>    314		spin_lock_init(&kiq->ring_lock);
>    315	
>    316		ring->adev = NULL;
>    317		ring->ring_obj = NULL;
>    318		ring->use_doorbell = true;
>    319		ring->xcc_id = xcc_id;
>    320		ring->vm_hub = AMDGPU_GFXHUB(xcc_id);
>    321		ring->doorbell_index =
>    322			(adev->doorbell_index.kiq +
>    323			 xcc_id * adev->doorbell_index.xcc_doorbell_range)
>    324			<< 1;
>    325	
>    326		r = amdgpu_gfx_kiq_acquire(adev, ring, xcc_id);
>    327		if (r)
>    328			return r;
>    329	
>    330		ring->eop_gpu_addr = kiq->eop_gpu_addr;
>    331		ring->no_scheduler = true;
>  > 332		snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
>    333			 xcc_id, ring->me, ring->pipe, ring->queue);
>    334		r = amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_DRIVER0,
>    335				     AMDGPU_RING_PRIO_DEFAULT, NULL);
>    336		if (r)
>    337			dev_warn(adev->dev, "(%d) failed to init kiq ring\n", r);
>    338	
>    339		return r;
>    340	}
>    341	

-- 
Jani Nikula, Intel
