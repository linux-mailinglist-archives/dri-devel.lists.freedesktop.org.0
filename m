Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56C9490257
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 08:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635A010E467;
	Mon, 17 Jan 2022 07:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278EE10E467
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:05:31 +0000 (UTC)
X-UUID: 55774dce266b4f5caedbbf50f4cb57cb-20220117
X-UUID: 55774dce266b4f5caedbbf50f4cb57cb-20220117
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 597594063; Mon, 17 Jan 2022 15:05:25 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Jan 2022 15:05:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 15:05:22 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Joerg Roedel <jroedel@suse.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
Subject: [PATCH v10 00/13] Clean up "mediatek,larb"
Date: Mon, 17 Jan 2022 15:04:57 +0800
Message-ID: <20220117070510.17642-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, yong.wu@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MediaTek IOMMU block diagram always like below:

        M4U
         |
    smi-common
         |
  -------------
  |         |  ...
  |         |
larb1     larb2
  |         |
vdec       venc

All the consumer connect with smi-larb, then connect with smi-common.

When the consumer works, it should enable the smi-larb's power which also
need enable the smi-common's power firstly.

Thus, Firstly, use the device link connect the consumer and the
smi-larbs. then add device link between the smi-larb and smi-common.

After adding the device_link, then "mediatek,larb" property can be removed.
the iommu consumer don't need call the mtk_smi_larb_get/put to enable
the power and clock of smi-larb and smi-common.

Base on the media branch [1] and a jpeg dtbinding patchset[2] that already got
the necessary R-b.

[1] git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18d
[2] https://lore.kernel.org/linux-mediatek/20211206130425.184420-1-hsinyi@chromium.org/

Change notes:
v10: a) Rebase on the media tree. Respin the "media: mtk-vcodec:" patches.     
     b) Add Joerg's Ack for iommu patches.

v9: https://lore.kernel.org/linux-mediatek/20211112105509.12010-1-yong.wu@mediatek.com/
    1) Add return -ENODEV when the dev is null.
    2) Add more strict about the case that a iommu consume device use the ports in
    different larbs. Don't allow this case.
    3) Remove two codec interface: mtk_vcodec_release_enc/dec_pm since it only has one
    line now.

v8: https://lore.kernel.org/linux-mediatek/20210929013719.25120-1-yong.wu@mediatek.com/
    1) Rebase on v5.15-rc1.
    2) Don't rebase the below mdp patchset that may still need more discuss.
    https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/
    3) Add Frank's Tested-by. Remove Dafna's Tested-by as he requested.

v7: https://lore.kernel.org/linux-mediatek/20210730025238.22456-1-yong.wu@mediatek.com/
    1) Fix a arm32 boot fail issue. reported from Frank.
    2) Add a return fail in the mtk drm. suggested by Dafna.

v6: https://lore.kernel.org/linux-mediatek/20210714025626.5528-1-yong.wu@mediatek.com/
    1) rebase on v5.14-rc1.
    2) Fix the issue commented in v5 from Dafna and Hsin-Yi.
    3) Remove the patches about using pm_runtime_resume_and_get since they have
       already been merged by other patches.

v5: https://lore.kernel.org/linux-mediatek/20210410091128.31823-1-yong.wu@mediatek.com/
    1) Base v5.12-rc2.
    2) Remove changing the mtk-iommu to module_platform_driver patch, It have already been a
    independent patch.

v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/ 
    base on v5.7-rc1.
  1) Move drm PM patch before smi patchs.
  2) Change builtin_platform_driver to module_platform_driver since we may need
     build as module.
  3) Rebase many patchset as above.

v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
    1) rebase on v5.3-rc1 and the latest mt8183 patchset.
    2) Use device_is_bound to check whether the driver is ready from Matthias.    
    3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
   reason in the commit message[3/14].
    4) Add a display patch[12/14] into this series. otherwise it may affect
   display HW fastlogo even though it don't happen in mt8183.
   
v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
   1) rebase on v5.2-rc1.
   2) Move adding device_link between the consumer and smi-larb into
iommu_add_device from Robin.
   3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
   4) Remove the shutdown callback in iommu.   

v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/

Yong Wu (12):
  dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
  iommu/mediatek-v1: Free the existed fwspec if the master dev already
    has
  iommu/mediatek: Return ENODEV if the device is NULL
  iommu/mediatek: Add probe_defer for smi-larb
  iommu/mediatek: Add device_link between the consumer and the larb
    devices
  media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
  media: mtk-mdp: Get rid of mtk_smi_larb_get/put
  drm/mediatek: Get rid of mtk_smi_larb_get/put
  media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
  memory: mtk-smi: Get rid of mtk_smi_larb_get/put
  arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
  arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes

Yongqiang Niu (1):
  drm/mediatek: Add pm runtime support for ovl and rdma

 .../display/mediatek/mediatek,disp.txt        |  9 ----
 .../media/mediatek,vcodec-decoder.yaml        |  7 ---
 .../media/mediatek,vcodec-encoder.yaml        |  8 ----
 .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
 .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
 .../bindings/media/mediatek-mdp.txt           |  8 ----
 arch/arm/boot/dts/mt2701.dtsi                 |  2 -
 arch/arm/boot/dts/mt7623n.dtsi                |  5 ---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  8 +++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 ++++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +--
 drivers/iommu/mtk_iommu.c                     | 34 ++++++++++++++
 drivers/iommu/mtk_iommu_v1.c                  | 42 ++++++++++++++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +------------------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 40 -----------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  2 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 41 +++--------------
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  2 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 45 +++----------------
 drivers/memory/mtk-smi.c                      | 14 ------
 include/soc/mediatek/smi.h                    | 20 ---------
 32 files changed, 115 insertions(+), 333 deletions(-)

-- 
2.18.0


