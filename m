Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED85847A3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 23:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E11110E625;
	Thu, 28 Jul 2022 21:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4021131B3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 21:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659043251; x=1690579251;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pxP46KbMMLqAAyC8VE4buMLpi2fN+uP6X+8JG9II198=;
 b=mtAf7M2Hm39W3dG176XEBoR+wivQb+Ai36XZ0PsscK4411xLciFDHu27
 d3YtmZC7WdAWM6zJTlyp4bo8/yJDxvyzY/ToV8MVKqa+msXJzzQbokoej
 8RMfulLbCFv28Mv309iJCxh/dvTWi7Ok0crtxQfkJZ+akmf91Dr6FMfiE
 XjjQvUEZAUeX8KLYhbtKM1d7Eh9y/6B7FfrGFYkVjWo3sLnjsSlMDMiiB
 XEjKqfsVJU8AQCY5W9vV8m5mTTKU4Z0yYicIpI27pnyB15VJZbDopjufd
 M9u9J/wSL/nNQt+xzGMcBaH1GWcubGtYnoHNI2rHE666CBbFvsdRl/9V8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="352630433"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="352630433"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 14:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="703958074"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2022 14:20:45 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHAw0-000Ab2-16;
 Thu, 28 Jul 2022 21:20:44 +0000
Date: Fri, 29 Jul 2022 05:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Markuss Broks <markuss.broks@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
Message-ID: <202207290523.Br8Zr7V3-lkp@intel.com>
References: <20220728142824.3836-3-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728142824.3836-3-markuss.broks@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>, linux-doc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>, kbuild-all@lists.01.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Markuss,

I love your patch! Yet something to improve:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on efi/next staging/staging-testing usb/usb-testing linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markuss-Broks/Add-generic-framebuffer-support-to-EFI-earlycon-driver/20220728-223117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20220729/202207290523.Br8Zr7V3-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b6a59e731326deaa78f7dcbd97520e2eed2bc707
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markuss-Broks/Add-generic-framebuffer-support-to-EFI-earlycon-driver/20220728-223117
        git checkout b6a59e731326deaa78f7dcbd97520e2eed2bc707
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/video/fbdev/earlycon.c: In function 'simplefb_earlycon_map':
>> drivers/video/fbdev/earlycon.c:65:16: error: implicit declaration of function 'early_memremap_prot'; did you mean 'early_memremap'? [-Werror=implicit-function-declaration]
      65 |         return early_memremap_prot(info.phys_base + start, len, pgprot_val(fb_prot));
         |                ^~~~~~~~~~~~~~~~~~~
         |                early_memremap
