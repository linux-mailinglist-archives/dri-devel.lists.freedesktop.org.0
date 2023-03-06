Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254246ACEB9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 21:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837A110E100;
	Mon,  6 Mar 2023 20:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080DF10E100
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 20:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132840; x=1709668840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CRdF0Nkx+b/muGGcWZtuKc0UsZkRBH9ke4J5QaHxNnA=;
 b=c4RGzCqSVlCNF74H5vgOMrhA6o6mxSqfux66a6kwhZZOTKYGCQJolkrG
 Wd1FrGwGIERg4hO3kRHuZG3Y3a4DG6Umcm4ic4PLbhik8po9lk8S5E1tz
 TY9pOpIY8OVYKM1FNppkTFrV/b8eSiDOKxHq7eFS2fgQ3umIltagZO9mt
 cO93ijUV5Vg79FvMMKEiPjHy2iYYlxSJn7EGGYT3yU670I6t42YvHOcuN
 KO/ec/1Yvb1+b3gZMtWNV8HAz3I0DPEEAf4xHPis4yVNpgNFLOqWykK4L
 Yi8LLVJ+GPTqF+/9UCocFMkfWXA+eFJPWWVcpeIG6UtT4fBgKnerOY92p w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319488294"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="319488294"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 12:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="626274597"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="626274597"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 06 Mar 2023 12:00:32 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pZH0Z-0000ar-1d;
 Mon, 06 Mar 2023 20:00:31 +0000
Date: Tue, 7 Mar 2023 04:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 paulus@samba.org, benh@kernel.crashing.org, linux@armlinux.org.uk,
 pjones@redhat.com, timur@kernel.org, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com, geert+renesas@glider.be, corbet@lwn.net
Subject: Re: [PATCH 29/99] fbdev/grvga: Parse option string with struct
 option_iter
