Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC7F955A7A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 02:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878CE10E148;
	Sun, 18 Aug 2024 00:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luH4jFJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB7E10E148;
 Sun, 18 Aug 2024 00:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723941301; x=1755477301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YUtKPX24NGFt1ahJB8hjdFaALbagaSaYs077AFGSgpM=;
 b=luH4jFJeg0VOfsX/CgcUHR7ptR4PvQoMKb8sdr1HcvU1wlY8GRDz8RfG
 cQHNshvJzQ7oMf5Jo/0fljsJ5uQAX3wFPcpEH0NJAvh//0UD45QUNwUKl
 eKHnNTz+dEMkmWYatcx3/YHwWuGJWv3jd6en2N9/yF+7UhyzG1hD+ALEl
 Qm+7AL0iSLikItSQbOgEbsPf0+0AszYQKrIF4VqewZnTHB5sKIIquW6B9
 rKy742YvnlosTU70Uov8gIOa29SCTw+XL2nQvagc+aWn2PasU2sPQmOQP
 2xOiziudlQQm9bh7u2jOGkx8Usf1IyUregxe4FyCHQDvCc+qEvLXBrQOy Q==;
X-CSE-ConnectionGUID: eBcAMuBnS6+8ezmoxook0g==
X-CSE-MsgGUID: t9O1ooneS+C+L0M4ZgGR+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22352658"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; d="scan'208";a="22352658"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 17:35:01 -0700
X-CSE-ConnectionGUID: sNZAGN9LTE640PeoEXN7aA==
X-CSE-MsgGUID: 1W/FjaDzRiiTy6ulAyt7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; d="scan'208";a="60053989"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 17 Aug 2024 17:34:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sfTsk-0007ui-11;
 Sun, 18 Aug 2024 00:34:54 +0000
Date: Sun, 18 Aug 2024 08:34:36 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Antonino Maniscalco <antomani103@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
Message-ID: <202408180848.cWzPm85G-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 7c626ce4bae1ac14f60076d00eafe71af30450ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonino-Maniscalco/drm-msm-Fix-bv_fence-being-used-as-bv_rptr/20240816-023442
base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
patch link:    https://lore.kernel.org/r/20240815-preemption-a750-t-v1-4-7bda26c34037%40gmail.com
patch subject: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
config: x86_64-buildonly-randconfig-001-20240818 (https://download.01.org/0day-ci/archive/20240818/202408180848.cWzPm85G-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180848.cWzPm85G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180848.cWzPm85G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_preempt.c:49:17: error: unused variable 'cur_wptr' [-Werror,-Wunused-variable]
      49 |         uint32_t wptr, cur_wptr;
         |                        ^~~~~~~~
   1 error generated.


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
