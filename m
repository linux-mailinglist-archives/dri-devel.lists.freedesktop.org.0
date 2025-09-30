Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43629BAC856
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7626C10E561;
	Tue, 30 Sep 2025 10:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOhG212l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C7C10E560;
 Tue, 30 Sep 2025 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759228621; x=1790764621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sbz5AL1wVvoPI4VgrY33BmNwLhxdJAx+xAgmOKchchs=;
 b=gOhG212lYe7nM4+126PMGBLhNV2b8krkSQwam1YrdfMFLqQvRVYAdqbO
 nw5UvIkn0YKJKI0mQxU4Vns7Lu30uUpnoxh8z6bDlVqrfF1whMmJq2F/3
 4ZEfekh/DNW3tjMOpCyKqBUw/z6lp+5hIrl4lQ3bzGc7JtLDx97RFjuGB
 5advPSwlgVPGaoSYLsJq6yaj1kUg/nlPjtnuGoUuPHu7eVr/8qe9cLYiN
 Ml/aoFqVAYjuTZGKgGVw7jYzBU1tEXnEUOr6l6pI8oegiXF0qLMC9ejZw
 BeQHmCfw2Vnn5ZeI1wIengDGZ3jxo40XG+9L+xzUnjmjOkBvQT1CS6Iku g==;
X-CSE-ConnectionGUID: Cqa02X+TQn6/Ezz9XfPeQw==
X-CSE-MsgGUID: GtU08NWcRdGtDi3zkjotRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61589875"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61589875"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:37:00 -0700
X-CSE-ConnectionGUID: 1JEwtSrhQpaqBfQvrOYe3A==
X-CSE-MsgGUID: ORJaRpGvQfCsMc7rucxYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178283490"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 30 Sep 2025 03:36:52 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v3Xj0-0001Ax-0s;
 Tue, 30 Sep 2025 10:36:50 +0000
Date: Tue, 30 Sep 2025 18:36:07 +0800
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
Subject: Re: [PATCH 6/8] drm/panthor: Introduce huge tmpfs mount point option
Message-ID: <202509301834.aoEcLO0C-lkp@intel.com>
References: <20250929200316.18417-7-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929200316.18417-7-loic.molinari@collabora.com>
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
[cannot apply to akpm-mm/mm-everything linus/master v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Add-huge-page-fault-handler/20250930-040600
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250929200316.18417-7-loic.molinari%40collabora.com
patch subject: [PATCH 6/8] drm/panthor: Introduce huge tmpfs mount point option
config: i386-buildonly-randconfig-004-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301834.aoEcLO0C-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301834.aoEcLO0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301834.aoEcLO0C-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_gem.c: In function 'panthor_gem_init':
>> drivers/gpu/drm/panthor/panthor_gem.c:24:14: error: 'panthor_transparent_hugepage' undeclared (first use in this function); did you mean 'has_transparent_hugepage'?
      24 |         if (!panthor_transparent_hugepage)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              has_transparent_hugepage
   drivers/gpu/drm/panthor/panthor_gem.c:24:14: note: each undeclared identifier is reported only once for each function it appears in


vim +24 drivers/gpu/drm/panthor/panthor_gem.c

    19	
    20	void panthor_gem_init(struct panthor_device *ptdev)
    21	{
    22		struct vfsmount *huge_mnt;
    23	
  > 24		if (!panthor_transparent_hugepage)
    25			return;
    26	
    27		huge_mnt = drm_gem_shmem_huge_mnt_create("within_size");
    28		if (IS_ERR(huge_mnt)) {
    29			drm_warn(&ptdev->base, "Can't use Transparent Hugepage (%ld)\n",
    30				 PTR_ERR(huge_mnt));
    31			return;
    32		}
    33	
    34		ptdev->huge_mnt = huge_mnt;
    35	
    36		drm_info(&ptdev->base, "Using Transparent Hugepage\n");
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
