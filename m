Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE17E77D2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 03:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1735810E63E;
	Fri, 10 Nov 2023 02:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E138710E23D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 02:59:16 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-45d94e7759eso706707137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 18:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699585156; x=1700189956;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYA5rJpCEqdhu1Dq/5dPoAwsI72d8BAvhnJXT+T4oos=;
 b=y1xcLZBJoCSW4VhGsuxjpkR+UCz8Pa2JgfZyDAI8F0zEjKzAyn5o9WA6qXHqmdmire
 KoZJ8sMZxBTKNL3ouz9hZJKa6IA7TDPMDgnX7fDwT6mD5h4hAJDrp79aVXFW4rZrXepI
 c/jQaZkhF0ApvLkfna+MadApuiMICBMKNkzczJdhyKn2Mo6z3xFlnwKc5tfO+MQbzRrI
 ZS9B5FAJuvo5lhB6MZj4UHke59X70DcS5ETXLHx9LL/ZM/o6iA3MJkNkYvzZj0ah6/5Q
 6Xrhf8waFAI3LRLqAhUa77f099uLwdYL0lupwkPP36ptmHuj7/878bJm0WCySzscAFXB
 SS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699585156; x=1700189956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYA5rJpCEqdhu1Dq/5dPoAwsI72d8BAvhnJXT+T4oos=;
 b=SQqGAxhCp8Rk1ZGtGCn8/8H7hXXSvntYjnBiGMvwTJQnH3EqkVaZq+84MK/rtx/KSu
 Mlh6RQuxEBA/lL3Cb5cTPWDRxr9iz5cOcOUTH4s9VsCzRG9s8+nZCbllMcn4pnyqd/wi
 G9XoNS8c00OCSQnPKz05aYP01KJuaX2BakqC2Hlr0Eehje4oGQpCfoen6/QuUamhkxVK
 tjs5DZcsQIXLKVnv7pfGatLU7LuOGjwvmy10rYrPwcpTRYrWyeD0djgEjDaqXa4TnY+6
 ENt6JZs99Y8nsUiP3J2S4gVoNBE/kSQl8aVcLIElRqLoKMCcqQxYiRtV1+nawXUMkMUs
 c+dw==
X-Gm-Message-State: AOJu0Yz2H3SgyWXVOnT4m2gI3fvk4Rd/RIr1KGgsBXweeMm1v5aI/fGm
 ym+SBtK72SdgWX77yaL5ZuyihvNgu+GiMwVQEiHf3Q==
X-Google-Smtp-Source: AGHT+IFOryz0B149KznbXpgkBi69phioiLVC4R9PWdX35ZPDwW1mQdW7sr2TdvnDfhWAyV20CN9DNjJoJE0dCWxIRHw=
X-Received: by 2002:a05:6102:205a:b0:45e:fe97:70a8 with SMTP id
 q26-20020a056102205a00b0045efe9770a8mr6645348vsr.22.1699585155651; Thu, 09
 Nov 2023 18:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
 <076fa6505f3e1c79cc8acdf9903809fad6c2fd31.camel@redhat.com>
In-Reply-To: <076fa6505f3e1c79cc8acdf9903809fad6c2fd31.camel@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 9 Nov 2023 18:59:04 -0800
Message-ID: <CAHS8izOGSE-PJ1uShkH_Mr6kUoC1EjM_9P1J=_TO6nLFP9K53Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
To: Paolo Abeni <pabeni@redhat.com>
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
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 9, 2023 at 12:30=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> I'm trying to wrap my head around the whole infra... the above line is
> confusing. Why do you increment dma_addr? it will be re-initialized in
> the next iteration.
>

That is just a mistake, sorry. Will remove this increment.

On Thu, Nov 9, 2023 at 1:29=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:> >>>
> >>> gen_pool_destroy BUG_ON() if it's not empty at the time of destroying=
.
> >>> Technically that should never happen, because
> >>> __netdev_devmem_binding_free() should only be called when the refcoun=
t
> >>> hits 0, so all the chunks have been freed back to the gen_pool. But,
> >>> just in case, I don't want to crash the server just because I'm
> >>> leaking a chunk... this is a bit of defensive programming that is
> >>> typically frowned upon, but the behavior of gen_pool is so severe I
> >>> think the WARN() + check is warranted here.
> >>
> >> It seems it is pretty normal for the above to happen nowadays because =
of
> >> retransmits timeouts, NAPI defer schemes mentioned below:
> >>
> >> https://lkml.kernel.org/netdev/168269854650.2191653.846525980849826981=
5.stgit@firesoul/
> >>
> >> And currently page pool core handles that by using a workqueue.
> >
> > Forgive me but I'm not understanding the concern here.
> >
> > __netdev_devmem_binding_free() is called when binding->ref hits 0.
> >
> > binding->ref is incremented when an iov slice of the dma-buf is
> > allocated, and decremented when an iov is freed. So,
> > __netdev_devmem_binding_free() can't really be called unless all the
> > iovs have been freed, and gen_pool_size() =3D=3D gen_pool_avail(),
> > regardless of what's happening on the page_pool side of things, right?
>
> I seems to misunderstand it. In that case, it seems to be about
> defensive programming like other checking.
>
> By looking at it more closely, it seems napi_frag_unref() call
> page_pool_page_put_many() directly=EF=BC=8C which means devmem seems to
> be bypassing the napi_safe optimization.
>
> Can napi_frag_unref() reuse napi_pp_put_page() in order to reuse
> the napi_safe optimization?
>

I think it already does. page_pool_page_put_many() is only called if
!recycle or !napi_pp_put_page(). In that case
page_pool_page_put_many() is just a replacement for put_page(),
because this 'page' may be an iov.

--=20
Thanks,
Mina
