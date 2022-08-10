Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E49E58EB88
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 13:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57817B421A;
	Wed, 10 Aug 2022 11:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5073B40D0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 11:51:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id bv3so17442881wrb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 04:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
 bh=LDfEYb5ujn1T+y8ZdrYflg44hRzKk8763KEYo/Jqooc=;
 b=VsfOftKCJHPLqJmZsbYKzFsC5wiVuqV/8JCiYAVptPF/YYd4ipgoyhzI0tuqldHgzH
 Ha0LF8Pybi7f5hyNzZO0APTqTQNuLpyB6F/dytyZsNhJNqrIqH+9NgHgqta8zn5/fan6
 gFqzx8Yco8TA6ivlfRBarvt+OEzZ4TOS10urY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=LDfEYb5ujn1T+y8ZdrYflg44hRzKk8763KEYo/Jqooc=;
 b=kA/hmvtI0bVGWE5QVlTpAe5iFCWiyAuatamvKAKIAIid4vvxufCwhnt1kt8drchqEb
 6GzoOD0xxZVe2wgiFP35RMC/im4oNWTWcnDnkZr36I3hYvF9mwuZ/gzeAPAupyyL0FWY
 /I6fIE2EgQRbstfEXwaXSGAvQI7TmeOl3YVex+s5YHgBHUaaBVNlXoq5EwQw02JU0EUS
 g996Fc3Q4SR4Owo03Y3bX6dFtrOAPfxPBD1fpXMuX4+8sC/hEXcg9UcPZAE9e5ljIVSX
 PnthFhhHGcPLAnirsTkTmG1zA4zUb54Gx7XruAzDz7vC0GhiOtrjNvqK6NGK4gGf5/yP
 YSGA==
X-Gm-Message-State: ACgBeo3d8ZNDqiJL1xm/PT/fNBmYT+1QHGyWadybSUcVbhwrs4BL2XmQ
 fDF1SDs7tSq7HnJInm04A7P1fA==
X-Google-Smtp-Source: AA6agR5l9QMtWYfltZKz7qPF62egv4G39OHczeBaxjZ9CRWiL1TB75raui6OQT3z6KcXev2/EWNGFw==
X-Received: by 2002:a05:6000:61c:b0:220:6425:c113 with SMTP id
 bn28-20020a056000061c00b002206425c113mr17742344wrb.612.1660132282843; 
 Wed, 10 Aug 2022 04:51:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adfe5c3000000b0021edb2d07bbsm15588661wrn.33.2022.08.10.04.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 04:51:22 -0700 (PDT)
Date: Wed, 10 Aug 2022 13:51:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: XueBing Chen <chenxuebing@jari.cn>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/sync_file: use strscpy to
 replace strlcpy
Message-ID: <YvObuLevnEWEITnS@phenom.ffwll.local>
Mail-Followup-To: XueBing Chen <chenxuebing@jari.cn>,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 gustavo@padovan.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <6aad3bff.d1a.181b982d1b1.Coremail.chenxuebing@jari.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aad3bff.d1a.181b982d1b1.Coremail.chenxuebing@jari.cn>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: gustavo@padovan.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 01, 2022 at 07:26:07PM +0800, XueBing Chen wrote:
> 
> The strlcpy should not be used because it doesn't limit the source
> length. Preferred is strscpy.
> 
> Signed-off-by: XueBing Chen <chenxuebing@jari.cn>

I don't think there's an impact here since we don't check the error return
value, but also doesn't hurt.

Thanks for your patch, applied to drm-misc-next.
-Daniel

> ---
>  drivers/dma-buf/sync_file.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 3ebec19a8e02..af57799c86ce 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -132,7 +132,7 @@ EXPORT_SYMBOL(sync_file_get_fence);
>  char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>  {
>  	if (sync_file->user_name[0]) {
> -		strlcpy(buf, sync_file->user_name, len);
> +		strscpy(buf, sync_file->user_name, len);
>  	} else {
>  		struct dma_fence *fence = sync_file->fence;
>  
> @@ -172,7 +172,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  		return NULL;
>  	}
>  	sync_file->fence = fence;
> -	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
> +	strscpy(sync_file->user_name, name, sizeof(sync_file->user_name));
>  	return sync_file;
>  }
>  
> @@ -262,9 +262,9 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
>  static int sync_fill_fence_info(struct dma_fence *fence,
>  				 struct sync_fence_info *info)
>  {
> -	strlcpy(info->obj_name, fence->ops->get_timeline_name(fence),
> +	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
>  		sizeof(info->obj_name));
> -	strlcpy(info->driver_name, fence->ops->get_driver_name(fence),
> +	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
>  		sizeof(info->driver_name));
>  
>  	info->status = dma_fence_get_status(fence);
> -- 
> 2.25.1
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
