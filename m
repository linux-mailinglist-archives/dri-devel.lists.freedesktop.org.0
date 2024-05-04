Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A682D8BBC63
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 16:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B27A10E18A;
	Sat,  4 May 2024 14:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbIERe+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FDC10E18A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 14:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714832560; x=1746368560;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CILwjP0ONUZbyTTcX+CyOZLykJ1vSQsMj2UBjnbECmc=;
 b=LbIERe+gQxQMNnGGWgWHWVVMS0iSvmvZK3qG5cKXHti6AjrWs/gUji3J
 XCm6MapaVLaij2G1RNpTgic7elMpLDtXkZlvDP78uBknSjQirfhrrZbVP
 Kur1J2FOLWYCeinSECMUd1Zel+y1HW0PUyd1EBFVsSlkNgAHn1IAuWrh0
 GcYZ4inw3gsbZeMgTn9dUz2Fi8heyhD5TzmQBy35h0g20f88ciOvUekdt
 bfO29pc/uynUKHXAcjSxa/VDOMn+oYyZJH/FpL9/pOzZmC41XD5siQ7VE
 ov858uP/3DAH37fWwCbhuhq9NtXorZeGSdZEWkQFRkZJGQmabUx893wse w==;
X-CSE-ConnectionGUID: bmRs5IPUTiqeAmWIYMZc6Q==
X-CSE-MsgGUID: 1YPj6t77SrGIaZ80TZvOdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28104595"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; d="scan'208";a="28104595"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 07:22:38 -0700
X-CSE-ConnectionGUID: D6ZZSsqiRy6oOitYNRRBtg==
X-CSE-MsgGUID: FthiDTOOQc+pp/Ddru3WnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; d="scan'208";a="28218343"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 04 May 2024 07:22:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s3GHW-000Cr2-2z;
 Sat, 04 May 2024 14:22:30 +0000
Date: Sat, 4 May 2024 22:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Sean Paul <sean@poorly.run>,
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: Re: [PATCH v7 16/18] drm/mediatek: Support CRC in display driver
Message-ID: <202405042214.VhrmelKu-lkp@intel.com>
References: <20240502103848.5845-17-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502103848.5845-17-shawn.sung@mediatek.com>
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

Hi Shawn,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240501]
[cannot apply to v6.9-rc6 v6.9-rc5 v6.9-rc4 linus/master v6.9-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Sung/soc-mediatek-Disable-9-bit-alpha-in-ETHDR/20240502-184103
base:   next-20240501
patch link:    https://lore.kernel.org/r/20240502103848.5845-17-shawn.sung%40mediatek.com
patch subject: [PATCH v7 16/18] drm/mediatek: Support CRC in display driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240504/202405042214.VhrmelKu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405042214.VhrmelKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405042214.VhrmelKu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_create_crc_cmdq':
>> drivers/gpu/drm/mediatek/mtk_crtc.c:1362:9: error: too few arguments to function 'cmdq_pkt_jump'
    1362 |         cmdq_pkt_jump(&crc->cmdq_handle, crc->cmdq_handle.pa_base);
         |         ^~~~~~~~~~~~~
   In file included from drivers/gpu/drm/mediatek/mtk_crtc.c:11:
   include/linux/soc/mediatek/mtk-cmdq.h:319:19: note: declared here
     319 | static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_pa)
         |                   ^~~~~~~~~~~~~


