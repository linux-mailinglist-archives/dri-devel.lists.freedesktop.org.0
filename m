Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A1C9EDA31
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A6910E3A5;
	Wed, 11 Dec 2024 22:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIK2v61R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59F010E3A5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733956824; x=1765492824;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2kvRBBph1xJE6pvRj6ZGPkSzRKem9ywKKkiLD48BVGA=;
 b=VIK2v61RnHO7rjabHMAj1KvSnYwsyLLHiTCF2wDhqjhpzAEoBg8FnJYA
 c99PuZ4sZCBf/ScENPeTBo4w+DuFbu5iLL+nNr/SXPNgQX+j2hW6cZD7f
 gdKlOQrmZK1WNoWJJUzrwJ+7URdnXW/Q64zEotUl6exBxUdXF5yBn3wUr
 yPdlK7O7EKU/RoR/LGzYgszILuY+2cGcaK3Gdwmpg9+iJAK5bqLuKUwq9
 KtapYld2Jepx6rsDUcQq39b4Q8PyfXYePPt5AApLiH6TKd5J7TC/OOL5Y
 DqkOBClqDey8fZuB+EUQxEf2D7dz363n0JXbYTf4QDkrZqQJ7KpffNY+p g==;
X-CSE-ConnectionGUID: VVAq6rSqQ/SqBbw3wQ43Tg==
X-CSE-MsgGUID: LWJAKO3BTc+sSrspbRqzKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51772135"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="51772135"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 14:40:23 -0800
X-CSE-ConnectionGUID: OCh016OeTByxsIW9zlk+Cw==
X-CSE-MsgGUID: kTbgP8mzSsaErlQESFa1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="96389004"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2024 14:40:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tLVNQ-0007AT-2d;
 Wed, 11 Dec 2024 22:40:16 +0000
Date: Thu, 12 Dec 2024 06:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Message-ID: <202412120643.qzGYgONG-lkp@intel.com>
References: <20241211032256.28494-7-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-7-jason-jh.lin@mediatek.com>
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

Hi Jason-JH.Lin,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/dt-bindings-mailbox-mediatek-Add-GCE-header-file-for-MT8196/20241211-112605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241211032256.28494-7-jason-jh.lin%40mediatek.com
patch subject: [PATCH v2 6/8] soc: mediatek: Add programming flow for unsupported subsys ID hardware
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412120643.qzGYgONG-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120643.qzGYgONG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120643.qzGYgONG-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/soc/mediatek/mtk-mmsys.o: in function `mtk_mmsys_update_bits':
>> drivers/soc/mediatek/mtk-mmsys.c:173:(.text+0x6c): undefined reference to `cmdq_subsys_is_valid'
   sparc-linux-ld: drivers/soc/mediatek/mtk-mutex.o: in function `mtk_mutex_enable_by_cmdq':
>> drivers/soc/mediatek/mtk-mutex.c:976:(.text+0x48c): undefined reference to `cmdq_subsys_is_valid'


vim +173 drivers/soc/mediatek/mtk-mmsys.c

   162	
   163	static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
   164					  struct cmdq_pkt *cmdq_pkt)
   165	{
   166		int ret;
   167		u32 tmp;
   168	
   169		if (mmsys->cmdq_base.size && cmdq_pkt) {
   170			struct cmdq_client *cl = (struct cmdq_client *)cmdq_pkt->cl;
   171	
   172			offset += mmsys->cmdq_base.offset;
 > 173			if (cmdq_subsys_is_valid(cl->chan, mmsys->cmdq_base.subsys)) {
   174				ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
   175							  offset, val, mask);
   176			} else {
   177				/* only MMIO access, no need to check mminfro_offset */
   178				ret = cmdq_pkt_assign(cmdq_pkt, 0,
   179						      CMDQ_ADDR_HIGH(mmsys->cmdq_base.pa_base));
   180				ret |= cmdq_pkt_write_s_mask_value(cmdq_pkt, 0,
   181								   CMDQ_ADDR_LOW(offset), val, mask);
   182			}
   183			if (ret)
   184				pr_debug("CMDQ unavailable: using CPU write\n");
   185			else
   186				return;
   187		}
   188		tmp = readl_relaxed(mmsys->regs + offset);
   189		tmp = (tmp & ~mask) | (val & mask);
   190		writel_relaxed(tmp, mmsys->regs + offset);
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
