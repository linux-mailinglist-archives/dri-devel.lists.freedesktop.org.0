Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B536AF725
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 22:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31DD10E553;
	Tue,  7 Mar 2023 21:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAF910E553
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678223062; x=1709759062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OiPnkRM1DCeuvAbu26k0+jb5D0wuc1VbMIv8dv5ojaU=;
 b=K8/ORVrB+uXH4gwl0TGJ1WxX81d5abRCNE4JMD3nPGZ370a5E3bDrY9a
 TUpuBzSMlU1/pSKnhJ9OKhUK25ZzC80BOilGGjxE5owGVXKSVwaoJU6Er
 jmeR1NnwZS6zOMAitEWZTP1h0bUHTTK2jnWY1GjFwnUYQVM2avSSyaF+r
 fjf9zvfVIsfskLcA5VhBcXga5OSVhocsw1R17d1Hwq38Fk/swFcjwsTC2
 SypRY06RBoEnWhJyL8XGcHhOuA/muMgnvwCLFoV5CMn918EJE+qj9u+Bt
 Eu1fvADSYMVOeENPZRwXu0EjinlxVTx0t2joF08c84Thhn7xxs6PLIe+D w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337492923"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="337492923"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 13:04:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676706960"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="676706960"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 13:04:19 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pZeTq-0001bf-2z;
 Tue, 07 Mar 2023 21:04:18 +0000
Date: Wed, 8 Mar 2023 05:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/format-helper: Make conversion_buf_size() support
 sub-byte pixel fmts
Message-ID: <202303080420.T1VvHVxo-lkp@intel.com>
References: <20230307193457.331360-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307193457.331360-1-javierm@redhat.com>
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
Cc: David Gow <davidgow@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.3-rc1 next-20230307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/drm-format-helper-Make-conversion_buf_size-support-sub-byte-pixel-fmts/20230308-033619
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230307193457.331360-1-javierm%40redhat.com
patch subject: [PATCH] drm/format-helper: Make conversion_buf_size() support sub-byte pixel fmts
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303080420.T1VvHVxo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5f0f9d30de18661bdabebde361180893b8ddba27
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Javier-Martinez-Canillas/drm-format-helper-Make-conversion_buf_size-support-sub-byte-pixel-fmts/20230308-033619
        git checkout 5f0f9d30de18661bdabebde361180893b8ddba27
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080420.T1VvHVxo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_format_helper_test.c: In function 'conversion_buf_size':
>> drivers/gpu/drm/tests/drm_format_helper_test.c:412:27: warning: variable 'cpp' set but not used [-Wunused-but-set-variable]
     412 |         unsigned int bpp, cpp;
         |                           ^~~


vim +/cpp +412 drivers/gpu/drm/tests/drm_format_helper_test.c

   397	
   398	/*
   399	 * conversion_buf_size - Return the destination buffer size required to convert
   400	 * between formats.
   401	 * @dst_format: destination buffer pixel format (DRM_FORMAT_*)
   402	 * @dst_pitch: Number of bytes between two consecutive scanlines within dst
   403	 * @clip: Clip rectangle area to convert
   404	 *
   405	 * Returns:
   406	 * The size of the destination buffer or negative value on error.
   407	 */
   408	static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
   409					  const struct drm_rect *clip)
   410	{
   411		const struct drm_format_info *dst_fi = drm_format_info(dst_format);
 > 412		unsigned int bpp, cpp;
   413	
   414		if (!dst_fi)
   415			return -EINVAL;
   416	
   417		if (!dst_pitch) {
   418			bpp = drm_format_info_bpp(dst_fi, 0);
   419			cpp = DIV_ROUND_UP(bpp, 8);
   420			dst_pitch = DIV_ROUND_UP(drm_rect_width(clip) * bpp, 8);
   421		}
   422	
   423		return dst_pitch * drm_rect_height(clip);
   424	}
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
