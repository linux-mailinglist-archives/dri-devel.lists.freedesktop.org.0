Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE445993E6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 06:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E77810E4D7;
	Fri, 19 Aug 2022 04:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5AA10E4D7;
 Fri, 19 Aug 2022 04:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660882297; x=1692418297;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8Y49LHzWGjuvArvCs2thyeNozEBUOrRqYUcI58mTGIM=;
 b=i9JvNNptFGKhRPH0Rph1Ut6exVx3TCjtfHp7GQzgME0rObRUINq9KX3u
 r9+MltkRLpx14H675Es08aTeaU2fTIcuK1oFG/YaF4MTYC5+P1cNAEoCj
 7dsVPxMBG4EF/qvZXT4E1QFD1wli3ikNqTXHdbiqhLcqUXM383lDUOQYu
 rxyZNBsaGjZlZrGYOIuY7N02+P9bvwlwj/K6CAgBW2GO0l16+3rLhzrIh
 IuzBKJrRU+qr8nw47Z1qSZlUWwsW4HKDYMCMFpGDSRL//6z+ZdRqg3sko
 1PtSAR/hudIDIRVGb52P70Rk+k0uXgxLw49+u7Uk2wEUIY6elbrpor1zV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293719421"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293719421"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 21:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="584499033"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 21:11:34 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oOtM5-00013H-37;
 Fri, 19 Aug 2022 04:11:33 +0000
Date: Fri, 19 Aug 2022 12:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 09/15] drm/i915/pxp: add huc
 authentication and loading command
Message-ID: <202208191208.p5c4LVLR-lkp@intel.com>
References: <20220818230243.3921066-10-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818230243.3921066-10-daniele.ceraolospurio@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 kbuild-all@lists.01.org, Vitaly Lubart <vitaly.lubart@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniele,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Ceraolo-Spurio/drm-i915-HuC-loading-for-DG2/20220819-070704
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220819/202208191208.p5c4LVLR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/5a5d288c4c93865952809443a74032634bfb9921
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniele-Ceraolo-Spurio/drm-i915-HuC-loading-for-DG2/20220819-070704
        git checkout 5a5d288c4c93865952809443a74032634bfb9921
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/pxp/intel_pxp_huc.c:39:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [assigned] [usertype] huc_base_address @@     got unsigned int [assigned] [usertype] huc_phys_addr @@
   drivers/gpu/drm/i915/pxp/intel_pxp_huc.c:39:35: sparse:     expected restricted __le64 [assigned] [usertype] huc_base_address
   drivers/gpu/drm/i915/pxp/intel_pxp_huc.c:39:35: sparse:     got unsigned int [assigned] [usertype] huc_phys_addr

vim +39 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c

    17	
    18	int intel_pxp_huc_load_and_auth(struct intel_pxp *pxp)
    19	{
    20		struct intel_gt *gt = pxp_to_gt(pxp);
    21		struct intel_huc *huc = &gt->uc.huc;
    22		struct pxp_tee_start_huc_auth_in huc_in = {0};
    23		struct pxp_tee_start_huc_auth_out huc_out = {0};
    24		dma_addr_t huc_phys_addr;
    25		u8 client_id = 0;
    26		u8 fence_id = 0;
    27		int err;
    28	
    29		if (!pxp->pxp_component)
    30			return -ENODEV;
    31	
    32		huc_phys_addr = i915_gem_object_get_dma_address(huc->fw.obj, 0);
    33	
    34		/* write the PXP message into the lmem (the sg list) */
    35		huc_in.header.api_version = PXP_TEE_43_APIVER;
    36		huc_in.header.command_id  = PXP_TEE_43_START_HUC_AUTH;
    37		huc_in.header.status      = 0;
    38		huc_in.header.buffer_len  = sizeof(huc_in.huc_base_address);
  > 39		huc_in.huc_base_address   = huc_phys_addr;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
