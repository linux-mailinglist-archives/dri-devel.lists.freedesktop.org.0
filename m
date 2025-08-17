Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C7DB294C0
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 20:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7E210E05B;
	Sun, 17 Aug 2025 18:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z5MV2LqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7347510E05B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 18:39:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9ECD341AD1;
 Sun, 17 Aug 2025 18:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB7BC4CEF4;
 Sun, 17 Aug 2025 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755455994;
 bh=m3PNNERXxwpCzkdnS/g84M24HexPmr502VnjyAPJFJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5MV2LqV5LaNSHO32gXSptkeeQvdwAMfWW7X7n7y7rTWYI09NaoJG3Z9C3hepxBhr
 dPGoUfZBzXnlxVUldR0sBdlw+z9HusCvmtzP9tIt/tG8YvzxKRZ2BYh8mkwxcB2vNE
 WFXso5bMN0O9faE67bNcjStO7OtzvS8Ep3hAz2v7vNt7+Qvo9GpRheMJkvYVb/K/OA
 iwgfeyTh7JYatQAJzzLJS9Qq+bboyEn8C6LCx9kadkPhgrNPXydEMvyKDF5nCzoEgU
 CtU28F8rTR/etylIJzaHpDW5v2v+psolCfE8tzrpzkVBQbkXz7+7j5G9GNW8Dj9e5E
 IOsSimuN2k63A==
Date: Sun, 17 Aug 2025 11:39:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <aKIh+MLEO2aM/vO7@x1>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-4-uwu@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814164048.2336043-4-uwu@icenowy.me>
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

On Fri, Aug 15, 2025 at 12:40:43AM +0800, Icenowy Zheng wrote:
> This is a from-scratch driver targeting Verisilicon DC-series display
> controllers, which feature self-identification functionality like their
> GC-series GPUs.
> 
> Only DC8200 is being supported now, and only the main framebuffer is set
> up (as the DRM primary plane). Support for more DC models and more
> features is my further targets.
> 
> As the display controller is delivered to SoC vendors as a whole part,
> this driver does not use component framework and extra bridges inside a
> SoC is expected to be implemented as dedicated bridges (this driver
> properly supports bridge chaining).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Thanks for working on this!

[snip]
> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> new file mode 100644
> index 0000000000000..25d6e01cc8b71
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
[snip]
> +static void vs_primary_plane_atomic_update(struct drm_plane *plane,
> +					   struct drm_atomic_state *atomic_state)
> +{
> +	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
> +								       plane);
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_crtc *crtc = state->crtc;
> +	struct drm_gem_dma_object *gem;
> +	struct vs_dc *dc;
> +	struct vs_crtc *vcrtc;
> +	struct vs_format fmt;
> +	unsigned int output, bpp;
> +	dma_addr_t dma_addr;
> +
> +	if (!crtc)
> +		return;
> +
> +	DRM_DEBUG_DRIVER("Updating output %d primary plane\n", output);

clang flagged this when building. I think this needs to be after the
line below that assigns vcrtc->id to output.

> +
> +	vcrtc = drm_crtc_to_vs_crtc(crtc);
> +	output = vcrtc->id;

Thanks,
Drew
