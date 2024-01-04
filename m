Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C0582418C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 13:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7059B10E12C;
	Thu,  4 Jan 2024 12:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A44510E12C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704370918; x=1735906918;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ruuSsVyzI+FqL/qb6+6M4z+J+RtXpasMgzkxo/9nSw8=;
 b=AJdh2VWRO8uS/bhlP/4QnVAHDTXI9Iuab2WT+U0L4PRhwQkWqkbxeqcQ
 qTo6pckxjlpJnWLqsaiHOUAFE5pNE4HqUuOPI7TN1vuNIo9UgBJOFl0Y0
 L3kdYByRK8OpmQvvZKxMJx/T/s6Bt1zuePFLoRpm9TkmGoW8hK90xBQX9
 0K49+SgALCc6YQlLtj6REabmNxjrzPN4zm0vIB7NngJ0vcPiidFBUMYYO
 KQjAtPw4GKJaQ4Vu0Yq1iwoIL8gYkWzJqgHfT+NFpe8Bkj0yPCuyTZobe
 GKroFFoMgFIhWvbLbY3twTiqi0pwNO2/Pf42ccMs9E8KAmlbkfquOGOwM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="376713424"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="376713424"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 04:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899282272"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899282272"
Received: from pdelarag-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.32])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 04:21:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 34/39] drm: bridge: dw_hdmi: switch to ->edid_read
 callback
In-Reply-To: <202401041305.NcTmAmOJ-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula@intel.com>
 <202401041305.NcTmAmOJ-lkp@intel.com>
Date: Thu, 04 Jan 2024 14:21:52 +0200
Message-ID: <87mstlz3tr.fsf@intel.com>
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
> patch link:    https://lore.kernel.org/r/a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula%40intel.com
> patch subject: [PATCH v2 34/39] drm: bridge: dw_hdmi: switch to ->edid_read callback
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240104/202401041305.NcTmAmOJ-lkp@intel.com/config)
> compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401041305.NcTmAmOJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401041305.NcTmAmOJ-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2473:3: warning: variable 'edid' is uninitialized when used here [-Wuninitialized]
>     2473 |                 edid->width_cm, edid->height_cm);
>          |                 ^~~~
>    include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
>      155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>          |                                              ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
>      274 |                            dev, fmt, ##__VA_ARGS__)
>          |                                        ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
>      250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
>          |                                                                  ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
>      248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
>          |                                                                        ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
>      224 |                 func(&id, ##__VA_ARGS__);                       \
>          |                             ^~~~~~~~~~~
>    drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2461:25: note: initialize the variable 'edid' to silence this warning
>     2461 |         const struct edid *edid;
>          |                                ^
>          |                                 = NULL
>    1 warning generated.

This is a valid report, fixed locally.

BR,
Jani.


-- 
Jani Nikula, Intel
