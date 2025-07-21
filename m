Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51300B0BB90
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 06:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4214810E246;
	Mon, 21 Jul 2025 04:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vg32tEoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A2A10E00D;
 Mon, 21 Jul 2025 04:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753070492; x=1784606492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hpmC95n4OBxLRcb5nlXE+FdVNSoRbAa6a34M075HyI4=;
 b=Vg32tEoZ33V9KG8HoyAYZkVLziYTXsLn51Qc6HOts/yqii7Lt5SPDYNN
 dSLNTnIJxncOAiWcOEX/q4UGso8NLiQvFKnblOT2v3eY5imUP0ebB1OGQ
 +si87h0mp7ttL6idegbSer4CipPc9gqH/fZGx+SkNfym760VdzZV8G3MO
 BEl4+/QU9hbqxUzBezmyytvdEa3dJuX/hNzNwrUPI3h7VtmXD3g7mUOpI
 o9U27lzfSSSm/BxJvkhlF53X+29IYPSzA6YHe52hPryaGUC7eNHoi+VnM
 8KHUQLxdl+vcgu3fae1BYpVo1s3XqVfW1gY00iEEaF/jX7B1lk6QgOtQN g==;
X-CSE-ConnectionGUID: gWZ0fjJRTCC6ff9UQd8jxw==
X-CSE-MsgGUID: KRAK/r52SaCDC4j5LdeV6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="59067848"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="59067848"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 21:01:31 -0700
X-CSE-ConnectionGUID: KmiIKJ+gQPyWI8ywyFMbPw==
X-CSE-MsgGUID: OoElf3AvQpa8rs33sWEITw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="189675444"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 20 Jul 2025 21:01:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1udhiP-000GSX-2H;
 Mon, 21 Jul 2025 04:01:25 +0000
Date: Mon, 21 Jul 2025 12:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
Message-ID: <202507211133.d0ChrtTQ-lkp@intel.com>
References: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
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

Hi Akhil,

kernel test robot noticed the following build errors:

[auto build test ERROR on 88bf743cabe5793d24f831ef8240a0bf90e5fd44]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-Update-GMU-register-xml/20250720-201844
base:   88bf743cabe5793d24f831ef8240a0bf90e5fd44
patch link:    https://lore.kernel.org/r/20250720-ifpc-support-v1-12-9347aa5bcbd6%40oss.qualcomm.com
patch subject: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250721/202507211133.d0ChrtTQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211133.d0ChrtTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211133.d0ChrtTQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/msm_gpu_devfreq.c:7:
>> drivers/gpu/drm/msm/adreno/adreno_gpu.h:17:10: fatal error: adreno_common.xml.h: No such file or directory
      17 | #include "adreno_common.xml.h"
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 drivers/gpu/drm/msm/adreno/adreno_gpu.h

7198e6b03155f6 Rob Clark 2013-07-19  16  
7198e6b03155f6 Rob Clark 2013-07-19 @17  #include "adreno_common.xml.h"
7198e6b03155f6 Rob Clark 2013-07-19  18  #include "adreno_pm4.xml.h"
7198e6b03155f6 Rob Clark 2013-07-19  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
