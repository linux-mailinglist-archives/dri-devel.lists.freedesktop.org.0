Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105BB6A5CBA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 17:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840F210E02E;
	Tue, 28 Feb 2023 16:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7293910E02E;
 Tue, 28 Feb 2023 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677600329; x=1709136329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7WTR5cEOx6pl83EELbuiP04ozprfCWKL6VhuLuedDOs=;
 b=N0ivWqRCJ0XvbH1vyTGofIYPI0/TjaMtkmxEecK6iQmbRU2Jt3dQSIrw
 /2fdz2UGHcv1ytI1Ct7lYbSrDIswNHKYyaZRyBwIIVsMNrqxr+ROXxpaq
 cjtDENphZs8/I9GwWT9CC4MAXjzXxttQT5yxb9MZ6I267fmc0cOkcMW6E
 Aab1tgU2E8ZEGEP3RRRPyaQAWbnSB+5UmiNdDdlLJHqlZIxXWKguUzSVb
 CF6gtn5qG7NyUL4YmEggctsZsnOiELWJAcdSKUgOjjsqLH8+yVUAfRhdV
 HIOvI+4ipiTp9x9z+/xpsaInM9DR8Pe8sIo48iPl3+XfXZs9cbmUGiX0Z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="313847281"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="313847281"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003269224"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="1003269224"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2023 08:04:40 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pX2T1-0005VM-2m;
 Tue, 28 Feb 2023 16:04:39 +0000
Date: Wed, 1 Mar 2023 00:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/qxl: switch to using drm_exec
Message-ID: <202302282339.welAynWc-lkp@intel.com>
References: <20230228083406.1720795-9-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228083406.1720795-9-christian.koenig@amd.com>
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
Cc: arunpravin.paneerselvam@amd.com, dakr@redhat.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next linus/master next-20230228]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-add-drm_exec-selftests/20230228-173404
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230228083406.1720795-9-christian.koenig%40amd.com
patch subject: [PATCH 8/9] drm/qxl: switch to using drm_exec
config: i386-randconfig-a014-20230227 (https://download.01.org/0day-ci/archive/20230228/202302282339.welAynWc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/435d2421797eb683d27984c9a823b48704069df9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-add-drm_exec-selftests/20230228-173404
        git checkout 435d2421797eb683d27984c9a823b48704069df9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302282339.welAynWc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_exec_init" [drivers/gpu/drm/qxl/qxl.ko] undefined!
>> ERROR: modpost: "drm_exec_prepare_obj" [drivers/gpu/drm/qxl/qxl.ko] undefined!
>> ERROR: modpost: "drm_exec_cleanup" [drivers/gpu/drm/qxl/qxl.ko] undefined!
>> ERROR: modpost: "drm_exec_fini" [drivers/gpu/drm/qxl/qxl.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