vim +/cmdq_pkt_jump +1362 drivers/gpu/drm/mediatek/mtk_crtc.c

  1267	
  1268	#if IS_REACHABLE(CONFIG_MTK_CMDQ)
  1269	/**
  1270	 * mtk_crtc_create_crc_cmdq - Create a CMDQ thread for syncing the CRCs
  1271	 * @dev: Kernel device node of the CRC provider
  1272	 * @crc: Pointer of the CRC to init
  1273	 *
  1274	 * This function will create a looping thread on GCE (Global Command Engine) to
  1275	 * keep the CRC up to date by monitoring the assigned event (usually the frame
  1276	 * done event) of the CRC provider, and read the CRCs from the registers to a
  1277	 * shared memory for the workqueue to read. To start/stop the looping thread,
  1278	 * please call `mtk_crtc_start_crc_cmdq()` and `mtk_crtc_stop_crc_cmdq()`
  1279	 * defined blow.
  1280	 *
  1281	 * The reason why we don't update the CRCs with CPU is that the front porch of
  1282	 * 4K60 timing in CEA-861 is less than 60us, and register read/write speed is
  1283	 * relatively unreliable comparing to GCE due to the bus design.
  1284	 *
  1285	 * We must create a new thread instead of using the original one for plane
  1286	 * update is because:
  1287	 * 1. We cannot add another wait-for-event command at the end of cmdq packet, or
  1288	 *    the cmdq callback will delay for too long
  1289	 * 2. Will get the CRC of the previous frame if using the existed wait-for-event
  1290	 *    command which is at the beginning of the packet
  1291	 */
  1292	void mtk_crtc_create_crc_cmdq(struct device *dev, struct mtk_crtc_crc *crc)
  1293	{
  1294		int i;
  1295	
  1296		if (!crc->cnt) {
  1297			dev_warn(dev, "%s: not support\n", __func__);
  1298			goto cleanup;
  1299		}
  1300	
  1301		if (!crc->ofs) {
  1302			dev_warn(dev, "%s: not defined\n", __func__);
  1303			goto cleanup;
  1304		}
  1305	
  1306		crc->cmdq_client.client.dev = dev;
  1307		crc->cmdq_client.client.tx_block = false;
  1308		crc->cmdq_client.client.knows_txdone = true;
  1309		crc->cmdq_client.client.rx_callback = NULL;
  1310		crc->cmdq_client.chan = mbox_request_channel(&crc->cmdq_client.client, 0);
  1311		if (IS_ERR(crc->cmdq_client.chan)) {
  1312			dev_warn(dev, "%s: failed to create mailbox client\n", __func__);
  1313			crc->cmdq_client.chan = NULL;
  1314			goto cleanup;
  1315		}
  1316	
  1317		if (mtk_drm_cmdq_pkt_create(&crc->cmdq_client, &crc->cmdq_handle, PAGE_SIZE)) {
  1318			dev_warn(dev, "%s: failed to create cmdq packet\n", __func__);
  1319			goto cleanup;
  1320		}
  1321	
  1322		if (!crc->va) {
  1323			dev_warn(dev, "%s: no memory\n", __func__);
  1324			goto cleanup;
  1325		}
  1326	
  1327		/* map the entry to get a dma address for cmdq to store the crc */
  1328		crc->pa = dma_map_single(crc->cmdq_client.chan->mbox->dev,
  1329					 crc->va, crc->cnt * sizeof(*crc->va),
  1330					 DMA_FROM_DEVICE);
  1331	
  1332		if (dma_mapping_error(crc->cmdq_client.chan->mbox->dev, crc->pa)) {
  1333			dev_err(dev, "%s: failed to map dma\n", __func__);
  1334			goto cleanup;
  1335		}
  1336	
  1337		if (crc->cmdq_event)
  1338			cmdq_pkt_wfe(&crc->cmdq_handle, crc->cmdq_event, true);
  1339	
  1340		for (i = 0; i < crc->cnt; i++) {
  1341			/* put crc to spr1 register */
  1342			cmdq_pkt_read_s(&crc->cmdq_handle, crc->cmdq_reg->subsys,
  1343					crc->cmdq_reg->offset + crc->ofs[i],
  1344					CMDQ_THR_SPR_IDX1);
  1345	
  1346			/* copy spr1 register to physical address of the crc */
  1347			cmdq_pkt_assign(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
  1348					CMDQ_ADDR_HIGH(crc->pa + i * sizeof(*crc->va)));
  1349			cmdq_pkt_write_s(&crc->cmdq_handle, CMDQ_THR_SPR_IDX0,
  1350					 CMDQ_ADDR_LOW(crc->pa + i * sizeof(*crc->va)),
  1351					 CMDQ_THR_SPR_IDX1);
  1352		}
  1353		/* reset crc */
  1354		mtk_ddp_write_mask(&crc->cmdq_handle, ~0, crc->cmdq_reg, 0,
  1355				   crc->rst_ofs, crc->rst_msk);
  1356	
  1357		/* clear reset bit */
  1358		mtk_ddp_write_mask(&crc->cmdq_handle, 0, crc->cmdq_reg, 0,
  1359				   crc->rst_ofs, crc->rst_msk);
  1360	
  1361		/* jump to head of the cmdq packet */
> 1362		cmdq_pkt_jump(&crc->cmdq_handle, crc->cmdq_handle.pa_base);
  1363	
  1364		return;
  1365	cleanup:
  1366		mtk_crtc_destroy_crc(crc);
  1367	}
  1368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
