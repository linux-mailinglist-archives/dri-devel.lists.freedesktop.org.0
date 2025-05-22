Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD4AC1169
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 18:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B041E10E7FE;
	Thu, 22 May 2025 16:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDMhW3rA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6806210E928
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747932615; x=1779468615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WAQaKse2ihBxfu0TJ9aEs4/TLMUkglE0FPdyzXEACyg=;
 b=NDMhW3rAbFiuePF43ilafJA4YtWevh8/3hfTA/q0jyR9Br5ERanu+jeg
 bb+T40cDLpB2CNLUB3aMz+Qfu/AgRJizyZZ29SlAHgvuR9VOaKnqnkiMs
 HAK38Rqbq/Vj5yIF94k+35Bx6eke3c6Jp/GpafkMk6hurKz8klNimoedM
 dWpJDpvZVQTaqlu/PwworLUCXibbKmRGb7GHCAWqyRJ+BzulZw9DBjWWL
 sKGZF2W2jd2wwgSERNweRrrTBjDKkbisVMullrhxOIM9MR95qkoS+XaHx
 OaK1x5gl3fIT8KCS3u/tI7YKDKoyepsBDrAcNLCverkf3zpy/o1rCv7RG g==;
X-CSE-ConnectionGUID: JW/Eu0/yShCsO3m/8hv4Wg==
X-CSE-MsgGUID: PI201upcSb2TUfa3OthwPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53783828"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="53783828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 09:50:14 -0700
X-CSE-ConnectionGUID: k2um+OxgQP2XgqQbU3n+og==
X-CSE-MsgGUID: BSIuWrpQQNafNT2SQQcBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="145550047"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 22 May 2025 09:50:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uI97L-000PWq-2Q;
 Thu, 22 May 2025 16:50:03 +0000
Date: Fri, 23 May 2025 00:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
Message-ID: <202505230242.8jtn9m5R-lkp@intel.com>
References: <20250520152436.474778-7-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520152436.474778-7-jens.wiklander@linaro.org>
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

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/optee-sync-secure-world-ABI-headers/20250520-232546
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250520152436.474778-7-jens.wiklander%40linaro.org
patch subject: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
config: um-randconfig-r123-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230242.8jtn9m5R-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230242.8jtn9m5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230242.8jtn9m5R-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "memremap" [drivers/tee/tee.ko] undefined!
ERROR: modpost: "memunmap" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "dma_alloc_pages" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "dma_free_pages" [drivers/tee/tee.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