>> drivers/video/fbdev/earlycon.c:65:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
      65 |         return early_memremap_prot(info.phys_base + start, len, pgprot_val(fb_prot));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   {standard input}: Assembler messages:
   {standard input}:210: Error: Register number out of range 0..0
   {standard input}:211: Error: Register number out of range 0..0
   {standard input}:211: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:211: Warning: Only the first path encountering the conflict is reported
   {standard input}:210: Warning: This is the location of the conflicting usage
   {standard input}:212: Error: Register number out of range 0..0
   {standard input}:212: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:212: Warning: Only the first path encountering the conflict is reported
   {standard input}:210: Warning: This is the location of the conflicting usage
   {standard input}:212: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:212: Warning: Only the first path encountering the conflict is reported
   {standard input}:211: Warning: This is the location of the conflicting usage
   {standard input}:214: Error: Register number out of range 0..0
   {standard input}:214: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:214: Warning: Only the first path encountering the conflict is reported
   {standard input}:210: Warning: This is the location of the conflicting usage
   {standard input}:214: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:214: Warning: Only the first path encountering the conflict is reported
   {standard input}:211: Warning: This is the location of the conflicting usage
   {standard input}:214: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:214: Warning: Only the first path encountering the conflict is reported
   {standard input}:212: Warning: This is the location of the conflicting usage
   {standard input}:215: Error: Register number out of range 0..0
   {standard input}:215: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:215: Warning: Only the first path encountering the conflict is reported
   {standard input}:210: Warning: This is the location of the conflicting usage
   {standard input}:215: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:215: Warning: Only the first path encountering the conflict is reported
   {standard input}:211: Warning: This is the location of the conflicting usage
   {standard input}:215: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:215: Warning: Only the first path encountering the conflict is reported
   {standard input}:212: Warning: This is the location of the conflicting usage
   {standard input}:215: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:215: Warning: Only the first path encountering the conflict is reported
   {standard input}:214: Warning: This is the location of the conflicting usage
   {standard input}:216: Error: Register number out of range 0..0
   {standard input}:216: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:216: Warning: Only the first path encountering the conflict is reported
   {standard input}:210: Warning: This is the location of the conflicting usage
   {standard input}:216: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:216: Warning: Only the first path encountering the conflict is reported
   {standard input}:211: Warning: This is the location of the conflicting usage
   {standard input}:216: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:216: Warning: Only the first path encountering the conflict is reported
   {standard input}:212: Warning: This is the location of the conflicting usage
   {standard input}:216: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:216: Warning: Only the first path encountering the conflict is reported
   {standard input}:214: Warning: This is the location of the conflicting usage
   {standard input}:216: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 35
   {standard input}:216: Warning: Only the first path encountering the conflict is reported
   {standard input}:215: Warning: This is the location of the conflicting usage
   {standard input}:220: Error: Register number out of range 0..0
   {standard input}:376: Error: Register number out of range 0..1
   {standard input}:376: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:376: Warning: Only the first path encountering the conflict is reported
   {standard input}:374: Warning: This is the location of the conflicting usage
   {standard input}:378: Error: Register number out of range 0..1
   {standard input}:378: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:378: Warning: Only the first path encountering the conflict is reported
   {standard input}:374: Warning: This is the location of the conflicting usage
   {standard input}:378: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:378: Warning: Only the first path encountering the conflict is reported
   {standard input}:376: Warning: This is the location of the conflicting usage
   {standard input}:379: Error: Register number out of range 0..1
   {standard input}:379: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:379: Warning: Only the first path encountering the conflict is reported
   {standard input}:374: Warning: This is the location of the conflicting usage
   {standard input}:379: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:379: Warning: Only the first path encountering the conflict is reported
   {standard input}:376: Warning: This is the location of the conflicting usage
   {standard input}:379: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:379: Warning: Only the first path encountering the conflict is reported
   {standard input}:378: Warning: This is the location of the conflicting usage
   {standard input}:380: Error: Register number out of range 0..1
   {standard input}:380: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:380: Warning: Only the first path encountering the conflict is reported
   {standard input}:374: Warning: This is the location of the conflicting usage
   {standard input}:380: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:380: Warning: Only the first path encountering the conflict is reported
   {standard input}:376: Warning: This is the location of the conflicting usage
   {standard input}:380: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:380: Warning: Only the first path encountering the conflict is reported
   {standard input}:378: Warning: This is the location of the conflicting usage
   {standard input}:380: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:380: Warning: Only the first path encountering the conflict is reported
   {standard input}:379: Warning: This is the location of the conflicting usage
   {standard input}:383: Error: Register number out of range 0..1
   {standard input}:384: Error: Register number out of range 0..1
   {standard input}:384: Warning: Use of 'mov' violates WAW dependency 'GR%, % in 1 - 127' (impliedf), specific resource number is 37
   {standard input}:384: Warning: Only the first path encountering the conflict is reported
   {standard input}:383: Warning: This is the location of the conflicting usage


vim +65 drivers/video/fbdev/earlycon.c

    56	
    57	static __ref void *simplefb_earlycon_map(unsigned long start, unsigned long len)
    58	{
    59		pgprot_t fb_prot;
    60	
    61		if (info.virt_base)
    62			return info.virt_base + start;
    63	
    64		fb_prot = PAGE_KERNEL;
  > 65		return early_memremap_prot(info.phys_base + start, len, pgprot_val(fb_prot));
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
