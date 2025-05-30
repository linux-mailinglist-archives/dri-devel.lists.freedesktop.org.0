Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06243AC9177
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 16:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E58110E07D;
	Fri, 30 May 2025 14:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Brh41GAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C9710E878
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748615130; x=1780151130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ebhvap3uGIXeOkgxbWkbzYk5e87c3HNY7AXyqp6Ao+U=;
 b=Brh41GASw906Zq2wymreyUkNUseSjIORyNmoNi04O0FtNMtXYY8EF1N+
 h2H2YVv0mxQy6AfNlDSQDpxn7d/RwK7Uh787F5phwNq0LLGrPWRDzVAvo
 NiluEpqnouO2XeUjTe7moy1g3NFmQrYIS0+nC3ZE6swNXIvmwyMGVfez+
 Xhkae9tfNyuVywaSxD6jH3LAGl/9fGNdA9H+G4uPkt6ss9qxkALiRjS6I
 x5/wNmxunePTT/zf5uSWW7CpjVXUqYv3YFBDd+LTh+2P2UjVWELbBg37Q
 UalelwEdReieAc4ZpJWZjrTozQpVn+omFMBffVJehQCtK+TlI5XMVpeEL A==;
X-CSE-ConnectionGUID: iy0lJgmVQn+zkiNbjln7hw==
X-CSE-MsgGUID: z4+TCcCgQOShsO0HJZ4FeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61336576"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="61336576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 07:25:30 -0700
X-CSE-ConnectionGUID: ZKP7FC/5Re2B7jgQnKVX5w==
X-CSE-MsgGUID: Etq2N76sQ3mlvbSQ+wT7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="143855846"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 30 May 2025 07:25:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uL0fh-000XhK-1e;
 Fri, 30 May 2025 14:25:21 +0000
Date: Fri, 30 May 2025 22:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: wangtao <tao.wangtao@honor.com>, sumit.semwal@linaro.org,
 christian.koenig@amd.com, kraxel@redhat.com,
 vivek.kasireddy@intel.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, hughd@google.com, akpm@linux-foundation.org,
 amir73il@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 jack@suse.cz, baolin.wang@linux.alibaba.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 bintian.wang@honor.com, yipengxiang@honor.com, liulu.liu@honor.com,
 feng.han@honor.com, wangtao <tao.wangtao@honor.com>
Subject: Re: [PATCH v3 3/4] udmabuf: Implement udmabuf rw_file callback
Message-ID: <202505302235.mDzENMSm-lkp@intel.com>
References: <20250530103941.11092-4-tao.wangtao@honor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530103941.11092-4-tao.wangtao@honor.com>
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

Hi wangtao,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on next-20250530]
[cannot apply to linus/master v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wangtao/fs-allow-cross-FS-copy_file_range-for-memory-backed-files/20250530-184146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250530103941.11092-4-tao.wangtao%40honor.com
patch subject: [PATCH v3 3/4] udmabuf: Implement udmabuf rw_file callback
config: sparc64-randconfig-002-20250530 (https://download.01.org/0day-ci/archive/20250530/202505302235.mDzENMSm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505302235.mDzENMSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505302235.mDzENMSm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/dma-buf/udmabuf.c: In function 'udmabuf_rw_file':
>> drivers/dma-buf/udmabuf.c:298:25: error: storage size of 'iter' isn't known
     298 |         struct iov_iter iter;
         |                         ^~~~
>> drivers/dma-buf/udmabuf.c:299:45: error: 'ITER_SOURCE' undeclared (first use in this function)
     299 |         unsigned int direction = is_write ? ITER_SOURCE : ITER_DEST;
         |                                             ^~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:299:45: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/dma-buf/udmabuf.c:299:59: error: 'ITER_DEST' undeclared (first use in this function)
     299 |         unsigned int direction = is_write ? ITER_SOURCE : ITER_DEST;
         |                                                           ^~~~~~~~~
>> drivers/dma-buf/udmabuf.c:327:17: error: implicit declaration of function 'iov_iter_bvec'; did you mean 'bvec_iter_bvec'? [-Wimplicit-function-declaration]
     327 |                 iov_iter_bvec(&iter, direction, bvec, bv_idx, bv_total);
         |                 ^~~~~~~~~~~~~
         |                 bvec_iter_bvec
>> drivers/dma-buf/udmabuf.c:298:25: warning: unused variable 'iter' [-Wunused-variable]
     298 |         struct iov_iter iter;
         |                         ^~~~


vim +298 drivers/dma-buf/udmabuf.c

   286	
   287	static ssize_t udmabuf_rw_file(struct dma_buf *dmabuf, loff_t my_pos,
   288				struct file *other, loff_t pos,
   289				size_t count, bool is_write)
   290	{
   291		struct udmabuf *ubuf = dmabuf->priv;
   292		loff_t my_end = my_pos + count, bv_beg, bv_end = 0;
   293		pgoff_t pg_idx = my_pos / PAGE_SIZE;
   294		pgoff_t pg_end = DIV_ROUND_UP(my_end, PAGE_SIZE);
   295		size_t i, bv_off, bv_len, bv_num, bv_idx = 0, bv_total = 0;
   296		struct bio_vec *bvec;
   297		struct kiocb kiocb;
 > 298		struct iov_iter iter;
 > 299		unsigned int direction = is_write ? ITER_SOURCE : ITER_DEST;
   300		ssize_t ret = 0, rw_total = 0;
   301		struct folio *folio;
   302	
   303		bv_num = min_t(size_t, pg_end - pg_idx + 1, 1024);
   304		bvec = kvcalloc(bv_num, sizeof(*bvec), GFP_KERNEL);
   305		if (!bvec)
   306			return -ENOMEM;
   307	
   308		init_sync_kiocb(&kiocb, other);
   309		kiocb.ki_pos = pos;
   310	
   311		for (i = 0; i < ubuf->nr_pinned && my_pos < my_end; i++) {
   312			folio = ubuf->pinned_folios[i];
   313			bv_beg = bv_end;
   314			bv_end += folio_size(folio);
   315			if (bv_end <= my_pos)
   316				continue;
   317	
   318			bv_len = min(bv_end, my_end) - my_pos;
   319			bv_off = my_pos - bv_beg;
   320			my_pos += bv_len;
   321			bv_total += bv_len;
   322			bvec_set_page(&bvec[bv_idx], &folio->page, bv_len, bv_off);
   323			if (++bv_idx < bv_num && my_pos < my_end)
   324				continue;
   325	
   326			/* start R/W if bvec is full or count reaches zero. */
 > 327			iov_iter_bvec(&iter, direction, bvec, bv_idx, bv_total);
   328			if (is_write)
   329				ret = other->f_op->write_iter(&kiocb, &iter);
   330			else
   331				ret = other->f_op->read_iter(&kiocb, &iter);
   332			if (ret <= 0)
   333				break;
   334			rw_total += ret;
   335			if (ret < bv_total || fatal_signal_pending(current))
   336				break;
   337	
   338			bv_idx = bv_total = 0;
   339		}
   340		kvfree(bvec);
   341	
   342		return rw_total > 0 ? rw_total : ret;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
