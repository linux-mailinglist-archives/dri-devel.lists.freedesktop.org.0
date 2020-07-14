Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B2821E53F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 03:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F06E869;
	Tue, 14 Jul 2020 01:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033356E869
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 01:39:15 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 13 Jul 2020 18:39:13 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 0CAC540978;
 Mon, 13 Jul 2020 18:39:13 -0700 (PDT)
Subject: Re: [PATCH] drm/vmwgfx: Fix two list_for_each loop exit tests
To: Dan Carpenter <dan.carpenter@oracle.com>, VMware Graphics
 <linux-graphics-maintainer@vmware.com>
References: <20200626103959.GC314359@mwanda>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <77f0761a-11e6-e321-2245-700258d54924@vmware.com>
Date: Tue, 14 Jul 2020 03:39:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626103959.GC314359@mwanda>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-002.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.06.20 um 12:39 schrieb Dan Carpenter:
> These if statements are supposed to be true if we ended the
> list_for_each_entry() loops without hitting a break statement but they
> don't work.
> 
> In the first loop, we increment "i" after the "if (i == unit)" condition
> so we don't necessarily know that "i" is not equal to unit at the end of
> the loop.
So, if I understand this right, this would only really be a problem if
there's no list entries at all, right? That is i == unit == 0.
Not sure if that can actually happen, but in any case the fix looks correct.


> 
> In the second loop we exit when mode is not pointing to a valid
> drm_display_mode struct so it doesn't make sense to check "mode->type".
Looks good to me too, condition order seems fine to me as well, though I
wouldn't particularly care.

Applied to vmwgfx-next as well, thanks.

Roland


> 
> Fixes: a278724aa23c ("drm/vmwgfx: Implement fbdev on kms v2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I reversed the second condition as well, just because I was copy and
> pasting the exit condition.  Plus I always feel like error handling is
> better than success handling.  If anyone feel strongly, then I can send
> a v2.
> 
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 3c97654b5a43..44168a7d7b44 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2576,7 +2576,7 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
>  		++i;
>  	}
>  
> -	if (i != unit) {
> +	if (&con->head == &dev_priv->dev->mode_config.connector_list) {
>  		DRM_ERROR("Could not find initial display unit.\n");
>  		ret = -EINVAL;
>  		goto out_unlock;
> @@ -2600,13 +2600,13 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
>  			break;
>  	}
>  
> -	if (mode->type & DRM_MODE_TYPE_PREFERRED)
> -		*p_mode = mode;
> -	else {
> +	if (&mode->head == &con->modes) {
>  		WARN_ONCE(true, "Could not find initial preferred mode.\n");
>  		*p_mode = list_first_entry(&con->modes,
>  					   struct drm_display_mode,
>  					   head);
> +	} else {
> +		*p_mode = mode;
>  	}
>  
>   out_unlock:
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
