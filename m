Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC0761B35
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 16:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9310E3D9;
	Tue, 25 Jul 2023 14:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9BF10E3D9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690294629; x=1721830629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eVxhmj+VYE1UrACEzYd5gGcDmS4uuwD9qqQr6Lk1mgU=;
 b=IDd8fV0XL+R1MtVsqw/EwlixJrfJbLy/EOI5vGK4lqqt5bBNOikdHMXr
 9lfI4JIaYvkdp2PZWNeK7hNiaVgC8fTW8J3dljpig0lmA2syBmyMrWA48
 y9nFYhNhzTgl55aC+UP0CBM4JxhkcDPsXMhkIs+9L0HEM2ixvqS5rRVqT
 yH7UDpI0NR9DPD2IzP6FrAgmQ0aYE9lYfLsOx9PGZ92S7zGhvxlbCZckP
 r5yLt2HC7c9AjXzkrkU0wXlg+DRHiqJsTBwsAvpJxR6AAyNh3hYNROlyW
 JqEF5HiMYFCnJIM8v24r3uvAbaAlUfL+XQIqAxDoSbeQTFp0ahq36XfH3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352635104"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="352635104"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 07:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="761222802"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="761222802"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 25 Jul 2023 07:16:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qOIpF-00001R-1E;
 Tue, 25 Jul 2023 14:15:50 +0000
Date: Tue, 25 Jul 2023 22:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/format-helper: Add KUnit tests for drm_fb_memcpy()
Message-ID: <202307252148.wr2nafKj-lkp@intel.com>
References: <20230721182316.560649-7-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721182316.560649-7-arthurgrillo@riseup.net>
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
Cc: tzimmermann@suse.de, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, davidgow@google.com, oe-kbuild-all@lists.linux.dev,
 jose.exposito89@gmail.com, andrealmeid@riseup.net, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc3 next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arthur-Grillo/drm-format-helper-Test-default-pitch-fallback/20230722-022649
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230721182316.560649-7-arthurgrillo%40riseup.net
patch subject: [PATCH 6/6] drm/format-helper: Add KUnit tests for drm_fb_memcpy()
config: nios2-randconfig-r093-20230723 (https://download.01.org/0day-ci/archive/20230725/202307252148.wr2nafKj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307252148.wr2nafKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307252148.wr2nafKj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/tests/drm_format_helper_test.c:856:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le32 const [usertype] *buf @@     got unsigned int [usertype] *[assigned] buf @@
   drivers/gpu/drm/tests/drm_format_helper_test.c:856:36: sparse:     expected restricted __le32 const [usertype] *buf
   drivers/gpu/drm/tests/drm_format_helper_test.c:856:36: sparse:     got unsigned int [usertype] *[assigned] buf
   drivers/gpu/drm/tests/drm_format_helper_test.c:1058:34: sparse: sparse: symbol 'fb_build_fourcc_list_cases' was not declared. Should it be static?
>> drivers/gpu/drm/tests/drm_format_helper_test.c:1566:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] * @@     got restricted __le32 [usertype] * @@
   drivers/gpu/drm/tests/drm_format_helper_test.c:1566:27: sparse:     expected unsigned int [usertype] *
   drivers/gpu/drm/tests/drm_format_helper_test.c:1566:27: sparse:     got restricted __le32 [usertype] *
   drivers/gpu/drm/tests/drm_format_helper_test.c:1576:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] * @@     got restricted __le32 [usertype] * @@
   drivers/gpu/drm/tests/drm_format_helper_test.c:1576:29: sparse:     expected unsigned int [usertype] *
   drivers/gpu/drm/tests/drm_format_helper_test.c:1576:29: sparse:     got restricted __le32 [usertype] *

vim +1566 drivers/gpu/drm/tests/drm_format_helper_test.c

  1539	
  1540	static void drm_test_fb_memcpy(struct kunit *test)
  1541	{
  1542		const struct multi_plane_op_case *params = test->param_value;
  1543		const struct fb_memcpy_result *result = &params->memcpy_result;
  1544		size_t dst_size[DRM_FORMAT_MAX_PLANES] = { 0 };
  1545		u32 *buf[DRM_FORMAT_MAX_PLANES] = { 0 };
  1546		u32 *src_cp[DRM_FORMAT_MAX_PLANES] = { 0 };
  1547		u32 *expected[DRM_FORMAT_MAX_PLANES] = { 0 };
  1548		struct iosys_map dst[DRM_FORMAT_MAX_PLANES];
  1549		struct iosys_map src[DRM_FORMAT_MAX_PLANES];
  1550	
  1551		struct drm_framebuffer fb = {
  1552			.format = drm_format_info(params->format),
  1553		};
  1554	
  1555		memcpy(fb.pitches, params->src_pitches, DRM_FORMAT_MAX_PLANES * sizeof(int));
  1556	
  1557		for (size_t i = 0; i < fb.format->num_planes; i++) {
  1558			dst_size[i] = conversion_buf_size(params->format, result->dst_pitches[i],
  1559							  &params->clip, i);
  1560			KUNIT_ASSERT_GT(test, dst_size[i], 0);
  1561	
  1562			buf[i] = kunit_kzalloc(test, dst_size[i], GFP_KERNEL);
  1563			KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf[i]);
  1564			iosys_map_set_vaddr(&dst[i], buf[i]);
  1565	
> 1566			src_cp[i] = cpubuf_to_le32(test, params->src[i], TEST_BUF_SIZE);
  1567			iosys_map_set_vaddr(&src[i], src_cp[i]);
  1568		}
  1569	
  1570		if (result->dst_pitches[0] == TEST_USE_DEFAULT_PITCH)
  1571			drm_fb_memcpy(dst, NULL, src, &fb, &params->clip);
  1572		else
  1573			drm_fb_memcpy(dst, result->dst_pitches, src, &fb, &params->clip);
  1574	
  1575		for (size_t i = 0; i < fb.format->num_planes; i++) {
  1576			expected[i] = cpubuf_to_le32(test, result->expected[i], TEST_BUF_SIZE);
  1577			KUNIT_EXPECT_MEMEQ_MSG(test, buf[i], expected[i], dst_size[i],
  1578					       "Failed expectation on plane %zu", i);
  1579		}
  1580	}
  1581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
