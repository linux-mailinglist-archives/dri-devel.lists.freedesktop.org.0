Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED5C7A1C3B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 12:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D05F10E176;
	Fri, 15 Sep 2023 10:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801A610E176
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:27:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABF3E6202B;
 Fri, 15 Sep 2023 10:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15EFC433CC;
 Fri, 15 Sep 2023 10:27:10 +0000 (UTC)
Message-ID: <7d882edf-4ae7-4521-a5b2-2781422cff1a@xs4all.nl>
Date: Fri, 15 Sep 2023 12:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
Content-Language: en-US, nl
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Moudy,

On 12/09/2023 09:57, Moudy Ho wrote:
> Changes since v4:
> - Rebase on v6.6-rc1
> - Remove any unnecessary DTS settings.
> - Adjust the usage of MOD and clock in blending components.
> 
> Changes since v3:
> - Depend on :
>   [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
> - Suggested by Krzysztof, integrating all newly added bindings for
>   the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> - Revise MDP3 nodes with generic names.
> 
> Changes since v2:
> - Depend on :
>   [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
>   [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> - Add parallel paths feature.
> - Add blended components settings.
> 
> Changes since v1:
> - Depend on :
>   [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
>   [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
> - Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"
> 
> Hello,
> 
> This patch is used to add support for MDP3 on the MT8195 platform that
> contains more picture quality components, and can arrange more pipelines
> through two sets of MMSYS and MUTEX respectively.

I ran this series through our build system and I got the following compile warning:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: In function 'mdp_path_config.isra':
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:449:51: warning: 'ctx' may be used uninitialized [-Wmaybe-uninitialized]
  449 |                         out = CFG_COMP(MT8195, ctx->param, outputs[0]);
      |                                                ~~~^~~~~~~
drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h:137:25: note: in definition of macro 'CFG_COMP'
  137 |         (IS_ERR_OR_NULL(comp) ? 0 : _CFG_COMP(plat, comp, mem))
      |                         ^~~~
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:402:30: note: 'ctx' was declared here
  402 |         struct mdp_comp_ctx *ctx;
      |                              ^~~

And also a few smatch warnings/errors:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:871 wait_wrot_event() warn: variable dereferenced before check 'mdp_cfg' (see line 864)
drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:1024 reset_luma_hist() warn: variable dereferenced before check 'mdp_cfg' (see line 1015)
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:447 mdp_path_config() error: potentially dereferencing uninitialized 'ctx'.
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:449 mdp_path_config() error: potentially dereferencing uninitialized 'ctx'.

You can run the same tests yourself, see this announcement:

https://lore.kernel.org/linux-media/18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl/

Regards,

	Hans

> 
> Moudy Ho (14):
>   arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
>   arm64: dts: mediatek: mt8195: add MDP3 nodes
>   media: platform: mtk-mdp3: add support second sets of MMSYS
>   media: platform: mtk-mdp3: add support second sets of MUTEX
>   media: platform: mtk-mdp3: introduce more pipelines from MT8195
>   media: platform: mtk-mdp3: introduce more MDP3 components
>   media: platform: mtk-mdp3: add checks for dummy components
>   media: platform: mtk-mdp3: avoid multiple driver registrations
>   media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
>   media: platform: mtk-mdp3: add support for blending multiple
>     components
>   media: platform: mtk-mdp3: add mt8195 platform configuration
>   media: platform: mtk-mdp3: add mt8195 shared memory configurations
>   media: platform: mtk-mdp3: add mt8195 MDP3 component settings
>   media: platform: mtk-mdp3: add support for parallel pipe to improve
>     FPS
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   6 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 378 ++++++++
>  .../platform/mediatek/mdp3/mdp_cfg_data.c     | 729 ++++++++++++++-
>  .../platform/mediatek/mdp3/mdp_reg_aal.h      |  25 +
>  .../platform/mediatek/mdp3/mdp_reg_color.h    |  31 +
>  .../media/platform/mediatek/mdp3/mdp_reg_fg.h |  23 +
>  .../platform/mediatek/mdp3/mdp_reg_hdr.h      |  31 +
>  .../platform/mediatek/mdp3/mdp_reg_merge.h    |  25 +
>  .../platform/mediatek/mdp3/mdp_reg_ovl.h      |  25 +
>  .../platform/mediatek/mdp3/mdp_reg_pad.h      |  21 +
>  .../platform/mediatek/mdp3/mdp_reg_rdma.h     |  24 +
>  .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   2 +
>  .../platform/mediatek/mdp3/mdp_reg_tdshp.h    |  34 +
>  .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   8 +
>  .../platform/mediatek/mdp3/mdp_sm_mt8195.h    | 283 ++++++
>  .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
>  .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   2 +
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 447 +++++++--
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 860 +++++++++++++++++-
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  93 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 103 ++-
>  .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  33 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  15 +
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  18 +
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |   1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |   3 +-
>  27 files changed, 3051 insertions(+), 174 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
> 

