Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F03780146
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 00:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AEC10E17B;
	Thu, 17 Aug 2023 22:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1066D10E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 22:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692312584; x=1723848584;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+fjmUkPDQDasNTVGAELP5F3mePImJMGZ5X3pJTt8eV4=;
 b=fSLmFo7qsL5jIhwWq4sfkSSvJtUSl5W/37VY0PzirsgSMKD1ce2n7uCw
 +8ik6MjKRKbZSrKw4cZ8Dey5q+NMH+VvaQLgTIA+nI0oQ8dstPhSiv26R
 NEU81XmT8FKogSNuXkEnlDbbvIeGCB2iTPFJfRwnscs4cda4uVd1fuYKv
 MhObj9lfgTjkR+ahe+VeukgljQCfpokAIZQKz5Q7Z3GY+2oiqhSN5gOND
 IJsvP+1+qySkzAPZMmNxMyS367eCQSro8w2FW0UGTox/Re9sMJ5JwDYx2
 KsufgkM6eVzQkLytamgDT3srw4LaceVZ79X0yD3VcNATqc+xQTD0y78jX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403931312"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="403931312"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 15:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858411483"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="858411483"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 15:49:39 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qWloA-0001X9-3D;
 Thu, 17 Aug 2023 22:49:38 +0000
Date: Fri, 18 Aug 2023 06:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 1/2] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for
 handling mmap
Message-ID: <202308180617.Rl3Qsrnt-lkp@intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, oe-kbuild-all@lists.linux.dev,
 Mike Kravetz <mike.kravetz@oracle.com>
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
config: sh-randconfig-r004-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180617.Rl3Qsrnt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180617.Rl3Qsrnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180617.Rl3Qsrnt-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
>> udmabuf.c:(.text+0xd8): undefined reference to `vmf_insert_pfn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
