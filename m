Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163A4BA5BA9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 10:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C3310E369;
	Sat, 27 Sep 2025 08:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4snJTQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE32110E369
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 08:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758963515; x=1790499515;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WMH3ygkCBAtii44YH3MNF9ofM2L+4E5AFh5PlGQA3vw=;
 b=D4snJTQE5kxXTqRbnp4880CiCzNO9v2Pv6F7Lp5DGqFnsQoJbiYTtXkY
 ikLsGg8cjtpt3PsfwqfmoEz5fwddqDl40v4MWNgFP/m8+SaIRYqG6+lhs
 F0dXS4SF3jigKA/nNKC6msNpHlkwiUQT5BT9cEfFZRfhK4HBo45LCsQq9
 moxT/4cu2Vj5WHP0R77GhFqmzEaPz7VUuXWeZH/BdH6G4Vssd151h+Xpm
 ZoDjFQ52oip8IMJQD0OeH8NNYppOrv/wwOG9EFlZwxZmvz1rVQzNOC3j4
 Zn7YwYpaBaRsrVodlyEpc5SP4EzoygsSfOYa6bTID0YCBMsbD198Zz/nY g==;
X-CSE-ConnectionGUID: 1peMleogSSWImRtF0TpwxA==
X-CSE-MsgGUID: mwY0V3ZaRtq5Smv/nBDV6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61201731"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="61201731"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 01:58:35 -0700
X-CSE-ConnectionGUID: wH7uek+oTtW/y7uWKmqwzw==
X-CSE-MsgGUID: 3OVluKQxQPeA5vADnYvXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="177850187"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 27 Sep 2025 01:58:31 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v2QlA-0006vj-0Y;
 Sat, 27 Sep 2025 08:58:28 +0000
Date: Sat, 27 Sep 2025 16:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 1/2] drm/bridge: add drm_bridge_unplug() and
 drm_bridge_enter/exit()
Message-ID: <202509271654.j3IsjsAJ-lkp@intel.com>
References: <20250926-drm-bridge-atomic-vs-remove-v2-1-69f7d5ca1a92@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-drm-bridge-atomic-vs-remove-v2-1-69f7d5ca1a92@bootlin.com>
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

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7acbe30813f04cccf7b2e8b571eb7936cfec0a87]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-bridge-add-drm_bridge_unplug-and-drm_bridge_enter-exit/20250927-003721
base:   7acbe30813f04cccf7b2e8b571eb7936cfec0a87
patch link:    https://lore.kernel.org/r/20250926-drm-bridge-atomic-vs-remove-v2-1-69f7d5ca1a92%40bootlin.com
patch subject: [PATCH v2 1/2] drm/bridge: add drm_bridge_unplug() and drm_bridge_enter/exit()
config: x86_64-buildonly-randconfig-002-20250927 (https://download.01.org/0day-ci/archive/20250927/202509271654.j3IsjsAJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271654.j3IsjsAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509271654.j3IsjsAJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_bridge.c:218 function parameter 'bridge' not described in 'drm_bridge_enter'
>> Warning: drivers/gpu/drm/drm_bridge.c:253 function parameter 'bridge' not described in 'drm_bridge_unplug'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
