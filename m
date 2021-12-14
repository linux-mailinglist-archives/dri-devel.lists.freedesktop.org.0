Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4A4742FE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 13:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E5D10E438;
	Tue, 14 Dec 2021 12:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A9E910E470
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 12:54:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02AA26D;
 Tue, 14 Dec 2021 04:54:15 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D69B23F793;
 Tue, 14 Dec 2021 04:54:14 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 9329368527A; Tue, 14 Dec 2021 12:54:13 +0000 (GMT)
Date: Tue, 14 Dec 2021 12:54:13 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] drm: mali-dp: potential dereference of null pointer
Message-ID: <YbiT9SZ2sqrl3sJT@e110455-lin.cambridge.arm.com>
References: <20211214125110.46979-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214125110.46979-1-jiasheng@iscas.ac.cn>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiasheng,

On Tue, Dec 14, 2021 at 08:51:10PM +0800, Jiasheng Jiang wrote:
> The return value of kzalloc() needs to be checked.
> To avoid use of null pointer '&state->base' in case of the
> failure of alloc.
> 
> Fixes: 99665d072183 ("drm: mali-dp: add malidp_crtc_state struct")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> Reported-by: Brian Starkey <brian.starkey@arm.com>

By R-b Brian meant "Reviewed-by" but I now can see how it can be confused with "Reported-by".

You don't have to send another version of the patch, I will add the correct tag to
your v1 when pushing it into drm-misc-next.

Best regards,
Liviu


> ---
> Changelog:
> 
> v1 -> v2
> 
> *Change 1. Add r-p.
> ---
>  drivers/gpu/drm/arm/malidp_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
> index 494075ddbef6..b5928b52e279 100644
> --- a/drivers/gpu/drm/arm/malidp_crtc.c
> +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> @@ -487,7 +487,10 @@ static void malidp_crtc_reset(struct drm_crtc *crtc)
>  	if (crtc->state)
>  		malidp_crtc_destroy_state(crtc, crtc->state);
>  
> -	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> +	if (state)
> +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
> +	else
> +		__drm_atomic_helper_crtc_reset(crtc, NULL);
>  }
>  
>  static int malidp_crtc_enable_vblank(struct drm_crtc *crtc)
> -- 
> 2.25.1
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
