Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3680BA37
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 11:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB3310E123;
	Sun, 10 Dec 2023 10:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDBC10E122;
 Sun, 10 Dec 2023 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702205648; x=1733741648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bKb6I9zBG+5Ovm9G2uVoaBqjWBV1g7OKt9qJag3oGHY=;
 b=dFcJFfk8NknIslreTc73Zu9zVuS5Ygs/xMSHF/jVy8yL3FLpjGKzUUta
 wytTMH14m39Nbn9QDlBMo5GrNTcBZCwXzTZcVGwWvuzV1WLxOVMgs2Emo
 hcTHnMoZ+HIjbXry4cefD0NHRdMq59BleJIDXRwYpIHIoEj4JOpMuHih3
 c29V2WP5uc8y8ZAiq73SS0zpaxBklQ8zl6tEo5cjt4fmfPUzC/WbmaZ6p
 7taAYVDiOcsp/IIYfn2fB9pMUsBV9N7GAmZRtq09DhmPHncVD5h5uVFH3
 9UkzADD/Q+vxEBbDrxxjEfdTCC4QImPd1jBcvfVUofNWvdc9rP4OwtJvG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="394284649"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; d="scan'208";a="394284649"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 02:54:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="772654098"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; d="scan'208";a="772654098"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 10 Dec 2023 02:54:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rCHRg-000Gjc-0h;
 Sun, 10 Dec 2023 10:54:00 +0000
Date: Sun, 10 Dec 2023 18:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 07/16] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM
 block
