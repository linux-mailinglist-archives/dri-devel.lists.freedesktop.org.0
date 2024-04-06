Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C172189AA56
	for <lists+dri-devel@lfdr.de>; Sat,  6 Apr 2024 12:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB16210F040;
	Sat,  6 Apr 2024 10:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeZhQfgI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D31D10F044;
 Sat,  6 Apr 2024 10:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712399616; x=1743935616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X5tsa7eLX6h92RpchhaZofh+CcOwNJe3uIwkNfFcBrc=;
 b=ZeZhQfgI023MBA4C2DutgU2cY8H1FhKWHLLpL65G2ASzVZzqCFDmYNAG
 ODHrx9brvt7/3DHTGx/SBdqER5mH+qlvHrV3pyemti85pTEHej8dZMptn
 dEUFaTuyXnStsYKDAxdw4++o2vEGzYsh6eyy6R4W88/9EB2K3hO5i+w4t
 cWRX3rGKaHmLOKXSg2cIW5BESGLb35eh9Kjg/MvR1WR0NWEYeZPRDtRyF
 kZ0M7lIh+a2TU3w9vSJUe5V2aNEjVo/vJ57EeKZv6PrN5hzoYwj6FHK9x
 aQtfgXO49ZBi5W3UbFLq3MQ5/VLAH+XyRDf63a5Lvg7PqPskU/Cu+E/cm Q==;
X-CSE-ConnectionGUID: 9Wbup3pYQJi/ziX2qGL4qA==
X-CSE-MsgGUID: SHhcw7XuQb6Qo2nbxJv8NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="25234380"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="25234380"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 03:33:35 -0700
X-CSE-ConnectionGUID: G9PzvfOATT+1qypTb+2KIA==
X-CSE-MsgGUID: sVDakfYxRMSk61kSRpmTIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="19266072"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 06 Apr 2024 03:33:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rt3MW-0003Nu-0H;
 Sat, 06 Apr 2024 10:33:28 +0000
Date: Sat, 6 Apr 2024 18:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
Message-ID: <202404061839.0waGfXwj-lkp@intel.com>
References: <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
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

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2b3d5988ae2cb5cd945ddbc653f0a71706231fdd]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/soc-qcom-Move-some-socinfo-defines-to-the-header-expand-them/20240405-164231
base:   2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
patch link:    https://lore.kernel.org/r/20240405-topic-smem_speedbin-v1-4-ce2b864251b1%40linaro.org
patch subject: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
config: i386-buildonly-randconfig-001-20240406 (https://download.01.org/0day-ci/archive/20240406/202404061839.0waGfXwj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061839.0waGfXwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061839.0waGfXwj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:1090:14: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1090 |         *speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
         |                     ^
   1 error generated.


vim +/FIELD_PREP +1090 drivers/gpu/drm/msm/adreno/adreno_gpu.c

  1062	
  1063	int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
  1064				 struct device *dev, u32 *speedbin)
  1065	{
  1066		u32 fcode, pcode;
  1067		int ret;
  1068	
  1069		/* Try reading the speedbin via a nvmem cell first */
  1070		ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
  1071		if (!ret && ret != -EINVAL)
  1072			return ret;
  1073	
  1074		ret = qcom_smem_get_feature_code(&fcode);
  1075		if (ret) {
  1076			dev_err(dev, "Couldn't get feature code from SMEM!\n");
  1077			return ret;
  1078		}
  1079	
  1080		ret = qcom_smem_get_product_code(&pcode);
  1081		if (ret) {
  1082			dev_err(dev, "Couldn't get product code from SMEM!\n");
  1083			return ret;
  1084		}
  1085	
  1086		/* Don't consider fcode for external feature codes */
  1087		if (fcode <= SOCINFO_FC_EXT_RESERVE)
  1088			fcode = SOCINFO_FC_UNKNOWN;
  1089	
> 1090		*speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
  1091			    FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
  1092	
  1093		return ret;
  1094	}
  1095	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
