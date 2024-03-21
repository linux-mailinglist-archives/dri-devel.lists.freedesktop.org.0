Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986988559B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 09:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE6C10E266;
	Thu, 21 Mar 2024 08:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ku0gceTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE6010E261
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711009422; x=1742545422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ICh11Y75BvftoU+591L7NnAkxkEdEjRgHnNIeW21dlM=;
 b=ku0gceTrJ9T31iuBttUxptKAxgyUbvja8BvDYXqE2gxdkV/1XA+EHfzn
 X5vrJ3Jd+JwQ7jZGpwyrsleSEZTS6A9lwjvCJCtQr5bEk05eO4rqR9MtR
 ZV7srUeV8DjXzHHnomdQDCYq7Dw9iZX4p9Cb8yh2d9zACe/RPJQ34p2B1
 gBWhP4H8yVi9dgwqaXJiOBST5PIqbp1K5WvVClRFZ6RFLr+pdslDIs393
 H9fJt9BU/YCb00nWMr+gmmcbyz/NSlDudkASEbURU3HOHsfDyoZ/V4XPc
 k270+WDSislBb3m3mnr3nDirAemUqIWVBFGoYAQGzrDOZZmCM1II9OsHb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6591108"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6591108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 01:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19148518"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 21 Mar 2024 01:23:39 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rnDi4-000JGt-2I;
 Thu, 21 Mar 2024 08:23:36 +0000
Date: Thu, 21 Mar 2024 16:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 13/13] drm/ast: Automatically clean up poll helper
Message-ID: <202403211604.aM8tDovD-lkp@intel.com>
References: <20240320093738.6341-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320093738.6341-14-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8 next-20240320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-ast-Include-linux-of-h-where-necessary/20240320-174013
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240320093738.6341-14-tzimmermann%40suse.de
patch subject: [PATCH v5 13/13] drm/ast: Automatically clean up poll helper
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240321/202403211604.aM8tDovD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211604.aM8tDovD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211604.aM8tDovD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_probe_helper.c:965: warning: expecting prototype for devm_drm_kms_helper_poll_init(). Prototype was for drmm_kms_helper_poll_init() instead


vim +965 drivers/gpu/drm/drm_probe_helper.c

   950	
   951	/**
   952	 * devm_drm_kms_helper_poll_init - initialize and enable output polling
   953	 * @dev: drm_device
   954	 *
   955	 * This function initializes and then also enables output polling support for
   956	 * @dev similar to drm_kms_helper_poll_init(). Polling will automatically be
   957	 * cleaned up when the DRM device goes away.
   958	 *
   959	 * See drm_kms_helper_poll_init() for more information.
   960	 *
   961	 * Returns:
   962	 * 0 on success, or a negative errno code otherwise.
   963	 */
   964	int drmm_kms_helper_poll_init(struct drm_device *dev)
 > 965	{
   966		drm_kms_helper_poll_init(dev);
   967	
   968		return drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_release, dev);
   969	}
   970	EXPORT_SYMBOL(drmm_kms_helper_poll_init);
   971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
