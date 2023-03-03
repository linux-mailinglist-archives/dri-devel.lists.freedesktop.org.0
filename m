Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871536AA0C3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 21:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AF610E753;
	Fri,  3 Mar 2023 20:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4A310E753;
 Fri,  3 Mar 2023 20:58:43 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-172afa7bee2so4439487fac.6; 
 Fri, 03 Mar 2023 12:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677877122;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T9Pyj/vm5rNlOjjV6b0BDKla8V0OkG8H114/eAFL1mY=;
 b=QQecMgzEyAPD0IkanEvZ1sfwcHrCM/T70MSHAnA+bsWkLjiBE6aqJFq5snIMZgRyHd
 JsFCsxhRu0fWLnmt23slKvp213K0gi/cZXrgmGCf25P5wGJKFZiTfsAOiMr+5Ql6yN+H
 DidUBftZAKRcqx4fhYQlt4uu8XXkv7F91gY+qjBnin5IY8liaYja+CUZQjr/WReR5sHk
 5EbRVTfwUO0fEcaLzLk29V+/BMMGpo9/pkB1abIw4mZcS0ntpx7actZ6H+oKv8ZL5TDe
 jxWX5uMzT4OcO6xWYVAARZfU4mSNhvX6KItjvgj7OqxiVV1Dn/tjCKreZ3PY6apgKbb+
 /6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677877122;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T9Pyj/vm5rNlOjjV6b0BDKla8V0OkG8H114/eAFL1mY=;
 b=ccJp5KPYLid+QEUH2XqfdCWY+TT/JiTrhcLgQAFK2I6UXnJ5uM5e8OjSvcBYLjh8VY
 9xqAUU/BBg1T1g5Kk00OE2YEQJNBu8rOeKQXDtWNLfg/jTI8/bxY45mvl5uVQvOw6nKN
 ZDv4tIHrVUjIesB4IkH8Z97QtR8mwkC8epUjhd6LfA5kwg2Qd3IW/eONkRqSCi58xgc3
 xEYzjEGp6c/5IrSRUkQEsCIBvmgQzN0D5MVS+gviVA/tqC+o/wjYVuS0uDpWAOEpL5fE
 bO/Iq3vWV0IidB4ZZIX56zwePMUZqX3NTue/tCP+nLPjRCjRUp5K9t/zUngdeD70eRC9
 8e5A==
X-Gm-Message-State: AO0yUKUxh/MKsIvFdrUTB9t50bnrxhTa7ZtjSYAGTBvtwbaTloxddYn/
 6ornqayzx36/990oKdFilD6x19YwDRZG7NgQrbr84Eebzew=
X-Google-Smtp-Source: AK7set+vyYgBINiehyL0i+7yg3YgTbb6+5Z2pWfDX8ZcLOBddCRvtvo4Kk20f7T0RHvn5fZBALM24XFERZG1DoetSCA=
X-Received: by 2002:a05:6870:b7b3:b0:16f:375e:329d with SMTP id
 ed51-20020a056870b7b300b0016f375e329dmr1065104oab.4.1677877122556; Fri, 03
 Mar 2023 12:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20230228165552.760988-1-l.stach@pengutronix.de>
In-Reply-To: <20230228165552.760988-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 3 Mar 2023 21:58:31 +0100
Message-ID: <CAH9NwWfPr-axoa1iS-khG37qQoknnUMHOu5y6orgMQ_sh5JZfw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: fix reference leak when mmaping imported
 buffer
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>
> drm_gem_prime_mmap() takes a reference on the GEM object, but before that
> drm_gem_mmap_obj() already takes a reference, which will be leaked as only
> one reference is dropped when the mapping is closed. Drop the extra
> reference when dma_buf_mmap() succeeds.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 7031db145a77..3524b5811682 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -91,7 +91,15 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
>  static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
>                 struct vm_area_struct *vma)
>  {
> -       return dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
> +       int ret;
> +
> +       ret = dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
> +       if (!ret) {
> +               /* Drop the reference acquired by drm_gem_mmap_obj(). */
> +               drm_gem_object_put(&etnaviv_obj->base);
> +       }
> +
> +       return ret;
>  }
>
>  static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
> --
> 2.30.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
