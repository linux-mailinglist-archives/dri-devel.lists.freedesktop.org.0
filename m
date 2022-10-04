Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997DD5F3A95
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 02:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBC810E520;
	Tue,  4 Oct 2022 00:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D8510E520;
 Tue,  4 Oct 2022 00:26:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE30461230;
 Tue,  4 Oct 2022 00:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D22C433D7;
 Tue,  4 Oct 2022 00:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664843215;
 bh=OA9gALTKKnHQ120A5UTTlN4CPGY9ult7j6PDay+Yy1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WvlPoU8Qd1mJV9iVXVfw9hRnqYx5Er1VAytV/1aNisZe+s16mCe1PL2MzcnVKRXxT
 /MyXryezYGWaYGRXh+IRNOHf2aN5Al6WotSokibUKc2Zn6daKn6/LaLuvzDKtjuyVe
 HRweKcWOi85Mw9y8Uh3V0VTW+Tv1vT7gsu8YkBf9CbbqXcI69TsqR5/Z+/DDv4RRDV
 lJE61qV4IDqCf3xjFzRBq9Ihlt3332sGv/ozv12x98CnZiYQEt2n0Rz7Xv7tNdYYU8
 mQYe2KbEdYzpWFkUpNrdrZRrNiwSqFOBkzkQTlZeQpFAE2hfGpmYzW6ZHgP8P7UAPE
 yOX8EVzlxXYEA==
Date: Mon, 3 Oct 2022 19:26:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 1/5] drm/msm/dsi: Remove useless math in DSC calculation
Message-ID: <20221004002650.joqwhmvzql55ospz@baldur>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-2-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221001190807.358691-2-marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Marek Vasut <marex@denx.de>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 01, 2022 at 09:08:03PM +0200, Marijn Suijten wrote:
> Multiplying a value by 2 and adding 1 to it always results in a value
> that is uneven, and that 1 gets truncated immediately when performing
> integer division by 2 again.  There is no "rounding" possible here.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 8e4bc586c262..e05bae647431 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1864,12 +1864,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>  	data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
>  	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
>  
> -	/* bpp * 16 + 0.5 */
> -	data = dsc->bits_per_pixel * 16;
> -	data *= 2;
> -	data++;
> -	data /= 2;
> -	target_bpp_x16 = data;
> +	target_bpp_x16 = dsc->bits_per_pixel * 16;
>  
>  	data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
>  	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
> -- 
> 2.37.3
> 
