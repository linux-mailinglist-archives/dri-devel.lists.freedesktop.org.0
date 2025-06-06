Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBFBAD08D2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 21:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F1B10EB85;
	Fri,  6 Jun 2025 19:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRF5+ni5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CC710E282;
 Fri,  6 Jun 2025 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749239247; x=1780775247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=waQvTFW1Tv1+HpQpBDsNKSK2lSYc7esWz0DnZzD7BfE=;
 b=XRF5+ni57zsDuhXYJVPx4y5MjTmDRt0RyjKT2+Yh2/aj4WtqAqdmRYWZ
 wRfWapxpXKFP4Q6szVEdfP3JxrrXhCgy89pff1lJC8lFqVJVeX+l/jwKd
 VL/6Eynzl5s+6VL5EZf8lwsbOqnP08p5OKp2xAxBbVxBt5kvTkLXuWxfT
 fpa4AQDUU/WTvvfgd7p2pml+9sNLugP/N2cY+VS8f6DY737KxTRGa9uxZ
 OaDb7meroAJcNELvJwqK4hWPWelIZq7APQ+gpo1DOMzg7kKabhPtjkuoo
 PcPeJ0KFHfUQXavz08t2LYs4+IvIIdrk0oy7/1/UG6S6MFOfNN6sNBgPi Q==;
X-CSE-ConnectionGUID: GuYL5JR4SQqxEp9zZ5mrgA==
X-CSE-MsgGUID: 9sb3KN4CShawgJaJfEl3Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61665408"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="61665408"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:47:27 -0700
X-CSE-ConnectionGUID: IjxxRQuWQ+q54FJCWZ6g+g==
X-CSE-MsgGUID: vgUl0eiYTQuEPBq2cfEHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="150925381"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 06 Jun 2025 12:47:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uNd27-0005FJ-17;
 Fri, 06 Jun 2025 19:47:19 +0000
Date: Sat, 7 Jun 2025 03:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v8 4/9] drm/ttm: Add ttm_bo_kmap_try_from_panic()
Message-ID: <202506070340.P5oZoRwh-lkp@intel.com>
References: <20250606120519.753928-5-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606120519.753928-5-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7247efca0dcbc8ac6147db9200ed1549c0662465]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-i915-fbdev-Add-intel_fbdev_get_map/20250606-200804
base:   7247efca0dcbc8ac6147db9200ed1549c0662465
patch link:    https://lore.kernel.org/r/20250606120519.753928-5-jfalempe%40redhat.com
patch subject: [PATCH v8 4/9] drm/ttm: Add ttm_bo_kmap_try_from_panic()
config: x86_64-buildonly-randconfig-001-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070340.P5oZoRwh-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070340.P5oZoRwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070340.P5oZoRwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_bo_util.c:381: warning: Cannot understand  *
    on line 381 - I thought it was a doc line


vim +381 drivers/gpu/drm/ttm/ttm_bo_util.c

   379	
   380	/**
 > 381	 *
   382	 * ttm_bo_kmap_try_from_panic
   383	 *
   384	 * @bo: The buffer object
   385	 * @page: The page to map
   386	 *
   387	 * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
   388	 * This can safely be called from the panic handler, if you make sure the bo
   389	 * is the one being displayed, so is properly allocated, and won't be modified.
   390	 *
   391	 * Returns the vaddr, that you can use to write to the bo, and that you should
   392	 * pass to kunmap_local() when you're done with this page, or NULL if the bo
   393	 * is in iomem.
   394	 */
   395	void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
   396	{
   397		if (page + 1 > PFN_UP(bo->resource->size))
   398			return NULL;
   399	
   400		if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
   401			return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
   402	
   403		return NULL;
   404	}
   405	EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
