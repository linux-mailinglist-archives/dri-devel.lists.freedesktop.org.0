Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1722F6A5B89
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB9F10E4DC;
	Tue, 28 Feb 2023 15:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4271310E67D;
 Tue, 28 Feb 2023 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677597527; x=1709133527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qxGqKIJep1k+6TRT08D3JAL5H4OHtaAM0Bv9aWfUHfc=;
 b=ArXTeaziGkWg7dCqMQKe/T6Ua9DKyJEnI5Z6bepXrRTLtAX5XHG1FtvD
 SC0jYr8lTgFdTjB25pu+HIdjnILhHFI7om3R9dpBqp4Z8wUdcu2vreb9b
 EtB63fanF2qE6EIAO2j2KvZPW4ecJ7hKCClAZWv7V6u0tFAiwEbMqA+CO
 HnisHbO0Q9CFk4eU1tIAorE8CHwflD7x/aZII2biMffTpe8xKJ5SwR2cE
 UUfdoXC/uqc64GMBmusaxtTq3ACH7zWdb56iJG57HhY7iUiFTFEBdJIoy
 dz3N3c7eZg6qzL3aEwVzT7HusuhAzh1huqv0iFQYW56hxjOqAeZvHuSvw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="317955769"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="317955769"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:10:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="919806108"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="919806108"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2023 07:10:38 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pX1cj-0005Tv-2e;
 Tue, 28 Feb 2023 15:10:37 +0000
Date: Tue, 28 Feb 2023 23:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 03/10] drm/i915/dsc: move DSC tables to DRM DSC helper
Message-ID: <202302282241.qRMAjDx8-lkp@intel.com>
References: <20230228113342.2051425-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228113342.2051425-4-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-i915-dsc-change-DSC-param-tables-to-follow-the-DSC-model/20230228-193505
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230228113342.2051425-4-dmitry.baryshkov%40linaro.org
patch subject: [PATCH 03/10] drm/i915/dsc: move DSC tables to DRM DSC helper
config: x86_64-randconfig-a002-20230227 (https://download.01.org/0day-ci/archive/20230228/202302282241.qRMAjDx8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ee048cb6c2ec7f7f92bea6b72e8cd3ef9921993e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-i915-dsc-change-DSC-param-tables-to-follow-the-DSC-model/20230228-193505
        git checkout ee048cb6c2ec7f7f92bea6b72e8cd3ef9921993e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302282241.qRMAjDx8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dsc_helper.c:635: warning: expecting prototype for drm_dsc_compute_rc_parameters(). Prototype was for drm_dsc_setup_rc_params() instead


vim +635 drivers/gpu/drm/display/drm_dsc_helper.c

   627	
   628	/**
   629	 * drm_dsc_compute_rc_parameters() - Set parameters and limits for RC model in
   630	 * accordance with the DSC 1.1 or 1.2 specification and DSC C Model
   631	 *
   632	 * @vdsc_cfg: DSC Configuration data partially filled by driver
   633	 */
   634	int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg)
 > 635	{
   636		const struct rc_parameters *rc_params;
   637		int i;
   638	
   639		/* fractional BPP is not supported */
   640		if (vdsc_cfg->bits_per_pixel & 0xf)
   641			return -EINVAL;
   642	
   643		rc_params = get_rc_params(vdsc_cfg->bits_per_pixel >> 4,
   644					  vdsc_cfg->bits_per_component);
   645		if (!rc_params)
   646			return -EINVAL;
   647	
   648		vdsc_cfg->first_line_bpg_offset = rc_params->first_line_bpg_offset;
   649		vdsc_cfg->initial_xmit_delay = rc_params->initial_xmit_delay;
   650		vdsc_cfg->initial_offset = rc_params->initial_offset;
   651		vdsc_cfg->flatness_min_qp = rc_params->flatness_min_qp;
   652		vdsc_cfg->flatness_max_qp = rc_params->flatness_max_qp;
   653		vdsc_cfg->rc_quant_incr_limit0 = rc_params->rc_quant_incr_limit0;
   654		vdsc_cfg->rc_quant_incr_limit1 = rc_params->rc_quant_incr_limit1;
   655	
   656		for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
   657			vdsc_cfg->rc_range_params[i].range_min_qp =
   658				rc_params->rc_range_params[i].range_min_qp;
   659			vdsc_cfg->rc_range_params[i].range_max_qp =
   660				rc_params->rc_range_params[i].range_max_qp;
   661			/*
   662			 * Range BPG Offset uses 2's complement and is only a 6 bits. So
   663			 * mask it to get only 6 bits.
   664			 */
   665			vdsc_cfg->rc_range_params[i].range_bpg_offset =
   666				rc_params->rc_range_params[i].range_bpg_offset &
   667				DSC_RANGE_BPG_OFFSET_MASK;
   668		}
   669	
   670		return 0;
   671	}
   672	EXPORT_SYMBOL(drm_dsc_setup_rc_params);
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
