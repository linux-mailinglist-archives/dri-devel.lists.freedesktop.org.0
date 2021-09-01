Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB23FE228
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 20:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00206E24D;
	Wed,  1 Sep 2021 18:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C30D6E24D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 18:13:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98EFA559;
 Wed,  1 Sep 2021 20:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1630520000;
 bh=BDl0EmauITqkvN6b/L6wjyoZWA3yqKvMu0HJWSPXVEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ucoRfpQEdOL5uWiJHPl4jRLJICaNAL5SCAJcbYTw57fqz6f46uYHeDfj1y/scMT25
 wijEhCS5NbSCTmWwQB44Jf1aPl7ADNgmaqlr6CVpNDLt5XVCxwDJo8rkGYgnpChKr8
 NxkykMaOVW8YiPowN9atrwmqi+FyI5NJjXJGKXMc=
Date: Wed, 1 Sep 2021 21:13:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm: Add drm_fixed_16_16 helper
Message-ID: <YS/CsCSqKeFYF9x7@pendragon.ideasonboard.com>
References: <20210901175431.14060-1-alyssa@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901175431.14060-1-alyssa@rosenzweig.io>
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

Hi Alyssa,

Thank you for the patch.

On Wed, Sep 01, 2021 at 01:54:27PM -0400, Alyssa Rosenzweig wrote:
> This constructs a fixed 16.16 rational, useful to specify the minimum
> and maximum scaling in drm_atomic_helper_check_plane_state. It is
> open-coded as a macro in multiple drivers, so let's share the helper.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>  include/drm/drm_fixed.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 553210c02ee0..df1f369b4918 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -208,4 +208,9 @@ static inline s64 drm_fixp_exp(s64 x)
>  	return sum;
>  }
>  

Missing documentation :-)

> +static inline int drm_fixed_16_16(s32 mult, s32 div)

You should return a s32.

The function name isn't very explicit, and departs from the naming
scheme of other functions in the same file. As fixed-point numbers are
stored in a s64 for the drm_fixp_* helpers, we shouldn't rese the
drm_fixp_ prefix, maybe drm_fixp_s16_16_ would be a good prefix. The
function should probably be named drm_fixp_s16_16 from_fraction() then,
but then the same logic should possibly be replicated to ensure optimal
precision. I wonder if it wouldn't be best to simply use
drm_fixp_from_fraction() and shift the result right by 16 bits.

> +{
> +	return (mult << 16) / div;
> +}
> +
>  #endif

-- 
Regards,

Laurent Pinchart
