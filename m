Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB75799AC2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 22:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D937710E15D;
	Sat,  9 Sep 2023 20:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3938C10E0F7;
 Sat,  9 Sep 2023 20:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694290672; x=1725826672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RegZB4eDi8SjZCfUYZyEQCZyBfiakk6pB+dug8RXBec=;
 b=EhCuub5MBwYtKK0iNw1x0rPEGyHgnOapIreX4YsQBL7PTw2mhNs+Zc7b
 xIZ5TgMn1JGRNryWva8dRnA5uZBngbHpW6+dGHE+9pLNtmv/ec2/IIziy
 y+Q7uGPBpIs4iSAb7ZvoJ2L0GCdbJa8VvOYwyPb2Oc/izbCzbzXK6BXy9
 YfmXH/jSYMh4o5snjqkssy0de8L6V1387TdprVBogN1YeeG1pywmi5FBI
 EhF4Lu54NvO0nBIyNA6FRbDIXXB4WypLu92UqQDW2k2Dbqi+X7WdsFrIS
 ERdUQNUS5IHR045DOHMfAfVkpzLp+udJdy3dKkxiWMq+VEGMXNEF5yRXt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="368108522"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; d="scan'208";a="368108522"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 13:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="833026089"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; d="scan'208";a="833026089"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Sep 2023 13:17:46 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qf4Om-0003sa-1y;
 Sat, 09 Sep 2023 20:17:44 +0000
Date: Sun, 10 Sep 2023 04:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <202309100424.uNXGR9d4-lkp@intel.com>
References: <20230909153125.30032-7-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230909153125.30032-7-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6bd3d8da51ca1ec97c724016466606aec7739b9f]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-gpuvm-rename-struct-drm_gpuva_manager-to-struct-drm_gpuvm/20230909-233346
base:   6bd3d8da51ca1ec97c724016466606aec7739b9f
patch link:    https://lore.kernel.org/r/20230909153125.30032-7-dakr%40redhat.com
patch subject: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize dma_resv/extobj handling and GEM validation
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230910/202309100424.uNXGR9d4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100424.uNXGR9d4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100424.uNXGR9d4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpuvm.c:734: warning: Function parameter or member '__gpuvm' not described in 'for_each_vm_bo_in_list'
>> drivers/gpu/drm/drm_gpuvm.c:734: warning: Function parameter or member '__list_name' not described in 'for_each_vm_bo_in_list'
>> drivers/gpu/drm/drm_gpuvm.c:734: warning: Function parameter or member '__local_list' not described in 'for_each_vm_bo_in_list'
>> drivers/gpu/drm/drm_gpuvm.c:734: warning: Function parameter or member '__vm_bo' not described in 'for_each_vm_bo_in_list'


