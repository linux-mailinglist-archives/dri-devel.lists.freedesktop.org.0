Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFBE590945
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 01:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856810FDF0;
	Thu, 11 Aug 2022 23:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382D18B326;
 Thu, 11 Aug 2022 23:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660261398; x=1691797398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EvJB+EyyjrE/ViFyxaCElIufWhOTNa4V37QL/lXPjow=;
 b=LWY0dZlrWOf+Iu49A1+YklxEkOjk4eIfI/y0E7JGZgvzODAoJukPZusW
 Fo1rppVrHG6QmLuBefSJubCo7tYPpAz8FQBadf6GkIyGrdgGcyAVmOFRr
 DEw2Z54m6NzFxoCtrHwDlTqqwvs8DkIFLZr/FdzRSTDZaBH4zAaQd1rx3
 mPo389kyfqtgTzy5dxENupArDhMvsMeeZyQBxjXOzFQQfLqfRRqbD0MAC
 VNJ2X9guNgvsausua2qRxBTpc7a1yG65j4IK5AayrXv4YSFKRvkdE+3x2
 kqdBTnLnTpiDkWPDbkLm3OB4rNhJvgCmGGCMal6j8boRRWKkbGafDh3Aw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="317452695"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; d="scan'208";a="317452695"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 16:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; d="scan'208";a="673890841"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2022 16:43:13 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oMHpZ-0000o3-07;
 Thu, 11 Aug 2022 23:43:13 +0000
Date: Fri, 12 Aug 2022 07:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenneng Li <lizhenneng@kylinos.cn>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: use native mode for dp aux transfer
Message-ID: <202208120737.JG7NkugC-lkp@intel.com>
References: <20220811072012.962460-1-lizhenneng@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811072012.962460-1-lizhenneng@kylinos.cn>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Zhenneng Li <lizhenneng@kylinos.cn>, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhenneng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v5.19 next-20220811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhenneng-Li/drm-amdgpu-use-native-mode-for-dp-aux-transfer/20220811-193443
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220812/202208120737.JG7NkugC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/1098c6fecb4292d634dbdccff9e720400dc7138d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhenneng-Li/drm-amdgpu-use-native-mode-for-dp-aux-transfer/20220811-193443
        git checkout 1098c6fecb4292d634dbdccff9e720400dc7138d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_dp_auxch.c:73:10: warning: no previous prototype for 'venus_mm_rreg_slow' [-Wmissing-prototypes]
      73 | uint32_t venus_mm_rreg_slow(struct amdgpu_device *adev, uint32_t reg)
         |          ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dp_auxch.c:84:6: warning: no previous prototype for 'venus_mm_wreg_slow' [-Wmissing-prototypes]
      84 | void venus_mm_wreg_slow(struct amdgpu_device *adev, uint32_t reg, uint32_t v)
         |      ^~~~~~~~~~~~~~~~~~


vim +/venus_mm_rreg_slow +73 drivers/gpu/drm/amd/amdgpu/amdgpu_dp_auxch.c

    69	
    70	#define R100_MM_INDEX                   0x0000
    71	#define R100_MM_DATA                      0x0004
    72	#define AMDGPU_MIN_MMIO_SIZE 0x10000
  > 73	uint32_t venus_mm_rreg_slow(struct amdgpu_device *adev, uint32_t reg)
    74	{
    75	        unsigned long flags;
    76	        uint32_t ret;
    77	
    78	        spin_lock_irqsave(&adev->mmio_idx_lock, flags);
    79	        writel(reg, ((void __iomem *)adev->rmmio) + R100_MM_INDEX);
    80	        ret = readl(((void __iomem *)adev->rmmio) + R100_MM_DATA);
    81	        spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
    82	        return ret;
    83	}
  > 84	void venus_mm_wreg_slow(struct amdgpu_device *adev, uint32_t reg, uint32_t v)
    85	{
    86	        unsigned long flags;
    87	
    88	        spin_lock_irqsave(&adev->mmio_idx_lock, flags);
    89	        writel(reg, ((void __iomem *)adev->rmmio) + R100_MM_INDEX);
    90	        writel(v, ((void __iomem *)adev->rmmio) + R100_MM_DATA);
    91	        spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
    92	}
    93	static inline uint32_t venus_mm_rreg(struct amdgpu_device *adev, uint32_t reg,
    94	                                    bool always_indirect)
    95	{
    96	        /* The mmio size is 64kb at minimum. Allows the if to be optimized out. */
    97	        if ((reg < adev->rmmio_size || reg < AMDGPU_MIN_MMIO_SIZE) && !always_indirect)
    98	                return readl(((void __iomem *)adev->rmmio) + reg);
    99	        else
   100	                return venus_mm_rreg_slow(adev, reg);
   101	}
   102	static inline void venus_mm_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t v,
   103	                                bool always_indirect)
   104	{
   105	        if ((reg < adev->rmmio_size || reg < AMDGPU_MIN_MMIO_SIZE) && !always_indirect)
   106	                writel(v, ((void __iomem *)adev->rmmio) + reg);
   107	        else
   108	                venus_mm_wreg_slow(adev, reg, v);
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