Message-ID: <202303070324.h15vDbVS-lkp@intel.com>
References: <20230306160016.4459-30-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306160016.4459-30-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.3-rc1 next-20230306]
[cannot apply to deller-parisc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230306160016.4459-30-tzimmermann%40suse.de
patch subject: [PATCH 29/99] fbdev/grvga: Parse option string with struct option_iter
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230307/202303070324.h15vDbVS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0d11862a5c27c6992c00d209c68a7c014f27165a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
        git checkout 0d11862a5c27c6992c00d209c68a7c014f27165a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070324.h15vDbVS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/grvga.c: In function 'grvga_probe':
>> drivers/video/fbdev/grvga.c:363:48: warning: passing argument 1 of 'grvga_parse_custom' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     363 |                         if (grvga_parse_custom(this_opt, &info->var) < 0) {
         |                                                ^~~~~~~~
   drivers/video/fbdev/grvga.c:266:37: note: expected 'char *' but argument is of type 'const char *'
     266 | static int grvga_parse_custom(char *options,
         |                               ~~~~~~^~~~~~~


vim +363 drivers/video/fbdev/grvga.c

a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  327  
48c68c4f1b5424 drivers/video/grvga.c       Greg Kroah-Hartman        2012-12-21  328  static int grvga_probe(struct platform_device *dev)
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  329  {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  330  	struct fb_info *info;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  331  	int retval = -ENOMEM;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  332  	unsigned long virtual_start;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  333  	unsigned long grvga_fix_addr = 0;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  334  	unsigned long physical_start = 0;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  335  	unsigned long grvga_mem_size = 0;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  336  	struct grvga_par *par = NULL;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  337  	char *options = NULL, *mode_opt = NULL;
0d11862a5c27c6 drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  338  	struct option_iter iter;
0d11862a5c27c6 drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  339  	const char *this_opt;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  340  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  341  	info = framebuffer_alloc(sizeof(struct grvga_par), &dev->dev);
0adcdbcb179624 drivers/video/fbdev/grvga.c Bartlomiej Zolnierkiewicz 2019-06-28  342  	if (!info)
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  343  		return -ENOMEM;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  344  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  345  	/* Expecting: "grvga: modestring, [addr:<framebuffer physical address>], [size:<framebuffer size>]
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  346  	 *
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  347  	 * If modestring is custom:<custom mode string> we parse the string which then contains all videoparameters
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  348  	 * If address is left out, we allocate memory,
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  349  	 * if size is left out we only allocate enough to support the given mode.
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  350  	 */
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  351  	if (fb_get_options("grvga", &options)) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  352  		retval = -ENODEV;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  353  		goto free_fb;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  354  	}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  355  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  356  	if (!options || !*options)
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  357  		options =  "640x480-8@60";
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  358  
0d11862a5c27c6 drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  359  	option_iter_init(&iter, options);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  360  
0d11862a5c27c6 drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  361  	while (option_iter_next(&iter, this_opt)) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  362  		if (!strncmp(this_opt, "custom", 6)) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05 @363  			if (grvga_parse_custom(this_opt, &info->var) < 0) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  364  				dev_err(&dev->dev, "Failed to parse custom mode (%s).\n", this_opt);
0d11862a5c27c6 drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  365  				option_iter_release(&iter);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  366  				retval = -EINVAL;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  367  				goto free_fb;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  368  			}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  369  		} else if (!strncmp(this_opt, "addr", 4))
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  370  			grvga_fix_addr = simple_strtoul(this_opt + 5, NULL, 16);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  371  		else if (!strncmp(this_opt, "size", 4))
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  372  			grvga_mem_size = simple_strtoul(this_opt + 5, NULL, 0);
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  373  		else {
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  374  			static char mode_option_buf[256];
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  375  			int ret;
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  376  
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  377  			ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", this_opt);
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  378  			if (WARN(ret < 0,
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  379  				 "grlib-svgactrl: ignoring invalid option, ret=%d\n",
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  380  				 ret))
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  381  				continue;
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  382  			if (WARN(ret >= sizeof(mode_option_buf),
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  383  				 "grlib-svgactrl: option too long\n"))
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  384  				continue;
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  385  			mode_opt = mode_option_buf;
cdc70347167d9a drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  386  		}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  387  	}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  388  
0d11862a5c27c6 drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  389  	option_iter_release(&iter);
0d11862a5c27c6 drivers/video/fbdev/grvga.c Thomas Zimmermann         2023-03-06  390  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  391  	par = info->par;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  392  	info->fbops = &grvga_ops;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  393  	info->fix = grvga_fix;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  394  	info->pseudo_palette = par->color_palette;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  395  	info->flags = FBINFO_DEFAULT | FBINFO_PARTIAL_PAN_OK | FBINFO_HWACCEL_YPAN;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  396  	info->fix.smem_len = grvga_mem_size;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  397  
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  398  	if (!devm_request_mem_region(&dev->dev, dev->resource[0].start,
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  399  		    resource_size(&dev->resource[0]), "grlib-svgactrl regs")) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  400  		dev_err(&dev->dev, "registers already mapped\n");
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  401  		retval = -EBUSY;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  402  		goto free_fb;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  403  	}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  404  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  405  	par->regs = of_ioremap(&dev->resource[0], 0,
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  406  			       resource_size(&dev->resource[0]),
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  407  			       "grlib-svgactrl regs");
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  408  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  409  	if (!par->regs) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  410  		dev_err(&dev->dev, "failed to map registers\n");
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  411  		retval = -ENOMEM;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  412  		goto free_fb;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  413  	}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  414  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  415  	retval = fb_alloc_cmap(&info->cmap, 256, 0);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  416  	if (retval < 0) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  417  		dev_err(&dev->dev, "failed to allocate mem with fb_alloc_cmap\n");
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  418  		retval = -ENOMEM;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  419  		goto unmap_regs;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  420  	}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  421  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  422  	if (mode_opt) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  423  		retval = fb_find_mode(&info->var, info, mode_opt,
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  424  				      grvga_modedb, sizeof(grvga_modedb), &grvga_modedb[0], 8);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  425  		if (!retval || retval == 4) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  426  			retval = -EINVAL;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  427  			goto dealloc_cmap;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  428  		}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  429  	}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  430  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  431  	if (!grvga_mem_size)
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  432  		grvga_mem_size = info->var.xres_virtual * info->var.yres_virtual * info->var.bits_per_pixel/8;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  433  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  434  	if (grvga_fix_addr) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  435  		/* Got framebuffer base address from argument list */
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  436  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  437  		physical_start = grvga_fix_addr;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  438  
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  439  		if (!devm_request_mem_region(&dev->dev, physical_start,
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  440  					     grvga_mem_size, dev->name)) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  441  			dev_err(&dev->dev, "failed to request memory region\n");
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  442  			retval = -ENOMEM;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  443  			goto dealloc_cmap;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  444  		}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  445  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  446  		virtual_start = (unsigned long) ioremap(physical_start, grvga_mem_size);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  447  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  448  		if (!virtual_start) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  449  			dev_err(&dev->dev, "error mapping framebuffer memory\n");
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  450  			retval = -ENOMEM;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  451  			goto dealloc_cmap;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  452  		}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  453  	} else {	/* Allocate frambuffer memory */
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  454  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  455  		unsigned long page;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  456  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  457  		virtual_start = (unsigned long) __get_free_pages(GFP_DMA,
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  458  								 get_order(grvga_mem_size));
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  459  		if (!virtual_start) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  460  			dev_err(&dev->dev,
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  461  				"unable to allocate framebuffer memory (%lu bytes)\n",
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  462  				grvga_mem_size);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  463  			retval = -ENOMEM;
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  464  			goto dealloc_cmap;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  465  		}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  466  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  467  		physical_start = dma_map_single(&dev->dev, (void *)virtual_start, grvga_mem_size, DMA_TO_DEVICE);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  468  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  469  		/* Set page reserved so that mmap will work. This is necessary
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  470  		 * since we'll be remapping normal memory.
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  471  		 */
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  472  		for (page = virtual_start;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  473  		     page < PAGE_ALIGN(virtual_start + grvga_mem_size);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  474  		     page += PAGE_SIZE) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  475  			SetPageReserved(virt_to_page(page));
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  476  		}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  477  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  478  		par->fb_alloced = 1;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  479  	}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  480  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  481  	memset((unsigned long *) virtual_start, 0, grvga_mem_size);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  482  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  483  	info->screen_base = (char __iomem *) virtual_start;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  484  	info->fix.smem_start = physical_start;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  485  	info->fix.smem_len   = grvga_mem_size;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  486  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  487  	dev_set_drvdata(&dev->dev, info);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  488  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  489  	dev_info(&dev->dev,
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  490  		 "Aeroflex Gaisler framebuffer device (fb%d), %dx%d-%d, using %luK of video memory @ %p\n",
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  491  		 info->node, info->var.xres, info->var.yres, info->var.bits_per_pixel,
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  492  		 grvga_mem_size >> 10, info->screen_base);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  493  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  494  	retval = register_framebuffer(info);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  495  	if (retval < 0) {
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  496  		dev_err(&dev->dev, "failed to register framebuffer\n");
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  497  		goto free_mem;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  498  	}
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  499  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  500  	__raw_writel(physical_start, &par->regs->fb_pos);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  501  	__raw_writel(__raw_readl(&par->regs->status) | 1,  /* Enable framebuffer */
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  502  		     &par->regs->status);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  503  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  504  	return 0;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  505  
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  506  free_mem:
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  507  	if (grvga_fix_addr)
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  508  		iounmap((void *)virtual_start);
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  509  	else
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  510  		kfree((void *)virtual_start);
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  511  dealloc_cmap:
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  512  	fb_dealloc_cmap(&info->cmap);
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  513  unmap_regs:
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  514  	of_iounmap(&dev->resource[0], par->regs,
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  515  		   resource_size(&dev->resource[0]));
42eb317f7d089f drivers/video/grvga.c       Emil Goode                2012-06-26  516  free_fb:
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  517  	framebuffer_release(info);
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  518  
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  519  	return retval;
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  520  }
a4b8f97a8fdeb9 drivers/video/grvga.c       Kristoffer Glembo         2011-07-05  521  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
