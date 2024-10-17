Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD289A2975
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 18:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8807310E88C;
	Thu, 17 Oct 2024 16:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsOimTqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C7110E886
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729183659; x=1760719659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Iu5+bxie8ClL72dgmR0K5BCaY6jY2gpB/16AcwrIYj4=;
 b=gsOimTqE2E0GxBqJSYzQftktyVSykRYX/c3wgD1Qfgu2iVNDf/p24idI
 DrOLqOhEYPC2Q9RwIDyYyl46rBLoWEWkFQtb1IuTv1NglErmDKW8TJqYn
 IlP/b/r98Lj6pIGzyqRx7v6yeQB7qu4F+LrzZNYo+mafVtSQgUcSJaT7O
 5PVghLTj/XbTxFMsCdKlBkj6e0rA0ClpqGS2tF4DNKsVNLk9jw2OXoWy+
 YXnDf8lzYEHh3oNMDcl7wBrYaHcin7tUHt/5A8vySPK0+pP8E8fPnUlS0
 yC/lgGZ1cVLrPH6HIfckmkuyz8RHGOubmP/w/TN90sNxs88GGSiefVaik g==;
X-CSE-ConnectionGUID: xkJOmrjfQSqhlWyWUTyTGA==
X-CSE-MsgGUID: 9y1RjARzRIGU0uOqqao9Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="54096875"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="54096875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:47:38 -0700
X-CSE-ConnectionGUID: VfUDu1F5SkK9IZsijI35+w==
X-CSE-MsgGUID: Y8HaMjWlTC28qDgsIdLHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78632480"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 17 Oct 2024 09:47:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t1Tet-000Mc7-2G;
 Thu, 17 Oct 2024 16:47:31 +0000
Date: Fri, 18 Oct 2024 00:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, christian.koenig@amd.com, ray.huang@amd.com,
 dmitry.baryshkov@linaro.org, dave.stevenson@raspberrypi.com,
 mcanal@igalia.com, quic_jjohnson@quicinc.com,
 karolina.stolarek@intel.com, Arunpravin.PaneerSelvam@amd.com,
 thomas.hellstrom@linux.intel.com, asomalap@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ruanjinjie@huawei.com
Subject: Re: [PATCH 1/3] drm/connector: hdmi: Fix memory leak in
 drm_display_mode_from_cea_vic()
Message-ID: <202410180045.uBklh7FI-lkp@intel.com>
References: <20241014071632.989108-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014071632.989108-2-ruanjinjie@huawei.com>
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

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.12-rc3 next-20241017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/drm-connector-hdmi-Fix-memory-leak-in-drm_display_mode_from_cea_vic/20241014-152022
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241014071632.989108-2-ruanjinjie%40huawei.com
patch subject: [PATCH 1/3] drm/connector: hdmi: Fix memory leak in drm_display_mode_from_cea_vic()
config: x86_64-randconfig-121-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180045.uBklh7FI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180045.uBklh7FI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180045.uBklh7FI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tests/drm_connector_test.c:1008:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1008:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1008:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1031:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1031:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1031:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1051:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1051:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1051:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1074:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1074:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1074:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1094:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1094:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1094:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1117:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1117:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1117:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1142:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1142:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1142:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1182:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1182:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1182:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1209:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1209:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1209:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1233:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1233:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1233:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1257:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1257:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1257:31: sparse:     got struct drm_display_mode const *[assigned] mode
   drivers/gpu/drm/tests/drm_connector_test.c:1281:31: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct drm_display_mode *mode @@     got struct drm_display_mode const *[assigned] mode @@
   drivers/gpu/drm/tests/drm_connector_test.c:1281:31: sparse:     expected struct drm_display_mode *mode
   drivers/gpu/drm/tests/drm_connector_test.c:1281:31: sparse:     got struct drm_display_mode const *[assigned] mode

vim +1008 drivers/gpu/drm/tests/drm_connector_test.c

   987	
   988	/*
   989	 * Test that for a given mode, with 8bpc and an RGB output the TMDS
   990	 * character rate is equal to the mode pixel clock.
   991	 */
   992	static void drm_test_drm_hdmi_compute_mode_clock_rgb(struct kunit *test)
   993	{
   994		struct drm_connector_init_priv *priv = test->priv;
   995		const struct drm_display_mode *mode;
   996		unsigned long long rate;
   997		struct drm_device *drm = &priv->drm;
   998	
   999		mode = drm_display_mode_from_cea_vic(drm, 16);
  1000		KUNIT_ASSERT_NOT_NULL(test, mode);
  1001	
  1002		KUNIT_ASSERT_FALSE(test, mode->flags & DRM_MODE_FLAG_DBLCLK);
  1003	
  1004		rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
  1005		KUNIT_ASSERT_GT(test, rate, 0);
  1006		KUNIT_EXPECT_EQ(test, mode->clock * 1000ULL, rate);
  1007	
> 1008		drm_mode_destroy(drm, mode);
  1009	}
  1010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
