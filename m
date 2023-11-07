Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7FC7E4B43
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 23:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585A810E027;
	Tue,  7 Nov 2023 21:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE07010E027
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:59:54 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-66d0ceba445so35235366d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 13:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699394394; x=1699999194;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PqaUmI2qs4cLDwl2i5pZd/bBUshC/jimD2IW3jRBHQ=;
 b=S5gk9zsTxAUgnyyYYcxh4GYuMFn1CG9w2jctuRhzlF3bVcrNytUw6G5Sr66YoUPtFP
 bwlJIpL7Ov+BI1YR+MtsA48NHnKVLSnVuq/kqPxjCJ1l/yWVSG+1jCWIqe1aeMsg5lDH
 hmckVgxvsE0vNjJ6OnYxDBaWjxBG+126S54adGMBubloIrewVRAP1Jjbe6MmsUV9HrP1
 DB8o8jgKqI13toyQalDmWVGrBdAAx34CnJOYlXxabzkDHt7NVLdz3+NDFsMsfkG9dGq2
 7k/7rYwuz4tfPSQ6FfqIwxVKxkHVoI2u6L21EJM+ITrLo72Ol+15viuKEVfELn+wBNRN
 YhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699394394; x=1699999194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PqaUmI2qs4cLDwl2i5pZd/bBUshC/jimD2IW3jRBHQ=;
 b=D3YAcd+uimVRTkoivH46kVWVmlqtcsDIwlfPvWiO7zUp+yNffXRTcDcqJr6S8DACr7
 QnL4A/9fhRNMikvyapm/SJw9/n9Fqjv65o34yVYb/DjmKo7TvLLDNLyZAzRYNGgSUHyo
 8nMAOJB5l8XIZ1a7EAAQWZI/fKWvfxJmEph6ZgqWOdGXdYzLaajlWyNnDViBYh4dlWnp
 sF+rzp9oezdYWZJ8iFekeE047Bx7VU621qq59kQ+ntg87S6OIH+7MP/v2ig5udDjujga
 qdote8Dp82zyWgFxlulHZQu96t7mWq/iWJBoQhMi+vQ2Yi5mwdmKLHHFqzsucOReUARs
 uJMA==
X-Gm-Message-State: AOJu0Yy/CTKaLN9VEtNa03wSII5bhG6qHpQgVlBNwau1AXJfH8YLFqmA
 Nzv5GCbyNp9cT31rfLs2CFfvUCKzJsdrKDvGidtz3Q==
X-Google-Smtp-Source: AGHT+IHVrgEKfASjC5rH9bq4RglRT8VPoPtK4Z4u/BPe0YLNL57TLwT+bbLdmq9/ZlUZX9/zJmxQ+t+E7PsoyRnnNeQ=
X-Received: by 2002:ad4:5be2:0:b0:66d:a22a:464f with SMTP id
 k2-20020ad45be2000000b0066da22a464fmr79490qvc.16.1699394393800; Tue, 07 Nov
 2023 13:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
 <1fee982f-1e96-4ae8-ede0-7e57bf84c5f7@huawei.com>
In-Reply-To: <1fee982f-1e96-4ae8-ede0-7e57bf84c5f7@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Nov 2023 13:59:40 -0800
Message-ID: <CAHS8izPV3isMWyjFnr7bJDDPANg-zm_M=UbHyuhYWv1Viy7fRw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
To: Yunsheng Lin <linyunsheng@huawei.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 11:46=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2023/11/6 10:44, Mina Almasry wrote:
> > +
> > +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *bindin=
g)
> > +{
> > +     size_t size, avail;
> > +
> > +     gen_pool_for_each_chunk(binding->chunk_pool,
> > +                             netdev_devmem_free_chunk_owner, NULL);
> > +
> > +     size =3D gen_pool_size(binding->chunk_pool);
> > +     avail =3D gen_pool_avail(binding->chunk_pool);
> > +
> > +     if (!WARN(size !=3D avail, "can't destroy genpool. size=3D%lu, av=
ail=3D%lu",
> > +               size, avail))
> > +             gen_pool_destroy(binding->chunk_pool);
>
>
> Is there any other place calling the gen_pool_destroy() when the above
> warning is triggered? Do we have a leaking for binding->chunk_pool?
>

gen_pool_destroy BUG_ON() if it's not empty at the time of destroying.
Technically that should never happen, because
__netdev_devmem_binding_free() should only be called when the refcount
hits 0, so all the chunks have been freed back to the gen_pool. But,
just in case, I don't want to crash the server just because I'm
leaking a chunk... this is a bit of defensive programming that is
typically frowned upon, but the behavior of gen_pool is so severe I
think the WARN() + check is warranted here.

> > +
> > +     dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> > +                              DMA_BIDIRECTIONAL);
> > +     dma_buf_detach(binding->dmabuf, binding->attachment);
> > +     dma_buf_put(binding->dmabuf);
> > +     kfree(binding);
> > +}
> > +
>
>


--=20
Thanks,
Mina
