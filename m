Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B6C6ACD5E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 19:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E8010E426;
	Mon,  6 Mar 2023 18:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A74F10E426
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 18:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678129117; x=1709665117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZmaqDXp/EaKIUUy4Hbs1NMmgPjwFBqK6TGUz+/WvE5o=;
 b=Oi/8kJ7Du1L57NAoINiCXgyYQzn6fsgwK1KLYt3Jofm6evzChn49G9q7
 mn5ZHh+YOa0YNG4t+WlrLXFrjsUI9k8UpZAY6oZqObKXLdGi7PbXnOOkv
 tCIhEgFiI7ylmann2bzlKhYjTLhCbqsrconEFC51QzjZnb9fhsLcEJgSW
 b9VnNPEVFKBvr8am4VoT1sVMoc6XTnhfSeblyD4ddBAKLMJRKoMOdcM9n
 nBa4EZK6SL7vLR5ba1XWXqTcoWSigz16hb+ZoXVv46RpYFO0iolYzf1mx
 AO3zKlHfDQ1WRm2qJNTP7ZFuXMlBbqPfzZkDf4VFRWdK8fK4jijkmDjgK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="421920966"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="421920966"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 10:58:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653699379"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="653699379"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 10:58:31 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pZG2Y-0000YZ-0V;
 Mon, 06 Mar 2023 18:58:30 +0000
Date: Tue, 7 Mar 2023 02:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 paulus@samba.org, benh@kernel.crashing.org, linux@armlinux.org.uk,
 pjones@redhat.com, timur@kernel.org, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com, geert+renesas@glider.be, corbet@lwn.net
Subject: Re: [PATCH 10/99] fbdev/atafb: Parse option string with struct
 option_iter
Message-ID: <202303070232.fCaufe3z-lkp@intel.com>
References: <20230306160016.4459-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306160016.4459-11-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
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
patch link:    https://lore.kernel.org/r/20230306160016.4459-11-tzimmermann%40suse.de
patch subject: [PATCH 10/99] fbdev/atafb: Parse option string with struct option_iter
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230307/202303070232.fCaufe3z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c5b52a9aafa2bf0107e27c7c2aa66bee9a449521
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/lib-Add-option-iterator/20230307-000524
        git checkout c5b52a9aafa2bf0107e27c7c2aa66bee9a449521
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070232.fCaufe3z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/atafb.c: In function 'ext_setcolreg':
   drivers/video/fbdev/atafb.c:2187:31: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
    2187 |                 unsigned char tmp = INB(0x3da); \
         |                               ^~~
   drivers/video/fbdev/atafb.c:2210:17: note: in expansion of macro 'DACDelay'
    2210 |                 DACDelay;
         |                 ^~~~~~~~
   drivers/video/fbdev/atafb.c:2187:31: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
    2187 |                 unsigned char tmp = INB(0x3da); \
         |                               ^~~
   drivers/video/fbdev/atafb.c:2212:17: note: in expansion of macro 'DACDelay'
    2212 |                 DACDelay;
         |                 ^~~~~~~~
   drivers/video/fbdev/atafb.c:2187:31: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
    2187 |                 unsigned char tmp = INB(0x3da); \
         |                               ^~~
   drivers/video/fbdev/atafb.c:2214:17: note: in expansion of macro 'DACDelay'
    2214 |                 DACDelay;
         |                 ^~~~~~~~
   drivers/video/fbdev/atafb.c:2187:31: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
    2187 |                 unsigned char tmp = INB(0x3da); \
         |                               ^~~
   drivers/video/fbdev/atafb.c:2216:17: note: in expansion of macro 'DACDelay'
    2216 |                 DACDelay;
         |                 ^~~~~~~~
   drivers/video/fbdev/atafb.c: In function 'atafb_copyarea':
   drivers/video/fbdev/atafb.c:2464:13: warning: variable 'rev_copy' set but not used [-Wunused-but-set-variable]
    2464 |         int rev_copy = 0;
         |             ^~~~~~~~
   drivers/video/fbdev/atafb.c: In function 'atafb_setup':
