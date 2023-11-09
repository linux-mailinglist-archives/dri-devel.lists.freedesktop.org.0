Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E07E6937
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 12:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE4310E201;
	Thu,  9 Nov 2023 11:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A166410E201
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699528183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrVJojTh870FEFQi+UJHXxqfpd2wklAEL3lneX1SbN0=;
 b=abm8cLJLmpZy5Towjg2OJT0hj2qA7YR5JZ/LnuTeMzNRbWYnmOFHKvpAxCWwA1qS4+eyz0
 ddefDlIXdkQq1GZF+an3UHrPS48FGLhBqbQi9bmu7fF19IcZC3Z3EfqJqCzFczsfTDH92b
 15Pv1HSoSWpNNJvLzFNU/lX4arf3IJc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-9WlNKpwVPd2olVgMxXo2-A-1; Thu, 09 Nov 2023 06:09:42 -0500
X-MC-Unique: 9WlNKpwVPd2olVgMxXo2-A-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-41eb42115e9so2209031cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 03:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699528182; x=1700132982;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ezu0iXe5WM3zfDfpiwhiAtccNmWTLMMx0akG9lcRF/g=;
 b=ecobKVCAPH3N0e1KwIu9wzObTKSi8PXQmUaK1S5hkNuzLUxMlTVmoY0xD5XwrWaDZS
 kiyKPLIyHOHafdQKw3afbEh1gdkGkqPbSnDgVMBZqUmx7oespWaXigXSeQBlwOL4O4eF
 xYKpRwyzkOzpki9cGJaj+If4Wcuq8zihWiBB32rw7NkGfMFYSYJVLagkE+q3tQmZEbkC
 NkxAgp54S1ywVixwyRibKAHlYZ2i7lM7ht7xyblaC4YlEOcOl09W19i/Cq9r/wPv8HPS
 emkxNQbt54J/RYdh47Nh+h1PylA6U2+u8w/r+Vjm0hiRfMkZGzMqsX0kNORCldKQmEE8
 mwNA==
X-Gm-Message-State: AOJu0YyvYIwMyoDj+CMCOMtmYD0O6lnAkXWq3vUG5m5OzbWoDVB+JI2m
 M2RHD0IKf4Yn1GKtt9IsdKos9v89VI5DMf+SAebCgeOqLQmQZsomRoOrxMhWSKN6bEsx2aThRgh
 4wfjpY+mWZAVIb6xy/bqFcvZ1GdNP
X-Received: by 2002:a05:622a:2b46:b0:41c:d433:6c86 with SMTP id
 hb6-20020a05622a2b4600b0041cd4336c86mr5854596qtb.4.1699528182033; 
 Thu, 09 Nov 2023 03:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEczlBkEToxT5HA1bWloT/vSc9WPJn4E7V19w/sRlEABI2nrBuMePu+oCzKYFBd5r1xDIeGg==
X-Received: by 2002:a05:622a:2b46:b0:41c:d433:6c86 with SMTP id
 hb6-20020a05622a2b4600b0041cd4336c86mr5854566qtb.4.1699528181732; 
 Thu, 09 Nov 2023 03:09:41 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 n5-20020ac86745000000b0041977932fc6sm1828045qtp.18.2023.11.09.03.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 03:09:41 -0800 (PST)
Message-ID: <fdf6b2e9c5a734b1a03336f7d5bcfd06bdef47c5.camel@redhat.com>
Subject: Re: [RFC PATCH v3 02/12] net: page_pool: create hooks for custom
 page providers
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Nov 2023 12:09:37 +0100
In-Reply-To: <20231106024413.2801438-3-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-3-almasrymina@google.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
> diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.=
h
> index 6fc5134095ed..d4bea053bb7e 100644
> --- a/include/net/page_pool/types.h
> +++ b/include/net/page_pool/types.h
> @@ -60,6 +60,8 @@ struct page_pool_params {
>  =09int=09=09nid;
>  =09struct device=09*dev;
>  =09struct napi_struct *napi;
> +=09u8=09=09memory_provider;
> +=09void            *mp_priv;

Minor nit: swapping the above 2 fields should make the struct smaller.

>  =09enum dma_data_direction dma_dir;
>  =09unsigned int=09max_len;
>  =09unsigned int=09offset;
> @@ -118,6 +120,19 @@ struct page_pool_stats {
>  };
>  #endif
> =20
> +struct mem_provider;
> +
> +enum pp_memory_provider_type {
> +=09__PP_MP_NONE, /* Use system allocator directly */
> +};
> +
> +struct pp_memory_provider_ops {
> +=09int (*init)(struct page_pool *pool);
> +=09void (*destroy)(struct page_pool *pool);
> +=09struct page *(*alloc_pages)(struct page_pool *pool, gfp_t gfp);
> +=09bool (*release_page)(struct page_pool *pool, struct page *page);
> +};
> +
>  struct page_pool {
>  =09struct page_pool_params p;
> =20
> @@ -165,6 +180,9 @@ struct page_pool {
>  =09 */
>  =09struct ptr_ring ring;
> =20
> +=09const struct pp_memory_provider_ops *mp_ops;
> +=09void *mp_priv;

Why the mp_ops are not part of page_pool_params? why mp_priv is
duplicated here?

Cheers,

Paolo

