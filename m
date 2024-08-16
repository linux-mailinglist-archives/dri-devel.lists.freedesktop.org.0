Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24BE9548AE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE7A10E452;
	Fri, 16 Aug 2024 12:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYqtBBdg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2FD10E452;
 Fri, 16 Aug 2024 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723811038; x=1755347038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0XjBuQ5Ujk4jTqxw19KMbPoC57UVqxNo9JAgL8Zw148=;
 b=aYqtBBdgNnNTSV5pfAszHc7lgscHK0UzHc01ktKYC3lfFZjo0+opPpN2
 4CGEVnstYDzgptBz1bTXFXn+I2617VLhkrt6QB42zVIaqyW6vxj3Lv3lX
 WgO9zFWC1U0GSJdK588geEg4Shrn7ZLN1Q0zd67o8grF964usTZ/nNi8g
 jNo1YO/ZJc9aH0dNk79EtOKUZXRcc5/n9XQpzYei8uGNUzVeVwbxO9RYm
 3wkIfTwoDsx8kMjXuM2NEAY/0CtTV3+8Kjn1RNtKAjyprgEKa5/UQ4lyY
 ++30kDoNYZA8xJ0pyKZtBwBiMBm4kdo44dHULc7xO6oOgzwDWbMuSQboH w==;
X-CSE-ConnectionGUID: pZW+88LESpmehENVouP8Ng==
X-CSE-MsgGUID: whSn46kZSq64NoOFo4Sgeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22250473"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="22250473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 05:23:57 -0700
X-CSE-ConnectionGUID: jTI0ERjdQYOOOYnshjCUog==
X-CSE-MsgGUID: S9gzk8e6RFu1PRuXaiBdrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="60218489"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 16 Aug 2024 05:23:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sevzj-0006Os-1J;
 Fri, 16 Aug 2024 12:23:51 +0000
Date: Fri, 16 Aug 2024 20:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
Message-ID: <202408161951.81zgvcJ5-lkp@intel.com>
References: <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
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

Hi Antonino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7c626ce4bae1ac14f60076d00eafe71af30450ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonino-Maniscalco/drm-msm-Fix-bv_fence-being-used-as-bv_rptr/20240816-023442
base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
patch link:    https://lore.kernel.org/r/20240815-preemption-a750-t-v1-4-7bda26c34037%40gmail.com
patch subject: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
config: i386-buildonly-randconfig-001-20240816 (https://download.01.org/0day-ci/archive/20240816/202408161951.81zgvcJ5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408161951.81zgvcJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408161951.81zgvcJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_preempt.c: In function 'update_wptr':
>> drivers/gpu/drm/msm/adreno/a6xx_preempt.c:49:24: warning: unused variable 'cur_wptr' [-Wunused-variable]
      49 |         uint32_t wptr, cur_wptr;
         |                        ^~~~~~~~


vim +/cur_wptr +49 drivers/gpu/drm/msm/adreno/a6xx_preempt.c

    44	
    45	/* Write the most recent wptr for the given ring into the hardware */
    46	static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
    47	{
    48		unsigned long flags;
  > 49		uint32_t wptr, cur_wptr;
    50	
    51		if (!ring)
    52			return;
    53	
    54		spin_lock_irqsave(&ring->preempt_lock, flags);
    55	
    56		if (ring->skip_inline_wptr) {
    57			wptr = get_wptr(ring);
    58	
    59			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
    60	
    61			ring->skip_inline_wptr = false;
    62		}
    63	
    64		spin_unlock_irqrestore(&ring->preempt_lock, flags);
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
