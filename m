Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC419BF45B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 18:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A6910E730;
	Wed,  6 Nov 2024 17:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBsJ1S83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3743C10E730
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730914413; x=1762450413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Chz4JO/i/KXWFxZlHZEPivlsDrtw0pBtXxdY60/ftKM=;
 b=lBsJ1S83SQZsK6dWguzdH1ghqY7976OLCR0agNfgdKzZENdRwhK+mftj
 KNUu3/hDHvG0YHHpLgu2ZEfkLzdpBnJzKBhLpCelSHS4mBNSkKQm1p9bm
 fPE+Nj7PS1Me+qjNDL4sITn9XiTTZFqU5RtKEnD1hNdDNOohPHXuEt75n
 bqGD3oEAarT2vtJP8g2R98OvRJxXeBs10s8EDOBKfNqeQaVzYIc8Qk9RG
 /7HS4yFtUajSZGqWhYTl7TmlHkDHt/rky102zbzXI7lyOYKP9lWhpg7uZ
 eD0FkUWRNkievTQhIA58Kj8cEDdxCy+0k6SHpg+Y43GUuNsf0gOOAQ66c A==;
X-CSE-ConnectionGUID: R9m5zLN+RyKIev/Ij0Z7TQ==
X-CSE-MsgGUID: wPvaWQGJRaeW095Nf30ZaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42128639"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="42128639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 09:33:32 -0800
X-CSE-ConnectionGUID: UXDqz9giQ8m1mzwGnH9tvg==
X-CSE-MsgGUID: ZaXmnvq0SrOn429yUdP70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="89199145"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 09:33:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8juI-000pE6-1r;
 Wed, 06 Nov 2024 17:33:26 +0000
Date: Thu, 7 Nov 2024 01:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Liviu Dudau <liviu.dudau@arm.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Lock XArray when getting entries for heap
 and VM
Message-ID: <202411070140.L4JAwkvX-lkp@intel.com>
References: <20241106120748.290697-1-liviu.dudau@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106120748.290697-1-liviu.dudau@arm.com>
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

Hi Liviu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liviu-Dudau/drm-panthor-Lock-XArray-when-getting-entries-for-heap-and-VM/20241106-200841
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241106120748.290697-1-liviu.dudau%40arm.com
patch subject: [PATCH] drm/panthor: Lock XArray when getting entries for heap and VM
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241107/202411070140.L4JAwkvX-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070140.L4JAwkvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070140.L4JAwkvX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_heap.c:354:57: warning: 'struct pathor_heap_pool' declared inside parameter list will not be visible outside of this definition or declaration
     354 | static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
         |                                                         ^~~~~~~~~~~~~~~~
   In file included from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1120,
                    from include/linux/scatterlist.h:8,
                    from include/linux/iommu.h:10,
                    from include/linux/io-pgtable.h:6,
                    from drivers/gpu/drm/panthor/panthor_device.h:10,
                    from drivers/gpu/drm/panthor/panthor_heap.c:9:
   drivers/gpu/drm/panthor/panthor_heap.c: In function 'panthor_heap_from_id':
>> drivers/gpu/drm/panthor/panthor_heap.c:358:22: error: invalid use of undefined type 'struct pathor_heap_pool'
     358 |         xa_lock(&pool->xa);
         |                      ^~
   include/linux/xarray.h:536:45: note: in definition of macro 'xa_lock'
     536 | #define xa_lock(xa)             spin_lock(&(xa)->xa_lock)
         |                                             ^~
   drivers/gpu/drm/panthor/panthor_heap.c:359:29: error: invalid use of undefined type 'struct pathor_heap_pool'
     359 |         heap = xa_load(&pool->xa, id);
         |                             ^~
   drivers/gpu/drm/panthor/panthor_heap.c:360:24: error: invalid use of undefined type 'struct pathor_heap_pool'
     360 |         xa_unlock(&pool->va);
         |                        ^~
   include/linux/xarray.h:537:47: note: in definition of macro 'xa_unlock'
     537 | #define xa_unlock(xa)           spin_unlock(&(xa)->xa_lock)
         |                                               ^~
   drivers/gpu/drm/panthor/panthor_heap.c: In function 'panthor_heap_return_chunk':
