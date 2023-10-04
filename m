Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1C37B76F8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 05:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE3610E32F;
	Wed,  4 Oct 2023 03:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A43D10E323;
 Wed,  4 Oct 2023 03:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696391689; x=1727927689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gw6rYXRCbRUHGgK7+O+B6viSGlrOBMQMDtbB2BWw1wk=;
 b=ASpgNDzWllzPRgSS5zJeuSy/c8PRVvlgyP0tqAfjs2xttjXmcpX/gYFf
 kRnns823R8invzMUZ4DV8E6CDpRKmORQooNLUVFCuZHE7mGGqHuUPkeRJ
 FCARNXnKpfqrstx1DnT3fEA2MGiLkH0Kj5weaYgPKdBPQuMZ0eFHDELYO
 iKQ2E4lOOdWn+tgyFKbFxsZAeJnegd6iVHQDaf5mtMqz90nE9F4rIRxOA
 h9cZqjK2pv6SJheVefbH5BfRunDK1+86HoRh8HZvf3OmHZIYw8v1YFzvH
 DKwqdSZahy+VW5t4Yhpr+1p5IJGPY5XSb4Xv91tVZUECwAX75OBshVJCm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1646073"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="1646073"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754685025"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="754685025"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 03 Oct 2023 20:54:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qnsyB-000Aqe-2C;
 Wed, 04 Oct 2023 03:54:43 +0000
Date: Wed, 4 Oct 2023 11:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: Deny copy-on-writes mmaps
Message-ID: <202310041156.Bi2Vshvb-lkp@intel.com>
References: <20231003230332.513051-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003230332.513051-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, oe-kbuild-all@lists.linux.dev,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.6-rc4 next-20231003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Shyti/dma-buf-Deny-copy-on-writes-mmaps/20231004-070556
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231003230332.513051-1-andi.shyti%40linux.intel.com
patch subject: [PATCH] dma-buf: Deny copy-on-writes mmaps
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231004/202310041156.Bi2Vshvb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310041156.Bi2Vshvb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310041156.Bi2Vshvb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/dma-buf.c: In function 'dma_buf_get_unmapped_area':
>> drivers/dma-buf/dma-buf.c:142:27: error: 'struct mm_struct' has no member named 'get_unmapped_area'
     142 |         return current->mm->get_unmapped_area(file, addr, len, pgoff, flags);
         |                           ^~
   drivers/dma-buf/dma-buf.c:143:1: error: control reaches end of non-void function [-Werror=return-type]
     143 | }
         | ^
   cc1: some warnings being treated as errors


vim +142 drivers/dma-buf/dma-buf.c

   131	
   132	static unsigned long
   133	dma_buf_get_unmapped_area(struct file *file,
   134				  unsigned long addr,
   135				  unsigned long len,
   136				  unsigned long pgoff,
   137				  unsigned long flags)
   138	{
   139		if ((flags & MAP_TYPE) == MAP_PRIVATE)
   140			return -EINVAL;
   141	
 > 142		return current->mm->get_unmapped_area(file, addr, len, pgoff, flags);
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
