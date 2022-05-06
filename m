Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3651E12A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 23:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752A410EB23;
	Fri,  6 May 2022 21:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42C010EB23
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 21:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651872765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJbJbWsoyM+Ik6q37wpw5Oa4Nh86YRow8ddVHHmJk08=;
 b=JK5FwrLry48xN+2TqybW4GjhX2pOCgz2U1HcaIrFukFni3wSBzGaLxnvSdCioSo+K9Pmex
 wrxB7D5YpfxGbQsGxnXcd3UsKw8bQ+VxrFquU7FiJoiVQIUcb+ACUxOIsEIw+wR9c5ESSh
 Q/3fcZAnCKYfsEyLziiKXVLb5xkH4G0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-ej95JrDHO4mnjbej3GpaiQ-1; Fri, 06 May 2022 17:32:44 -0400
X-MC-Unique: ej95JrDHO4mnjbej3GpaiQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 a28-20020ac8435c000000b002f3bc1cbd08so5065010qtn.18
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 14:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dJbJbWsoyM+Ik6q37wpw5Oa4Nh86YRow8ddVHHmJk08=;
 b=aptWgd4YGvUQYgUsBdudgh9Pk1OmvYpXYSymt6fZLCETbf8FnzJv/eSmda6b5dxabj
 MfarTWKUBEIq86/cOsxpSxgJbz452Ae9GpHF9RB6kXJ0FvE3m4KwXMKfqZHV8wC03IME
 MZHmbQMVYEe51LQ6kMSdES2RlHxkrDs6InH8hAWawCNXGGMYxIJNyVg8RcYcfbSQ1n8D
 YNO4FoJ8QDx45R7ru9hYmgO+zhvBsLSqnJaC0sxRk5uXtIGDmZ2Q9rPtKvhEoU1CA2Uj
 EOFmBSOk4lc11YQ/LECFO3lHLaTfBADiDeuUgItv/tLBDPF9wYLUyqSoK6DKEPU02VHI
 ZAHQ==
X-Gm-Message-State: AOAM531LRLUENlrYXHaEXX/7z9OAYECAcenKgFJ0s6j2HIfuOZIN3H2N
 MwDxpzemnCd8z+Abj8ygQn8KwvzvvL+uWG92Uk/CHKu3LyGSj7/121QryKuDPGP/0znZ0GUsxnS
 Vz7z+5hbhGztHpSFcIGyyrCtR/Oj7
X-Received: by 2002:a0c:ab09:0:b0:443:95d9:140c with SMTP id
 h9-20020a0cab09000000b0044395d9140cmr4170811qvb.84.1651872764313; 
 Fri, 06 May 2022 14:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK5FWqqA+iA50nH6ppws5HNXmaCdaMsh8I0itmM43LaQ06P84wOxCI5Gl5CmLPygLNpGGy8Q==
X-Received: by 2002:a0c:ab09:0:b0:443:95d9:140c with SMTP id
 h9-20020a0cab09000000b0044395d9140cmr4170789qvb.84.1651872763988; 
 Fri, 06 May 2022 14:32:43 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 b3-20020ac85403000000b002f39b99f6adsm3164237qtq.71.2022.05.06.14.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 14:32:43 -0700 (PDT)
Message-ID: <9b7eab5df5e63e3fe899bca9ea35f4be8bbff98c.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix a potential theorical leak in
 nouveau_get_backlight_name()
From: Lyude Paul <lyude@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Pierre Moreau
 <pierre.morrow@free.fr>
Date: Fri, 06 May 2022 17:32:42 -0400
In-Reply-To: <9ba85bca59df6813dc029e743a836451d5173221.1644386541.git.christophe.jaillet@wanadoo.fr>
References: <9ba85bca59df6813dc029e743a836451d5173221.1644386541.git.christophe.jaillet@wanadoo.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry I totally missed this patch up until now, noticed it while going through
unread emails today. This is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

FWIW, if there's something you need reviews on that hasn't gotten looked at
after a few weeks feel free to poke the nouveau list/me.

Anyway, I will go ahead and push this to drm-misc-fixes in a moment. Thanks!

On Wed, 2022-02-09 at 07:03 +0100, Christophe JAILLET wrote:
> If successful ida_simple_get() calls are not undone when needed, some
> additional memory may be allocated and wasted.
> 
> Here, an ID between 0 and MAX_INT is required. If this ID is >=100, it is
> not taken into account and is wasted. It should be released.
> 
> Instead of calling ida_simple_remove(), take advantage of the 'max'
> parameter to require the ID not to be too big. Should it be too big, it
> is not allocated and don't need to be freed.
> 
> While at it, use ida_alloc_xxx()/ida_free() instead to
> ida_simple_get()/ida_simple_remove().
> The latter is deprecated and more verbose.
> 
> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is more a clean-up than a fix.
> It is unlikely than >= 100 backlight devices will be registered, and the
> over allocation would occur even much later when the underlying xarray is
> full.
> 
> I also think that the 'if (bl->id >= 0)' before the ida_simple_remove()
> calls are useless. We don't store the id if a negative (i.e. error) is
> returned by ida_simple_get().
> 
> Finally, having a '#define BL_MAX_MINORS 99' could be better than a
> magic number in the code.
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index ae2f2abc8f5a..ccd080ba30bf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -46,8 +46,8 @@ static bool
>  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
>                            struct nouveau_backlight *bl)
>  {
> -       const int nb = ida_simple_get(&bl_ida, 0, 0, GFP_KERNEL);
> -       if (nb < 0 || nb >= 100)
> +       const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
> +       if (nb < 0)
>                 return false;
>         if (nb > 0)
>                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d",
> nb);
> @@ -414,7 +414,7 @@ nouveau_backlight_init(struct drm_connector *connector)
>                                             nv_encoder, ops, &props);
>         if (IS_ERR(bl->dev)) {
>                 if (bl->id >= 0)
> -                       ida_simple_remove(&bl_ida, bl->id);
> +                       ida_free(&bl_ida, bl->id);
>                 ret = PTR_ERR(bl->dev);
>                 goto fail_alloc;
>         }
> @@ -442,7 +442,7 @@ nouveau_backlight_fini(struct drm_connector *connector)
>                 return;
>  
>         if (bl->id >= 0)
> -               ida_simple_remove(&bl_ida, bl->id);
> +               ida_free(&bl_ida, bl->id);
>  
>         backlight_device_unregister(bl->dev);
>         nv_conn->backlight = NULL;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

