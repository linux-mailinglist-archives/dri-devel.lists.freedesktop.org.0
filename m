Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADBF6F8757
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 19:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EBB10E03B;
	Fri,  5 May 2023 17:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CA110E03B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683306991; x=1714842991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=COkGdhmzVsdP87GQO1YqoDziPbpeYNGC0sWooQdVgSE=;
 b=gGKfoPFQ1j8ZRXjdLE/t3B73zXMMFzoAhRI6XfxXiKKezq6/eKDLtJ/l
 Vxle/p6CS253xaNkG3CilBmW6wVzSrzNSED+QVOLtcyFwcPRngbERtahD
 pLJJVcRyfq9L5GsdJvRwIs5J3xJRDyt50sYC68A4kqnFyo+KxD85MUgX2
 9W1Uk0yaRHnIN5ZO2ZBm0LX6BRSikvNa7ojgMxay+7FLrSG6c6qttTnEL
 8nn6u9WLjTX1//PuFttXBq6jHKZoTiniiGgyhf/u91HUHMHd5yIZLM9fr
 p45TJcCYmHrDS6bO/NHkueLofUshDcmdO+ttWPDq35ORub0abevk6nxLs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="435579041"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="435579041"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 10:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="675166695"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="675166695"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 05 May 2023 10:16:23 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1puz2d-0000mD-0U;
 Fri, 05 May 2023 17:16:23 +0000
Date: Sat, 6 May 2023 01:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 04/68] clk: Introduce
 clk_hw_determine_rate_no_reparent()
Message-ID: <202305060103.z9ddfq9A-lkp@intel.com>
References: <20221018-clk-range-checks-fixes-v4-4-971d5077e7d2@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v4-4-971d5077e7d2@cerno.tech>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-phy@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 145e5cddfe8b4bf607510b2dcf630d95f4db420f]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
base:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
patch link:    https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v4-4-971d5077e7d2%40cerno.tech
patch subject: [PATCH v4 04/68] clk: Introduce clk_hw_determine_rate_no_reparent()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230506/202305060103.z9ddfq9A-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3acd93f10087c4a2905407786d6dc7af83c2a58c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
        git checkout 3acd93f10087c4a2905407786d6dc7af83c2a58c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060103.z9ddfq9A-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