>> drivers/video/fbdev/atafb.c:2948:44: warning: passing argument 1 of 'get_video_mode' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2948 |                 if ((temp = get_video_mode(this_opt))) {
         |                                            ^~~~~~~~
   drivers/video/fbdev/atafb.c:529:33: note: expected 'char *' but argument is of type 'const char *'
     529 | static int get_video_mode(char *vname)
         |                           ~~~~~~^~~~~
>> drivers/video/fbdev/atafb.c:2973:50: warning: passing argument 1 of 'atafb_setup_ext' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2973 |                         atafb_setup_ext(this_opt + 9);
         |                                         ~~~~~~~~~^~~
   drivers/video/fbdev/atafb.c:2720:42: note: expected 'char *' but argument is of type 'const char *'
    2720 | static void __init atafb_setup_ext(char *spec)
         |                                    ~~~~~~^~~~
>> drivers/video/fbdev/atafb.c:2976:50: warning: passing argument 1 of 'atafb_setup_int' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2976 |                         atafb_setup_int(this_opt + 9);
         |                                         ~~~~~~~~~^~~
   drivers/video/fbdev/atafb.c:2837:42: note: expected 'char *' but argument is of type 'const char *'
    2837 | static void __init atafb_setup_int(char *spec)
         |                                    ~~~~~~^~~~
>> drivers/video/fbdev/atafb.c:2984:51: warning: passing argument 1 of 'atafb_setup_mcap' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2984 |                         atafb_setup_mcap(this_opt + 11);
         |                                          ~~~~~~~~~^~~~
   drivers/video/fbdev/atafb.c:2873:43: note: expected 'char *' but argument is of type 'const char *'
    2873 | static void __init atafb_setup_mcap(char *spec)
         |                                     ~~~~~~^~~~
>> drivers/video/fbdev/atafb.c:2989:51: warning: passing argument 1 of 'atafb_setup_user' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2989 |                         atafb_setup_user(this_opt + 1);
         |                                          ~~~~~~~~~^~~
   drivers/video/fbdev/atafb.c:2910:43: note: expected 'char *' but argument is of type 'const char *'
    2910 | static void __init atafb_setup_user(char *spec)
         |                                     ~~~~~~^~~~


vim +2948 drivers/video/fbdev/atafb.c

^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2836  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16 @2837  static void __init atafb_setup_int(char *spec)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2838  {
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2839  	/* Format to config extended internal video hardware like OverScan:
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2840  	 * "internal:<xres>;<yres>;<xres_max>;<yres_max>;<offset>"
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2841  	 * Explanation:
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2842  	 * <xres>: x-resolution
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2843  	 * <yres>: y-resolution
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2844  	 * The following are only needed if you have an overscan which
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2845  	 * needs a black border:
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2846  	 * <xres_max>: max. length of a line in pixels your OverScan hardware would allow
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2847  	 * <yres_max>: max. number of lines your OverScan hardware would allow
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2848  	 * <offset>: Offset from physical beginning to visible beginning
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2849  	 *	  of screen in bytes
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2850  	 */
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2851  	int xres;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2852  	char *p;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2853  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2854  	if (!(p = strsep(&spec, ";")) || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2855  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2856  	xres = simple_strtoul(p, NULL, 10);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2857  	if (!(p = strsep(&spec, ";")) || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2858  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2859  	sttt_xres = xres;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2860  	tt_yres = st_yres = simple_strtoul(p, NULL, 10);
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2861  	if ((p = strsep(&spec, ";")) && *p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2862  		sttt_xres_virtual = simple_strtoul(p, NULL, 10);
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2863  	if ((p = strsep(&spec, ";")) && *p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2864  		sttt_yres_virtual = simple_strtoul(p, NULL, 0);
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2865  	if ((p = strsep(&spec, ";")) && *p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2866  		ovsc_offset = simple_strtoul(p, NULL, 0);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2867  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2868  	if (ovsc_offset || (sttt_yres_virtual != st_yres))
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2869  		use_hwscroll = 0;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2870  }
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2871  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2872  #ifdef ATAFB_FALCON
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2873  static void __init atafb_setup_mcap(char *spec)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2874  {
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2875  	char *p;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2876  	int vmin, vmax, hmin, hmax;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2877  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2878  	/* Format for monitor capabilities is: <Vmin>;<Vmax>;<Hmin>;<Hmax>
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2879  	 * <V*> vertical freq. in Hz
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2880  	 * <H*> horizontal freq. in kHz
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2881  	 */
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2882  	if (!(p = strsep(&spec, ";")) || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2883  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2884  	vmin = simple_strtoul(p, NULL, 10);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2885  	if (vmin <= 0)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2886  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2887  	if (!(p = strsep(&spec, ";")) || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2888  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2889  	vmax = simple_strtoul(p, NULL, 10);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2890  	if (vmax <= 0 || vmax <= vmin)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2891  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2892  	if (!(p = strsep(&spec, ";")) || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2893  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2894  	hmin = 1000 * simple_strtoul(p, NULL, 10);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2895  	if (hmin <= 0)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2896  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2897  	if (!(p = strsep(&spec, "")) || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2898  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2899  	hmax = 1000 * simple_strtoul(p, NULL, 10);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2900  	if (hmax <= 0 || hmax <= hmin)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2901  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2902  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2903  	fb_info.monspecs.vfmin = vmin;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2904  	fb_info.monspecs.vfmax = vmax;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2905  	fb_info.monspecs.hfmin = hmin;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2906  	fb_info.monspecs.hfmax = hmax;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2907  }
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2908  #endif /* ATAFB_FALCON */
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2909  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2910  static void __init atafb_setup_user(char *spec)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2911  {
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2912  	/* Format of user defined video mode is: <xres>;<yres>;<depth>
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2913  	 */
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2914  	char *p;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2915  	int xres, yres, depth, temp;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2916  
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2917  	p = strsep(&spec, ";");
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2918  	if (!p || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2919  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2920  	xres = simple_strtoul(p, NULL, 10);
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2921  	p = strsep(&spec, ";");
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2922  	if (!p || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2923  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2924  	yres = simple_strtoul(p, NULL, 10);
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2925  	p = strsep(&spec, "");
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2926  	if (!p || !*p)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2927  		return;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2928  	depth = simple_strtoul(p, NULL, 10);
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2929  	temp = get_video_mode("user0");
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2930  	if (temp) {
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2931  		default_par = temp;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2932  		atafb_predefined[default_par - 1].xres = xres;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2933  		atafb_predefined[default_par - 1].yres = yres;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2934  		atafb_predefined[default_par - 1].bits_per_pixel = depth;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2935  	}
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2936  }
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2937  
c5b52a9aafa2bf drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2938  static int __init atafb_setup(const char *options)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2939  {
c5b52a9aafa2bf drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2940  	struct option_iter iter;
c5b52a9aafa2bf drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2941  	const char *this_opt;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2942  	int temp;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2943  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2944  	if (!options || !*options)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2945  		return 0;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2946  
c5b52a9aafa2bf drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2947  	while (option_iter_next(&iter, this_opt)) {
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01 @2948  		if ((temp = get_video_mode(this_opt))) {
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2949  			static char mode_option_buf[256];
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2950  			int ret;
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2951  
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2952  			ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s", this_opt);
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2953  			if (WARN(ret < 0, "atafb: ignoring invalid option, ret=%d\n", ret))
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2954  				continue;
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2955  			if (WARN(ret >= sizeof(mode_option_buf), "atafb: option too long\n"))
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2956  				continue;
1d84bc16e985b8 drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2957  			mode_option = mode_option_buf;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2958  			default_par = temp;
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2959  		} else if (!strcmp(this_opt, "inverse"))
c7ef5e285c842b drivers/video/fbdev/atafb.c Geert Uytterhoeven 2022-07-11  2960  			fb_invert_cmaps();
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2961  		else if (!strncmp(this_opt, "hwscroll_", 9)) {
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2962  			hwscroll = simple_strtoul(this_opt + 9, NULL, 10);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2963  			if (hwscroll < 0)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2964  				hwscroll = 0;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2965  			if (hwscroll > 200)
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2966  				hwscroll = 200;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2967  		}
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2968  #ifdef ATAFB_EXT
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2969  		else if (!strcmp(this_opt, "mv300")) {
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2970  			external_bitspercol = 8;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2971  			external_card_type = IS_MV300;
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2972  		} else if (!strncmp(this_opt, "external:", 9))
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16 @2973  			atafb_setup_ext(this_opt + 9);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2974  #endif
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2975  		else if (!strncmp(this_opt, "internal:", 9))
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16 @2976  			atafb_setup_int(this_opt + 9);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2977  #ifdef ATAFB_FALCON
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2978  		else if (!strncmp(this_opt, "eclock:", 7)) {
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2979  			fext.f = simple_strtoul(this_opt + 7, NULL, 10);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2980  			/* external pixelclock in kHz --> ps */
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2981  			fext.t = 1000000000 / fext.f;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2982  			fext.f *= 1000;
a100501212f2e2 drivers/video/atafb.c       Michael Schmitz    2007-05-01  2983  		} else if (!strncmp(this_opt, "monitorcap:", 11))
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16 @2984  			atafb_setup_mcap(this_opt + 11);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2985  #endif
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2986  		else if (!strcmp(this_opt, "keep"))
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2987  			DontCalcRes = 1;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2988  		else if (!strncmp(this_opt, "R", 1))
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16 @2989  			atafb_setup_user(this_opt + 1);
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2990  	}
c5b52a9aafa2bf drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2991  
c5b52a9aafa2bf drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2992  	option_iter_release(&iter);
c5b52a9aafa2bf drivers/video/fbdev/atafb.c Thomas Zimmermann  2023-03-06  2993  
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2994  	return 0;
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2995  }
^1da177e4c3f41 drivers/video/atafb.c       Linus Torvalds     2005-04-16  2996  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
