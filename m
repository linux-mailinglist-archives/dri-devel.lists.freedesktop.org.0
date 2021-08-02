Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB08E3DD1E0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 10:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCB26E0D2;
	Mon,  2 Aug 2021 08:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60216E0D2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 08:24:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id n2so23291809eda.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vKDm52pzzptHwDYLuFIUTz+fSECmPblZnnt4WqSDV4c=;
 b=AomdHCmM0uJ+L03tMWr7bf6oMRo5b7/DrMJNJpnSvXzi06ySFLUZ+55OBsVy0BHakP
 SDZXAIxxMw89wtuw7jWYwQ1R3tsMJ65l6xewcXAzxYmSKvTJziZylj80nySonDfRLi79
 d+EqofLOuCwnbw7KEwKlKcUIjU8GnAVLQm5Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vKDm52pzzptHwDYLuFIUTz+fSECmPblZnnt4WqSDV4c=;
 b=iJZcAhVF4i0Kkh4alSApHLkd/vGnHEA6u9YS6iHU26JxMaT6FTPPPM3ZoGQFvOvLmI
 ywNRQ2KrUNoNT/YeYaj5LVjHiZAHydNPoVIGLHXZSCOIyyCE5D/uXLwdkePrZJE7zn9d
 fixloM2zpCPQ+fklrBPWGyff2ChX6naSSV34Qfdgmy0tBqUxDRzQ8HXeAbBHR7zLNg6R
 45HVSzQ86ipEu8QmjhcJ1Ns7jK+WuML03oPkSmAtpY1Scttp9dOiXugm1GC78yFGNFZ9
 ykgAIs3Bgv9VIruPLTInJkr+zzAmyLk8OpxnGPNdsYlMGN+yYq2jndBYV1o6/qxRRSNm
 dmSA==
X-Gm-Message-State: AOAM531a/rprZOCg7lWyfRgYCDxl0o8b0X8/89PZMwUaGV/Tvoc+nZFk
 +vwT8gJTpnN+N9vXs0T7iHJdew==
X-Google-Smtp-Source: ABdhPJwPtzMyOPhtZqXF7X4dDqGBSfZsYPEOEyptBR+N42SQ9Gq+j3CrpfwTe57AnD21Rv6xSnGGGA==
X-Received: by 2002:a05:6402:254b:: with SMTP id
 l11mr17507222edb.157.1627892672121; 
 Mon, 02 Aug 2021 01:24:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m20sm4272269edv.67.2021.08.02.01.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 01:24:31 -0700 (PDT)
Date: Mon, 2 Aug 2021 10:24:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm: property: Replace strncpy() with strscpy_pad()
Message-ID: <YQervQEb7ggEcIB+@phenom.ffwll.local>
References: <20210731013241.11656-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210731013241.11656-1-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Sat, Jul 31, 2021 at 04:32:41AM +0300, Laurent Pinchart wrote:
> strncpy() is widely regarded as unsafe due to the fact that it may leave
> the destination string without a nul-termination when the source string
> size is too large. When compiling the kernel with W=1, the gcc warns
> about this:
> 
> drivers/gpu/drm/drm_property.c: In function ‘drm_property_create’:
> drivers/gpu/drm/drm_property.c:130:2: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
>   130 |  strncpy(property->name, name, DRM_PROP_NAME_LEN);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> There are three occurrences of strncpy() in drm_property.c. None of them
> are actually unsafe, as the very next line forces nul-termination of the
> destination buffer. The warning is thus a false positive, but adds noise
> to the kernel log. It can easily be silenced by using strscpy_pad()
> instead. Do so.
> 
> One of the three occurrences, in drm_property_add_enum(), fills a char
> array that is later copied to userspace with copy_to_user() in
> drm_mode_getproperty_ioctl(). To avoid leaking kernel data,
> strscpy_pad() is required. Similarly, a second occurrence, in
> drm_mode_getproperty_ioctl(), copies the string to an ioctl data buffer
> that isn't previously zero'ed, to strscpy_pad() is also required. The
> last occurrence, in drm_property_create(), would be safe to replace with
> strscpy(), as the destination buffer is copied to userspace with
> strscpy_pad(). However, given that this isn't in a hot path, let's avoid
> future data leaks in case someone copies the whole char array blindly.

+1 on just playing it safe.

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_property.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index 27c824a6eb60..32404891446e 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -127,8 +127,7 @@ struct drm_property *drm_property_create(struct drm_device *dev,
>  	property->num_values = num_values;
>  	INIT_LIST_HEAD(&property->enum_list);
>  
> -	strncpy(property->name, name, DRM_PROP_NAME_LEN);
> -	property->name[DRM_PROP_NAME_LEN-1] = '\0';
> +	strscpy_pad(property->name, name, DRM_PROP_NAME_LEN);
>  
>  	list_add_tail(&property->head, &dev->mode_config.property_list);
>  
> @@ -421,8 +420,7 @@ int drm_property_add_enum(struct drm_property *property,
>  	if (!prop_enum)
>  		return -ENOMEM;
>  
> -	strncpy(prop_enum->name, name, DRM_PROP_NAME_LEN);
> -	prop_enum->name[DRM_PROP_NAME_LEN-1] = '\0';
> +	strscpy_pad(prop_enum->name, name, DRM_PROP_NAME_LEN);
>  	prop_enum->value = value;
>  
>  	property->values[index] = value;
> @@ -475,8 +473,7 @@ int drm_mode_getproperty_ioctl(struct drm_device *dev,
>  	if (!property)
>  		return -ENOENT;
>  
> -	strncpy(out_resp->name, property->name, DRM_PROP_NAME_LEN);
> -	out_resp->name[DRM_PROP_NAME_LEN-1] = 0;
> +	strscpy_pad(out_resp->name, property->name, DRM_PROP_NAME_LEN);
>  	out_resp->flags = property->flags;
>  
>  	value_count = property->num_values;
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
