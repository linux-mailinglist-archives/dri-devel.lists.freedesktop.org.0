Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59085183F4
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5B710F89E;
	Tue,  3 May 2022 12:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC81110F90B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:12:19 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nlrO6-0006cw-5h; Tue, 03 May 2022 14:12:18 +0200
Message-ID: <86160889d7be260c5012044643b81d10098943fe.camel@pengutronix.de>
Subject: Re: [PATCH] drm/msm: Limit command submission when no IOMMU
From: Lucas Stach <l.stach@pengutronix.de>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Date: Tue, 03 May 2022 14:12:15 +0200
In-Reply-To: <20220502172908.3569799-1-robdclark@gmail.com>
References: <20220502172908.3569799-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 02.05.2022 um 10:29 -0700 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
> 
> Running the GPU without an IOMMU is not really a supported (or sane)
> configuration.  Yet it can be useful during SoC bringup (ie. if the
> iommu driver doesn't work yet).
> 
> Lets limit it to users who already have /dev/mem access, to avoid the
> chance that a user accidentially configures kernel without IOMMU
> support.

I haven't followed MSM too closely, so ctx->aspace may also include the
GPU MMU, but if this really only includes the IOMMU (as the commit
message implies) then this breaks Freedreno on i.MX5.

Regards,
Lucas

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 23b68bc945f6..9cd8c8708990 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -734,6 +734,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	if (args->pad)
>  		return -EINVAL;
>  
> +	if (unlikely(!ctx->aspace) && !capable(CAP_SYS_RAWIO)) {
> +		DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
> +		return -EPERM;
> +	}
> +
>  	/* for now, we just have 3d pipe.. eventually this would need to
>  	 * be more clever to dispatch to appropriate gpu module:
>  	 */


