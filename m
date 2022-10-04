Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D435F4BE3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF5E10E1CE;
	Tue,  4 Oct 2022 22:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40D110E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664922538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mW8nxNEfDMnxO5t6gWu1Vy8dgMqlNDCx37WZK/3Paec=;
 b=HPjUg7QK6oOTqLDujHF7mpokktz9PSZanZFfpPbJA2jlvHB51bVhNMwvuym1Eq7/lT/5ya
 L0QSDWcMwP4OGqoykdwu3byKQtO1RcHyw4TqlWkeEckRpvRnbzKH5/fSlwfAzNJvCTV4il
 Ck5tO0MvzsMs1ZvfPbarZsEFflMJ9XM=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-fFUpgCmaNpKFgaPvtvPb4g-1; Tue, 04 Oct 2022 18:28:57 -0400
X-MC-Unique: fFUpgCmaNpKFgaPvtvPb4g-1
Received: by mail-io1-f71.google.com with SMTP id
 w16-20020a6b4a10000000b006a5454c789eso10093649iob.20
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 15:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mW8nxNEfDMnxO5t6gWu1Vy8dgMqlNDCx37WZK/3Paec=;
 b=T1y2ZRr56nGaY+9tJLWRakHTUc/wxUDftiLchR+TwB+EeBd2g6cZ2SYTxxfZjPPCVu
 oP6MVXYp5V5qUryDZyKrMSkizrFmankclYnWqkUb6YpHkXSHzxyUBcoGnPmO+9o2kNx1
 QqTUVT60k39bdqOAMH1uBov4O9v6be8RjLecb6pdsgUoQha/Nhjm6VBPMevyEhk7Xjt+
 B+pXqHyH62RdKZtu35nvS2+iPUQ3WU3qc98yemKuzmEeZgG5p8j8ftQAsNrZuHVlXgsq
 KQg+kl39RUU7V03PKlxXeXHK+XItQQaVKTuGjofBIRl/q3tfs1aQzIh8h6gD9Rl8WqOA
 1raw==
X-Gm-Message-State: ACrzQf2BGJacZiCfRDIut30F0r7Ou7qNRvw8ZF9qo4SMIHJVRnmO6U+u
 ObyB9bLcYgyViB4AL2ols8uOaEbw6Lp9o3I5J85x81snyPisGoRhmVmGqKBvvylLHApQ7sLIQvY
 81031dH5kznEbLscy/D9CH7oWofyy
X-Received: by 2002:a6b:691d:0:b0:6a3:e87e:5aed with SMTP id
 e29-20020a6b691d000000b006a3e87e5aedmr11740546ioc.56.1664922536818; 
 Tue, 04 Oct 2022 15:28:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7o1dMrlezHiS6RmiQJ7Q+t9tr0cMDjTNCLIWczpaXJxgscMa+SkXNfT/k7xdiqPDjya67C9Q==
X-Received: by 2002:a6b:691d:0:b0:6a3:e87e:5aed with SMTP id
 e29-20020a6b691d000000b006a3e87e5aedmr11740532ioc.56.1664922536528; 
 Tue, 04 Oct 2022 15:28:56 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.0]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05660213c200b006814fd71117sm6025672iov.12.2022.10.04.15.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:28:56 -0700 (PDT)
Message-ID: <6af7645c-880f-b1d1-4d78-aa8642e6f7e9@redhat.com>
Date: Wed, 5 Oct 2022 00:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 10/16] drm/udl: Use damage iterator
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-11-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-11-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/22 15:04, Thomas Zimmermann wrote:
> Use a damage iterator to process damage areas individually. Merging
> damage areas can resul tin large updates of unchanged framebuffer

result in

> regions. As USB is rather slow, it's better to process damage areas
> individually and hence minimize USB-transfered data.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

but I've a comment below.

>  
>  /*
> @@ -301,16 +291,26 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>  	struct drm_framebuffer *fb = plane_state->fb;
>  	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> -	struct drm_rect rect;
> -	int idx;
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_rect damage;
> +	int ret, idx;
>  
> -	if (!drm_dev_enter(dev, &idx))
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
>  		return;
>

This is an unrelated change. The sync was made in udl_handle_damage() before
and you are moving to udl_primary_plane_helper_atomic_update() in this patch.

I don't have a strong opinion and I see that there are drivers that do once
before iterating over the damage areas and others do the sync for each damage
area update. But it would be good to mention that this change is done too and
provided some justification.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

