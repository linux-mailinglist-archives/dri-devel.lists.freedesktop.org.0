Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC0077EEEA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 04:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2529E10E04A;
	Thu, 17 Aug 2023 02:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3783410E04A;
 Thu, 17 Aug 2023 02:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692237956; x=1723773956;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qS88+1x1dNYl+kZ3HVtR/OE/V3f4bomUd0O5kPlz9VE=;
 b=bB2D23mkUCYZHw29CgEMi8YHyp6Wx3pa2r4xCS3Cmy8h7Gq2kvyHIc9S
 5aRDw8DVKOUQ9+ndOhZLX1ruusdn08WeIs9r8etU4qYPJ5gNGVIv7G/HD
 OgH1W8SRi4mYmdMu86bUfR9k0JaRfupLzH5rtiXo331aiV2SDQDGSK08p
 nBxYnBV3Dlkur6bUw1O6Kv7e43RlyOq+ZiuolXzeSPN5N7p8Wx3VDnIDs
 BNkShyGDLAnJOaj0+KeDZEtbBpyQ6r1qCJbeBY2AOvcWUdApllTnywHtA
 LPtNxxie6LB/B1PdonzLaXyjNdjsqxye9ltAAvEZWGrC3ZleP6rvabFFZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370158837"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="370158837"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 19:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="858037664"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="858037664"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 19:05:53 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qWSOW-0000iX-1B;
 Thu, 17 Aug 2023 02:05:52 +0000
Date: Thu, 17 Aug 2023 10:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] Documentation/gpu: VM_BIND locking document
Message-ID: <202308170916.TGY7kBpM-lkp@intel.com>
References: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816091547.2982-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-tip/drm-tip linus/master v6.5-rc6 next-20230816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/Documentation-gpu-VM_BIND-locking-document/20230816-171911
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230816091547.2982-1-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2] Documentation/gpu: VM_BIND locking document
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170916.TGY7kBpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170916.TGY7kBpM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-vm-bind-locking.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
