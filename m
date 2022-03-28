Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539A4EA25A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 23:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D92310EDA3;
	Mon, 28 Mar 2022 21:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6621710EDA3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648502444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ovb2abZLdPXIpDXoFNTL/ZfMzAu8x+Cb7oB/ww9JfYA=;
 b=XWvlDsxq2zQIz2e26TNkOgTYSmEsWEdDuc8edZe3kxXhHjS+c5+mXmu3HB/cwC+wt0HrOr
 6HqaMAIOEz3+BFxZmrBop0/3rU3ntPWWZiYimp3b5YCotW82qUKFW0INNKAtTn1tEKxZd/
 5h98GGSaLMOKQwcCl4FXjFj0rRIc6Qg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-Qh7wNzqjOyOtta3i105fvA-1; Mon, 28 Mar 2022 17:20:43 -0400
X-MC-Unique: Qh7wNzqjOyOtta3i105fvA-1
Received: by mail-qv1-f72.google.com with SMTP id
 z1-20020ad44781000000b00440ded04b09so12247219qvy.22
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Ovb2abZLdPXIpDXoFNTL/ZfMzAu8x+Cb7oB/ww9JfYA=;
 b=d3a+QARS0yvj8DcUtrm6vZmoSPRJZdsbgFCinwdnK8LQmunT88f4ajiwYacPqkwAoj
 40JcizuDfZJDRdjFjjwt1Gdp6LK4k967jnP0vNm8A6UenT+MbZ9JpRZVCznrnQTDwFpA
 3amKgLxn1GEE4577dqECGhPPzjup3PB3KUyEJ8vDN3DHj0tzPYyikTijxWPoh8Pt+BDw
 O0oeMwAetmaaMRG3OxjAs7rfhNmwMJpiCQqd62iDDzwMI2DeMeKg4AEvfm9MdDnER6/Y
 zZuTvUhKFRj3aU2xMHpcxHzg5dyWoYUPXPqthMBM6pBHGK3QOUW0TINLrC/0gy7tqwDC
 RCtw==
X-Gm-Message-State: AOAM530ZIkwPGgvWJtz4SagpoIoMm2y7YFgsG1Lrk1sJPIoQlWtQLh+n
 +H0syGBcoWsxONM1UGbhV6f4DYA1azkpo9S01G6iQ02hq8+E7iFFVY48gBpcfegJNnVhgQiR0oG
 BvUixYo5PnVA2hUD938/LAtmPN4iQ
X-Received: by 2002:ac8:7d84:0:b0:2e2:1ef6:94bb with SMTP id
 c4-20020ac87d84000000b002e21ef694bbmr24837155qtd.348.1648502442438; 
 Mon, 28 Mar 2022 14:20:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr/xaDRnoX5KQggdrvWhRc+vYS5yUpsvIM+b2oehs7B0Lt4/tR1Ebdv6ok0NtajQHNvYUffQ==
X-Received: by 2002:ac8:7d84:0:b0:2e2:1ef6:94bb with SMTP id
 c4-20020ac87d84000000b002e21ef694bbmr24837135qtd.348.1648502442222; 
 Mon, 28 Mar 2022 14:20:42 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 w17-20020ac857d1000000b002e19feda592sm13392465qta.85.2022.03.28.14.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:20:41 -0700 (PDT)
Message-ID: <30057caf791dd789fe715715d1c1973994a91953.camel@redhat.com>
Subject: Re: [PATCH] dispnv50: atom: fix an incorrect NULL check on list
 iterator
From: Lyude Paul <lyude@redhat.com>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, bskeggs@redhat.com, 
 kherbst@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 28 Mar 2022 17:20:40 -0400
In-Reply-To: <20220327073925.11121-1-xiam0nd.tong@gmail.com>
References: <20220327073925.11121-1-xiam0nd.tong@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.DarkModeFix.fc35)
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
Cc: nouveau@lists.freedesktop.org, yangyingliang@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this to the appropriate repository shortly.

On Sun, 2022-03-27 at 15:39 +0800, Xiaomeng Tong wrote:
> The bug is here:
>         return encoder;
> 
> The list iterator value 'encoder' will *always* be set and non-NULL
> by drm_for_each_encoder_mask(), so it is incorrect to assume that the
> iterator value will be NULL if the list is empty or no element found.
> Otherwise it will bypass some NULL checks and lead to invalid memory
> access passing the check.
> 
> To fix this bug, just return 'encoder' when found, otherwise return
> NULL.
> 
> Cc: stable@vger.kernel.org
> Fixes: 12885ecbfe62d ("drm/nouveau/kms/nvd9-: Add CRC support")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/atom.h |  6 +++---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c  | 27 ++++++++++++++++++++-----
>  2 files changed, 25 insertions(+), 8 deletions(-)
> (also 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h
> b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> index 3d82b3c67dec..93f8f4f64578 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> @@ -160,14 +160,14 @@ nv50_head_atom_get(struct drm_atomic_state *state,
> struct drm_crtc *crtc)
>  static inline struct drm_encoder *
>  nv50_head_atom_get_encoder(struct nv50_head_atom *atom)
>  {
> -       struct drm_encoder *encoder = NULL;
> +       struct drm_encoder *encoder;
>  
>         /* We only ever have a single encoder */
>         drm_for_each_encoder_mask(encoder, atom->state.crtc->dev,
>                                   atom->state.encoder_mask)
> -               break;
> +               return encoder;
>  
> -       return encoder;
> +       return NULL;
>  }
>  
>  #define nv50_wndw_atom(p) container_of((p), struct nv50_wndw_atom, state)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index 29428e770f14..b834e8a9ae77 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -390,9 +390,18 @@ void nv50_crc_atomic_check_outp(struct nv50_atom *atom)
>                 struct nv50_head_atom *armh =
> nv50_head_atom(old_crtc_state);
>                 struct nv50_head_atom *asyh =
> nv50_head_atom(new_crtc_state);
>                 struct nv50_outp_atom *outp_atom;
> -               struct nouveau_encoder *outp =
> -                       nv50_real_outp(nv50_head_atom_get_encoder(armh));
> -               struct drm_encoder *encoder = &outp->base.base;
> +               struct nouveau_encoder *outp;
> +               struct drm_encoder *encoder, *enc;
> +
> +               enc = nv50_head_atom_get_encoder(armh);
> +               if (!enc)
> +                       continue;
> +
> +               outp = nv50_real_outp(enc);
> +               if (!outp)
> +                       continue;
> +
> +               encoder = &outp->base.base;
>  
>                 if (!asyh->clr.crc)
>                         continue;
> @@ -443,8 +452,16 @@ void nv50_crc_atomic_set(struct nv50_head *head,
>         struct drm_device *dev = crtc->dev;
>         struct nv50_crc *crc = &head->crc;
>         const struct nv50_crc_func *func = nv50_disp(dev)->core->func->crc;
> -       struct nouveau_encoder *outp =
> -               nv50_real_outp(nv50_head_atom_get_encoder(asyh));
> +       struct nouveau_encoder *outp;
> +       struct drm_encoder *encoder;
> +
> +       encoder = nv50_head_atom_get_encoder(asyh);
> +       if (!encoder)
> +               return;
> +
> +       outp = nv50_real_outp(encoder);
> +       if (!outp)
> +               return;
>  
>         func->set_src(head, outp->or, nv50_crc_source_type(outp, asyh-
> >crc.src),
>                       &crc->ctx[crc->ctx_idx]);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

