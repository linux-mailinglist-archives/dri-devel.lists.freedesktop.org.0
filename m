Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357365B7D60
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 01:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE59D10E653;
	Tue, 13 Sep 2022 23:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626D510E63A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 23:18:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00924B810DB;
 Tue, 13 Sep 2022 23:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4BDC433C1;
 Tue, 13 Sep 2022 23:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663111133;
 bh=/LcuPi8V7Ej7uvoNaew7dsD1eUxauxC0rf5elEG4pcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=isGmkR8X+bqZCIZQIZToszbRwjKwXAksaJyyViRDQ/ma3/H6VFLPPnBz4H+I+C6Z1
 6k969mCZrmzJ/PvuMY9bfIh5gMSpa4U5DU+e9lUOE5415GUoFjRUDZLy9B6o1Sfnhm
 3EtgPvgMiLXEI9iAzPZ6EBkKHoMNjadHoRDyPZOk3tWbqMPuFIqDyGl9hIa45hm89L
 F/BlojPf6ZnPMR+WiolQWurOnGA0nbqbWlbZrE0JZ1mokMU4oSYFD6+IMLVQOPtkRJ
 CxhG7NRoOAS+mXX9yUN/d+qGKH5PXJyjUYxkpe2rJdJWPuBGrPaadHsfomM2bY93nQ
 TCPHDb5axgLdA==
Date: Tue, 13 Sep 2022 16:18:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Subject: Re: [PATCH] drm/exynos: Fix return type for mixer_mode_valid and
 hdmi_mode_valid
Message-ID: <YyEP28J5O2Wlh4lS@dev-arch.thelio-3990X>
References: <20220913205449.154966-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913205449.154966-1-nhuck@google.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
 David Airlie <airlied@linux.ie>, Nick Desaulniers <ndesaulniers@google.com>,
 llvm@lists.linux.dev, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Tom Rix <trix@redhat.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 01:54:49PM -0700, Nathan Huckleberry wrote:
> The field mode_valid in exynos_drm_crtc_ops is expected to be of type
> enum drm_mode_status (*mode_valid)(struct exynos_drm_crtc *crtc,
>                                    const struct drm_display_mode *mode);
> 
> Likewise for mode_valid in drm_connector_helper_funcs.
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of mixer_mode_valid and hdmi_mode_valid should be
> changed from int to enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c  | 4 ++--
>  drivers/gpu/drm/exynos/exynos_mixer.c | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 10b0036f8a2e..8453359c92e8 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -922,8 +922,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
>  	return -EINVAL;
>  }
>  
> -static int hdmi_mode_valid(struct drm_connector *connector,
> -			struct drm_display_mode *mode)
> +static enum drm_mode_status hdmi_mode_valid(struct drm_connector *connector,
> +					    struct drm_display_mode *mode)
>  {
>  	struct hdmi_context *hdata = connector_to_hdmi(connector);
>  	int ret;
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 65260a658684..82f676e6d21b 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1045,8 +1045,9 @@ static void mixer_atomic_disable(struct exynos_drm_crtc *crtc)
>  	clear_bit(MXR_BIT_POWERED, &ctx->flags);
>  }
>  
> -static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
> -		const struct drm_display_mode *mode)
> +static enum drm_mode_status
> +mixer_mode_valid(struct exynos_drm_crtc *crtc,
> +		 const struct drm_display_mode *mode)
>  {
>  	struct mixer_context *ctx = crtc->ctx;
>  	u32 w = mode->hdisplay, h = mode->vdisplay;
> -- 
> 2.37.2.789.g6183377224-goog
> 
