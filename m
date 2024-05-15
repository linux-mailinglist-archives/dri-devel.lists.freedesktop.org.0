Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62F8C6CC3
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 21:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF12010E842;
	Wed, 15 May 2024 19:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBIwTOpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B5510E842
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 19:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715800864; x=1747336864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7LfF5lcOdFPeGFTPb+fODEveoslcVaZ/X2jDGxGMktg=;
 b=QBIwTOpvZfLKmplp2NPJi/R6gL/oBIJUKZTEG/lG00fl5oHxfr2o20yY
 ak2/BCp1mMSt6HwQB4cyJU+8gB59oqHapTaEuLCSRYzNtBW0MpjN6FD9F
 oNR5DJshIBJ7685PW+wZa64ebnXs9aTdQtcN+ySWr1rKVCRfvd0o+I287
 OUOn1A6FtRZob3eyeuq5pD7Rd31CQVnJZFsEtxMru62I3q3bubCffbxZH
 qCmM1hM6osWDkR0aiCsEzAD8nnaosYeHDXtsVc2QxRURye3hpFVZbifjE
 M4Zu35sD8z8U1YszdvHXN/WLK/aPnJjYSdQ2Nccpoix6pBkp3qjvSn0w3 w==;
X-CSE-ConnectionGUID: EHFUESJeQt66IVX64Z3qmg==
X-CSE-MsgGUID: X7rK5B03TtmzlzBHkhRzyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23276594"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="23276594"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 12:21:03 -0700
X-CSE-ConnectionGUID: lwpOMX0UREuLrJXFoRahzQ==
X-CSE-MsgGUID: vsBQ3kzmQoy8Z20D6BF0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35943377"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 15 May 2024 12:21:01 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s7KBO-000DBr-2O;
 Wed, 15 May 2024 19:20:58 +0000
Date: Thu, 16 May 2024 03:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/loongson: Introduce component framework support
Message-ID: <202405160207.efDMQSwS-lkp@intel.com>
References: <20240513001243.1739336-3-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513001243.1739336-3-sui.jingfeng@linux.dev>
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

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.9 next-20240515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-loongson-Add-helpers-for-creating-subdevice/20240513-081653
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240513001243.1739336-3-sui.jingfeng%40linux.dev
patch subject: [PATCH 2/3] drm/loongson: Introduce component framework support
config: alpha-randconfig-r133-20240515 (https://download.01.org/0day-ci/archive/20240516/202405160207.efDMQSwS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240516/202405160207.efDMQSwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160207.efDMQSwS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_drv.c:282:35: sparse: sparse: symbol 'loongson_drm_master_ops' was not declared. Should it be static?

vim +/loongson_drm_master_ops +282 drivers/gpu/drm/loongson/lsdc_drv.c

   281	
 > 282	const struct component_master_ops loongson_drm_master_ops = {
   283		.bind = loongson_drm_master_bind,
   284		.unbind = loongson_drm_master_unbind,
   285	};
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
