Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFBBAC681
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3810E54E;
	Tue, 30 Sep 2025 10:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhFmtE6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89B110E29C;
 Tue, 30 Sep 2025 10:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759226749; x=1790762749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=npvtgCQVERmCarOfKSvie70oeT0wMLmYdU95Di6tZxk=;
 b=GhFmtE6Pk62pdzSsWHRsCoSE1jmrrgoNBTLQxdnyoeCS0nIh4LAW4Lr7
 6awTtXibWYeqUujxIzJfXaU7eVc99iR9nTO88ItrRu6OXUYH2ckJnwi46
 yrr7+kb+cvvamRzFTjRj14G14ezebdfA+TwxZ99MGpJh+Tx4CHUmZ7W2l
 vEBT7WUz/zI/JK8h7svroXeU+t6HzN+xuq7uZLVvjf5QIpZA5PJvYP6cO
 ICAV5lckd+GS1xKP6oYoWp/Yywl1GElRmbwXpkycru8/dmLNLZpobvEGN
 KB6MAReJVbdZ3GQVyXfL8E5F2SHTsdChMXHsNUKS9S5vQlqK8DVA2bIch w==;
X-CSE-ConnectionGUID: svh840NuSPqiOiRziVay9w==
X-CSE-MsgGUID: Tz5QUxMJRWyXokoxcLjyww==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72097643"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72097643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:05:49 -0700
X-CSE-ConnectionGUID: PV+0NBfaTwSqEdenvWAgLQ==
X-CSE-MsgGUID: K51ZkYz/TQmtpVOD/uXFwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178889093"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 30 Sep 2025 03:05:43 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v3XEq-00019L-1H;
 Tue, 30 Sep 2025 10:05:40 +0000
Date: Tue, 30 Sep 2025 18:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?utf-8?Q?Miko=C5=82aj?= Wasiak <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 2/8] drm/gem: Introduce drm_gem_get_unmapped_area() fop
Message-ID: <202509301702.DL6CeU62-lkp@intel.com>
References: <20250929200316.18417-3-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929200316.18417-3-loic.molinari@collabora.com>
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

Hi Loïc,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.17 next-20250929]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Add-huge-page-fault-handler/20250930-040600
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250929200316.18417-3-loic.molinari%40collabora.com
patch subject: [PATCH 2/8] drm/gem: Introduce drm_gem_get_unmapped_area() fop
config: arm-randconfig-002-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301702.DL6CeU62-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301702.DL6CeU62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301702.DL6CeU62-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem.c: In function 'drm_gem_get_unmapped_area':
>> drivers/gpu/drm/drm_gem.c:1280:9: error: implicit declaration of function 'mm_get_unmapped_area'; did you mean 'shmem_get_unmapped_area'? [-Werror=implicit-function-declaration]
     return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0, flags);
            ^~~~~~~~~~~~~~~~~~~~
            shmem_get_unmapped_area
   cc1: some warnings being treated as errors


vim +1280 drivers/gpu/drm/drm_gem.c

  1238	
  1239	/**
  1240	 * drm_gem_get_unmapped_area - get memory mapping region routine for GEM objects
  1241	 * @filp: DRM file pointer
  1242	 * @uaddr: User address hint
  1243	 * @len: Mapping length
  1244	 * @pgoff: Offset (in pages)
  1245	 * @flags: Mapping flags
  1246	 *
  1247	 * If a driver supports GEM object mapping, before ending up in drm_gem_mmap(),
  1248	 * mmap calls on the DRM file descriptor will first try to find a free linear
  1249	 * address space large enough for a mapping. Since GEM objects are backed by
  1250	 * shmem buffers, this should preferably be handled by the shmem virtual memory
  1251	 * filesystem which can appropriately align addresses to huge page sizes when
  1252	 * needed.
  1253	 *
  1254	 * Look up the GEM object based on the offset passed in (vma->vm_pgoff will
  1255	 * contain the fake offset we created) and call shmem_get_unmapped_area() with
  1256	 * the right file pointer.
  1257	 *
  1258	 * If a GEM object is not available at the given offset or if the caller is not
  1259	 * granted access to it, fall back to mm_get_unmapped_area().
  1260	 */
  1261	unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
  1262						unsigned long len, unsigned long pgoff,
  1263						unsigned long flags)
  1264	{
  1265	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  1266		struct drm_gem_object *obj;
  1267		unsigned long ret;
  1268	
  1269		obj = drm_gem_object_lookup_from_offset(filp, pgoff, len >> PAGE_SHIFT);
  1270		if (IS_ERR(obj))
  1271			return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
  1272						    flags);
  1273	
  1274		ret = shmem_get_unmapped_area(obj->filp, uaddr, len, 0, flags);
  1275	
  1276		drm_gem_object_put(obj);
  1277	
  1278		return ret;
  1279	#else
> 1280		return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0, flags);
  1281	#endif
  1282	}
  1283	EXPORT_SYMBOL(drm_gem_get_unmapped_area);
  1284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
