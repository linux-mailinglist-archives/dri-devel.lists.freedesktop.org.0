Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06589BCCB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 12:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B5A1123F0;
	Mon,  8 Apr 2024 10:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08E591123F0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 10:15:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93586339
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 03:16:18 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E1CD03F766
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 03:15:47 -0700 (PDT)
Date: Mon, 8 Apr 2024 11:15:41 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Huai-Yuan Liu <qq810974084@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 baijiaju1990@outlook.com
Subject: Re: [PATCH V2] drm/arm/malidp: fix a possible null pointer dereference
Message-ID: <ZhPDzdRp_6BAQkyP@e110455-lin.cambridge.arm.com>
References: <20240407063053.5481-1-qq810974084@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240407063053.5481-1-qq810974084@gmail.com>
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

On Sun, Apr 07, 2024 at 02:30:53PM +0800, Huai-Yuan Liu wrote:
> In malidp_mw_connector_reset, new memory is allocated with kzalloc, but 
> no check is performed. In order to prevent null pointer dereferencing, 
> ensure that mw_state is checked before calling 
> __drm_atomic_helper_connector_reset.
> 
> Fixes: 8cbc5caf36ef ("drm: mali-dp: Add writeback connector")
> Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the patch. I will pull it into drm-misc-fixes before the end of the week.

Best regards,
Liviu

> ---
> V2:
> * In patch V2, we additionally set connector->state to NULL. In this way
> we can ensure that there is no state pointing to freed memory.
>   Thanks to Liviu Dudau for helpful suggestion.
> ---
>  drivers/gpu/drm/arm/malidp_mw.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index 626709bec6f5..2577f0cef8fc 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -72,7 +72,10 @@ static void malidp_mw_connector_reset(struct drm_connector *connector)
>  		__drm_atomic_helper_connector_destroy_state(connector->state);
>  
>  	kfree(connector->state);
> -	__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> +	connector->state = NULL;
> +
> +	if (mw_state)
> +		__drm_atomic_helper_connector_reset(connector, &mw_state->base);
>  }
>  
>  static enum drm_connector_status
> -- 
> 2.34.1
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
