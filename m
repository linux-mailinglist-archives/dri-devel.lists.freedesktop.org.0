Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D865554A3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 21:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6167C10E22C;
	Wed, 22 Jun 2022 19:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADB810E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 19:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655926742; x=1687462742;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pu20s3sIn3/nhHVpC5gqrpOTcRolyORnxbj2UpioySA=;
 b=Zbo2Mo+kVVilhc6hWRfkbd09qcxCdVYnhxlsWf7unz9iNe7Betq21gtU
 +4NpY16cgUxsDfoA+hzfYLt74vqtd4oncxg+cmhXlDJ/sGOG8s7xRShA6
 GdEkcaNc/mRWE4vOwhLGtlUCDQAEW//nWzhwkU59c6dNTPBbzgJRWnKey
 mk+YdY8yAFPXJPJnCKu+rfoF+2cp4sF3KwB17HRtkamZMnTbTEpQ8vfW4
 HirWvPreaHI86HVqW/f/U9UZXCcI+apZK2bjHYCqnbNeaZtRDD9dNlcFD
 iyFNjFvi0rEDqL5rLAQkuzWPkFk2HD9VL+5BdqNV0vR8j25T2Gzg9Ntpu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="278076084"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="278076084"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 12:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="677717242"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2022 12:38:58 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o46Bm-0001cL-0z;
 Wed, 22 Jun 2022 19:38:58 +0000
Date: Thu, 23 Jun 2022 03:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2 03/68] drm/encoder: Introduce drmm_encoder_init
Message-ID: <202206230352.n3jM0UCD-lkp@intel.com>
References: <20220622143209.600298-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-4-maxime@cerno.tech>
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
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20220623/202206230352.n3jM0UCD-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/241f292ab7ccd70b2f6259d1155de8d1bfdd5c9c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-Fix-hotplug-for-vc4/20220622-223842
        git checkout 241f292ab7ccd70b2f6259d1155de8d1bfdd5c9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_encoder.c: In function 'drmm_encoder_init':
>> drivers/gpu/drm/drm_encoder.c:269:9: warning: function 'drmm_encoder_init' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     269 |         ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
         |         ^~~


vim +269 drivers/gpu/drm/drm_encoder.c

   239	
   240	/**
   241	 * drmm_encoder_init - Initialize a preallocated encoder
   242	 * @dev: drm device
   243	 * @encoder: the encoder to init
   244	 * @funcs: callbacks for this encoder (optional)
   245	 * @encoder_type: user visible type of the encoder
   246	 * @name: printf style format string for the encoder name, or NULL for default name
   247	 *
   248	 * Initializes a preallocated encoder. Encoder should be subclassed as
   249	 * part of driver encoder objects. Cleanup is automatically handled
   250	 * through registering drm_encoder_cleanup() with drmm_add_action(). The
   251	 * encoder structure should be allocated with drmm_kzalloc().
   252	 *
   253	 * The @drm_encoder_funcs.destroy hook must be NULL.
   254	 *
   255	 * Returns:
   256	 * Zero on success, error code on failure.
   257	 */
   258	int drmm_encoder_init(struct drm_device *dev, struct drm_encoder *encoder,
   259			      const struct drm_encoder_funcs *funcs,
   260			      int encoder_type, const char *name, ...)
   261	{
   262		va_list ap;
   263		int ret;
   264	
   265		if (WARN_ON(funcs && funcs->destroy))
   266			return -EINVAL;
   267	
   268		va_start(ap, name);
 > 269		ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
   270		va_end(ap);
   271		if (ret)
   272			return ret;
   273	
   274		ret = drmm_add_action_or_reset(dev, drmm_encoder_alloc_release, encoder);
   275		if (ret)
   276			return ret;
   277	
   278		return 0;
   279	}
   280	EXPORT_SYMBOL(drmm_encoder_init);
   281	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
