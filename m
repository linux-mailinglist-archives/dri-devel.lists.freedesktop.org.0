Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D0F3C80CB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F56B6E1D3;
	Wed, 14 Jul 2021 08:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE46C6E1D3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:56:25 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown
 [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4DB701F42B69;
 Wed, 14 Jul 2021 09:56:23 +0100 (BST)
Subject: Re: [PATCH v6 00/11] Clean up "mediatek,larb"
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <672ef386-aa95-da45-0f17-acb398a1f6e0@collabora.com>
Date: Wed, 14 Jul 2021 10:56:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-1-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

Thanks for the patchset.

I tested it on mt8173 (elm) with chromeos userspace.
Before that patchset, the test:

tast -verbose run -build=false 10.42.0.175 video.DecodeAccel.h264

sometimes passed and sometimes failed with 'context deadline exceeded'.
With this patchset it seems that the test always passes so I added tested-by:

Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Thanks,
Dafna




On 14.07.21 04:56, Yong Wu wrote:
> MediaTek IOMMU block diagram always like below:
> 
>          M4U
>           |
>      smi-common
>           |
>    -------------
>    |         |  ...
>    |         |
> larb1     larb2
>    |         |
> vdec       venc
> 
> All the consumer connect with smi-larb, then connect with smi-common.
> 
> When the consumer works, it should enable the smi-larb's power which also
> need enable the smi-common's power firstly.
> 
> Thus, Firstly, use the device link connect the consumer and the
> smi-larbs. then add device link between the smi-larb and smi-common.
> 
> After adding the device_link, then "mediatek,larb" property can be removed.
> the iommu consumer don't need call the mtk_smi_larb_get/put to enable
> the power and clock of smi-larb and smi-common.
> 
> About the MM dt-binding/dtsi patches, I guess they should go together, thus
> I don't split them for each a MM module and each a SoC.
> 
> Base on v5.14-rc1, and a jpeg[1] and mdp[2] patchset.
> 
> [1] https://lore.kernel.org/linux-mediatek/20210702102304.3346429-1-hsinyi@chromium.org/
> [2] https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/
> 
> Change notes:
> v6: 1) rebase on v5.14-rc1.
>      2) Fix the issue commented in v5 from Dafna and Hsin-Yi.
>      3) Remove the patches about using pm_runtime_resume_and_get since they have
>         already been merged by other patches.
> 
> v5: https://lore.kernel.org/linux-mediatek/20210410091128.31823-1-yong.wu@mediatek.com/
>      1) Base v5.12-rc2.
>      2) Remove changing the mtk-iommu to module_platform_driver patch, It have already been a
>      independent patch.
> 
> v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/
>      base on v5.7-rc1.
>    1) Move drm PM patch before smi patchs.
>    2) Change builtin_platform_driver to module_platform_driver since we may need
>       build as module.
>    3) Rebase many patchset as above.
> 
> v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
>      1) rebase on v5.3-rc1 and the latest mt8183 patchset.
>      2) Use device_is_bound to check whether the driver is ready from Matthias.
>      3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
>     reason in the commit message[3/14].
>      4) Add a display patch[12/14] into this series. otherwise it may affect
>     display HW fastlogo even though it don't happen in mt8183.
>     
> v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
>     1) rebase on v5.2-rc1.
>     2) Move adding device_link between the consumer and smi-larb into
> iommu_add_device from Robin.
>     3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
>     4) Remove the shutdown callback in iommu.
> 
> v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/
> 
> Yong Wu (10):
>    dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
>    iommu/mediatek: Add probe_defer for smi-larb
>    iommu/mediatek: Add device_link between the consumer and the larb
>      devices
>    media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
>    media: mtk-mdp: Get rid of mtk_smi_larb_get/put
>    drm/mediatek: Get rid of mtk_smi_larb_get/put
>    media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
>    memory: mtk-smi: Get rid of mtk_smi_larb_get/put
>    arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
>    arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes
> 
> Yongqiang Niu (1):
>    drm/mediatek: Add pm runtime support for ovl and rdma
> 
>   .../display/mediatek/mediatek,disp.txt        |  9 ----
>   .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
>   .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
>   .../bindings/media/mediatek-mdp.txt           |  8 ----
>   .../bindings/media/mediatek-vcodec.txt        |  4 --
>   arch/arm/boot/dts/mt2701.dtsi                 |  2 -
>   arch/arm/boot/dts/mt7623n.dtsi                |  5 --
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  9 +++-
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 19 ++++----
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
>   drivers/iommu/mtk_iommu.c                     | 24 +++++++++-
>   drivers/iommu/mtk_iommu_v1.c                  | 22 ++++++++-
>   .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +-----------------
>   .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>   drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 ++----------------
>   drivers/memory/mtk-smi.c                      | 14 ------
>   include/soc/mediatek/smi.h                    | 20 --------
>   28 files changed, 85 insertions(+), 323 deletions(-)
> 
