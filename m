Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9DAB0F1D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 11:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181C610E9ED;
	Fri,  9 May 2025 09:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ik3mPqeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5727010E9ED
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746783487; x=1778319487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GKyHnY3Ghu2yiVf36Y/TrJp84COCpEcwGhvyMsI/YG8=;
 b=ik3mPqeLNpQHns/JSK/lLniI2htObWmhm/T8j+897Tu46JV4mDSgDECI
 2c/3FBnE4RC/ZJ9P8qk72+dVUQCLdsfM2szj0A6VqH9FzAkKSDRk8wsUJ
 aFfg3BXJKCPFxim+0+Mxq68rxlMgtQjEM4Xua6inDkiS4ksVIXbXQH1lx
 0jN8DVTD5GxKI9RUIJVQft5TRxKpKsBz+gEn5CNZ/fSz3b+hk/nK3u9VP
 GLLteY4q7mzy2hee3+4FPs5X+29STxsfqRF6BPw60+mMcOaSkaKVwU/p3
 R4jsDJyfhuAb86vnGf7EMnzVQNytMhFUzDimgiNnaHy7cGSeyfnhykLsb g==;
X-CSE-ConnectionGUID: HaJPtlbrTEafr8wLVmrL5Q==
X-CSE-MsgGUID: YTHanDGTTfiGmfHzYqiWAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59268839"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="59268839"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:38:06 -0700
X-CSE-ConnectionGUID: 0/Te/Uk2TmuNkEJfgpnkUA==
X-CSE-MsgGUID: qb8DGivuQBW3TKbXJfOpfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136959750"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 02:37:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uDKAv-000BsO-1B;
 Fri, 09 May 2025 09:37:49 +0000
Date: Fri, 9 May 2025 17:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Markus Burri <markus.burri@mt.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nuno Sa <nuno.sa@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 4/6] gpio: fix potential out-of-bound write
Message-ID: <202505091754.285hHbr2-lkp@intel.com>
References: <20250508130612.82270-5-markus.burri@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508130612.82270-5-markus.burri@mt.com>
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

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Burri/iio-backend-fix-out-of-bound-write/20250508-211644
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250508130612.82270-5-markus.burri%40mt.com
patch subject: [PATCH v4 4/6] gpio: fix potential out-of-bound write
config: x86_64-buildonly-randconfig-003-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091754.285hHbr2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091754.285hHbr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091754.285hHbr2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-virtuser.c:404:6: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     404 |         if (size >= sizeof(buf))
         |             ^~~~
         |             ksize
   include/linux/slab.h:491:8: note: 'ksize' declared here
     491 | size_t ksize(const void *objp);
         |        ^
   1 error generated.


vim +404 drivers/gpio/gpio-virtuser.c

   393	
   394	static ssize_t gpio_virtuser_direction_do_write(struct file *file,
   395							const char __user *user_buf,
   396							size_t count, loff_t *ppos,
   397							bool atomic)
   398	{
   399		struct gpio_virtuser_line_data *data = file->private_data;
   400		struct gpio_desc *desc = data->ad.desc;
   401		char buf[32], *trimmed;
   402		int ret, dir, val = 0;
   403	
 > 404		if (size >= sizeof(buf))
   405			return -EINVAL;
   406	
   407		ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
   408		if (ret < 0)
   409			return ret;
   410	
   411		buf[ret] = '\0';
   412	
   413		trimmed = strim(buf);
   414	
   415		if (strcmp(trimmed, "input") == 0) {
   416			dir = 1;
   417		} else if (strcmp(trimmed, "output-high") == 0) {
   418			dir = 0;
   419			val = 1;
   420		} else if (strcmp(trimmed, "output-low") == 0) {
   421			dir = val = 0;
   422		} else {
   423			return -EINVAL;
   424		}
   425	
   426		if (!atomic)
   427			ret = gpio_virtuser_set_direction(desc, dir, val);
   428		else
   429			ret = gpio_virtuser_set_direction_atomic(desc, dir, val);
   430		if (ret)
   431			return ret;
   432	
   433		return count;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
