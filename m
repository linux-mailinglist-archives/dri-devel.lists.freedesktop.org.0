Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7B3B7AEB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 02:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43B96E908;
	Wed, 30 Jun 2021 00:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFAE6E907;
 Wed, 30 Jun 2021 00:16:23 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so795525otp.1; 
 Tue, 29 Jun 2021 17:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TeU+3+BSYIPpIeuTqgZDRxi1yeuqH6v4tOX7y63fgHw=;
 b=XKDqX3TPtx+FM7XOGFT5ZxxIRnOGdcF7kmoOpeRxvJSLbMexAdV711roiibP4qR76q
 KT76AWQgueP1tZo03SIm3YWwMpUcHfF3jKmNbrm+XwvnbzZDcmGbFiVFNkv6db1TtrGf
 DGIgsilQzPkOKh0TKSnJ/MGueuZFhCQB0kSIwOb7CU2RSO+5GT8JMUvUWELpgGhRJYG9
 zoc5Yq/PetkBCi9nvCuSFE/DIJWYVnn3GuAIuwPrXnWt/OeNTOE4Nyy9uMPdS1gSGmHA
 5Kz2gJgQjVrKojgqR6WDet/Di5tgLLQqlXIJ5jyoS8fTZSk0PyD1Z5K52Gjezw/vmrK+
 qiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TeU+3+BSYIPpIeuTqgZDRxi1yeuqH6v4tOX7y63fgHw=;
 b=BxZhZU6ylfstQSUBqGA3sCy+BK/0i+Zm1RMAHzoZMUqiqnV9Niph+clt77M4UZsqQ3
 L31WXJ8h6OZ0ygiCKd7OOuh12Pj0OzGX08YKyoJ+Xf4bbARfMng0jnEDbb6cb6fKq249
 lbukShPJK2cJcJft2eNFVU9sbalRzTLmsXY1Y8tXznqwVBttRfTDa8VLBj57kIQbEgtZ
 w1AKviZRC22oZ2DuYTipbEI2ACYD4fAa/naT0H/4jflxXQBQTMsu/x2ROhOs0F/TItIa
 EABJT+g5kwr2O98Js5M3bJ3FYXPD6IdMu6RXvJtZ2eym6cL2B+FL2Clxknal8AAGuvOr
 mYFQ==
X-Gm-Message-State: AOAM533FIa4nOr3e6Nw4o5rwmVtVTuruhlvFR9NwExYDp19kqN702+VY
 4jBIpV98ddoJCklw7a58ytv1z8ohfaKybTALpaw=
X-Google-Smtp-Source: ABdhPJx34XXa9kHNh6uvHXEDImmKhDaL6BZO5KazFWN+0la39xePneKq3e4T3vbCD/IXdwpTxTXiC0j8xj4riZHpj8M=
X-Received: by 2002:a9d:1b41:: with SMTP id l59mr6810295otl.8.1625012182689;
 Tue, 29 Jun 2021 17:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
 <20210629033706.20537-4-desmondcheongzx@gmail.com>
In-Reply-To: <20210629033706.20537-4-desmondcheongzx@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 30 Jun 2021 01:16:10 +0100
Message-ID: <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm: protect drm_master pointers in drm_lease.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Desmond,

Couple of small suggestions, with those the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

On Tue, 29 Jun 2021 at 04:38, Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:

> @@ -128,13 +137,20 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>         struct drm_master *master;
>         bool ret;
>
> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
> +       if (!file_priv)
>                 return true;
>
> -       master = file_priv->master;
> +       master = drm_file_get_master(file_priv);
> +       if (master == NULL)
> +               return true;
> +       if (!master->lessor) {
> +               drm_master_put(&master);
> +               return true;

Let's add a "ret = true; goto unlock;" here, so we can have a single
drm_master_put() in the function.
Nearly all code paths touched by this patch already follow this approach.

> @@ -154,10 +170,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>         int count_in, count_out;
>         uint32_t crtcs_out = 0;
>
> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
> +       if (!file_priv)
>                 return crtcs_in;
>
> -       master = file_priv->master;
> +       master = drm_file_get_master(file_priv);
> +       if (master == NULL)
> +               return crtcs_in;
> +       if (!master->lessor) {
> +               drm_master_put(&master);
> +               return crtcs_in;

Ditto

Thanks
Emil
