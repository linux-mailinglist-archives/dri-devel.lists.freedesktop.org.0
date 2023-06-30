Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B0C743D82
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 16:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789C010E493;
	Fri, 30 Jun 2023 14:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1E10E493
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688135438; x=1719671438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9I8VS6WX/BF/j754AYm46KpzU8aeLTf85BRuBqO8fhg=;
 b=aPbzRaj95bfo1Wcr8Hx+Tj0eQCjiGNM4oHxac38sRO1vZ45uLovqsWRO
 cazf/XLtEy3lC3GjghAkhDg6PvsHZtajNOLGOXc3rpud42tex+ztu0QsD
 R4KYiw1KXruAopZl2TxIvGtNrqgYabLEg68KEBpkptjuVVRjoLEPniK3Q
 pIXyI2jhCmmvyPS3OBjZdr21x3hxP8oZ80pZqkEivJ5x6NbsnkNvgpYnf
 LKRqGeFAx+lQKphcY6aLbppQLzTNF0hY8IA2hlgk+2PKRF1D1vMbMQEnf
 XuvbNzMniFdtXoyePl9sQG3LKwDtP+Z7fAu4m/jWzJKeT7AxNKRfEfSD3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352226628"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="352226628"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 07:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="717821775"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="717821775"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 30 Jun 2023 07:30:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qFF8m-000F2T-1o;
 Fri, 30 Jun 2023 14:30:28 +0000
Date: Fri, 30 Jun 2023 22:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Mario.Limonciello@amd.com,
 mdaenzer@redhat.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, hdegoede@redhat.com, jingyuwang_vip@163.com,
 Lijo.Lazar@amd.com, jim.cromie@gmail.com, bellosilicio@gmail.com,
 andrealmeid@igalia.com, trix@redhat.com, jsg@jsg.id.au, arnd@arndb.de
Subject: Re: [PATCH V5 7/9] drm/amd/pm: add flood detection for wbrf events
Message-ID: <202306302258.ZdzWnrmF-lkp@intel.com>
References: <20230630103240.1557100-8-evan.quan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630103240.1557100-8-evan.quan@amd.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Evan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main v6.4]
[cannot apply to drm-misc/drm-misc-next linus/master next-20230630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Quan/drivers-core-Add-support-for-Wifi-band-RF-mitigations/20230630-183633
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230630103240.1557100-8-evan.quan%40amd.com
patch subject: [PATCH V5 7/9] drm/amd/pm: add flood detection for wbrf events
config: x86_64-buildonly-randconfig-r003-20230630 (https://download.01.org/0day-ci/archive/20230630/202306302258.ZdzWnrmF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302258.ZdzWnrmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302258.ZdzWnrmF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c: In function 'smu_wbrf_init':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1336:31: warning: unused variable 'adev' [-Wunused-variable]
    1336 |         struct amdgpu_device *adev = smu->adev;
         |                               ^~~~


vim +/adev +1336 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c

19fbe240b2627a Evan Quan 2023-06-30  1324  
19fbe240b2627a Evan Quan 2023-06-30  1325  /**
19fbe240b2627a Evan Quan 2023-06-30  1326   * smu_wbrf_init - init driver wbrf support
19fbe240b2627a Evan Quan 2023-06-30  1327   *
19fbe240b2627a Evan Quan 2023-06-30  1328   * @smu: smu_context pointer
19fbe240b2627a Evan Quan 2023-06-30  1329   *
19fbe240b2627a Evan Quan 2023-06-30  1330   * Verifies the AMD ACPI interfaces and registers with the wbrf
19fbe240b2627a Evan Quan 2023-06-30  1331   * notifier chain if wbrf feature is supported.
19fbe240b2627a Evan Quan 2023-06-30  1332   * Returns 0 on success, error on failure.
19fbe240b2627a Evan Quan 2023-06-30  1333   */
19fbe240b2627a Evan Quan 2023-06-30  1334  static int smu_wbrf_init(struct smu_context *smu)
19fbe240b2627a Evan Quan 2023-06-30  1335  {
19fbe240b2627a Evan Quan 2023-06-30 @1336  	struct amdgpu_device *adev = smu->adev;
19fbe240b2627a Evan Quan 2023-06-30  1337  	int ret;
19fbe240b2627a Evan Quan 2023-06-30  1338  
19fbe240b2627a Evan Quan 2023-06-30  1339  	if (!smu->wbrf_supported)
19fbe240b2627a Evan Quan 2023-06-30  1340  		return 0;
19fbe240b2627a Evan Quan 2023-06-30  1341  
0b8224d2686865 Evan Quan 2023-06-30  1342  	INIT_DELAYED_WORK(&smu->wbrf_delayed_work,
0b8224d2686865 Evan Quan 2023-06-30  1343  			  smu_wbrf_delayed_work_handler);
0b8224d2686865 Evan Quan 2023-06-30  1344  
19fbe240b2627a Evan Quan 2023-06-30  1345  	smu->wbrf_notifier.notifier_call = smu_wbrf_event_handler;
19fbe240b2627a Evan Quan 2023-06-30  1346  	ret = wbrf_register_notifier(&smu->wbrf_notifier);
19fbe240b2627a Evan Quan 2023-06-30  1347  	if (ret)
19fbe240b2627a Evan Quan 2023-06-30  1348  		return ret;
19fbe240b2627a Evan Quan 2023-06-30  1349  
19fbe240b2627a Evan Quan 2023-06-30  1350  	/*
19fbe240b2627a Evan Quan 2023-06-30  1351  	 * Some wifiband exclusion ranges may be already there
19fbe240b2627a Evan Quan 2023-06-30  1352  	 * before our driver loaded. To make sure our driver
19fbe240b2627a Evan Quan 2023-06-30  1353  	 * is awared of those exclusion ranges.
19fbe240b2627a Evan Quan 2023-06-30  1354  	 */
0b8224d2686865 Evan Quan 2023-06-30  1355  	schedule_delayed_work(&smu->wbrf_delayed_work,
0b8224d2686865 Evan Quan 2023-06-30  1356  			      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
19fbe240b2627a Evan Quan 2023-06-30  1357  
0b8224d2686865 Evan Quan 2023-06-30  1358  	return 0;
19fbe240b2627a Evan Quan 2023-06-30  1359  }
19fbe240b2627a Evan Quan 2023-06-30  1360  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
