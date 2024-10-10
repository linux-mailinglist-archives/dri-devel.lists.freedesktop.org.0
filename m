Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CDC9993C0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 22:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B376E10E9CD;
	Thu, 10 Oct 2024 20:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJeVJQBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC7110E9CD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 20:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728592599; x=1760128599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PEOrMed0XoOGSxfnnHoSuxxB2fcADkrYpaZ2gR/BVCE=;
 b=NJeVJQBoM+m/SMtPOs5VxF/2nGDkZS8PCvuanjIRxWgCCe5CLVQE915F
 3w1VbwzOWXUFTZsnYJ4qQs4a03sXAJCiKZNp/h+G5E9ghb1NxKE3sVwqC
 cS/tv4VRIvPejF6Jeh0P3BNiPnHZpO3JHSgd7W5PLo7zFGeZU1ReoW1r4
 UuF/Yq2ai/vfiD1RMR4NH57fJffVQLuiJMchLWfeHIXDA/TBoLC/sotb/
 pBuQpzEAPWdLNWLqRaQHqN07Y7XfF9yn6H2YVO8XeiIq1rkBa4omfPRJq
 ipGNUid6q+KWtap8PCp3ToXR7gRuM5YHIJKga7MoanprYEvAAOh1iPXQS w==;
X-CSE-ConnectionGUID: +fi7TZ/CTY+hEhICYnqL8A==
X-CSE-MsgGUID: bmBs9YWCTHCDqhoxBYe8RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39373356"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="39373356"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 13:36:38 -0700
X-CSE-ConnectionGUID: zsUJwG1uSc2QB6hgk5nb5Q==
X-CSE-MsgGUID: Mv/wsEi3Qfy8gL8addNwnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="81508557"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 10 Oct 2024 13:36:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1syztd-000BEl-1o;
 Thu, 10 Oct 2024 20:36:29 +0000
Date: Fri, 11 Oct 2024 04:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v12 13/15] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <202410110407.EHvadSaF-lkp@intel.com>
References: <20241007-yuv-v12-13-01c1ada6fec8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007-yuv-v12-13-01c1ada6fec8@bootlin.com>
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

Hi Louis,

kernel test robot noticed the following build errors:

[auto build test ERROR on 82fe69e63d2b5a5e86ea94c7361c833d3848ab69]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Code-formatting/20241008-001316
base:   82fe69e63d2b5a5e86ea94c7361c833d3848ab69
patch link:    https://lore.kernel.org/r/20241007-yuv-v12-13-01c1ada6fec8%40bootlin.com
patch subject: [PATCH v12 13/15] drm/vkms: Create KUnit tests for YUV conversions
config: i386-randconfig-013-20241010 (https://download.01.org/0day-ci/archive/20241011/202410110407.EHvadSaF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110407.EHvadSaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110407.EHvadSaF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "drm_get_color_range_name" [drivers/gpu/drm/vkms/tests/vkms_format_test.ko] undefined!
>> ERROR: modpost: "drm_get_color_encoding_name" [drivers/gpu/drm/vkms/tests/vkms_format_test.ko] undefined!
>> ERROR: modpost: "get_conversion_matrix_to_argb_u16" [drivers/gpu/drm/vkms/tests/vkms_format_test.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
