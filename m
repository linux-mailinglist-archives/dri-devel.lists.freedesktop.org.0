Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9E782417C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 13:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EF510E055;
	Thu,  4 Jan 2024 12:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07A310E055
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704370669; x=1735906669;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=38ZdTWKxn3CScgJvy/fi3YUFYW5BHXEAc9RRKzwiruM=;
 b=IiU+ONv/0+z3d9i88m25uToIztvkPO3HHNZ7SLKvYXpfZrZIhhNm9mVb
 5PY0zO+uxylNRJHE/9JVx/kUcng4QwqbS1tcKA/FO8+ABbLTzKzrWXg4W
 D4KEIzpckFQ5TB5LnR5/FuMSG6qtnF1Airc0HovQCtw4F7r8JeoGSYE+w
 HQ2rcD9Yx/YwmSzKjMhHuhTKeUytKebctaA0OoTCxkWquGza23SaRzwXb
 1WcsHsSBvEm4AcvmLV/BpefQDsDT7pgoTqScPwpr/QKqMeMLid0pUqTv1
 /MbfaPo14kuWsT0urnc93oVUFsEJWQ/90DxQ9uEasTonMs4E48DaV+YVe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="377375543"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="377375543"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 04:17:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="870893950"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="870893950"
Received: from pdelarag-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.32])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 04:17:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 23/39] drm/bridge: nxp-ptn3460: switch to ->edid_read
 callback
In-Reply-To: <202401040455.PPhqJiVr-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87fb7fd52d087dd9a15b7194f3915b6b1c4146d6.1704276309.git.jani.nikula@intel.com>
 <202401040455.PPhqJiVr-lkp@intel.com>
Date: Thu, 04 Jan 2024 14:17:42 +0200
Message-ID: <87plyhz40p.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 04 Jan 2024, kernel test robot <lkp@intel.com> wrote:
> Hi Jani,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc8 next-20240103]
> [cannot apply to drm-intel/for-linux-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-bridge-add-edid_read-hook-and-drm_bridge_edid_read/20240103-181513
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/87fb7fd52d087dd9a15b7194f3915b6b1c4146d6.1704276309.git.jani.nikula%40intel.com
> patch subject: [PATCH v2 23/39] drm/bridge: nxp-ptn3460: switch to ->edid_read callback
> config: arm-randconfig-001-20240103 (https://download.01.org/0day-ci/archive/20240104/202401040455.PPhqJiVr-lkp@intel.com/config)
> compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040455.PPhqJiVr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401040455.PPhqJiVr-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/gpu/drm/bridge/nxp-ptn3460.c:170:6: warning: variable 'drm_edid' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>      170 |         if (!edid) {
>          |             ^~~~~
>    drivers/gpu/drm/bridge/nxp-ptn3460.c:189:9: note: uninitialized use occurs here
>      189 |         return drm_edid;
>          |                ^~~~~~~~
>    drivers/gpu/drm/bridge/nxp-ptn3460.c:170:2: note: remove the 'if' if its condition is always false
>      170 |         if (!edid) {
>          |         ^~~~~~~~~~~~
>      171 |                 DRM_ERROR("Failed to allocate EDID\n");
>          |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      172 |                 goto out;
>          |                 ~~~~~~~~~
>      173 |         }
>          |         ~
>    drivers/gpu/drm/bridge/nxp-ptn3460.c:161:33: note: initialize the variable 'drm_edid' to silence this warning
>      161 |         const struct drm_edid *drm_edid;
>          |                                        ^
>          |                                         = NULL
>    1 warning generated.

This is a valid report, fixed locally.

BR,
Jani.


-- 
Jani Nikula, Intel
