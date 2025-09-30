Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92386BACA1E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D80610E0BA;
	Tue, 30 Sep 2025 11:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+WHo3vt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFA18913D;
 Tue, 30 Sep 2025 11:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759230429; x=1790766429;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JkEgfrFobUvPs9WUhYazXemTzj5bNBhLW05gn5e7dd8=;
 b=C+WHo3vt7xPUc7iYxUexZY7llARR+9vmE9GiqLTQbjP9KWDIIzQLq0gG
 1vGubEAiZlfUN2Y+9Td/2XmpyyHDrBxCgBrFHuZPgYgDO8w8mlmynf8DY
 AjY0s5D9aXQf2R+YK1/w2IplSsJaF7XVpAumZaYHS6FolpznX2dsarh7q
 gpBhm1JU27ThKcPIbTXf4kIsI4AlRNsTADvD4nQiZ1pkK6Su2tusHqac1
 RIyA8MIzOR6J+tu+QstFVPTOQoJ6YhEhntg7kpA4y7NI6R4Z0qJZffHmf
 MvFhBRGcQBsIO9m6CfWE3hdWn8Yv83vnlGTkrRD9X8Zp687O5MiiU5Kle w==;
X-CSE-ConnectionGUID: ksomaVP7TvGJb0IHQ7TRSQ==
X-CSE-MsgGUID: KbpQtC7BR3qWkRLIfH4RFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72907810"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72907810"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:07:09 -0700
X-CSE-ConnectionGUID: MY9ov9QwQ5GXH8kC6Jesqg==
X-CSE-MsgGUID: HZtVzlPZRheexbv1wLS3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177763539"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 30 Sep 2025 04:07:01 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v3YCB-0001CR-16;
 Tue, 30 Sep 2025 11:06:59 +0000
Date: Tue, 30 Sep 2025 19:06:41 +0800
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
Subject: Re: [PATCH 4/8] drm/i915: Use huge tmpfs mount point helpers
Message-ID: <202509301837.pQ2TiJkx-lkp@intel.com>
References: <20250929200316.18417-5-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929200316.18417-5-loic.molinari@collabora.com>
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
patch link:    https://lore.kernel.org/r/20250929200316.18417-5-loic.molinari%40collabora.com
patch subject: [PATCH 4/8] drm/i915: Use huge tmpfs mount point helpers
config: i386-randconfig-013-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301837.pQ2TiJkx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301837.pQ2TiJkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301837.pQ2TiJkx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gemfs.c: In function 'i915_gemfs_init':
>> drivers/gpu/drm/i915/gem/i915_gemfs.c:29:17: error: implicit declaration of function 'drm_gem_shmem_huge_mnt_create' [-Wimplicit-function-declaration]
      29 |         gemfs = drm_gem_shmem_huge_mnt_create("within_size");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gem/i915_gemfs.c:29:15: error: assignment to 'struct vfsmount *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      29 |         gemfs = drm_gem_shmem_huge_mnt_create("within_size");
         |               ^
   drivers/gpu/drm/i915/gem/i915_gemfs.c: In function 'i915_gemfs_fini':
>> drivers/gpu/drm/i915/gem/i915_gemfs.c:46:9: error: implicit declaration of function 'drm_gem_shmem_huge_mnt_free' [-Wimplicit-function-declaration]
      46 |         drm_gem_shmem_huge_mnt_free(i915->mm.gemfs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_gem_shmem_huge_mnt_create +29 drivers/gpu/drm/i915/gem/i915_gemfs.c

     9	
    10	void i915_gemfs_init(struct drm_i915_private *i915)
    11	{
    12		struct vfsmount *gemfs;
    13	
    14		/*
    15		 * By creating our own shmemfs mountpoint, we can pass in
    16		 * mount flags that better match our usecase.
    17		 *
    18		 * One example, although it is probably better with a per-file
    19		 * control, is selecting huge page allocations ("huge=within_size").
    20		 * However, we only do so on platforms which benefit from it, or to
    21		 * offset the overhead of iommu lookups, where with latter it is a net
    22		 * win even on platforms which would otherwise see some performance
    23		 * regressions such a slow reads issue on Broadwell and Skylake.
    24		 */
    25	
    26		if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
    27			return;
    28	
  > 29		gemfs = drm_gem_shmem_huge_mnt_create("within_size");
    30		if (IS_ERR(gemfs))
    31			goto err;
    32	
    33		i915->mm.gemfs = gemfs;
    34		drm_info(&i915->drm, "Using Transparent Hugepages\n");
    35		return;
    36	
    37	err:
    38		drm_notice(&i915->drm,
    39			   "Transparent Hugepage support is recommended for optimal performance%s\n",
    40			   GRAPHICS_VER(i915) >= 11 ? " on this platform!" :
    41						      " when IOMMU is enabled!");
    42	}
    43	
    44	void i915_gemfs_fini(struct drm_i915_private *i915)
    45	{
  > 46		drm_gem_shmem_huge_mnt_free(i915->mm.gemfs);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
