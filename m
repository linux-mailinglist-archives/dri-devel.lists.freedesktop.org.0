Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6E3DD37D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 12:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F816E55C;
	Mon,  2 Aug 2021 10:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 566 seconds by postgrey-1.36 at gabe;
 Mon, 02 Aug 2021 10:01:15 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789726E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 10:01:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0C338379; Mon,  2 Aug 2021 11:51:43 +0200 (CEST)
Date: Mon, 2 Aug 2021 11:51:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 acourbot@chromium.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Message-ID: <YQfALZNWyw8VKODp@8bytes.org>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
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

On Fri, Jul 30, 2021 at 10:52:26AM +0800, Yong Wu wrote:
>  .../display/mediatek/mediatek,disp.txt        |  9 ----
>  .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
>  .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
>  .../bindings/media/mediatek-mdp.txt           |  8 ----
>  .../bindings/media/mediatek-vcodec.txt        |  4 --
>  arch/arm/boot/dts/mt2701.dtsi                 |  2 -
>  arch/arm/boot/dts/mt7623n.dtsi                |  5 --
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  9 +++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
>  drivers/iommu/mtk_iommu.c                     | 24 +++++++++-
>  drivers/iommu/mtk_iommu_v1.c                  | 31 ++++++++++++-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +-----------------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 ++----------------
>  drivers/memory/mtk-smi.c                      | 14 ------
>  include/soc/mediatek/smi.h                    | 20 --------
>  28 files changed, 92 insertions(+), 321 deletions(-)

So this is likely not going through the IOMMU tree, given Matthias has
reviewed the IOMMU changes you can add my Acked-by: Joerg Roedel <jroedel@suse.de>
