Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D440C359E44
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 14:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D666E49C;
	Fri,  9 Apr 2021 12:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4771C6E49C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 12:05:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 z24-20020a1cf4180000b029012463a9027fso2846490wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GmoW3YljJdzXTdaVl3nKzHtP9yoeRbS+PR/SwGvPwzI=;
 b=erhM+YHyzMZa0CVwtQsYV9LovNt7FcdT20X5u1iUbZdVlYeivXtUzPU6Qw3oaXdTBN
 CbVlChfZL4vSa3dVPx3ZIda+g/0zHu8D2UsMwXFRbXHv60YntJ6gatbX7lFkPYrg2IWF
 3qKmkBwJ3tywOp3d0F2x1+DpXPO+HHstejc/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GmoW3YljJdzXTdaVl3nKzHtP9yoeRbS+PR/SwGvPwzI=;
 b=MFagyB6PaH8ONYq9fwO7MUX2bxUb9cxUB1/5CymMGrZyBWnsywqHWnYDSdwKoq4JM0
 CVT/nNYx2YmH4DnYSuwxfPNYGTDZ+Vp+CCqPEwQECnsQTO0fBcJnoQ57HAOVkX/evsqs
 bqFVNV9fzP1Ro42WkMHDqMUdeCKFca/q5U6Mk0LHTO0ZZ2joolvqZmdUvLBKJft4oxR/
 4RJqJz/yX40nLLRgQUEO54PPnmfFUojBvH3eyiA5yf3fYCC5R1FvjtkSbTdApb8cq/ng
 Cd9/kaOEtF8OM8b6VU5K335lwXicUi4w7zIxm6NQ/lBZcsnV4/v1iisAViYQHG+Feh+d
 iDKQ==
X-Gm-Message-State: AOAM533wbIu9AbQncrek9ZqwH2AfzAsoJGaRFJaOGJg+hZghrGwT8Wbu
 Aqz6mJGKwQVJKYgelScyOy4dXg==
X-Google-Smtp-Source: ABdhPJzCVJxTdxHSbwZkB3t3jIMfzd2jEa5/FMu4DWUv6enFBkVCkO32q+pA/LFBrU3gJVDSzioAKA==
X-Received: by 2002:a1c:6787:: with SMTP id b129mr8526972wmc.11.1617969942919; 
 Fri, 09 Apr 2021 05:05:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j23sm3426762wmo.33.2021.04.09.05.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 05:05:42 -0700 (PDT)
Date: Fri, 9 Apr 2021 14:05:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: make global mutex and use count static
Message-ID: <YHBDFDIktBBsSkAB@phenom.ffwll.local>
References: <20210409110730.2958-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210409110730.2958-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: bernard@vivo.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 09, 2021 at 01:07:30PM +0200, Christian K=F6nig wrote:
> Only needed during device hot plug and remove and not exported.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Suggested-by: Bernard <bernard@vivo.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index 9b787b3caeb5..1f2024164d72 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -39,8 +39,8 @@
>  /**
>   * ttm_global_mutex - protecting the global state
>   */
> -DEFINE_MUTEX(ttm_global_mutex);
> -unsigned ttm_glob_use_count;
> +static DEFINE_MUTEX(ttm_global_mutex);
> +static unsigned ttm_glob_use_count;
>  struct ttm_global ttm_glob;
>  EXPORT_SYMBOL(ttm_glob);
>  =

> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
