Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3CA646ED5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 12:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFC810E1DF;
	Thu,  8 Dec 2022 11:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6C4010E1DF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 11:43:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92F53FEC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 03:43:08 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 995F23F73B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 03:43:01 -0800 (PST)
Date: Thu, 8 Dec 2022 11:42:55 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm: mali-dp: Add check for kzalloc
Message-ID: <Y5HNv5BEEzB2Gt9W@e110455-lin.cambridge.arm.com>
References: <20221208031621.3274-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221208031621.3274-1-jiasheng@iscas.ac.cn>
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
Cc: robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiasheng,

I appreciate the effort you have put into this and I find nothing wrong with the
intention of the patch. However, I don't intend to move base from being the first
member of the malidp_mw_connector_state struct as it has other benefits in the code
and we can use container_of() in implementation of generic APIs. As Robin has rightly
pointed, it is unlikely that a compiler will dereference the pointer before doing
offset_of(), so having mw_state == NULL is safe, even if quirky.

So I'm going to thank you for the patch but I will not merge it.

As a side comment, please use --in-reply-to and link to previous email when re-sending
patches with small spelling fixes as otherwise it gets confusing on which email is the last
one and it also relies on the servers delivering messages in the order you've sent,
not always a strong guarantee.

Best regards,
Liviu

On Thu, Dec 08, 2022 at 11:16:21AM +0800, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer, the "mw_state" can be NULL.
> If the layout of struct malidp_mw_connector_state ever changes, it
> will cause NULL poineter derefernce of "&mw_state->base".
> Therefore, the "mw_state" should be checked whether it is NULL in order
> to improve the robust.
> 
> Fixes: 8cbc5caf36ef ("drm: mali-dp: Add writeback connector")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/gpu/drm/arm/malidp_mw.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index ef76d0e6ee2f..fe4474c2ddcf 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -72,7 +72,11 @@ static void malidp_mw_connector_reset(struct drm_connector *connector)
>  		__drm_atomic_helper_connector_destroy_state(connector->state);
>  
>  	kfree(connector->state);
> -	__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> +
> +	if (mw_state)
> +		__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> +	else
> +		__drm_atomic_helper_connector_reset(connector, NULL);
>  }
>  
>  static enum drm_connector_status
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
