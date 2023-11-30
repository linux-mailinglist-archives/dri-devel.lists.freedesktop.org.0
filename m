Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E97FF3D2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CE510E71B;
	Thu, 30 Nov 2023 15:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A2E10E71E;
 Thu, 30 Nov 2023 15:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701359075; x=1732895075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZzJQww8gCfXPFKpB1djUtfiz73/yfE52SVZo3S21BQ8=;
 b=lwYn3fWZfDNIU1Uji6Nlmrlmwpd5gmPoJ2f5gN4ODloUGKiCh0rgvL/S
 kZ61ms1lzJhT4qDYJAT4NMhSHZT/ZYgvtI/l3x7e6XsVB4L8bFEALnmSQ
 jPxcpVDWKHrEPfkNn+NHMI3iF0N44zIbfbZN6dn+qUV4ddOzSt5my+cNh
 cFet/satpKmBIWd+fvm/UST3kcCymc47mohwcd9Tmqte1ATeMmRB46U7O
 cb5ckyM73z90J1ClFIdU1QOFCqLlNtqNOc5hgEIV4893jz7c5FETQkiwy
 7dVRXziB/vrj44+sTWAo2gN/3Dm+N4HNRNJ4q18qoxI0mLJHChNQ5DVkT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="242139"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="242139"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 07:44:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769344631"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="769344631"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 30 Nov 2023 07:44:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r8jDG-0002FY-1V;
 Thu, 30 Nov 2023 15:44:26 +0000
Date: Thu, 30 Nov 2023 23:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, agross@kernel.org, dmitry.baryshkov@linaro.org,
 andersson@kernel.org
Subject: Re: [PATCH v1] drm/msm/dpu: improve DSC allocation
Message-ID: <202311302343.3lXKkLxR-lkp@intel.com>
References: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev, quic_abhinavk@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, oe-kbuild-all@lists.linux.dev,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuogee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc3 next-20231130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/drm-msm-dpu-improve-DSC-allocation/20231130-064646
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1701289898-12235-1-git-send-email-quic_khsieh%40quicinc.com
patch subject: [PATCH v1] drm/msm/dpu: improve DSC allocation
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231130/202311302343.3lXKkLxR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302343.3lXKkLxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302343.3lXKkLxR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:537:24: warning: incompatible pointer to integer conversion assigning to 'uint32_t' (aka 'unsigned int') from 'void *' [-Wint-conversion]
                   pp_to_enc_id[pp_idx] = NULL;
                                        ^ ~~~~
   1 warning generated.


vim +537 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c

   463	
   464	static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
   465				       struct dpu_global_state *global_state,
   466				       struct drm_encoder *enc,
   467				       const struct msm_display_topology *top)
   468	{
   469		int num_dsc = 0;
   470		int i, pp_idx;
   471		bool pair = false;
   472		int dsc_idx[DSC_MAX - DSC_0];
   473		uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
   474		int pp_max = PINGPONG_MAX - PINGPONG_0;
   475	
   476		if (!top->num_dsc || !top->num_intf)
   477			return 0;
   478	
   479		/*
   480		 * Truth:
   481		 * 1) every layer mixer only connects to one pingpong
   482		 * 2) no pingpong split -- two layer mixers shared one pingpong
   483		 * 3) each DSC engine contains two dsc encoders
   484		 *    -- index(0,1), index (2,3),... etc
   485		 * 4) dsc pair can only happens with same DSC engine except 4 dsc
   486		 *    merge mode application (8k) which need two DSC engines
   487		 * 5) odd pingpong connect to odd dsc
   488		 * 6) even pingpong connect even dsc
   489		 */
   490	
   491		/* num_dsc should be either 1, 2 or 4 */
   492		if (top->num_dsc > top->num_intf)	/* merge mode */
   493			pair = true;
   494	
   495		/* fill working copy with pingpong list */
   496		memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
   497	
   498		for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
   499			if (!rm->dsc_blks[i])	/* end of dsc list */
   500				break;
   501	
   502			if (global_state->dsc_to_enc_id[i]) {	/* used */
   503				/* consective dsc index to be paired */
   504				if (pair && num_dsc) {	/* already start pairing, re start */
   505					num_dsc = 0;
   506					/* fill working copy with pingpong list */
   507					memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
   508									sizeof(pp_to_enc_id));
   509				}
   510				continue;
   511			}
   512	
   513			/* odd index can not become start of pairing */
   514			if (pair && (i & 0x01) && !num_dsc)
   515				continue;
   516	
   517			/*
   518			 * find the pingpong index which had been reserved
   519			 * previously at layer mixer allocation
   520			 */
   521			for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
   522				if (pp_to_enc_id[pp_idx] == enc->base.id)
   523					break;
   524			}
   525	
   526			/*
   527			 * dsc even index must map to pingpong even index
   528			 * dsc odd index must map to pingpong odd index
   529			 */
   530			if ((i & 0x01) != (pp_idx & 0x01))
   531				continue;
   532	
   533			/*
   534			 * delete pp_idx so that it can not be found at next search
   535			 * in the case of pairing
   536			 */
 > 537			pp_to_enc_id[pp_idx] = NULL;
   538	
   539			dsc_idx[num_dsc++] = i;
   540			if (num_dsc >= top->num_dsc)
   541				break;
   542		}
   543	
   544		if (num_dsc < top->num_dsc) {
   545			DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
   546							num_dsc, top->num_dsc );
   547			return -ENAVAIL;
   548		}
   549	
   550		/* reserve dsc */
   551		for (i = 0; i < top->num_dsc; i++) {
   552			int j;
   553	
   554			j = dsc_idx[i];
   555			global_state->dsc_to_enc_id[j] = enc->base.id;
   556		}
   557	
   558		return 0;
   559	}
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
