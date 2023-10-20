Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0B7D1948
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 00:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09B510E607;
	Fri, 20 Oct 2023 22:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8443710E607
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 22:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697841748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jnxbpqPQ8Qwv3Gl+kg+6M9wo7fO1MRiFh8TZBKBFXUY=;
 b=QzkyW00CI1ZynjsW4tdku4VMrUC2ETXMSilP+KsZuiYz2XMXe575hWJRg6v4OYDVMN12Gr
 wWH89WWk9hp91nM+Dz8vdbzVKmVWwVjVyKSD2BuUfRvhzKEKl7Rs+lZ37/fmUq67jDTKTO
 lX/ulo/KW4TcW+4nxYz4I9vyKhL6IIk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-s1-a_Gk8NBOFqRk6T7EzkA-1; Fri, 20 Oct 2023 18:42:27 -0400
X-MC-Unique: s1-a_Gk8NBOFqRk6T7EzkA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2c53ea92642so11708051fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697841745; x=1698446545;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jnxbpqPQ8Qwv3Gl+kg+6M9wo7fO1MRiFh8TZBKBFXUY=;
 b=DlM8xv7wXrCi6PRkZ3SyD/c5yBsOifiIrNGUN0zapsrSK2FuaKOOROcy67VRv2lHis
 W044vrUX7aY0qO/8RCNyqdY7+uVXhMh+kF0MQwnrXOdJn3Cb3BcsM8L0m2v0jQ4oWVw8
 AyHt7sLVIDZoIEtIslUvfFWDou006qmhGyD2nDUVqwDh6k+xlJbeC2N/gg4hL8M5/l4S
 d5f194EJYbXnVjb4NNyPqIF1wTWChizxt6HvJsbtecnu4g3esyUTHRb+50QBX/hZ92GR
 PthOdkFSJ98X/neAS/NSMZW4EwCmRPRDG2+xSVlqC6jr/gqxce0BaLkW/YtOfmbRobEA
 zp5w==
X-Gm-Message-State: AOJu0YzSMWIvvuprq1VS2Oy+j4b+6MJ/tbmXyfWlseLG7cPlyJRHVv1B
 Xb5TpnuL55L19FougAnko2s7cCGrFiayTunT1KxTvBvdhIqBulEDb5KE0XcGf2v5AsJUKRQoM1k
 PLhDhmn11UiAuM4o+y3f0z1h2nsDW
X-Received: by 2002:a05:651c:1991:b0:2c5:2475:f848 with SMTP id
 bx17-20020a05651c199100b002c52475f848mr2604683ljb.15.1697841745591; 
 Fri, 20 Oct 2023 15:42:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7ma8y0t0l/MOVqHhCSbw1qwXFPQdaWRYbp5TcVVN5pieyiq7yax7CvYKQNfpGvzWrDaBArg==
X-Received: by 2002:a05:651c:1991:b0:2c5:2475:f848 with SMTP id
 bx17-20020a05651c199100b002c52475f848mr2604679ljb.15.1697841745200; 
 Fri, 20 Oct 2023 15:42:25 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b11-20020a05600010cb00b00324853fc8adsm2521365wrx.104.2023.10.20.15.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 15:42:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [bug report] drm/ssd130x: Add support for the SSD132x OLED
 controller family
In-Reply-To: <7dd6ca45-8263-44fe-a318-2fd9d761425d@moroto.mountain>
References: <7dd6ca45-8263-44fe-a318-2fd9d761425d@moroto.mountain>
Date: Sat, 21 Oct 2023 00:42:22 +0200
Message-ID: <878r7wkjap.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dan Carpenter <dan.carpenter@linaro.org> writes:

Hello Dan,

> Hello Javier Martinez Canillas,
>
> The patch fdd591e00a9c: "drm/ssd130x: Add support for the SSD132x
> OLED controller family" from Oct 14, 2023 (linux-next), leads to the
> following Smatch static checker warning:
>
> 	drivers/gpu/drm/solomon/ssd130x.c:921 ssd132x_primary_plane_atomic_check()
> 	error: uninitialized symbol 'crtc_state'.
>
> drivers/gpu/drm/solomon/ssd130x.c
>     905 static int ssd132x_primary_plane_atomic_check(struct drm_plane *plane,
>     906                                               struct drm_atomic_state *state)
>     907 {
>     908         struct drm_device *drm = plane->dev;
>     909         struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
>     910         struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>     911         struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
>     912         struct drm_crtc *crtc = plane_state->crtc;
>     913         struct drm_crtc_state *crtc_state;
>     914         const struct drm_format_info *fi;
>     915         unsigned int pitch;
>     916         int ret;
>     917 
>     918         if (crtc)
>     919                 crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>
> crtc_state is not initialized
>

Indeed. Thanks a lot for reporting this.

I'll post a fix.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

