Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE7B73AC62
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 00:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4112410E5B2;
	Thu, 22 Jun 2023 22:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0216610E5B2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 22:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687471853; x=1719007853;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BKdj/JadWCFUxAEp/Fu2mYUFLMkg1UeER0yJgeOg5Og=;
 b=mt/1GOIfrBGlDvsae0PKg8KeMwvkysyax1bEblYE0btbkYHWFTwcd9xx
 PqEL6DlFNG4mdTYJm72ua9CfrLXP7iy/2A66fqzANCPc/Ton+UnF202XU
 WsR8BPo+O1XDddppYsb+RGkds8ZjmHmbTK2xbIeNn2WGnwBHatAxz8VUe
 vdooXUgX/3cxjl1khXf4X0L+bl4N7ztwSXFqc1UBBW2ZERrh1ezQRokUx
 qMyvpll8OGJ0DxB2RHxQEePyiyCbMU+2LhH2VYNTFaOBBexBaOIOSCkWb
 kkJHs1gda2j3+sgk0Q4kVNZ3eexO2JBDEdUk7pKMb+Ox7iZL4JigSKkdI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350388260"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="350388260"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 15:10:51 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="749508768"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="749508768"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 22 Jun 2023 15:10:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qCSVr-0007mx-06;
 Thu, 22 Jun 2023 22:10:47 +0000
Date: Fri, 23 Jun 2023 06:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 2/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <202306230534.TIq82gef-lkp@intel.com>
References: <20230622072710.3707315-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622072710.3707315-3-vivek.kasireddy@intel.com>
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Michal Hocko <mhocko@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20230622]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip v6.4-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20230622-155402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230622072710.3707315-3-vivek.kasireddy%40intel.com
patch subject: [PATCH v1 2/2] udmabuf: Add back support for mapping hugetlb pages
config: openrisc-randconfig-c044-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230534.TIq82gef-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230534.TIq82gef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230534.TIq82gef-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/udmabuf.c:172:2-7: WARNING: NULL check before some freeing functions is not needed.
   drivers/dma-buf/udmabuf.c:360:2-7: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
