Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A102E3EBB03
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 19:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A886E8AB;
	Fri, 13 Aug 2021 17:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 16CA26E8AB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 17:06:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F4B0D6E;
 Fri, 13 Aug 2021 10:06:27 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EF0B3F70D;
 Fri, 13 Aug 2021 10:06:27 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id CE7A1683E19; Fri, 13 Aug 2021 18:06:25 +0100 (BST)
Date: Fri, 13 Aug 2021 18:06:25 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Sandor.yu@nxp.com
Cc: brian.starkey@arm.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/arm/malidp: fix mode_valid couldn't cull invalid
 modes issue
Message-ID: <20210813170625.rootzkv4qctri63q@e110455-lin.cambridge.arm.com>
References: <20210810024331.14050-1-Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210810024331.14050-1-Sandor.yu@nxp.com>
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

On Tue, Aug 10, 2021 at 10:43:31AM +0800, Sandor.yu@nxp.com wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> In function malidp_crtc_mode_valid, mode->crtc_mode = 0 when run
> in drm_helper_probe_single_connector_modes.
> Invalid video modes are not culled
> and all modes move to the connector's modes list.
> It is not expected by mode_valid.
> 
> Replace mode->crtc_clock with mode->clock to fix the issue.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>

It looks like at least drm/bridge/cdns-dsi.c does the same thing of using
mode->clock when validating, so looks like a legit bug.

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Many thanks,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
> index 494075ddbef6..55890334385d 100644
> --- a/drivers/gpu/drm/arm/malidp_crtc.c
> +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> @@ -31,7 +31,7 @@ static enum drm_mode_status malidp_crtc_mode_valid(struct drm_crtc *crtc,
>  	 * check that the hardware can drive the required clock rate,
>  	 * but skip the check if the clock is meant to be disabled (req_rate = 0)
>  	 */
> -	long rate, req_rate = mode->crtc_clock * 1000;
> +	long rate, req_rate = mode->clock * 1000;
>  
>  	if (req_rate) {
>  		rate = clk_round_rate(hwdev->pxlclk, req_rate);
> -- 
> 2.17.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
