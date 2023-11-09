Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA507E6588
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 09:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E12410E1E6;
	Thu,  9 Nov 2023 08:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA99F10E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699519465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RuUjbbPhRl5EQPcpCl7vmfz91LrPsOQlBvSVC3H1A30=;
 b=eg0XRjQm3Qgyk2uOwrt2b9vxmQ8dJZw6/ryYCcl7uhWPYT0F1dFTZX1DrmDQp3T/MA1cky
 PrkGcBGGimVbjWkTK5xi9+5hO6GbElmyRebMAlMdIizmZrQbJeziaDGqMDAcPERYLXo0Jd
 DCs9NN3tPfR9D1ngc8/SLLIa6W/qlak=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-o8-00lILN0-mhMpWu-4IqQ-1; Thu, 09 Nov 2023 03:44:22 -0500
X-MC-Unique: o8-00lILN0-mhMpWu-4IqQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9d358c03077so8396066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 00:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699519461; x=1700124261;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eTFEp4CMLoFdUcZdEGfmISXt6fDITsZHDJnL/kZD0Z4=;
 b=KRc84u1Q0oug4VA8X+JLhJAvyjw2f3rT4ryJjB7eCWOU8+rLCwBRSH3HcXmuGm4E7d
 vfrquLp8HTYPwY0gbdeBTDJVW2K/+tUUfzprpDXQa028SCa4YspZbU+36w7dcE9MVfPs
 JnX+1IStbdAlWVQCv2QJzBZuvxoy2PuEsm8ZC01aBAgdbGs5LBwteqCxwTYq1Edne8dK
 tlHnskulCoi3Eu2HQfwaKh1pC3SN70i4UMAsfDvp+P7yTd/RIcb7XoGzq3pJ0NGZrt1C
 JoR1wiG8hagAkufH0Hb2HI/fJ7BamAgo5cMGxYx3OlEGC16gLU1P9RpwzWy3QGTx5fuZ
 skvA==
X-Gm-Message-State: AOJu0YyGRuUWMaEulDk60Rjpc5uGRh7uYm1OodwJ4L2ZKzgH6V4zNJQZ
 UfVbWVT5YMztwS96vbC5gPMzfOD5ZIyYmIxnUt0kjXEwEopBJYajRMaG5hq9fiFnHAlboVDew1y
 v8h1G5PHwnbiJWa7jBAhKwCzRAAIj
X-Received: by 2002:a17:906:6a0e:b0:9ae:50de:1aaf with SMTP id
 qw14-20020a1709066a0e00b009ae50de1aafmr3323722ejc.4.1699519461239; 
 Thu, 09 Nov 2023 00:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpt6f4OXVKtH4i3m412g4H1Y1OUcpmAtKJLGhLybamCWeX8G1/7ze6DLbaN+L9dFmPNZ/PZg==
X-Received: by 2002:a17:906:6a0e:b0:9ae:50de:1aaf with SMTP id
 qw14-20020a1709066a0e00b009ae50de1aafmr3323714ejc.4.1699519460914; 
 Thu, 09 Nov 2023 00:44:20 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 ha12-20020a170906a88c00b0099d804da2e9sm2235687ejb.225.2023.11.09.00.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 00:44:20 -0800 (PST)
Message-ID: <21e4ef7d4a1b4ad298b0688f2b9ce8f5572e1e69.camel@redhat.com>
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Nov 2023 09:44:18 +0100
In-Reply-To: <20231106024413.2801438-6-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
[...]
> +void netdev_free_devmem(struct page_pool_iov *ppiov)
> +{
> +=09struct netdev_dmabuf_binding *binding =3D page_pool_iov_binding(ppiov=
);
> +
> +=09refcount_set(&ppiov->refcount, 1);
> +
> +=09if (gen_pool_has_addr(binding->chunk_pool,
> +=09=09=09      page_pool_iov_dma_addr(ppiov), PAGE_SIZE))
> +=09=09gen_pool_free(binding->chunk_pool,
> +=09=09=09      page_pool_iov_dma_addr(ppiov), PAGE_SIZE);

Minor nit: what about caching the dma_addr value to make the above more
readable?

Cheers,

Paolo

