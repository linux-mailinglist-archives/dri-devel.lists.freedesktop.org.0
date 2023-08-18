Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB1A780604
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 08:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A1310E467;
	Fri, 18 Aug 2023 06:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F49810E467
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 06:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692341742; x=1723877742;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mHNsFXuEtXzAhgoCApLvFOIEZkFl/CS5g6nQfFPQhMU=;
 b=mWln8Xgq+j47hfXBcR/Q/uzWDudd4ipci88K8Vhz+nFYzI8o/NHRDyM3
 O1GnYMj7s9Dty3XMvYdOTpwvF9VZKYBkw999zCxvGYYjOEafJd/fGWayy
 ydcklVJzditqwFLd+4TpDlOVTq9T8wuZu6aUlZxRfL+dJxhwxdLQK3xvd
 0uiQNL0Kt/2rYjZWfWnOMmbfPmiEDDlsg6jHCiJOh3WEuAGWbLFcC5k9P
 r0uEu9tcEADfClP/h5ZJd6ETRm+KgDlAV4a3hVTYrh+w8z5uMtRHbpG5H
 Nsq0Q+OQE1WLBxjIid2hgsR1LjxtfLZu8cihA7i12LrCjvMdcyvk44wdg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="436943523"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="436943523"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 23:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858563690"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="858563690"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 23:55:38 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qWtNU-0002Be-2R;
 Fri, 18 Aug 2023 06:54:42 +0000
Date: Fri, 18 Aug 2023 14:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 1/2] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for
 handling mmap
Message-ID: <202308181405.UwIsWuMi-lkp@intel.com>
References: <20230817064623.3424348-2-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817064623.3424348-2-vivek.kasireddy@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, llvm@lists.linux.dev,
 Hugh Dickins <hughd@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Peter Xu <peterx@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 oe-kbuild-all@lists.linux.dev, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivek,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20230817-150922
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230817064623.3424348-2-vivek.kasireddy%40intel.com
patch subject: [PATCH v3 1/2] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
config: arm-randconfig-r035-20230818 (https://download.01.org/0day-ci/archive/20230818/202308181405.UwIsWuMi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181405.UwIsWuMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181405.UwIsWuMi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vmf_insert_pfn
   >>> referenced by udmabuf.c:44 (drivers/dma-buf/udmabuf.c:44)
   >>>               drivers/dma-buf/udmabuf.o:(udmabuf_vm_fault) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
