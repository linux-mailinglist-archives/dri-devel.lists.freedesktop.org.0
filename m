Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4EAED145
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 23:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54B010E035;
	Sun, 29 Jun 2025 21:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyYWz0cq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E661110E035
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751232517; x=1782768517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=slX9fChmUoL5l9nvF+ZMylk+SnKP5UtGpkfN0xJ+NZs=;
 b=cyYWz0cqy1sxsnWr1NFoqq9nCgUhTpDQwsMRw//m7CpRenuw482YUthq
 AZnxgZtaYzhY5HswJK6C7MU32wQMfNJdhbz50Q4offK3ezmD3Kb7J+tCn
 /h9Qc0z+fXSVVzIPlP+rRVc6jdQN/4Ik/ZzfMlIrVN1I1BYCz0trz0UZr
 kBQDcVwkH5pbhVaIieYUTRa7Mmf49/K5svoJlXINjQk6LPXp+kpBlzMSh
 Wrp4mpZdedXlHyWmvFfArHmwK0Hpjd1F56rqANQNKBGTiBvSoHv+vcQks
 pUdTb9HaSFiTtbpcqVdy7rGbxD7Zm+cZZTlNbK1vdYQj690jWBRHXFIuF Q==;
X-CSE-ConnectionGUID: 6H4BuzZ+Ra6WtJ9LjwwZIg==
X-CSE-MsgGUID: 4pLRXTq4Q0WsnZYy9cuMxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57261639"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; d="scan'208";a="57261639"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 14:28:36 -0700
X-CSE-ConnectionGUID: 6WMCJYmKRu+jB6KsrlCtww==
X-CSE-MsgGUID: qdWMCtPQQsmFYRdXgAHS5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; d="scan'208";a="153026179"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 29 Jun 2025 14:28:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uVzZd-000YFC-2f;
 Sun, 29 Jun 2025 21:28:29 +0000
Date: Mon, 30 Jun 2025 05:27:59 +0800
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
Subject: Re: [PATCH v6 7/8] drm/vkms: Create helper macro for YUV formats
Message-ID: <202506300528.vxGyGV82-lkp@intel.com>
References: <20250628-b4-new-color-formats-v6-7-2125b193f91a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-b4-new-color-formats-v6-7-2125b193f91a@bootlin.com>
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
patch link:    https://lore.kernel.org/r/20250628-b4-new-color-formats-v6-7-2125b193f91a%40bootlin.com
patch subject: [PATCH v6 7/8] drm/vkms: Create helper macro for YUV formats
config: x86_64-randconfig-073-20250630 (https://download.01.org/0day-ci/archive/20250630/202506300528.vxGyGV82-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300528.vxGyGV82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300528.vxGyGV82-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/vkms/vkms_formats.c:317 Excess function parameter '__VA_ARGS__' description in 'READ_LINE'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:344 function parameter 'a' not described in 'READ_LINE_ARGB8888'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:344 function parameter 'r' not described in 'READ_LINE_ARGB8888'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:344 function parameter 'g' not described in 'READ_LINE_ARGB8888'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:344 function parameter 'b' not described in 'READ_LINE_ARGB8888'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:354 function parameter 'a' not described in 'READ_LINE_le16161616'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:354 function parameter 'r' not described in 'READ_LINE_le16161616'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:354 function parameter 'g' not described in 'READ_LINE_le16161616'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:354 function parameter 'b' not described in 'READ_LINE_le16161616'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:490 Excess function parameter '__VA_ARGS__' description in 'READ_LINE_YUV_SEMIPLANAR'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
