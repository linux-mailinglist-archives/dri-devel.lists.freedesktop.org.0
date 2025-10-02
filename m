Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A272EBB5979
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 01:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1C910E858;
	Thu,  2 Oct 2025 23:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tiih65xx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B95710E858;
 Thu,  2 Oct 2025 23:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759447209; x=1790983209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zer4Xzjj7dBSQqyLbsDiI/IqBCXEGdFEHlexlQ6sVGk=;
 b=Tiih65xxm5nh/Ts+3u8+zcdrALE0dRvkBwxFcN9c1PPtC8xIWmfpLjm2
 Ula7sePnRuDa1CX2JOFNNICqfMSaUNmLXXcwenH5a+JXufIUOhEOyhd0h
 UNDmI1TLDy70st5+GLysUD9pwIT+qQnMIKnUpqW4JHt7ce7C1X/Nvlp3m
 c/djssyPi6RbKktEmX+KoDJMEjr9f19vo5WU/B27SJX4+43i3uVdHHDt+
 FYJ+WyD6bRe6YC8o70wEkKmhEwTv+hAet4nYRruz5UWTNa9iJyFNF5dtw
 MIILj9pbZ1WwSpreUbSP9uNLCSMzH8ezERjHy+er+3Rm2G6hnuISD7MEO g==;
X-CSE-ConnectionGUID: 7d2PV25hRhilMHWbJjuwpw==
X-CSE-MsgGUID: h1lyKfG7QoqLRmcYnuTzjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61775398"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61775398"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:20:08 -0700
X-CSE-ConnectionGUID: OX9JyEZvQMKLN55bhMJf0Q==
X-CSE-MsgGUID: jLVVd7kZT8Omi4yhL6VRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179103637"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2025 16:20:02 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v4Sad-0004BT-1y;
 Thu, 02 Oct 2025 23:19:59 +0000
Date: Fri, 3 Oct 2025 07:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 ganglxie <ganglxie@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Candice Li <candice.li@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 Roman Li <roman.li@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Karthi Kandasamy <karthi.kandasamy@amd.com>,
 David Rosca <david.rosca@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 bhanuseshukumar@gmail.com
Subject: Re: [PATCH] drm: amd:  Use kmalloc_array to prevent overflow of
 dynamic size calculation
Message-ID: <202510030646.pqNWfKQ0-lkp@intel.com>
References: <20251002022241.77823-1-bhanuseshukumar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002022241.77823-1-bhanuseshukumar@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bhanu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on amd-pstate/linux-next]
[also build test WARNING on amd-pstate/bleeding-edge v6.17]
[cannot apply to linus/master next-20251002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhanu-Seshu-Kumar-Valluri/drm-amd-Use-kmalloc_array-to-prevent-overflow-of-dynamic-size-calculation/20251002-102458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20251002022241.77823-1-bhanuseshukumar%40gmail.com
patch subject: [PATCH] drm: amd:  Use kmalloc_array to prevent overflow of dynamic size calculation
config: x86_64-randconfig-003-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030646.pqNWfKQ0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030646.pqNWfKQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510030646.pqNWfKQ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:16,
                    from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs.h:11,
                    from include/linux/debugfs.h:15,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:24:
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c: In function 'amdgpu_ras_badpages_read':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:37: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                                     ^~~~~~
   include/linux/alloc_tag.h:239:16: note: in definition of macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:16: note: in expansion of macro 'kmalloc_array'
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:37: note: earlier argument should specify number of elements, later size of each element
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                                     ^~~~~~
   include/linux/alloc_tag.h:239:16: note: in definition of macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:16: note: in expansion of macro 'kmalloc_array'
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                ^~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:37: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                                     ^~~~~~
   include/linux/alloc_tag.h:243:24: note: in definition of macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:16: note: in expansion of macro 'kmalloc_array'
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:37: note: earlier argument should specify number of elements, later size of each element
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                                     ^~~~~~
   include/linux/alloc_tag.h:243:24: note: in definition of macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:16: note: in expansion of macro 'kmalloc_array'
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                ^~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:37: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                                     ^~~~~~
   include/linux/alloc_tag.h:246:24: note: in definition of macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:16: note: in expansion of macro 'kmalloc_array'
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:37: note: earlier argument should specify number of elements, later size of each element
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                                     ^~~~~~
   include/linux/alloc_tag.h:246:24: note: in definition of macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2569:16: note: in expansion of macro 'kmalloc_array'
    2569 |         *bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
         |                ^~~~~~~~~~~~~


vim +2569 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

  2546	
  2547	/* return 0 on success.
  2548	 * caller need free bps.
  2549	 */
  2550	static int amdgpu_ras_badpages_read(struct amdgpu_device *adev,
  2551			struct ras_badpage **bps, unsigned int *count)
  2552	{
  2553		struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
  2554		struct ras_err_handler_data *data;
  2555		int i = 0;
  2556		int ret = 0, status;
  2557	
  2558		if (!con || !con->eh_data || !bps || !count)
  2559			return -EINVAL;
  2560	
  2561		mutex_lock(&con->recovery_lock);
  2562		data = con->eh_data;
  2563		if (!data || data->count == 0) {
  2564			*bps = NULL;
  2565			ret = -EINVAL;
  2566			goto out;
  2567		}
  2568	
> 2569		*bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
  2570		if (!*bps) {
  2571			ret = -ENOMEM;
  2572			goto out;
  2573		}
  2574	
  2575		for (; i < data->count; i++) {
  2576			(*bps)[i] = (struct ras_badpage){
  2577				.bp = data->bps[i].retired_page,
  2578				.size = AMDGPU_GPU_PAGE_SIZE,
  2579				.flags = AMDGPU_RAS_RETIRE_PAGE_RESERVED,
  2580			};
  2581			status = amdgpu_vram_mgr_query_page_status(&adev->mman.vram_mgr,
  2582					data->bps[i].retired_page << AMDGPU_GPU_PAGE_SHIFT);
  2583			if (status == -EBUSY)
  2584				(*bps)[i].flags = AMDGPU_RAS_RETIRE_PAGE_PENDING;
  2585			else if (status == -ENOENT)
  2586				(*bps)[i].flags = AMDGPU_RAS_RETIRE_PAGE_FAULT;
  2587		}
  2588	
  2589		*count = data->count;
  2590	out:
  2591		mutex_unlock(&con->recovery_lock);
  2592		return ret;
  2593	}
  2594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
