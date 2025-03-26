Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA91A70E64
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 02:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA80710E634;
	Wed, 26 Mar 2025 01:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SI9Cp3CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7A110E634
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742952167; x=1774488167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EW2WUYnXzEeFiqZb4aNRiXPv+E5nRHDeYMd6+zBYJ/E=;
 b=SI9Cp3CLYDpZsG+MsFbUQl2gprTPFiIcf0ZL6+IqDFg/l02VNQG0wmGf
 WsLrgYt7O/Qy34N8ycpjkdzPMy7vDTO0ty0Wl2uRIWE995nKbPldnIUTJ
 Mw24R59ksDOMfft1tT5NiPWNybFG2ocfSaSwhcIWO8Tosp0rdD5fqrPNv
 amtY+JbeKq3bBdktyF+ovSnQARGhKVAC3LyGmVXQbFe/PWZGibjImPJfP
 xxJRqpZp/jziqUSSAJCS8sZZHBqn2r/SLtyD07gjoXWy9QOW0VIV+4fnm
 i914TW9leb73XnkrzPuvipdwyB8zhR6CqcuIc0vgXa+02m4ltX42HL225 g==;
X-CSE-ConnectionGUID: YOU1mZyLS02OL6+a3Z4KMg==
X-CSE-MsgGUID: +2i0lhakSWaj9o1yNMcSvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43951826"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="43951826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 18:22:47 -0700
X-CSE-ConnectionGUID: 5oOBzU7oSCaHqS8SQxa1SA==
X-CSE-MsgGUID: 5n/uCNutQEePq1cdGOjfgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="125350033"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2025 18:22:43 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1txFTd-0005MR-1a;
 Wed, 26 Mar 2025 01:22:41 +0000
Date: Wed, 26 Mar 2025 09:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Anusha Srivatsa <asrivats@redhat.com>
Subject: Re: [PATCH 2/5] drm/panel: Add refcount support
Message-ID: <202503260820.3wTF0Zap-lkp@intel.com>
References: <20250325-b4-panel-refcounting-v1-2-4e2bf5d19c5d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-b4-panel-refcounting-v1-2-4e2bf5d19c5d@redhat.com>
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

Hi Anusha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c8ba07caaecc622a9922cda49f24790821af8a71]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/drm-panel-Add-new-helpers-for-refcounted-panel-allocatons/20250326-012651
base:   c8ba07caaecc622a9922cda49f24790821af8a71
patch link:    https://lore.kernel.org/r/20250325-b4-panel-refcounting-v1-2-4e2bf5d19c5d%40redhat.com
patch subject: [PATCH 2/5] drm/panel: Add refcount support
config: s390-randconfig-002-20250326 (https://download.01.org/0day-ci/archive/20250326/202503260820.3wTF0Zap-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260820.3wTF0Zap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260820.3wTF0Zap-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_panel.c:408: warning: expecting prototype for drm_bridge_put_void(). Prototype was for drm_panel_put_void() instead


vim +408 drivers/gpu/drm/drm_panel.c

   398	
   399	/**
   400	 * drm_bridge_put_void - wrapper to drm_bridge_put() taking a void pointer
   401	 *
   402	 * @data: pointer to @struct drm_bridge, cast to a void pointer
   403	 *
   404	 * Wrapper of drm_bridge_put() to be used when a function taking a void
   405	 * pointer is needed, for example as a devm action.
   406	 */
   407	static void drm_panel_put_void(void *data)
 > 408	{
   409		struct drm_panel *panel = (struct drm_panel *)data;
   410	
   411		drm_panel_put(panel);
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