vim +734 drivers/gpu/drm/drm_gpuvm.c

    32	
    33	/**
    34	 * DOC: Overview
    35	 *
    36	 * The DRM GPU VA Manager, represented by struct drm_gpuvm keeps track of a
    37	 * GPU's virtual address (VA) space and manages the corresponding virtual
    38	 * mappings represented by &drm_gpuva objects. It also keeps track of the
    39	 * mapping's backing &drm_gem_object buffers.
    40	 *
    41	 * &drm_gem_object buffers maintain a list of &drm_gpuva objects representing
    42	 * all existent GPU VA mappings using this &drm_gem_object as backing buffer.
    43	 *
    44	 * GPU VAs can be flagged as sparse, such that drivers may use GPU VAs to also
    45	 * keep track of sparse PTEs in order to support Vulkan 'Sparse Resources'.
    46	 *
    47	 * The GPU VA manager internally uses a rb-tree to manage the
    48	 * &drm_gpuva mappings within a GPU's virtual address space.
    49	 *
    50	 * The &drm_gpuvm structure contains a special &drm_gpuva representing the
    51	 * portion of VA space reserved by the kernel. This node is initialized together
    52	 * with the GPU VA manager instance and removed when the GPU VA manager is
    53	 * destroyed.
    54	 *
    55	 * In a typical application drivers would embed struct drm_gpuvm and
    56	 * struct drm_gpuva within their own driver specific structures, there won't be
    57	 * any memory allocations of its own nor memory allocations of &drm_gpuva
    58	 * entries.
    59	 *
    60	 * The data structures needed to store &drm_gpuvas within the &drm_gpuvm are
    61	 * contained within struct drm_gpuva already. Hence, for inserting &drm_gpuva
    62	 * entries from within dma-fence signalling critical sections it is enough to
    63	 * pre-allocate the &drm_gpuva structures.
    64	 *
    65	 * In order to connect a struct drm_gpuva its backing &drm_gem_object each
    66	 * &drm_gem_object maintains a list of &drm_gpuvm_bo structures, and each
    67	 * &drm_gpuvm_bo contains a list of &&drm_gpuva structures.
    68	 *
    69	 * A &drm_gpuvm_bo is an abstraction that represents a combination of a
    70	 * &drm_gpuvm and a &drm_gem_object. Every such combination should be unique.
    71	 * This is ensured by the API through drm_gpuvm_bo_obtain() and
    72	 * drm_gpuvm_bo_obtain_prealloc() which first look into the corresponding
    73	 * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
    74	 * particular combination. If not existent a new instance is created and linked
    75	 * to the &drm_gem_object.
    76	 *
    77	 * &drm_gpuvm_bo structures, since unique for a given &drm_gpuvm, are also used
    78	 * as entry for the &drm_gpuvm's lists of external and evicted objects. Those
    79	 * list are maintained in order to accelerate locking of dma-resv locks and
    80	 * validation of evicted objects bound in a &drm_gpuvm. For instance the all
    81	 * &drm_gem_object's &dma_resv of a given &drm_gpuvm can be locked by calling
    82	 * drm_gpuvm_exec_lock(). Once locked drivers can call drm_gpuvm_validate() in
    83	 * order to validate all evicted &drm_gem_objects. It is also possible to lock
    84	 * additional &drm_gem_objects by providing the corresponding parameters to
    85	 * drm_gpuvm_exec_lock() as well as open code the &drm_exec loop while making
    86	 * use of helper functions such as drm_gpuvm_prepare_range() or
    87	 * drm_gpuvm_prepare_objects().
    88	 *
    89	 * Every bound &drm_gem_object is treated as external object when its &dma_resv
    90	 * structure is different than the &drm_gpuvm's common &dma_resv structure.
    91	 */
    92	
    93	/**
    94	 * DOC: Split and Merge
    95	 *
    96	 * Besides its capability to manage and represent a GPU VA space, the
    97	 * GPU VA manager also provides functions to let the &drm_gpuvm calculate a
    98	 * sequence of operations to satisfy a given map or unmap request.
    99	 *
   100	 * Therefore the DRM GPU VA manager provides an algorithm implementing splitting
   101	 * and merging of existent GPU VA mappings with the ones that are requested to
   102	 * be mapped or unmapped. This feature is required by the Vulkan API to
   103	 * implement Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to this
   104	 * as VM BIND.
   105	 *
   106	 * Drivers can call drm_gpuvm_sm_map() to receive a sequence of callbacks
   107	 * containing map, unmap and remap operations for a given newly requested
   108	 * mapping. The sequence of callbacks represents the set of operations to
   109	 * execute in order to integrate the new mapping cleanly into the current state
   110	 * of the GPU VA space.
   111	 *
   112	 * Depending on how the new GPU VA mapping intersects with the existent mappings
   113	 * of the GPU VA space the &drm_gpuvm_ops callbacks contain an arbitrary amount
   114	 * of unmap operations, a maximum of two remap operations and a single map
   115	 * operation. The caller might receive no callback at all if no operation is
   116	 * required, e.g. if the requested mapping already exists in the exact same way.
   117	 *
   118	 * The single map operation represents the original map operation requested by
   119	 * the caller.
   120	 *
   121	 * &drm_gpuva_op_unmap contains a 'keep' field, which indicates whether the
   122	 * &drm_gpuva to unmap is physically contiguous with the original mapping
   123	 * request. Optionally, if 'keep' is set, drivers may keep the actual page table
   124	 * entries for this &drm_gpuva, adding the missing page table entries only and
   125	 * update the &drm_gpuvm's view of things accordingly.
   126	 *
   127	 * Drivers may do the same optimization, namely delta page table updates, also
   128	 * for remap operations. This is possible since &drm_gpuva_op_remap consists of
   129	 * one unmap operation and one or two map operations, such that drivers can
   130	 * derive the page table update delta accordingly.
   131	 *
   132	 * Note that there can't be more than two existent mappings to split up, one at
   133	 * the beginning and one at the end of the new mapping, hence there is a
   134	 * maximum of two remap operations.
   135	 *
   136	 * Analogous to drm_gpuvm_sm_map() drm_gpuvm_sm_unmap() uses &drm_gpuvm_ops to
   137	 * call back into the driver in order to unmap a range of GPU VA space. The
   138	 * logic behind this function is way simpler though: For all existent mappings
   139	 * enclosed by the given range unmap operations are created. For mappings which
   140	 * are only partically located within the given range, remap operations are
   141	 * created such that those mappings are split up and re-mapped partically.
   142	 *
   143	 * As an alternative to drm_gpuvm_sm_map() and drm_gpuvm_sm_unmap(),
   144	 * drm_gpuvm_sm_map_ops_create() and drm_gpuvm_sm_unmap_ops_create() can be used
   145	 * to directly obtain an instance of struct drm_gpuva_ops containing a list of
   146	 * &drm_gpuva_op, which can be iterated with drm_gpuva_for_each_op(). This list
   147	 * contains the &drm_gpuva_ops analogous to the callbacks one would receive when
   148	 * calling drm_gpuvm_sm_map() or drm_gpuvm_sm_unmap(). While this way requires
   149	 * more memory (to allocate the &drm_gpuva_ops), it provides drivers a way to
   150	 * iterate the &drm_gpuva_op multiple times, e.g. once in a context where memory
   151	 * allocations are possible (e.g. to allocate GPU page tables) and once in the
   152	 * dma-fence signalling critical path.
   153	 *
   154	 * To update the &drm_gpuvm's view of the GPU VA space drm_gpuva_insert() and
   155	 * drm_gpuva_remove() may be used. These functions can safely be used from
   156	 * &drm_gpuvm_ops callbacks originating from drm_gpuvm_sm_map() or
   157	 * drm_gpuvm_sm_unmap(). However, it might be more convenient to use the
   158	 * provided helper functions drm_gpuva_map(), drm_gpuva_remap() and
   159	 * drm_gpuva_unmap() instead.
   160	 *
   161	 * The following diagram depicts the basic relationships of existent GPU VA
   162	 * mappings, a newly requested mapping and the resulting mappings as implemented
   163	 * by drm_gpuvm_sm_map() - it doesn't cover any arbitrary combinations of these.
   164	 *
   165	 * 1) Requested mapping is identical. Replace it, but indicate the backing PTEs
   166	 *    could be kept.
   167	 *
   168	 *    ::
   169	 *
   170	 *	     0     a     1
   171	 *	old: |-----------| (bo_offset=n)
   172	 *
   173	 *	     0     a     1
   174	 *	req: |-----------| (bo_offset=n)
   175	 *
   176	 *	     0     a     1
   177	 *	new: |-----------| (bo_offset=n)
   178	 *
   179	 *
   180	 * 2) Requested mapping is identical, except for the BO offset, hence replace
   181	 *    the mapping.
   182	 *
   183	 *    ::
   184	 *
   185	 *	     0     a     1
   186	 *	old: |-----------| (bo_offset=n)
   187	 *
   188	 *	     0     a     1
   189	 *	req: |-----------| (bo_offset=m)
   190	 *
   191	 *	     0     a     1
   192	 *	new: |-----------| (bo_offset=m)
   193	 *
   194	 *
   195	 * 3) Requested mapping is identical, except for the backing BO, hence replace
   196	 *    the mapping.
   197	 *
   198	 *    ::
   199	 *
   200	 *	     0     a     1
   201	 *	old: |-----------| (bo_offset=n)
   202	 *
   203	 *	     0     b     1
   204	 *	req: |-----------| (bo_offset=n)
   205	 *
   206	 *	     0     b     1
   207	 *	new: |-----------| (bo_offset=n)
   208	 *
   209	 *
   210	 * 4) Existent mapping is a left aligned subset of the requested one, hence
   211	 *    replace the existent one.
   212	 *
   213	 *    ::
   214	 *
   215	 *	     0  a  1
   216	 *	old: |-----|       (bo_offset=n)
   217	 *
   218	 *	     0     a     2
   219	 *	req: |-----------| (bo_offset=n)
   220	 *
   221	 *	     0     a     2
   222	 *	new: |-----------| (bo_offset=n)
   223	 *
   224	 *    .. note::
   225	 *       We expect to see the same result for a request with a different BO
   226	 *       and/or non-contiguous BO offset.
   227	 *
   228	 *
   229	 * 5) Requested mapping's range is a left aligned subset of the existent one,
   230	 *    but backed by a different BO. Hence, map the requested mapping and split
   231	 *    the existent one adjusting its BO offset.
   232	 *
   233	 *    ::
   234	 *
   235	 *	     0     a     2
   236	 *	old: |-----------| (bo_offset=n)
   237	 *
   238	 *	     0  b  1
   239	 *	req: |-----|       (bo_offset=n)
   240	 *
   241	 *	     0  b  1  a' 2
   242	 *	new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
   243	 *
   244	 *    .. note::
   245	 *       We expect to see the same result for a request with a different BO
   246	 *       and/or non-contiguous BO offset.
   247	 *
   248	 *
   249	 * 6) Existent mapping is a superset of the requested mapping. Split it up, but
   250	 *    indicate that the backing PTEs could be kept.
   251	 *
   252	 *    ::
   253	 *
   254	 *	     0     a     2
   255	 *	old: |-----------| (bo_offset=n)
   256	 *
   257	 *	     0  a  1
   258	 *	req: |-----|       (bo_offset=n)
   259	 *
   260	 *	     0  a  1  a' 2
   261	 *	new: |-----|-----| (a.bo_offset=n, a'.bo_offset=n+1)
   262	 *
   263	 *
   264	 * 7) Requested mapping's range is a right aligned subset of the existent one,
   265	 *    but backed by a different BO. Hence, map the requested mapping and split
   266	 *    the existent one, without adjusting the BO offset.
   267	 *
   268	 *    ::
   269	 *
   270	 *	     0     a     2
   271	 *	old: |-----------| (bo_offset=n)
   272	 *
   273	 *	           1  b  2
   274	 *	req:       |-----| (bo_offset=m)
   275	 *
   276	 *	     0  a  1  b  2
   277	 *	new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
   278	 *
   279	 *
   280	 * 8) Existent mapping is a superset of the requested mapping. Split it up, but
   281	 *    indicate that the backing PTEs could be kept.
   282	 *
   283	 *    ::
   284	 *
   285	 *	      0     a     2
   286	 *	old: |-----------| (bo_offset=n)
   287	 *
   288	 *	           1  a  2
   289	 *	req:       |-----| (bo_offset=n+1)
   290	 *
   291	 *	     0  a' 1  a  2
   292	 *	new: |-----|-----| (a'.bo_offset=n, a.bo_offset=n+1)
   293	 *
   294	 *
   295	 * 9) Existent mapping is overlapped at the end by the requested mapping backed
   296	 *    by a different BO. Hence, map the requested mapping and split up the
   297	 *    existent one, without adjusting the BO offset.
   298	 *
   299	 *    ::
   300	 *
   301	 *	     0     a     2
   302	 *	old: |-----------|       (bo_offset=n)
   303	 *
   304	 *	           1     b     3
   305	 *	req:       |-----------| (bo_offset=m)
   306	 *
   307	 *	     0  a  1     b     3
   308	 *	new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
   309	 *
   310	 *
   311	 * 10) Existent mapping is overlapped by the requested mapping, both having the
   312	 *     same backing BO with a contiguous offset. Indicate the backing PTEs of
   313	 *     the old mapping could be kept.
   314	 *
   315	 *     ::
   316	 *
   317	 *	      0     a     2
   318	 *	 old: |-----------|       (bo_offset=n)
   319	 *
   320	 *	            1     a     3
   321	 *	 req:       |-----------| (bo_offset=n+1)
   322	 *
   323	 *	      0  a' 1     a     3
   324	 *	 new: |-----|-----------| (a'.bo_offset=n, a.bo_offset=n+1)
   325	 *
   326	 *
   327	 * 11) Requested mapping's range is a centered subset of the existent one
   328	 *     having a different backing BO. Hence, map the requested mapping and split
   329	 *     up the existent one in two mappings, adjusting the BO offset of the right
   330	 *     one accordingly.
   331	 *
   332	 *     ::
   333	 *
   334	 *	      0        a        3
   335	 *	 old: |-----------------| (bo_offset=n)
   336	 *
   337	 *	            1  b  2
   338	 *	 req:       |-----|       (bo_offset=m)
   339	 *
   340	 *	      0  a  1  b  2  a' 3
   341	 *	 new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
   342	 *
   343	 *
   344	 * 12) Requested mapping is a contiguous subset of the existent one. Split it
   345	 *     up, but indicate that the backing PTEs could be kept.
   346	 *
   347	 *     ::
   348	 *
   349	 *	      0        a        3
   350	 *	 old: |-----------------| (bo_offset=n)
   351	 *
   352	 *	            1  a  2
   353	 *	 req:       |-----|       (bo_offset=n+1)
   354	 *
   355	 *	      0  a' 1  a  2 a'' 3
   356	 *	 old: |-----|-----|-----| (a'.bo_offset=n, a.bo_offset=n+1, a''.bo_offset=n+2)
   357	 *
   358	 *
   359	 * 13) Existent mapping is a right aligned subset of the requested one, hence
   360	 *     replace the existent one.
   361	 *
   362	 *     ::
   363	 *
   364	 *	            1  a  2
   365	 *	 old:       |-----| (bo_offset=n+1)
   366	 *
   367	 *	      0     a     2
   368	 *	 req: |-----------| (bo_offset=n)
   369	 *
   370	 *	      0     a     2
   371	 *	 new: |-----------| (bo_offset=n)
   372	 *
   373	 *     .. note::
   374	 *        We expect to see the same result for a request with a different bo
   375	 *        and/or non-contiguous bo_offset.
   376	 *
   377	 *
   378	 * 14) Existent mapping is a centered subset of the requested one, hence
   379	 *     replace the existent one.
   380	 *
   381	 *     ::
   382	 *
   383	 *	            1  a  2
   384	 *	 old:       |-----| (bo_offset=n+1)
   385	 *
   386	 *	      0        a       3
   387	 *	 req: |----------------| (bo_offset=n)
   388	 *
   389	 *	      0        a       3
   390	 *	 new: |----------------| (bo_offset=n)
   391	 *
   392	 *     .. note::
   393	 *        We expect to see the same result for a request with a different bo
   394	 *        and/or non-contiguous bo_offset.
   395	 *
   396	 *
   397	 * 15) Existent mappings is overlapped at the beginning by the requested mapping
   398	 *     backed by a different BO. Hence, map the requested mapping and split up
   399	 *     the existent one, adjusting its BO offset accordingly.
   400	 *
   401	 *     ::
   402	 *
   403	 *	            1     a     3
   404	 *	 old:       |-----------| (bo_offset=n)
   405	 *
   406	 *	      0     b     2
   407	 *	 req: |-----------|       (bo_offset=m)
   408	 *
   409	 *	      0     b     2  a' 3
   410	 *	 new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
   411	 */
   412	
   413	/**
   414	 * DOC: Locking
   415	 *
   416	 * Generally, the GPU VA manager does not take care of locking itself, it is
   417	 * the drivers responsibility to take care about locking. Drivers might want to
   418	 * protect the following operations: inserting, removing and iterating
   419	 * &drm_gpuva objects as well as generating all kinds of operations, such as
   420	 * split / merge or prefetch.
   421	 *
   422	 * The GPU VA manager also does not take care of the locking of the backing
   423	 * &drm_gem_object buffers GPU VA lists and &drm_gpuvm_bo abstractions by
   424	 * itself; drivers are responsible to enforce mutual exclusion using either the
   425	 * GEMs dma_resv lock or alternatively a driver specific external lock. For the
   426	 * latter see also drm_gem_gpuva_set_lock().
   427	 *
   428	 * However, the GPU VA manager contains lockdep checks to ensure callers of its
   429	 * API hold the corresponding lock whenever the &drm_gem_objects GPU VA list is
   430	 * accessed by functions such as drm_gpuva_link() or drm_gpuva_unlink(), but
   431	 * also drm_gpuvm_bo_obtain() and drm_gpuvm_bo_put().
   432	 *
   433	 * The latter is required since on creation and destruction of a &drm_gpuvm_bo
   434	 * the &drm_gpuvm_bo is attached / removed from the &drm_gem_objects gpuva list.
   435	 * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm and
   436	 * &drm_gem_object must be able to observe previous creations and destructions
   437	 * of &drm_gpuvm_bos in order to keep instances unique.
   438	 *
   439	 * The &drm_gpuvm's lists for keeping track of external and evicted objects are
   440	 * protected against concurrent insertion / removal and iteration internally.
   441	 *
   442	 * However, drivers still need ensure to protect concurrent calls to functions
   443	 * iterating those lists, such as drm_gpuvm_validate() and
   444	 * drm_gpuvm_prepare_objects(). Every such function contains a particular
   445	 * comment and lockdep checks if possible.
   446	 *
   447	 * Functions adding or removing entries from those lists, such as
   448	 * drm_gpuvm_bo_evict() or drm_gpuvm_bo_extobj_add() may be called with external
   449	 * locks being held, e.g. in order to avoid the corresponding list to be
   450	 * (safely) modified while potentially being iternated by other API functions.
   451	 * However, this is entirely optional.
   452	 */
   453	
   454	/**
   455	 * DOC: Examples
   456	 *
   457	 * This section gives two examples on how to let the DRM GPUVA Manager generate
   458	 * &drm_gpuva_op in order to satisfy a given map or unmap request and how to
   459	 * make use of them.
   460	 *
   461	 * The below code is strictly limited to illustrate the generic usage pattern.
   462	 * To maintain simplicitly, it doesn't make use of any abstractions for common
   463	 * code, different (asyncronous) stages with fence signalling critical paths,
   464	 * any other helpers or error handling in terms of freeing memory and dropping
   465	 * previously taken locks.
   466	 *
   467	 * 1) Obtain a list of &drm_gpuva_op to create a new mapping::
   468	 *
   469	 *	// Allocates a new &drm_gpuva.
   470	 *	struct drm_gpuva * driver_gpuva_alloc(void);
   471	 *
   472	 *	// Typically drivers would embedd the &drm_gpuvm and &drm_gpuva
   473	 *	// structure in individual driver structures and lock the dma-resv with
   474	 *	// drm_exec or similar helpers.
   475	 *	int driver_mapping_create(struct drm_gpuvm *gpuvm,
   476	 *				  u64 addr, u64 range,
   477	 *				  struct drm_gem_object *obj, u64 offset)
   478	 *	{
   479	 *		struct drm_gpuva_ops *ops;
   480	 *		struct drm_gpuva_op *op
   481	 *		struct drm_gpuvm_bo *vm_bo;
   482	 *
   483	 *		driver_lock_va_space();
   484	 *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
   485	 *						  obj, offset);
   486	 *		if (IS_ERR(ops))
   487	 *			return PTR_ERR(ops);
   488	 *
   489	 *		vm_bo = drm_gpuvm_bo_obtain(gpuvm, obj);
   490	 *		if (IS_ERR(vm_bo))
   491	 *			return PTR_ERR(vm_bo);
   492	 *
   493	 *		drm_gpuva_for_each_op(op, ops) {
   494	 *			struct drm_gpuva *va;
   495	 *
   496	 *			switch (op->op) {
   497	 *			case DRM_GPUVA_OP_MAP:
   498	 *				va = driver_gpuva_alloc();
   499	 *				if (!va)
   500	 *					; // unwind previous VA space updates,
   501	 *					  // free memory and unlock
   502	 *
   503	 *				driver_vm_map();
   504	 *				drm_gpuva_map(gpuvm, va, &op->map);
   505	 *				drm_gpuva_link(va, vm_bo);
   506	 *
   507	 *				break;
   508	 *			case DRM_GPUVA_OP_REMAP: {
   509	 *				struct drm_gpuva *prev = NULL, *next = NULL;
   510	 *
   511	 *				va = op->remap.unmap->va;
   512	 *
   513	 *				if (op->remap.prev) {
   514	 *					prev = driver_gpuva_alloc();
   515	 *					if (!prev)
   516	 *						; // unwind previous VA space
   517	 *						  // updates, free memory and
   518	 *						  // unlock
   519	 *				}
   520	 *
   521	 *				if (op->remap.next) {
   522	 *					next = driver_gpuva_alloc();
   523	 *					if (!next)
   524	 *						; // unwind previous VA space
   525	 *						  // updates, free memory and
   526	 *						  // unlock
   527	 *				}
   528	 *
   529	 *				driver_vm_remap();
   530	 *				drm_gpuva_remap(prev, next, &op->remap);
   531	 *
   532	 *				if (prev)
   533	 *					drm_gpuva_link(prev, va->vm_bo);
   534	 *				if (next)
   535	 *					drm_gpuva_link(next, va->vm_bo);
   536	 *				drm_gpuva_unlink(va);
   537	 *
   538	 *				break;
   539	 *			}
   540	 *			case DRM_GPUVA_OP_UNMAP:
   541	 *				va = op->unmap->va;
   542	 *
   543	 *				driver_vm_unmap();
   544	 *				drm_gpuva_unlink(va);
   545	 *				drm_gpuva_unmap(&op->unmap);
   546	 *
   547	 *				break;
   548	 *			default:
   549	 *				break;
   550	 *			}
   551	 *		}
   552	 *		drm_gpuvm_bo_put(vm_bo);
   553	 *		driver_unlock_va_space();
   554	 *
   555	 *		return 0;
   556	 *	}
   557	 *
   558	 * 2) Receive a callback for each &drm_gpuva_op to create a new mapping::
   559	 *
   560	 *	struct driver_context {
   561	 *		struct drm_gpuvm *gpuvm;
   562	 *		struct drm_gpuvm_bo *vm_bo;
   563	 *		struct drm_gpuva *new_va;
   564	 *		struct drm_gpuva *prev_va;
   565	 *		struct drm_gpuva *next_va;
   566	 *	};
   567	 *
   568	 *	// ops to pass to drm_gpuvm_init()
   569	 *	static const struct drm_gpuvm_ops driver_gpuvm_ops = {
   570	 *		.sm_step_map = driver_gpuva_map,
   571	 *		.sm_step_remap = driver_gpuva_remap,
   572	 *		.sm_step_unmap = driver_gpuva_unmap,
   573	 *	};
   574	 *
   575	 *	// Typically drivers would embedd the &drm_gpuvm and &drm_gpuva
   576	 *	// structure in individual driver structures and lock the dma-resv with
   577	 *	// drm_exec or similar helpers.
   578	 *	int driver_mapping_create(struct drm_gpuvm *gpuvm,
   579	 *				  u64 addr, u64 range,
   580	 *				  struct drm_gem_object *obj, u64 offset)
   581	 *	{
   582	 *		struct driver_context ctx;
   583	 *		struct drm_gpuvm_bo *vm_bo;
   584	 *		struct drm_gpuva_ops *ops;
   585	 *		struct drm_gpuva_op *op;
   586	 *		int ret = 0;
   587	 *
   588	 *		ctx.gpuvm = gpuvm;
   589	 *
   590	 *		ctx.new_va = kzalloc(sizeof(*ctx.new_va), GFP_KERNEL);
   591	 *		ctx.prev_va = kzalloc(sizeof(*ctx.prev_va), GFP_KERNEL);
   592	 *		ctx.next_va = kzalloc(sizeof(*ctx.next_va), GFP_KERNEL);
   593	 *		ctx.vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
   594	 *		if (!ctx.new_va || !ctx.prev_va || !ctx.next_va || !vm_bo) {
   595	 *			ret = -ENOMEM;
   596	 *			goto out;
   597	 *		}
   598	 *
   599	 *		// Typically protected with a driver specific GEM gpuva lock
   600	 *		// used in the fence signaling path for drm_gpuva_link() and
   601	 *		// drm_gpuva_unlink(), hence pre-allocate.
   602	 *		ctx.vm_bo = drm_gpuvm_bo_obtain_prealloc(ctx.vm_bo);
   603	 *
   604	 *		driver_lock_va_space();
   605	 *		ret = drm_gpuvm_sm_map(gpuvm, &ctx, addr, range, obj, offset);
   606	 *		driver_unlock_va_space();
   607	 *
   608	 *	out:
   609	 *		drm_gpuvm_bo_put(ctx.vm_bo);
   610	 *		kfree(ctx.new_va);
   611	 *		kfree(ctx.prev_va);
   612	 *		kfree(ctx.next_va);
   613	 *		return ret;
   614	 *	}
   615	 *
   616	 *	int driver_gpuva_map(struct drm_gpuva_op *op, void *__ctx)
   617	 *	{
   618	 *		struct driver_context *ctx = __ctx;
   619	 *
   620	 *		drm_gpuva_map(ctx->vm, ctx->new_va, &op->map);
   621	 *
   622	 *		drm_gpuva_link(ctx->new_va, ctx->vm_bo);
   623	 *
   624	 *		// prevent the new GPUVA from being freed in
   625	 *		// driver_mapping_create()
   626	 *		ctx->new_va = NULL;
   627	 *
   628	 *		return 0;
   629	 *	}
   630	 *
   631	 *	int driver_gpuva_remap(struct drm_gpuva_op *op, void *__ctx)
   632	 *	{
   633	 *		struct driver_context *ctx = __ctx;
   634	 *		struct drm_gpuva *va = op->remap.unmap->va;
   635	 *
   636	 *		drm_gpuva_remap(ctx->prev_va, ctx->next_va, &op->remap);
   637	 *
   638	 *		if (op->remap.prev) {
   639	 *			drm_gpuva_link(ctx->prev_va, va->vm_bo);
   640	 *			ctx->prev_va = NULL;
   641	 *		}
   642	 *
   643	 *		if (op->remap.next) {
   644	 *			drm_gpuva_link(ctx->next_va, va->vm_bo);
   645	 *			ctx->next_va = NULL;
   646	 *		}
   647	 *
   648	 *		drm_gpuva_unlink(va);
   649	 *		kfree(va);
   650	 *
   651	 *		return 0;
   652	 *	}
   653	 *
   654	 *	int driver_gpuva_unmap(struct drm_gpuva_op *op, void *__ctx)
   655	 *	{
   656	 *		drm_gpuva_unlink(op->unmap.va);
   657	 *		drm_gpuva_unmap(&op->unmap);
   658	 *		kfree(op->unmap.va);
   659	 *
   660	 *		return 0;
   661	 *	}
   662	 */
   663	
   664	/**
   665	 * get_next_vm_bo_from_list() - get the next vm_bo element
   666	 * @__gpuvm: The GPU VM
   667	 * @__list_name: The name of the list we're iterating on
   668	 * @__local_list: A pointer to the local list used to store already iterated items
   669	 * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
   670	 *
   671	 * This helper is here to provide lockless list iteration. Lockless as in, the
   672	 * iterator releases the lock immediately after picking the first element from
   673	 * the list, so list insertion deletion can happen concurrently.
   674	 *
   675	 * Elements popped from the original list are kept in a local list, so removal
   676	 * and is_empty checks can still happen while we're iterating the list.
   677	 */
   678	#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
   679		({										\
   680			struct drm_gpuvm_bo *__vm_bo;						\
   681												\
   682			drm_gpuvm_bo_put(__prev_vm_bo);						\
   683												\
   684			spin_lock(&(__gpuvm)->__list_name.lock);				\
   685			while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
   686				__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
   687							   struct drm_gpuvm_bo,			\
   688							   list.entry.__list_name);		\
   689				if (drm_gpuvm_bo_get_unless_zero(__vm_bo)) {			\
   690					list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
   691						       __local_list);				\
   692					break;							\
   693				} else {							\
   694					list_del_init(&(__vm_bo)->list.entry.__list_name);	\
   695					__vm_bo = NULL;						\
   696				}								\
   697			}									\
   698			spin_unlock(&(__gpuvm)->__list_name.lock);				\
   699												\
   700			__vm_bo;								\
   701		})
   702	
   703	/**
   704	 * for_each_vm_bo_in_list() - internal vm_bo list iterator
   705	 *
   706	 * This helper is here to provide lockless list iteration. Lockless as in, the
   707	 * iterator releases the lock immediately after picking the first element from the
   708	 * list, so list insertion and deletion can happen concurrently.
   709	 *
   710	 * Typical use:
   711	 *
   712	 *	struct drm_gpuvm_bo *vm_bo;
   713	 *	LIST_HEAD(my_local_list);
   714	 *
   715	 *	ret = 0;
   716	 *	drm_gpuvm_for_each_vm_bo(gpuvm, <list_name>, &my_local_list, vm_bo) {
   717	 *		ret = do_something_with_vm_bo(..., vm_bo);
   718	 *		if (ret)
   719	 *			break;
   720	 *	}
   721	 *	drm_gpuvm_bo_put(vm_bo);
   722	 *	drm_gpuvm_restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);
   723	 *
   724	 *
   725	 * Only used for internal list iterations, not meant to be exposed to the outside
   726	 * world.
   727	 */
   728	#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
   729		for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
   730							__local_list, NULL);		\
   731		     __vm_bo;								\
   732		     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
   733							__local_list, __vm_bo))		\
 > 734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