>> drivers/gpu/drm/panthor/panthor_heap.c:389:37: error: passing argument 1 of 'panthor_heap_from_id' from incompatible pointer type [-Werror=incompatible-pointer-types]
     389 |         heap = panthor_heap_from_id(pool, heap_id);
         |                                     ^~~~
         |                                     |
         |                                     struct panthor_heap_pool *
   drivers/gpu/drm/panthor/panthor_heap.c:354:75: note: expected 'struct pathor_heap_pool *' but argument is of type 'struct panthor_heap_pool *'
     354 | static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/panthor/panthor_heap.c: In function 'panthor_heap_grow':
   drivers/gpu/drm/panthor/panthor_heap.c:452:37: error: passing argument 1 of 'panthor_heap_from_id' from incompatible pointer type [-Werror=incompatible-pointer-types]
     452 |         heap = panthor_heap_from_id(pool, heap_id);
         |                                     ^~~~
         |                                     |
         |                                     struct panthor_heap_pool *
   drivers/gpu/drm/panthor/panthor_heap.c:354:75: note: expected 'struct pathor_heap_pool *' but argument is of type 'struct panthor_heap_pool *'
     354 | static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/seq_file.h:11,
                    from include/drm/drm_debugfs.h:36,
                    from drivers/gpu/drm/panthor/panthor_mmu.c:5:
   drivers/gpu/drm/panthor/panthor_mmu.c: In function 'panthor_vm_pool_get_vm':
>> drivers/gpu/drm/panthor/panthor_mmu.c:1585:26: error: 'struct panthor_vm_pool' has no member named 'va'; did you mean 'xa'?
    1585 |         xa_unlock(&pool->va);
         |                          ^~
   include/linux/xarray.h:537:47: note: in definition of macro 'xa_unlock'
     537 | #define xa_unlock(xa)           spin_unlock(&(xa)->xa_lock)
         |                                               ^~


vim +358 drivers/gpu/drm/panthor/panthor_heap.c

   353	
 > 354	static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
   355	{
   356		struct panthor_heap *heap;
   357	
 > 358		xa_lock(&pool->xa);
   359		heap = xa_load(&pool->xa, id);
   360		xa_unlock(&pool->va);
   361	
   362		return heap;
   363	}
   364	
   365	/**
   366	 * panthor_heap_return_chunk() - Return an unused heap chunk
   367	 * @pool: The pool this heap belongs to.
   368	 * @heap_gpu_va: The GPU address of the heap context.
   369	 * @chunk_gpu_va: The chunk VA to return.
   370	 *
   371	 * This function is used when a chunk allocated with panthor_heap_grow()
   372	 * couldn't be linked to the heap context through the FW interface because
   373	 * the group requesting the allocation was scheduled out in the meantime.
   374	 */
   375	int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
   376				      u64 heap_gpu_va,
   377				      u64 chunk_gpu_va)
   378	{
   379		u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
   380		u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
   381		struct panthor_heap_chunk *chunk, *tmp, *removed = NULL;
   382		struct panthor_heap *heap;
   383		int ret;
   384	
   385		if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
   386			return -EINVAL;
   387	
   388		down_read(&pool->lock);
 > 389		heap = panthor_heap_from_id(pool, heap_id);
   390		if (!heap) {
   391			ret = -EINVAL;
   392			goto out_unlock;
   393		}
   394	
   395		chunk_gpu_va &= GENMASK_ULL(63, 12);
   396	
   397		mutex_lock(&heap->lock);
   398		list_for_each_entry_safe(chunk, tmp, &heap->chunks, node) {
   399			if (panthor_kernel_bo_gpuva(chunk->bo) == chunk_gpu_va) {
   400				removed = chunk;
   401				list_del(&chunk->node);
   402				heap->chunk_count--;
   403				break;
   404			}
   405		}
   406		mutex_unlock(&heap->lock);
   407	
   408		if (removed) {
   409			panthor_kernel_bo_destroy(chunk->bo);
   410			kfree(chunk);
   411			ret = 0;
   412		} else {
   413			ret = -EINVAL;
   414		}
   415	
   416	out_unlock:
   417		up_read(&pool->lock);
   418		return ret;
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
