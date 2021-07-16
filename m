Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BB3CB4F8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 11:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF746E94A;
	Fri, 16 Jul 2021 09:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3366E94A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 09:03:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="210514966"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="210514966"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 02:03:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="495986443"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.28.42])
 ([10.255.28.42])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 02:03:49 -0700
Subject: Re: [PATCH 1/5] drm: Define DRM_FORMAT_MAX_PLANES
References: <202107160729.dsfkD3VR-lkp@intel.com>
In-Reply-To: <202107160729.dsfkD3VR-lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
From: kernel test robot <rong.a.chen@intel.com>
X-Forwarded-Message-Id: <202107160729.dsfkD3VR-lkp@intel.com>
Message-ID: <4c72622c-67c6-afa0-6f06-3266dbfecbf9@intel.com>
Date: Fri, 16 Jul 2021 17:03:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 4d00e2309398147acdbfefbe1deb4b0e78868466]

url: 
https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Provide-framebuffer-vmap-helpers/20210716-020508
base:   4d00e2309398147acdbfefbe1deb4b0e78868466
compiler: hppa-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:192:14: warning: Unsigned variable 'i' can't be negative so it is unnecessary to test it. [unsignedPositive]
     for (i--; i >= 0; i--)
                 ^

vim +192 drivers/gpu/drm/drm_gem_framebuffer_helper.c

4c3dbb2c312c9f Noralf Trønnes        2017-08-13  119  4c3dbb2c312c9f 
Noralf Trønnes        2017-08-13  120  /**
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  121   * 
drm_gem_fb_init_with_funcs() - Helper function for implementing
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  122   *				 
&drm_mode_config_funcs.fb_create
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  123   *				  callback 
in cases when the driver
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  124   *				  allocates 
a subclass of
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  125   *				  struct 
drm_framebuffer
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  126   * @dev: DRM device
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  127   * @fb: 
framebuffer object
2e187b2099034a Noralf Trønnes        2017-09-22  128   * @file: DRM file 
that holds the GEM handle(s) backing the framebuffer
2e187b2099034a Noralf Trønnes        2017-09-22  129   * @mode_cmd: 
Metadata from the userspace framebuffer creation request
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  130   * @funcs: vtable 
to be used for the new framebuffer object
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  131   *
dbd62e16fd53d3 Noralf Trønnes        2019-01-15  132   * This function 
can be used to set &drm_framebuffer_funcs for drivers that need
dbd62e16fd53d3 Noralf Trønnes        2019-01-15  133   * custom 
framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
dbd62e16fd53d3 Noralf Trønnes        2019-01-15  134   * change 
&drm_framebuffer_funcs. The function does buffer size validation.
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  135   * The buffer size 
validation is for a general case, though, so users should
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  136   * pay attention 
to the checks being appropriate for them or, at least,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  137   * non-conflicting.
2e187b2099034a Noralf Trønnes        2017-09-22  138   *
2e187b2099034a Noralf Trønnes        2017-09-22  139   * Returns:
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  140   * Zero or a 
negative error code.
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  141   */
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  142  int 
drm_gem_fb_init_with_funcs(struct drm_device *dev,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  143  			       struct 
drm_framebuffer *fb,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  144  			       struct 
drm_file *file,
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  145  			       const 
struct drm_mode_fb_cmd2 *mode_cmd,
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  146  			       const 
struct drm_framebuffer_funcs *funcs)
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  147  {
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  148  	const struct 
drm_format_info *info;
6065e7036e073e Thomas Zimmermann     2021-07-15  149  	struct 
drm_gem_object *objs[DRM_FORMAT_MAX_PLANES];
6065e7036e073e Thomas Zimmermann     2021-07-15  150  	unsigned int i;
6065e7036e073e Thomas Zimmermann     2021-07-15  151  	int ret;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  152  4c3dbb2c312c9f 
Noralf Trønnes        2017-08-13  153  	info = drm_get_format_info(dev, 
mode_cmd);
f7f525030854b1 Simon Ser             2021-05-03  154  	if (!info) {
f7f525030854b1 Simon Ser             2021-05-03  155  		drm_dbg_kms(dev, 
"Failed to get FB format info\n");
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  156  		return -EINVAL;
f7f525030854b1 Simon Ser             2021-05-03  157  	}
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  158  4c3dbb2c312c9f 
Noralf Trønnes        2017-08-13  159  	for (i = 0; i < 
info->num_planes; i++) {
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  160  		unsigned int 
width = mode_cmd->width / (i ? info->hsub : 1);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  161  		unsigned int 
height = mode_cmd->height / (i ? info->vsub : 1);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  162  		unsigned int 
min_size;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  163  4c3dbb2c312c9f 
Noralf Trønnes        2017-08-13  164  		objs[i] = 
drm_gem_object_lookup(file, mode_cmd->handles[i]);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  165  		if (!objs[i]) {
24f03be4aa7922 Jani Nikula           2019-12-10  166  		 
drm_dbg_kms(dev, "Failed to lookup GEM object\n");
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  167  			ret = -ENOENT;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  168  			goto 
err_gem_object_put;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  169  		}
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  170  4c3dbb2c312c9f 
Noralf Trønnes        2017-08-13  171  		min_size = (height - 1) * 
mode_cmd->pitches[i]
042bf753842ddb Alexandru Gheorghe    2018-11-01  172  			 + 
drm_format_info_min_pitch(info, i, width)
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  173  			 + 
mode_cmd->offsets[i];
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  174  4c3dbb2c312c9f 
Noralf Trønnes        2017-08-13  175  		if (objs[i]->size < min_size) {
f7f525030854b1 Simon Ser             2021-05-03  176  			drm_dbg_kms(dev,
f7f525030854b1 Simon Ser             2021-05-03  177  				    "GEM 
object size (%zu) smaller than minimum size (%u) for plane %d\n",
f7f525030854b1 Simon Ser             2021-05-03  178  				 
objs[i]->size, min_size, i);
be6ee102341bc4 Emil Velikov          2020-05-15  179  		 
drm_gem_object_put(objs[i]);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  180  			ret = -EINVAL;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  181  			goto 
err_gem_object_put;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  182  		}
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  183  	}
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  184  f2b816d78a9431 
Andrzej Pietrasiewicz 2020-03-11  185  	ret = drm_gem_fb_init(dev, fb, 
mode_cmd, objs, i, funcs);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  186  	if (ret)
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  187  		goto 
err_gem_object_put;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  188  f2b816d78a9431 
Andrzej Pietrasiewicz 2020-03-11  189  	return 0;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  190  4c3dbb2c312c9f 
Noralf Trønnes        2017-08-13  191  err_gem_object_put:
4c3dbb2c312c9f Noralf Trønnes        2017-08-13 @192  	for (i--; i >= 0; 
i--)
be6ee102341bc4 Emil Velikov          2020-05-15  193  	 
drm_gem_object_put(objs[i]);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  194  f2b816d78a9431 
Andrzej Pietrasiewicz 2020-03-11  195  	return ret;
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  196  }
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  197 
EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  198
---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
