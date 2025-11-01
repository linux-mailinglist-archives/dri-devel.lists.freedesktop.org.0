Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB8DC27C6A
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 12:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB3610E012;
	Sat,  1 Nov 2025 11:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jm5PnlJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5727510E012
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 11:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761995265; x=1793531265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pwo2AH/F6d+H4i2vyh89lNZ+XD4n4HBplTVDLdDFnB4=;
 b=Jm5PnlJwxr82UmtT9GMQBDM33G6qWaUDkSYg/M7EetOmQpeODpe+rf8m
 QFjoKVBfGzninZQ+r7Aq90ovuvp8YpswOHnU/XXx3vNHLy0GOZfwVQ/vI
 qmzxRswOxCZf3/P6a6qNmQsBtdGxmmp2CnQ/UVLrXENQ9ev6MKYZ3ovv/
 lSE+8jtC17n8jYpMHo7RYibjZoe+TfLK4rN07hh4n9VpKodZjGotRa9q7
 Z7fm5b9B0HNgC/kZZYCMDhiyKib9ZxieGxF06C1MRVFaVhmO9ZoCqDVjz
 qCy60AORX9ZYJRBVqVXkdcvtQvZ3KEnnk72tkToGW0y9cXYNpVCdmzS6a Q==;
X-CSE-ConnectionGUID: Sq8lBsxZRSi/xneXmj/k9g==
X-CSE-MsgGUID: fubHWOJtQoO4S4wSluv8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81771068"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; d="scan'208";a="81771068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 04:07:45 -0700
X-CSE-ConnectionGUID: D9pmvt2aRzub+M8lQn84cw==
X-CSE-MsgGUID: FpfaqeAFSECmJUUrEqcDeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; d="scan'208";a="190789457"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2025 04:07:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vF9SE-000OAS-0o;
 Sat, 01 Nov 2025 11:07:33 +0000
Date: Sat, 1 Nov 2025 19:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] soc: mediatek: Use pkt_write function pointer for
 subsys ID compatibility
Message-ID: <202511011822.Vn6fsvGr-lkp@intel.com>
References: <20251031160309.1654761-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031160309.1654761-2-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/soc-mediatek-Use-pkt_write-function-pointer-for-subsys-ID-compatibility/20251101-000555
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251031160309.1654761-2-jason-jh.lin%40mediatek.com
patch subject: [PATCH 1/5] soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
config: powerpc64-randconfig-r063-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011822.Vn6fsvGr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011822.Vn6fsvGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011822.Vn6fsvGr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-mmsys.c:170:26: error: no member named 'pkt_write_mask' in 'struct cmdq_client_reg'
     170 |                 ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
         |                       ~~~~~~~~~~~~~~~~ ^
>> drivers/soc/mediatek/mtk-mmsys.c:172:30: error: no member named 'pa_base' in 'struct cmdq_client_reg'
     172 |                                                       mmsys->cmdq_base.pa_base,
         |                                                       ~~~~~~~~~~~~~~~~ ^
   2 errors generated.
--
>> drivers/soc/mediatek/mtk-mutex.c:1002:16: error: no member named 'pkt_write' in 'struct cmdq_client_reg'
    1002 |         mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
         |         ~~~~~~~~~~~~~ ^
   1 error generated.


vim +170 drivers/soc/mediatek/mtk-mmsys.c

   162	
   163	static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
   164					  struct cmdq_pkt *cmdq_pkt)
   165	{
   166		int ret;
   167		u32 tmp;
   168	
   169		if (mmsys->cmdq_base.size && cmdq_pkt) {
 > 170			ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
   171							      mmsys->cmdq_base.subsys,
 > 172							      mmsys->cmdq_base.pa_base,
   173							      mmsys->cmdq_base.offset + offset,
   174							      val, mask);
   175			if (ret)
   176				pr_debug("CMDQ unavailable: using CPU write\n");
   177			else
   178				return;
   179		}
   180		tmp = readl_relaxed(mmsys->regs + offset);
   181		tmp = (tmp & ~mask) | (val & mask);
   182		writel_relaxed(tmp, mmsys->regs + offset);
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
