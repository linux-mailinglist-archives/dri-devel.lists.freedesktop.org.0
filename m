Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9612BFF7C4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550B410E892;
	Thu, 23 Oct 2025 07:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3V4d8Ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A84010E88F;
 Thu, 23 Oct 2025 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761203940; x=1792739940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wdv4KhYwTEUc/LA/L05ZFeU6Lf3l77gTzl2aS1om74o=;
 b=d3V4d8Tso50YmS3UxjG1O+Fi7I+z/9dBoDy/bc+nOLS9w2o8BcTEQW3v
 rI9orz8cjmq+RPNqQNxZauBLvYrwmtgW7fXwxVzo8Y5zVuHcup6NcindU
 p9EESJbCUMKRzXeG7TNnwLru7NS5me62qgRFvGHYq690OpxUt3ViuqRr/
 Vq/6FFKGZjtHjJE7+eQpA4hoLcJnXlUKtyl+h0EkZFjcY0lacHD4Tgw4m
 d7KyRxk2eDFz62+PmDwQkVrgYto9esGr+QFK2Dvx5ka30I2SJ3XenXubW
 WHvRJ6K3XHH5SQK+7AP0uZqwv0urdBROR4FHVe4qNKM2udEfDABa64xTW Q==;
X-CSE-ConnectionGUID: 8YiIzv56QWu/MXjQXHbXUg==
X-CSE-MsgGUID: eZ/TwCx5RdyN1l+QTml+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63401987"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63401987"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 00:19:00 -0700
X-CSE-ConnectionGUID: CJfyOGOqQ6Sa/dhY/2ZvGw==
X-CSE-MsgGUID: I8JKyANbTqWWDWeiP+PORg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184563304"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2025 00:18:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vBpb5-000D8v-0M;
 Thu, 23 Oct 2025 07:18:55 +0000
Date: Thu, 23 Oct 2025 15:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>, YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/amd/ras: Fix memory corruption in
 ras_core_convert_timestamp_to_time()
Message-ID: <202510231558.5UzBX0ox-lkp@intel.com>
References: <aPi6I5z5oenppEuu@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPi6I5z5oenppEuu@stanley.mountain>
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

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251022]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/drm-amd-ras-Fix-memory-corruption-in-ras_core_convert_timestamp_to_time/20251022-190512
base:   next-20251022
patch link:    https://lore.kernel.org/r/aPi6I5z5oenppEuu%40stanley.mountain
patch subject: [PATCH next] drm/amd/ras: Fix memory corruption in ras_core_convert_timestamp_to_time()
config: arm-randconfig-003-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231558.5UzBX0ox-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231558.5UzBX0ox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231558.5UzBX0ox-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
