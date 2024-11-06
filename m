Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9189BF315
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 17:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8330710E2E8;
	Wed,  6 Nov 2024 16:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkZnLSUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B42C10E2E8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730909965; x=1762445965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=syEZ0PUhB/s8AY7uLWeu+hDKYqIIr8eprxynDeL1Ahk=;
 b=NkZnLSURELpI5T5F2U3cjvblm2FSMoGhqPwwK/Yl8hGsbjXQwtNCawbt
 n7sd3XI/CEJS5jZfJzKimMi6ZX2JDW0bnCvnUh/kjf+DW3DqpW+STAifw
 oHP3kPjdMF+q2zVDNbC/8Qpeg4Nz+OishY5s7o1z052nR+yCR1uzbHEY5
 zJjdwSQlLsjm6MbcGqjlxLc35LkS9PhgJw6xG6xE3y0NTdo8v2uldrHa2
 P2Pjxb1xkYbsBfXXQKV/DsXNoH0PQ0oopyZI5kde9M/YAX0toXCwYvV4P
 rcro7OdrA9VN73iOr+DlDQMrnnzQaYn33xQskgE6avpsruRa2rlTIYoQd A==;
X-CSE-ConnectionGUID: 2kdGi6EITxu27NcOgtcD3w==
X-CSE-MsgGUID: kmED28sLQMSznpRr/VLyhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30934263"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="30934263"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 08:19:24 -0800
X-CSE-ConnectionGUID: lhPZUfgZRP+LsZXDQg+Ong==
X-CSE-MsgGUID: l2Tmkid3R9mXOwIn9SXByg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="88587679"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2024 08:19:22 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8ika-000p7A-0d;
 Wed, 06 Nov 2024 16:19:20 +0000
Date: Thu, 7 Nov 2024 00:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 3/4] drm/mode_object: add
 drm_mode_object_read_refcount()
Message-ID: <202411070038.tZJzI7NC-lkp@intel.com>
References: <20241106-drm-small-improvements-v2-3-f6e2aef86719@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-drm-small-improvements-v2-3-f6e2aef86719@bootlin.com>
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

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 42f7652d3eb527d03665b09edac47f85fb600924]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-drm_mode_object-fix-typo-in-kerneldoc/20241106-185032
base:   42f7652d3eb527d03665b09edac47f85fb600924
patch link:    https://lore.kernel.org/r/20241106-drm-small-improvements-v2-3-f6e2aef86719%40bootlin.com
patch subject: [PATCH v2 3/4] drm/mode_object: add drm_mode_object_read_refcount()
config: arc-randconfig-002-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070038.tZJzI7NC-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070038.tZJzI7NC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070038.tZJzI7NC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_mode_object.c:228: warning: expecting prototype for drm_mode_object_get(). Prototype was for drm_mode_object_read_refcount() instead


vim +228 drivers/gpu/drm/drm_mode_object.c

   219	
   220	/**
   221	 * drm_mode_object_get - read the refcount for a mode object
   222	 * @obj: DRM mode object
   223	 *
   224	 * This function returns the current object's refcount if it is a
   225	 * refcounted modeset object, or 0 on any other object.
   226	 */
   227	unsigned int drm_mode_object_read_refcount(struct drm_mode_object *obj)
 > 228	{
   229		unsigned int refcount = 0;
   230	
   231		if (obj->free_cb) {
   232			refcount = kref_read(&obj->refcount);
   233			DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, refcount);
   234		}
   235	
   236		return refcount;
   237	}
   238	EXPORT_SYMBOL(drm_mode_object_read_refcount);
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