Message-ID: <202312101815.B3ZH7Pfy-lkp@intel.com>
References: <20231208050641.32582-8-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208050641.32582-8-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, oe-kbuild-all@lists.linux.dev,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231207]
[also build test WARNING on v6.7-rc4]
[cannot apply to drm-misc/drm-misc-next linus/master v6.7-rc4 v6.7-rc3 v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-msm-dpu-add-formats-check-for-writeback-encoder/20231208-130820
base:   next-20231207
patch link:    https://lore.kernel.org/r/20231208050641.32582-8-quic_abhinavk%40quicinc.com
patch subject: [PATCH v2 07/16] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231210/202312101815.B3ZH7Pfy-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312101815.B3ZH7Pfy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101815.B3ZH7Pfy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c:193:5: warning: no previous prototype for function 'dpu_hw_cdm_enable' [-Wmissing-prototypes]
   int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
       ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c:193:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
   ^
   static 
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c:230:6: warning: no previous prototype for function 'dpu_hw_cdm_disable' [-Wmissing-prototypes]
   void dpu_hw_cdm_disable(struct dpu_hw_cdm *ctx)
        ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c:230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dpu_hw_cdm_disable(struct dpu_hw_cdm *ctx)
   ^
   static 
   2 warnings generated.
--
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c:59: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Horizontal coefficients for cosite chroma downscale
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c:65: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Horizontal coefficients for offsite chroma downscale
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c:70: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Vertical coefficients for cosite chroma downscale
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c:74: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Vertical coefficients for offsite chroma downscale


vim +/dpu_hw_cdm_enable +193 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c

    57	
    58	/**
  > 59	 * Horizontal coefficients for cosite chroma downscale
    60	 * s13 representation of coefficients
    61	 */
    62	static u32 cosite_h_coeff[] = {0x00000016, 0x000001cc, 0x0100009e};
    63	
    64	/**
    65	 * Horizontal coefficients for offsite chroma downscale
    66	 */
    67	static u32 offsite_h_coeff[] = {0x000b0005, 0x01db01eb, 0x00e40046};
    68	
    69	/**
    70	 * Vertical coefficients for cosite chroma downscale
    71	 */
    72	static u32 cosite_v_coeff[] = {0x00080004};
    73	/**
    74	 * Vertical coefficients for offsite chroma downscale
    75	 */
    76	static u32 offsite_v_coeff[] = {0x00060002};
    77	
    78	static int dpu_hw_cdm_setup_cdwn(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cfg)
    79	{
    80		struct dpu_hw_blk_reg_map *c = &ctx->hw;
    81		u32 opmode = 0;
    82		u32 out_size = 0;
    83	
    84		if (cfg->output_bit_depth == CDM_CDWN_OUTPUT_10BIT)
    85			opmode &= ~CDM_CDWN2_OP_MODE_BITS_OUT_8BIT;
    86		else
    87			opmode |= CDM_CDWN2_OP_MODE_BITS_OUT_8BIT;
    88	
    89		/* ENABLE DWNS_H bit */
    90		opmode |= CDM_CDWN2_OP_MODE_ENABLE_H;
    91	
    92		switch (cfg->h_cdwn_type) {
    93		case CDM_CDWN_DISABLE:
    94			/* CLEAR METHOD_H field */
    95			opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
    96			/* CLEAR DWNS_H bit */
    97			opmode &= ~CDM_CDWN2_OP_MODE_ENABLE_H;
    98			break;
    99		case CDM_CDWN_PIXEL_DROP:
   100			/* Clear METHOD_H field (pixel drop is 0) */
   101			opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
   102			break;
   103		case CDM_CDWN_AVG:
   104			/* Clear METHOD_H field (Average is 0x1) */
   105			opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
   106			opmode |= CDM_CDWN2_OP_MODE_METHOD_H_AVG;
   107			break;
   108		case CDM_CDWN_COSITE:
   109			/* Clear METHOD_H field (Average is 0x2) */
   110			opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
   111			opmode |= CDM_CDWN2_OP_MODE_METHOD_H_COSITE;
   112			/* Co-site horizontal coefficients */
   113			DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_0,
   114					cosite_h_coeff[0]);
   115			DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_1,
   116					cosite_h_coeff[1]);
   117			DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_2,
   118					cosite_h_coeff[2]);
   119			break;
   120		case CDM_CDWN_OFFSITE:
   121			/* Clear METHOD_H field (Average is 0x3) */
   122			opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
   123			opmode |= CDM_CDWN2_OP_MODE_METHOD_H_OFFSITE;
   124	
   125			/* Off-site horizontal coefficients */
   126			DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_0,
   127					offsite_h_coeff[0]);
   128			DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_1,
   129					offsite_h_coeff[1]);
   130			DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_2,
   131					offsite_h_coeff[2]);
   132			break;
   133		default:
   134			pr_err("%s invalid horz down sampling type\n", __func__);
   135			return -EINVAL;
   136		}
   137	
   138		/* ENABLE DWNS_V bit */
   139		opmode |= CDM_CDWN2_OP_MODE_ENABLE_V;
   140	
   141		switch (cfg->v_cdwn_type) {
   142		case CDM_CDWN_DISABLE:
   143			/* CLEAR METHOD_V field */
   144			opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
   145			/* CLEAR DWNS_V bit */
   146			opmode &= ~CDM_CDWN2_OP_MODE_ENABLE_V;
   147			break;
   148		case CDM_CDWN_PIXEL_DROP:
   149			/* Clear METHOD_V field (pixel drop is 0) */
   150			opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
   151			break;
   152		case CDM_CDWN_AVG:
   153			/* Clear METHOD_V field (Average is 0x1) */
   154			opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
   155			opmode |= CDM_CDWN2_OP_MODE_METHOD_V_AVG;
   156			break;
   157		case CDM_CDWN_COSITE:
   158			/* Clear METHOD_V field (Average is 0x2) */
   159			opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
   160			opmode |= CDM_CDWN2_OP_MODE_METHOD_V_COSITE;
   161			/* Co-site vertical coefficients */
   162			DPU_REG_WRITE(c,
   163				      CDM_CDWN2_COEFF_COSITE_V,
   164				      cosite_v_coeff[0]);
   165			break;
   166		case CDM_CDWN_OFFSITE:
   167			/* Clear METHOD_V field (Average is 0x3) */
   168			opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
   169			opmode |= CDM_CDWN2_OP_MODE_METHOD_V_OFFSITE;
   170	
   171			/* Off-site vertical coefficients */
   172			DPU_REG_WRITE(c,
   173				      CDM_CDWN2_COEFF_OFFSITE_V,
   174				      offsite_v_coeff[0]);
   175			break;
   176		default:
   177			return -EINVAL;
   178		}
   179	
   180		if (cfg->v_cdwn_type || cfg->h_cdwn_type)
   181			opmode |= CDM_CDWN2_OP_MODE_EN; /* EN CDWN module */
   182		else
   183			opmode &= ~CDM_CDWN2_OP_MODE_EN;
   184	
   185		out_size = (cfg->output_width & 0xFFFF) | ((cfg->output_height & 0xFFFF) << 16);
   186		DPU_REG_WRITE(c, CDM_CDWN2_OUT_SIZE, out_size);
   187		DPU_REG_WRITE(c, CDM_CDWN2_OP_MODE, opmode);
   188		DPU_REG_WRITE(c, CDM_CDWN2_CLAMP_OUT, ((0x3FF << 16) | 0x0));
   189	
   190		return 0;
   191	}
   192	
 > 193	int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
   194	{
   195		struct dpu_hw_blk_reg_map *c = &ctx->hw;
   196		const struct dpu_format *fmt;
   197		u32 opmode = 0;
   198		u32 csc = 0;
   199	
   200		if (!ctx || !cdm)
   201			return -EINVAL;
   202	
   203		fmt = cdm->output_fmt;
   204	
   205		if (!DPU_FORMAT_IS_YUV(fmt))
   206			return -EINVAL;
   207	
   208		dpu_hw_csc_setup(&ctx->hw, CDM_CSC_10_MATRIX_COEFF_0, cdm->csc_cfg, true);
   209		dpu_hw_cdm_setup_cdwn(ctx, cdm);
   210	
   211		if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
   212			if (fmt->chroma_sample != DPU_CHROMA_H1V2)
   213				return -EINVAL; /*unsupported format */
   214			opmode = CDM_HDMI_PACK_OP_MODE_EN;
   215			opmode |= (fmt->chroma_sample << 1);
   216		}
   217	
   218		csc |= CDM_CSC10_OP_MODE_DST_FMT_YUV;
   219		csc &= ~CDM_CSC10_OP_MODE_SRC_FMT_YUV;
   220		csc |= CDM_CSC10_OP_MODE_EN;
   221	
   222		if (ctx && ctx->ops.bind_pingpong_blk)
   223			ctx->ops.bind_pingpong_blk(ctx, true, cdm->pp_id);
   224	
   225		DPU_REG_WRITE(c, CDM_CSC_10_OPMODE, csc);
   226		DPU_REG_WRITE(c, CDM_HDMI_PACK_OP_MODE, opmode);
   227		return 0;
   228	}
   229	
 > 230	void dpu_hw_cdm_disable(struct dpu_hw_cdm *ctx)
   231	{
   232		if (!ctx)
   233			return;
   234	
   235		if (ctx && ctx->ops.bind_pingpong_blk)
   236			ctx->ops.bind_pingpong_blk(ctx, false, PINGPONG_NONE);
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
