Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A677A2E0C
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 07:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087EB10E0BC;
	Sat, 16 Sep 2023 05:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C19910E0BB;
 Sat, 16 Sep 2023 05:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694841983; x=1726377983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sQqNUz8NvUk6DBasGIZFf64Imf283b8WYPr38zLikEA=;
 b=OIZ4pbKaFCn0nM0FDzobFYXxyceV5hWbYn0mEmLEFnHci7Sygv12/SRe
 Wlsnh5OZJvLbHoi5J23cz9+iAfYvFAWzX7SBu3nUeExPQB/DbLkSZ+cKD
 0QhlR+dImVEMSv2U6y/drkDcRvrcmFThB854oYUjrSqdqfPtSwiJSUmgt
 Xy3/0hQmm2NALE9UVhDNRPnkeMbyNihs/+bLu3smHin3T3LnFqE/77Muv
 iMiYFkE3ZM5AciacFWkkT3G6cuhCCsbw99WXzjMECE+uchKoc5r+fd69F
 FpHNXHZ5qmkAGSjUymnmP+tuxYO4op07iBlI2h9CpEsRBd8OvxiphWxzH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445860726"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; d="scan'208";a="445860726"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 22:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="860400269"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; d="scan'208";a="860400269"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2023 22:26:18 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qhNou-0003ts-09;
 Sat, 16 Sep 2023 05:26:16 +0000
Date: Sat, 16 Sep 2023 13:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, agross@kernel.org, dmitry.baryshkov@linaro.org,
 andersson@kernel.org
Subject: Re: [PATCH v3 4/7] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Message-ID: <202309161321.UeiYRcIs-lkp@intel.com>
References: <1694813901-26952-5-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694813901-26952-5-git-send-email-quic_khsieh@quicinc.com>
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
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, oe-kbuild-all@lists.linux.dev,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuogee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.6-rc1]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/drm-msm-dp-tie-dp_display_irq_handler-with-dp-driver/20230916-054014
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/1694813901-26952-5-git-send-email-quic_khsieh%40quicinc.com
patch subject: [PATCH v3 4/7] drm/msm/dp: incorporate pm_runtime framework into DP driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230916/202309161321.UeiYRcIs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161321.UeiYRcIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161321.UeiYRcIs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_power.c: In function 'dp_power_client_deinit':
>> drivers/gpu/drm/msm/dp/dp_power.c:160:34: warning: variable 'power' set but not used [-Wunused-but-set-variable]
     160 |         struct dp_power_private *power;
         |                                  ^~~~~
   drivers/gpu/drm/msm/dp/dp_power.c: In function 'dp_power_init':
   drivers/gpu/drm/msm/dp/dp_power.c:168:34: warning: variable 'power' set but not used [-Wunused-but-set-variable]
     168 |         struct dp_power_private *power = NULL;
         |                                  ^~~~~
   drivers/gpu/drm/msm/dp/dp_power.c: In function 'dp_power_deinit':
   drivers/gpu/drm/msm/dp/dp_power.c:179:34: warning: variable 'power' set but not used [-Wunused-but-set-variable]
     179 |         struct dp_power_private *power;
         |                                  ^~~~~


vim +/power +160 drivers/gpu/drm/msm/dp/dp_power.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  157  
c943b4948b5848 Chandan Uddaraju 2020-08-27  158  void dp_power_client_deinit(struct dp_power *dp_power)
c943b4948b5848 Chandan Uddaraju 2020-08-27  159  {
c943b4948b5848 Chandan Uddaraju 2020-08-27 @160  	struct dp_power_private *power;
c943b4948b5848 Chandan Uddaraju 2020-08-27  161  
c943b4948b5848 Chandan Uddaraju 2020-08-27  162  	power = container_of(dp_power, struct dp_power_private, dp_power);
c943b4948b5848 Chandan Uddaraju 2020-08-27  163  }
c943b4948b5848 Chandan Uddaraju 2020-08-27  164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
