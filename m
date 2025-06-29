Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB72AED02E
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 21:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E21110E02C;
	Sun, 29 Jun 2025 19:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRoGbtys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745CA10E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 19:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751226750; x=1782762750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WVUAn15qn8pZfFMR72mBNe+d59ohwbj/sreGBPUsMDA=;
 b=YRoGbtysidAaYWONd2z4J41r+w/cdwt4t2dJcHt0NikGMTwYnOzBzwv6
 qW+2PDxZ7qyEmuAbQYm/H4oCRzNWO1ZrN2qDJlgD5aNC+pz1mCN78H8+j
 Q39l8X2W9838vzPQQrLHNy0fMdNLJg6owh88SjGdCMXda0fnIr4mIrtxs
 J00Cwp5EkHbxU0lq67AxseRpkgZQ+i4HPxZravKbG+ankcI/I+jgrqglz
 EUL0amsTL6ksZi7S8vSV1ipPz2gmjPmpb1bewQdfOIldpfOJeJIh31rF7
 Vyt/e9deoHikJTEDskecY7oCGLva030oIwp60j3AlKIgYEdGdaO14e5DV w==;
X-CSE-ConnectionGUID: dqRbMfriS8e3crXSG9HsAg==
X-CSE-MsgGUID: QmSghHQ4R3y7IBV4f+xX5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="63707431"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; d="scan'208";a="63707431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 12:52:29 -0700
X-CSE-ConnectionGUID: IWkpNjgoTeW6ympUjaLX1A==
X-CSE-MsgGUID: fGdJyy9dQdmPsFuboUhk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; d="scan'208";a="153367254"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2025 12:52:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uVy4c-000YBW-0t;
 Sun, 29 Jun 2025 19:52:22 +0000
Date: Mon, 30 Jun 2025 03:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v6 1/8] drm/vkms: Create helpers macro to avoid code
 duplication in format callbacks
Message-ID: <202506300323.LXmrpHFL-lkp@intel.com>
References: <20250628-b4-new-color-formats-v6-1-2125b193f91a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-b4-new-color-formats-v6-1-2125b193f91a@bootlin.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on bb8aa27eff6f3376242da37c2d02b9dcc66934b1]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Create-helpers-macro-to-avoid-code-duplication-in-format-callbacks/20250628-065148
base:   bb8aa27eff6f3376242da37c2d02b9dcc66934b1
patch link:    https://lore.kernel.org/r/20250628-b4-new-color-formats-v6-1-2125b193f91a%40bootlin.com
patch subject: [PATCH v6 1/8] drm/vkms: Create helpers macro to avoid code duplication in format callbacks
config: x86_64-randconfig-073-20250630 (https://download.01.org/0day-ci/archive/20250630/202506300323.LXmrpHFL-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300323.LXmrpHFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300323.LXmrpHFL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:306 Excess function parameter '__VA_ARGS__' description in 'READ_LINE'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:333 function parameter 'a' not described in 'READ_LINE_ARGB8888'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:333 function parameter 'r' not described in 'READ_LINE_ARGB8888'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:333 function parameter 'g' not described in 'READ_LINE_ARGB8888'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:333 function parameter 'b' not described in 'READ_LINE_ARGB8888'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:343 function parameter 'a' not described in 'READ_LINE_le16161616'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:343 function parameter 'r' not described in 'READ_LINE_le16161616'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:343 function parameter 'g' not described in 'READ_LINE_le16161616'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:343 function parameter 'b' not described in 'READ_LINE_le16161616'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
