Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5EAE1DFF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 16:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2620510EB77;
	Fri, 20 Jun 2025 14:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A001410EB77
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:58:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 860EA16F2;
 Fri, 20 Jun 2025 07:58:36 -0700 (PDT)
Received: from [10.1.30.22] (e122027.cambridge.arm.com [10.1.30.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9B423F673;
 Fri, 20 Jun 2025 07:58:51 -0700 (PDT)
Message-ID: <7f4d377c-c84a-43e0-9e4d-3d616ac4ef40@arm.com>
Date: Fri, 20 Jun 2025 15:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Add Mali GPU support for Mediatek MT8370 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All 5 patches push to drm-misc-next.

Thanks,
Steve

On 09/05/2025 11:12, Louis-Alexis Eyraud wrote:
> This patchset adds the support of the ARM Mali G57 MC2 GPU (Valhall-JM,
> dual core), integrated in the Mediatek MT8370 SoC, to the panfrost
> driver and to the mt8370.dtsi include file.
> 
> Since v4 patchset was sent, the [1] patchset adds in panfrost driver
> the AARCH64_4K page table format support and enablement for Mediatek
> SoC with integrated Arm Mali-G57, already supported in panfrost driver
> (like MT8188, MT8192, MT8195, MT8390, MT8395...).
> As MT8370 SoC is a less powerful variant of MT8390 (same GPU but with
> one less core for MT8370), I've reworked the second patch
> ('drm/panfrost: Add support for Mali on the MT8370 SoC') to enable the
> AARCH64_4K mode on this SoC as well by adding specific MT8370 platform
> data to set the needed flag.
> The previous patch revision uses MT8186 platform data because despite
> having different GPU architecture (Mali G52 2EE MC2 for MT8186, making
> them not compatible), using the same plaform data, for describing the
> same power management features only, was okay.
> But now, the platform data also contains the GPU configuration quirk
> bitfield that needs to be modified to enable the AARCH64_4K page table
> format, and in order not to change MT8186 behaviour, I add specific
> MT8370 platform data.
> 
> I've tested this patchset on a Mediatek Genio 510 EVK board,
> with a kernel based on linux-next (tag: next-20250502).
> 
> The panfrost driver probed with the following messages:
> ```
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>   80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
> ```
> 
> Running glmark2-es2-drm is also OK:
> ```
> =======================================================
>     glmark2 2023.01
> =======================================================
>     OpenGL Information
>     GL_VENDOR:      Mesa
>     GL_RENDERER:    Mali-G57 (Panfrost)
>     GL_VERSION:     OpenGL ES 3.1 Mesa 25.0.3-1
>     Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
>     Surface Size:   1200x1920 fullscreen
> =======================================================
> [build] use-vbo=false: FPS: 952 FrameTime: 1.051 ms
> [build] use-vbo=true: FPS: 983 FrameTime: 1.018 ms
> [texture] texture-filter=nearest: FPS: 906 FrameTime: 1.105 ms
> [texture] texture-filter=linear: FPS: 908 FrameTime: 1.102 ms
> [texture] texture-filter=mipmap: FPS: 883 FrameTime: 1.134 ms
> [shading] shading=gouraud: FPS: 838 FrameTime: 1.194 ms
> [shading] shading=blinn-phong-inf: FPS: 778 FrameTime: 1.287 ms
> [shading] shading=phong: FPS: 583 FrameTime: 1.717 ms
> [shading] shading=cel: FPS: 553 FrameTime: 1.809 ms
> [bump] bump-render=high-poly: FPS: 573 FrameTime: 1.747 ms
> [bump] bump-render=normals: FPS: 868 FrameTime: 1.153 ms
> [bump] bump-render=height: FPS: 707 FrameTime: 1.415 ms
> [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 454 FrameTime: 2.204 ms
> [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 172 FrameTime:
>   5.843 ms
> [pulsar] light=false:quads=5:texture=false: FPS: 770 FrameTime:
>   1.300 ms
> [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4:
>   FPS: 161 FrameTime: 6.235 ms
> [desktop] effect=shadow:windows=4: FPS: 484 FrameTime: 2.069 ms
> [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
>   =0.5:update-method=map: FPS: 512 FrameTime: 1.955 ms
> [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
>   =0.5:update-method=subdata: FPS: 513 FrameTime: 1.952 ms
> [buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction
>   =0.5:update-method=map: FPS: 577 FrameTime: 1.735 ms
> [ideas] speed=duration: FPS: 448 FrameTime: 2.235 ms
> [jellyfish] <default>: FPS: 226 FrameTime: 4.440 ms
> [terrain] <default>: FPS: 38 FrameTime: 26.861 ms
> [shadow] <default>: FPS: 328 FrameTime: 3.051 ms
> [refract] <default>: FPS: 72 FrameTime: 13.937 ms
> [conditionals] fragment-steps=0:vertex-steps=0: FPS: 844 FrameTime:
>   1.186 ms
> [conditionals] fragment-steps=5:vertex-steps=0: FPS: 685 FrameTime: 
>   1.462 ms
> [conditionals] fragment-steps=0:vertex-steps=5: FPS: 833 FrameTime:
>   1.201 ms
> [function] fragment-complexity=low:fragment-steps=5: FPS: 830 FrameTime:
>   1.205 ms
> [function] fragment-complexity=medium:fragment-steps=5: FPS: 525 FrameTime:
>   1.905 ms
> [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 837
>   FrameTime: 1.195 ms
> [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 835 
>   FrameTime: 1.199 ms
> [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 550
>   FrameTime: 1.820 ms
> =======================================================
>                                   glmark2 Score: 611 
> =======================================================
> ```
> 
> [1] https://lore.kernel.org/dri-devel/20250324185801.168664-1-ariel.dalessandro@collabora.com/
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Changes in v6:
> - Add two new patches to commonize and drop duplicated data related to 
>   the power domain and supplies definitions for Mediatek SoC
> - Remove useless comment and rework MT8370 platform data to use
>   mediatek_pm_domains and default_supplies arrays in 'drm/panfrost: Add
>   support for Mali on the MT8370 SoC'
> - Update code-review trailer
> - Link to v5: https://lore.kernel.org/r/20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com
> 
> Changes in v5:
> - Rebase on linux-next (tqg: next-2020501)
> - Rework 'drm/panfrost: Add support for Mali on the MT8370 SoC' patch
>   to have MT8370 support with its AARCH64_4K page table format support enabled 
> - Drop code-review trailers from 'drm/panfrost: Add support for Mali on
>   the MT8370 SoC' patch due to major changes in content and commit message
> - Add ack trailer for 'dt-bindings: gpu: mali-bifrost: Add compatible 
>   for MT8370 SoC' patch
> - Add glmark2-es2-drm benchmark results in cover letter
> - Link to v4: https://lore.kernel.org/r/20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com
> 
> Changes in v4:
> - Add warning comment in mt8370.dtsi about GPU node override
> - Reword "dt-bindings: gpu: mali-bifrost: Add compatible for MT8370
>   SoC" commit message
> - Add code-review trailers
> - Link to v3: https://lore.kernel.org/r/20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com
> 
> Changes in v3:
> - Rebased on linux-next (tag: next-20250207)
> - Remove prerequisite change/patch ids
> - Reword commit messages to better explicit compatible needs
> - Link to v2: https://lore.kernel.org/r/20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com
> 
> Changes in v2:
> - Rework "drm/panfrost: Add support for Mali on the MT8370 SoC" to avoid
>   data structure duplication, as requested by Krzysztof Kozlowski
> - Reword commit messages to use imperative mood and make new compatible
>   need more explicit
> - Link to v1: https://lore.kernel.org/r/20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com
> 
> ---
> Louis-Alexis Eyraud (5):
>       dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
>       drm/panfrost: Drop duplicated Mediatek supplies arrays
>       drm/panfrost: Commonize Mediatek power domain array definitions
>       drm/panfrost: Add support for Mali on the MT8370 SoC
>       arm64: dts: mediatek: mt8370: Enable gpu support
> 
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +-
>  arch/arm64/boot/dts/mediatek/mt8370.dtsi           | 16 ++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c            | 61 ++++++++++++----------
>  3 files changed, 53 insertions(+), 29 deletions(-)
> ---
> base-commit: 1c51b1ba38c07e4f999802eb708bf798dd5f5d1b
> change-id: 20250115-mt8370-enable-gpu-3b6f595fa63d
> 
> Best regards,

