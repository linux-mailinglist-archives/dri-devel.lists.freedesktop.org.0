Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E0D2DE94
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95A010E22C;
	Fri, 16 Jan 2026 08:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRfVYLCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF81410E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768551592; x=1800087592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CgknGuh2zD1AtzufF5p3XF3o0fsNUQ8YV94B8JUrEL0=;
 b=BRfVYLCBfb3eExYnwDOjddhKRprC0oFfDHmF6qNcWUhiQDhQEn0zKMh7
 Nev0Hw4A+PW01DE4CnTrWFmItPsfmzVObXMG7w8+wGjXbRxpQQCzQ9W+e
 WVYiDQMGa7vHAOzGwA1iM54wiif7m74C6KLsoA6sN2Rs8rdD75ot8CFpa
 TB+gWAo7GW5ji0fzs+5CBdw7cbqq1yBafLS8JVFyeTckM2kReXYgGv3Wa
 9KUxG/SPsQMo9IPs5z0s8dhu4PjgujYpYf3GTwuKLdIqmb/+cX6N2z20E
 eEMi0b4zX7TIYUX23JjxJCJH2YMusDo/cR/cSFbU6pldsotMBw8ReIji4 Q==;
X-CSE-ConnectionGUID: v+tcTkX9SG2o2Rl8d3tuig==
X-CSE-MsgGUID: xqRCsEuGSACzIGLnwRAUYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69778483"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="69778483"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:19:51 -0800
X-CSE-ConnectionGUID: Z954urQ6QauRKbvbaOBlbA==
X-CSE-MsgGUID: tSXl33nARHCHQQK6lsdP9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="210049819"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 00:19:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vgf3Y-00000000KZS-1MhZ;
 Fri, 16 Jan 2026 08:19:44 +0000
Date: Fri, 16 Jan 2026 16:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akash Goel <akash.goel@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: Re: [PATCH v1 6/9] drm/panthor: Lazily allocate pages on mmap()
Message-ID: <202601161646.7Uuv5fVY-lkp@intel.com>
References: <20260109130801.1239558-7-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109130801.1239558-7-boris.brezillon@collabora.com>
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

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-gem-Consider-GEM-object-reclaimable-if-shrinking-fails/20260109-211034
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260109130801.1239558-7-boris.brezillon%40collabora.com
patch subject: [PATCH v1 6/9] drm/panthor: Lazily allocate pages on mmap()
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260116/202601161646.7Uuv5fVY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161646.7Uuv5fVY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161646.7Uuv5fVY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_gem.c: In function 'insert_page':
>> drivers/gpu/drm/panthor/panthor_gem.c:625:20: warning: unused variable 'ret' [-Wunused-variable]
     625 |         vm_fault_t ret;
         |                    ^~~


vim +/ret +625 drivers/gpu/drm/panthor/panthor_gem.c

   621	
   622	static vm_fault_t insert_page(struct vm_fault *vmf, struct page *page)
   623	{
   624		struct vm_area_struct *vma = vmf->vma;
 > 625		vm_fault_t ret;
   626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
