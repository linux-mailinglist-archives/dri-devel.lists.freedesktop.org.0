Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FAA5691D9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 20:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0DB112B64;
	Wed,  6 Jul 2022 18:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BF3112FFC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 18:31:59 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31c86fe1dddso101250827b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JqBcZVmZY62+uZaaDsEVHApvk4BPtabj2ze/xYSIKPM=;
 b=dEPL46gwLY9Xnxeq7C4mX9Slt3nXB1pC1jn5H0CL9VX9G2i8J6+ylsbX1Mgg2ERRjp
 vlPsgCqXtBs1XZnGQqilXjd5GePb2UO5C6pmc+JN1fk6Wqr+Ol6n1+ETMDRdz1MbpBtX
 se7qXtyj0/MrUfsRscQXaxQREgk3/B/JhYx7GEriklH1gVdocFajhWPIjV+pRV1sOL1M
 55HKrnvRjLHyI7UjeoWg73/+uxDsaFlG8k/XgUulVf0AGvgOOL2cjp6zctn+FPub2yuT
 6Sa9SruHspQVXX5hrICktogXVFwx0I513/4Z7w3NV8jfaVdf3t2TkUdWgnHZFmwAAFKa
 XZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JqBcZVmZY62+uZaaDsEVHApvk4BPtabj2ze/xYSIKPM=;
 b=ABgSftiSnfDEwNGjFQmwk8kqHczNmQAl0nWsnZh676UtvdQ6NYh55mAs69qEa1UIUx
 zk+1FX7c1kYpz2l4RyiKiuc+S6/y35aZP7xVSRul6JcgiDXZ3q0wNIua9gyzGK0+M1+g
 LjHpt4PbnsI35/UbPd/FF+jXOv5Q52zhOqel14RHDv/YfG5G7AB0dWC+393BkB3Cvtk5
 UuVRn9a38GDkZ9/ocTpJqfMtcD5WiXkSwt541Hah+xrnYHQQBd0KWE0J35mW0NS4aIrk
 RqiZKascWJevrzxXO+3l6cU0voBar44RkDWPxwqb0WEjmjoqR7x4KXOI0GgtTKzs/2Yr
 JdvQ==
X-Gm-Message-State: AJIora/8mmRIKT++9qyjXZGgY5t/asydcoZrHEqC1Mg4Ktk/uWvy5X9j
 Rp+gjo+EbyKAfIW//khnbJ4f4Z81iC+5OmrCcLE6NHMcsP+Efw==
X-Google-Smtp-Source: AGRyM1vStpSFCTvQoOkYY9pCw67PR2KX2//2Tg5M4w73NRNk7nScyntoWxARzbefU6wlbYJu8sZsAQDLLqSTcibHrBs=
X-Received: by 2002:a81:4f95:0:b0:31c:9817:90e5 with SMTP id
 d143-20020a814f95000000b0031c981790e5mr20142591ywb.280.1657132318960; Wed, 06
 Jul 2022 11:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182924.2563058-1-tjmercier@google.com>
In-Reply-To: <20220706182924.2563058-1-tjmercier@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 6 Jul 2022 11:31:48 -0700
Message-ID: <CABdmKX2vtT04iPp-BZHRu0DAyXQpLvrtSc4eahNgUVxx+K4Tqg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Remove duplicate call to
 drm_gem_free_mmap_offset
To: "T.J. Mercier" <tjmercier@google.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 6, 2022 at 11:29 AM T.J. Mercier <tjmercier@google.com> wrote:
>
> The docs explicitly say the drm_gem_object_release function already calls this,
> and this does not appear to be a prerequisite for the call to
> etnaviv_gem_ops.release.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index cc386f8a7116..ecb828e4e156 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -504,7 +504,6 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
>                 kfree(mapping);
>         }
>
> -       drm_gem_free_mmap_offset(obj);
>         etnaviv_obj->ops->release(etnaviv_obj);
>         drm_gem_object_release(obj);
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>

I don't have a device to test this with, but I believe this is correct
based on inspecting the code and the drm_gem_free_mmap_offset function
docs.
