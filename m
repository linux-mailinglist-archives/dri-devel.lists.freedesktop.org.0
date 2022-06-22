Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4573155535B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 20:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6162710E3A6;
	Wed, 22 Jun 2022 18:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7055910E3A6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655923079; x=1687459079;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lQOlUxYNuQVcl+FmODxwBbN5EVVDPtYIogkxmeyIqIo=;
 b=I6gDQYEhTP5hQ57NdiI4i7nVkrPIwcXmA9c0Bkv+vfaHJWl5bjnkkUV3
 4q3rA2prtT03iHgbO8ixsirHKO6aflcXNhHkaNSAoXNtxK2Llox6bkBKQ
 dI+wsoRv7bX+vWDQuU0aQNUtFpToR2V4WeCm2HK37MPlyc0MuKq6hYbt6
 ACTG3wWNOpoIUdGv7OPgjBAyGxhaXi9b8t3QPSEg4A5CUjYHwi4e5qJVC
 UnAcb1XXjVejBUFR+wUuqXhmQEE86sG4xAVQHXUexZ3uhhjBVM+ZhdyX8
 m4sqhZ6+KRWF6WJIazzG/vEyn07ydLvA7oSu1J7qeDwgTHaKk+CRu8poE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="305967671"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="305967671"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 11:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="538587717"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 22 Jun 2022 11:37:56 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o45Ei-0001ZA-6K;
 Wed, 22 Jun 2022 18:37:56 +0000
Date: Thu, 23 Jun 2022 02:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2 02/68] drm/crtc: Introduce drmm_crtc_init_with_planes
Message-ID: <202206230238.D3tMKlmQ-lkp@intel.com>
References: <20220622143209.600298-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-3-maxime@cerno.tech>
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220622]
[also build test WARNING on v5.19-rc3]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next drm-tip/drm-tip linus/master anholt/for-next v5.19-rc3 v5.19-rc2 v5.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-vc4-Fix-hotplug-for-vc4/20220622-223842
base:    ac0ba5454ca85162c08dc429fef1999e077ca976
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20220623/202206230238.D3tMKlmQ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/46edccc8b6046ecee2de71b23c941dc23514f522
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-Fix-hotplug-for-vc4/20220622-223842
        git checkout 46edccc8b6046ecee2de71b23c941dc23514f522
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_crtc.c: In function 'drmm_crtc_init_with_planes':
>> drivers/gpu/drm/drm_crtc.c:421:43: warning: function 'drmm_crtc_init_with_planes' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     421 |                                           name, ap);
         |                                           ^~~~


vim +421 drivers/gpu/drm/drm_crtc.c

   379	
   380	/**
   381	 * drmm_crtc_init_with_planes - Initialise a new CRTC object with
   382	 *    specified primary and cursor planes.
   383	 * @dev: DRM device
   384	 * @crtc: CRTC object to init
   385	 * @primary: Primary plane for CRTC
   386	 * @cursor: Cursor plane for CRTC
   387	 * @funcs: callbacks for the new CRTC
   388	 * @name: printf style format string for the CRTC name, or NULL for default name
   389	 *
   390	 * Inits a new object created as base part of a driver crtc object. Drivers
   391	 * should use this function instead of drm_crtc_init(), which is only provided
   392	 * for backwards compatibility with drivers which do not yet support universal
   393	 * planes). For really simple hardware which has only 1 plane look at
   394	 * drm_simple_display_pipe_init() instead.
   395	 *
   396	 * Cleanup is automatically handled through registering
   397	 * drmm_crtc_cleanup() with drmm_add_action(). The crtc structure should
   398	 * be allocated with drmm_kzalloc().
   399	 *
   400	 * The @drm_crtc_funcs.destroy hook must be NULL.
   401	 *
   402	 * The @primary and @cursor planes are only relevant for legacy uAPI, see
   403	 * &drm_crtc.primary and &drm_crtc.cursor.
   404	 *
   405	 * Returns:
   406	 * Zero on success, error code on failure.
   407	 */
   408	int drmm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
   409				       struct drm_plane *primary,
   410				       struct drm_plane *cursor,
   411				       const struct drm_crtc_funcs *funcs,
   412				       const char *name, ...)
   413	{
   414		va_list ap;
   415		int ret;
   416	
   417		WARN_ON(funcs && funcs->destroy);
   418	
   419		va_start(ap, name);
   420		ret = __drm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
 > 421						  name, ap);
   422		va_end(ap);
   423		if (ret)
   424			return ret;
   425	
   426		ret = drmm_add_action_or_reset(dev, drmm_crtc_init_with_planes_cleanup,
   427					       crtc);
   428		if (ret)
   429			return ret;
   430	
   431		return 0;
   432	}
   433	EXPORT_SYMBOL(drmm_crtc_init_with_planes);
   434	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
