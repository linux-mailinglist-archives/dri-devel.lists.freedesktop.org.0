Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB172BBD5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A6B10E1DC;
	Mon, 12 Jun 2023 09:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55C810E1E2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:14:45 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D48423F0E3;
 Mon, 12 Jun 2023 11:14:40 +0200 (CEST)
Date: Mon, 12 Jun 2023 11:14:39 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Message-ID: <aenzh4vscayeqvyjpbxifog7l3yuxv5lh5cizcie7dk7awx5z7@nuajlsildlw6>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Degdag Mohamed <degdagmohamed@gmail.com>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-12 06:16:15, Dmitry Baryshkov wrote:
> Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
> overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
> proper dirty/damage processing. The drm/msm driver requires that to
> function to let CMD panels to work. Use simplified version of
> drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.
> 
> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> Fixes: 93e81e38e197 ("drm/fb_helper: Minimize damage-helper overhead")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks, this solves the following warning:

    msm_dpu ae01000.display-controller: drm_WARN_ON_ONCE(!helper->funcs->fb_dirty)
    WARNING: CPU: 0 PID: 9 at drivers/gpu/drm/drm_fb_helper.c:381 drm_fb_helper_damage_work+0x1c0/0x20c

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Note that drm_fb_helper_funcs documents this as "This callback is
optional": is it no longer optional, or are we enabling a damage feature
that makes it not-optional?

- Marijn

> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index fa9c1cbffae3..b933a85420f6 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -139,8 +139,28 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
>  	return ret;
>  }
>  
> +static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
> +			      struct drm_clip_rect *clip)
> +{
> +	struct drm_device *dev = helper->dev;
> +	int ret;
> +
> +	/* Call damage handlers only if necessary */
> +	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
> +		return 0;
> +
> +	if (helper->fb->funcs->dirty) {
> +		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
> +		if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>  	.fb_probe = msm_fbdev_create,
> +	.fb_dirty = msm_fbdev_fb_dirty,
>  };
>  
>  /*
> -- 
> 2.39.2
> 
