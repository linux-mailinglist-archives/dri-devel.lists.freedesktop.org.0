Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1F7DE09F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 13:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFA910E0B0;
	Wed,  1 Nov 2023 12:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E612D10E0B0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698840077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HFG3zX5V5RjxlXQbZojzLeljMHWLMjLWQqVlWICX4sc=;
 b=AmaQEnuG+e2yZE72t+PLwMMQjBVpoTvO0cdCgg+Ts/PX0I+0HdUTuoxWSFl20/ZLHafDRW
 ythGA7kuCPPxj5YOYdCr9KGKUA05jJs9eCK4tr4MVSlvdpjcovAYrdqSjJb+AxBFl8rlOy
 PrNSh7C/u4YD7i//ohoevpSmzZw+O3A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-d3-4F5OaPwKcfvtf3_wKHA-1; Wed, 01 Nov 2023 08:01:15 -0400
X-MC-Unique: d3-4F5OaPwKcfvtf3_wKHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40853e14f16so49996705e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 05:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698840074; x=1699444874;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HFG3zX5V5RjxlXQbZojzLeljMHWLMjLWQqVlWICX4sc=;
 b=Cnv/6h5omJK/ySI/m9V8FVN0Em5J1N/55fSjmlhRIC3D3NEFHX8yrPIAKaAYEn5wj8
 yzbYpNsTEn8f08XFoso9BeNeuW30vRrGNsDmF/Gthm0oMPGRN233lTvKIQFA9OTQNU4C
 WPfkCprh7cFO5qUdw1IwZovfZ4tdFp9PKwAJYA01SnzRsf4c9Doou8b0zmFxWy9J1Hk6
 TdJ7oPnMLK/ha2141zl3W7MA6TVyeHgj0rFCjhcZJ1dGA2WFY2bx+DkVC1zdx3ZeAVbL
 urC1R0O/zvxW6kdaSrXcnhTV4zBJXZ0Q/c7XftbgB46UPRzX8ls4ayd2AGvsTXZLjuqR
 Fa2g==
X-Gm-Message-State: AOJu0YwIT8TGwbfRFrp9kKQZUJrYUG/p39KPrNez3HMeudS4kw5E7HQW
 ShE1dP+2hRB7JecnXqNflMvGqXB0SCiYfa1ii1zGk7N+o7Agd1nN7AZ/St2KgG9nziSzD3fm9A0
 EJSeB3NHP3zfolMcvKPH6S+bvtLkY
X-Received: by 2002:a05:600c:450a:b0:407:8e85:89ad with SMTP id
 t10-20020a05600c450a00b004078e8589admr12771490wmo.14.1698840074092; 
 Wed, 01 Nov 2023 05:01:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2+PSw1U5BBXhsW0tWh67cjNOABSJ94OWquafP+g6y35Pq9Tj4Yt5CkZXCcdATZodCqe6dQ==
X-Received: by 2002:a05:600c:450a:b0:407:8e85:89ad with SMTP id
 t10-20020a05600c450a00b004078e8589admr12771467wmo.14.1698840073635; 
 Wed, 01 Nov 2023 05:01:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g8-20020a056000118800b0032db8cccd3asm3987701wrx.114.2023.11.01.05.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 05:01:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, tejas.upadhyay@intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: Re: [PATCH v5 2/7] drm/client: Do not acquire module reference
In-Reply-To: <20230927102808.18650-3-tzimmermann@suse.de>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-3-tzimmermann@suse.de>
Date: Wed, 01 Nov 2023 13:01:12 +0100
Message-ID: <87bkcdhed3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Do not acquire a reference on the module that provides a client's
> callback functions in drm_client_init(). The additional reference
> prevents the user from unloading the callback functions' module and
> thus creating dangling pointers.
>
> This is only necessary if there is no direct dependency between the
> caller of drm_client_init() and the provider of the callbacks in
> struct drm_client_funcs. If this case ever existed, it has been
> removed from the DRM code. Callers of drm_client_init() also provide
> the callback implementation. The lifetime of the clients is tied to
> the dependency chain's outer-most module, which is the hardware's
> DRM driver. Before client helpers could be unloaded, the driver module
> would have to be unloaded, which also unregisters all clients.
>
> Driver modules that set up DRM clients can now be unloaded.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The change makes sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

