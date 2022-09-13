Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C860B5B7D6D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 01:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C43210E64D;
	Tue, 13 Sep 2022 23:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2775410E64D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 23:20:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7881CB8110A;
 Tue, 13 Sep 2022 23:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90208C433D6;
 Tue, 13 Sep 2022 23:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663111230;
 bh=OkP3AB4BNr1hUTAE2knTD/oF21cHVgadoi0HWaJ0SLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RaG8wFr0Psffi9JspzPru/GXaGT31Tfy0p63bSRRqfCwuyyhTBkvV3TfOMHLio4Yh
 FONjnotfc5J+UDhI/D8W4zMvyvLL4yDn62ng5yothHBqic01UQAPxbaFbuwhTsNugx
 sbWkYYeNEbC5wgzXf/TVe+jVIIiOnkcUYSe7ZJIbplTSlV3F/yuiO1a1bphlDTyooE
 DoNtdvWoQwzV+wbBI8K9lavbO4IDr6F0G//6qdG1L7W6ORdWS1+wXSECCeUtiQ93PT
 g1m3sqxpQdSrYVhd/nJattv5U4sARnRjlPFalr6A2+u4eh/N/zZG13j5+lSA5PuLIA
 SznubJmBFyvKA==
Date: Tue, 13 Sep 2022 16:20:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Subject: Re: [PATCH] drm/rockchip: Fix return type of
 cdn_dp_connector_mode_valid
Message-ID: <YyEQOztVBGl9D3u1@dev-arch.thelio-3990X>
References: <20220913205555.155149-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913205555.155149-1-nhuck@google.com>
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
Cc: David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 01:55:55PM -0700, Nathan Huckleberry wrote:
> The mode_valid field in drm_connector_helper_funcs is expected to be of
> type:
> enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
> 				     struct drm_display_mode *mode);
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of cdn_dp_connector_mode_valid should be changed from
> int to enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index c204e9b95c1f..518ee13b1d6f 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -283,8 +283,9 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
>  	return ret;
>  }
>  
> -static int cdn_dp_connector_mode_valid(struct drm_connector *connector,
> -				       struct drm_display_mode *mode)
> +static enum drm_mode_status
> +cdn_dp_connector_mode_valid(struct drm_connector *connector,
> +			    struct drm_display_mode *mode)
>  {
>  	struct cdn_dp_device *dp = connector_to_dp(connector);
>  	struct drm_display_info *display_info = &dp->connector.display_info;
> -- 
> 2.37.2.789.g6183377224-goog
> 
> 
