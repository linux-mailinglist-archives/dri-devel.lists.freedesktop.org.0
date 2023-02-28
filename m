Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B86A5D34
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 17:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931EE10E513;
	Tue, 28 Feb 2023 16:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9499710E50B;
 Tue, 28 Feb 2023 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677602144; x=1709138144;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T69L2a3vtQLUJ7P/vLCmeuaN1M5lunXQ4CM2qfN9Tdo=;
 b=EXeq/R1lKcg0x6rHc+gRzrtWdGhsuFpZYFqNpThc8KgwIuJUhAcbU51Q
 NHfbQ86h+Zan14w4nyHi/SBUEPsBdSLh1Bp/4RraDIL7KRIebH5q8ZmWd
 kRZoTTotYJrRjAsUZCDgLFN6DTpuGzfEwJwnGTeN2bKg58US6AMBrXbQA
 Lm4NmEljlGA0EYTjUOuKZkyM56ccQgR8S5KyIT9v91/O/dslsKdb+Hu2+
 mBYufXH8YMohy3CDCLhU32VaJeg3Er2e9GLjnImnaC154aUlgE7ae/Wh8
 uGg2eSz1/rPrDyi5M1YuOopQXE5nJlEhBqs/g8vB6giXPtyucy3sTDjvC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="396752928"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="396752928"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 08:35:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="798110167"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="798110167"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 28 Feb 2023 08:35:41 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pX2x2-0005WV-2v;
 Tue, 28 Feb 2023 16:35:40 +0000
Date: Wed, 1 Mar 2023 00:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/qxl: switch to using drm_exec
Message-ID: <202303010013.SZZNcsCW-lkp@intel.com>
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
[cannot apply to drm-intel/for-linux-next-fixes v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-add-drm_exec-selftests/20230228-173404
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230228083406.1720795-9-christian.koenig%40amd.com
patch subject: [PATCH 8/9] drm/qxl: switch to using drm_exec
config: x86_64-randconfig-a016-20230227 (https://download.01.org/0day-ci/archive/20230301/202303010013.SZZNcsCW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/435d2421797eb683d27984c9a823b48704069df9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-add-drm_exec-selftests/20230228-173404
        git checkout 435d2421797eb683d27984c9a823b48704069df9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010013.SZZNcsCW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `qxl_release_reserve_list':
>> drivers/gpu/drm/qxl/qxl_release.c:221: undefined reference to `drm_exec_init'
>> ld: drivers/gpu/drm/qxl/qxl_release.c:222: undefined reference to `drm_exec_cleanup'
>> ld: drivers/gpu/drm/qxl/qxl_release.c:224: undefined reference to `drm_exec_prepare_obj'
>> ld: drivers/gpu/drm/qxl/qxl_release.c:240: undefined reference to `drm_exec_fini'
   ld: vmlinux.o: in function `qxl_release_backoff_reserve_list':
>> drivers/gpu/drm/qxl/qxl_release.c:251: undefined reference to `drm_exec_fini'
   ld: vmlinux.o: in function `qxl_release_fence_buffer_objects':
   drivers/gpu/drm/qxl/qxl_release.c:439: undefined reference to `drm_exec_fini'


vim +221 drivers/gpu/drm/qxl/qxl_release.c

   210	
   211	int qxl_release_reserve_list(struct qxl_release *release, bool no_intr)
   212	{
   213		int ret;
   214		struct qxl_bo_list *entry;
   215	
   216		/* if only one object on the release its the release itself
   217		   since these objects are pinned no need to reserve */
   218		if (list_is_singular(&release->bos))
   219			return 0;
   220	
 > 221		drm_exec_init(&release->exec, !no_intr);
 > 222		drm_exec_while_not_all_locked(&release->exec) {
   223			list_for_each_entry(entry, &release->bos, list) {
 > 224				ret = drm_exec_prepare_obj(&release->exec,
   225							   &entry->bo->tbo.base,
   226							   1);
   227				drm_exec_break_on_contention(&release->exec);
   228				if (ret)
   229					goto error;
   230			}
   231		}
   232	
   233		list_for_each_entry(entry, &release->bos, list) {
   234			ret = qxl_release_validate_bo(entry->bo);
   235			if (ret)
   236				goto error;
   237		}
   238		return 0;
   239	error:
 > 240		drm_exec_fini(&release->exec);
   241		return ret;
   242	}
   243	
   244	void qxl_release_backoff_reserve_list(struct qxl_release *release)
   245	{
   246		/* if only one object on the release its the release itself
   247		   since these objects are pinned no need to reserve */
   248		if (list_is_singular(&release->bos))
   249			return;
   250	
 > 251		drm_exec_fini(&release->exec);
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
