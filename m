Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F14B43752
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 11:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EED410E9CD;
	Thu,  4 Sep 2025 09:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGUb4h7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEF310E9CC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 09:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756978689; x=1788514689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K2roMTDLYdK6snjjQKgov43nRYmQIvretg5aO99t3Kk=;
 b=WGUb4h7VUL1C/hjEP+PWe4rjNAy8F3dFZ8alE/6nJ2NNFMhUYoVmb3JC
 Vc0rSP4ji8jGoOWjmmq4myFqKifw8B2+HoEeYdrxEB81syVnpdE2sZiWM
 5RkNDb24Mo5nMVU1Ld4NAPLRlFaDK6ZpvXSnVjHhm2kjP6hbOsYxIsl2D
 +zO1FJRQnZlKgGVSpnAqsIuNy/Tzz8d1VUh0AMxZnYqZVN7nbZec50Z0D
 Yy2NJYO8l840dV0ElBL9UznDNCbvSzKLbGDMszWHOEAult4xpxcTbMwZa
 pYJcriGw4c5O6+QlYMqGSGOvlSonHAGjfJ8QwcTtt2vIPJT97Gn/2SvFO Q==;
X-CSE-ConnectionGUID: Oq7bzW23T5WyvL/Es/sccg==
X-CSE-MsgGUID: Lr/KSZCrTwakT6KEgXPVfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69926154"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="69926154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 02:38:08 -0700
X-CSE-ConnectionGUID: xspA0gIYSpSDftwk10r1cA==
X-CSE-MsgGUID: hrUIlaOmSLmIcge8I0Ymgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="209028838"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 04 Sep 2025 02:38:00 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uu6PE-00054F-11;
 Thu, 04 Sep 2025 09:37:32 +0000
Date: Thu, 4 Sep 2025 17:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [v4 05/15] mm/migrate_device: handle partially mapped folios
 during collection
Message-ID: <202509041732.UTJsw3LB-lkp@intel.com>
References: <20250903011900.3657435-6-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903011900.3657435-6-balbirs@nvidia.com>
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

Hi Balbir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on sj/damon/next linus/master v6.17-rc4 next-20250904]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-zone_device-support-large-zone-device-private-folios/20250903-092241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250903011900.3657435-6-balbirs%40nvidia.com
patch subject: [v4 05/15] mm/migrate_device: handle partially mapped folios during collection
config: arm64-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041732.UTJsw3LB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041732.UTJsw3LB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041732.UTJsw3LB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/migrate_device.c:66 function parameter 'folio' not described in 'migrate_vma_split_folio'
>> Warning: mm/migrate_device.c:66 function parameter 'fault_page' not described in 'migrate_vma_split_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
