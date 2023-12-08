Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20980ACDF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 20:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD7310EAF8;
	Fri,  8 Dec 2023 19:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DAC10EAF8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 19:23:16 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-4649e4e6fbfso610052137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 11:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702063396; x=1702668196;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNuhxRDBfdQenk+uC5+I+2o2Yad/2wCHUso1pH85sfo=;
 b=Fnd36sjhsObs96uln42OP3zvXfjlavGkqk0/47rSsept8+0dwXJpgGZ79F1+bvywv/
 Sub2bISTZleIoyPibBzBwx2S36cNdtCDt9pW9A1BxXZokUNsiSX2rl2vL488W6ziMJpB
 S4gBtCMBlGSHAOev9p5fPaeu93cR0ziQCfvd+x60dxyn3LgXQK3Gv+A4B0kYyAzQAgGi
 bBbm0UrxGjLwzvHkW2XTNbq75NwLxQW5kycP6flAgzRbAYGZNzIjn14oWbWcMVMd/3yH
 SnNxD00LgMvmeLL6Tf5Qeb0g5dUHvMiZYCRYYcFs2jbJiYNNTsQP/YoUuw8355zbZqSJ
 s7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702063396; x=1702668196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNuhxRDBfdQenk+uC5+I+2o2Yad/2wCHUso1pH85sfo=;
 b=lWQexWnIm6YFRKkP/7L5gqbr65lCy9aOF0PWZ3GAe8zB+JcE3WOBp5XCp9VX5Ss6fH
 c8WIeRY8z/9nBhrXayvlPpZoJiypdsMpd06nW1wNwZm9SIRMsrg+fQXOZDmyTYOL7YTi
 TNCzga7+UhVkc9eKkZ+deQSqMVjnfPQKpe5A+5xhK8A4kCF9lqYfbrWPa46ebvIyBwtt
 xf93vAC6nvixTG0YeqLa/jENSsM+ZMfIhTZzjtmxi7513oTFuMBnEAJB1NkQrGkrbUhy
 y1TZRkKGU2pmQr/UZbh1CA6rUYNEtEfVPoh7zOpyZtGQ3E0oM+kYpSdzSzgKC7CYnFd4
 AaZw==
X-Gm-Message-State: AOJu0YzfjR7Wc17xfc2M/vEVQ9L8i1IUckYfgkOd1wrybfkkZbp2PilE
 lHGEk5WJW3ZQUl3DsSR9IqKhC1GrRoC0QivogMKWDA==
X-Google-Smtp-Source: AGHT+IHb22ZjibDls1yBkhF7QNEaIMpgDSaJZ0OHWa3jb0vnzr6qisUp6akF/Nl59oBqhH37DmVgAI0o7BDgdz/1wpc=
X-Received: by 2002:a05:6102:38ce:b0:465:e3df:13a with SMTP id
 k14-20020a05610238ce00b00465e3df013amr837357vst.9.1702063395773; Fri, 08 Dec
 2023 11:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-14-almasrymina@google.com>
 <dd47a2a4-cb80-4164-8855-045999931a8e@kernel.org>
In-Reply-To: <dd47a2a4-cb80-4164-8855-045999931a8e@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 8 Dec 2023 11:23:04 -0800
Message-ID: <CAHS8izPwkARkYjPYPY2t-5H=XFTdn=NcWk0EwiCycThR5xFmtg@mail.gmail.com>
Subject: Re: [net-next v1 13/16] tcp: RX path for devmem TCP
To: David Ahern <dsahern@kernel.org>
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
Cc: linux-doc@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 9:55=E2=80=AFAM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 12/7/23 5:52 PM, Mina Almasry wrote:
> > In tcp_recvmsg_locked(), detect if the skb being received by the user
> > is a devmem skb. In this case - if the user provided the MSG_SOCK_DEVME=
M
> > flag - pass it to tcp_recvmsg_devmem() for custom handling.
> >
> > tcp_recvmsg_devmem() copies any data in the skb header to the linear
> > buffer, and returns a cmsg to the user indicating the number of bytes
> > returned in the linear buffer.
> >
> > tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frags,
> > and returns to the user a cmsg_devmem indicating the location of the
> > data in the dmabuf device memory. cmsg_devmem contains this information=
:
> >
> > 1. the offset into the dmabuf where the payload starts. 'frag_offset'.
> > 2. the size of the frag. 'frag_size'.
> > 3. an opaque token 'frag_token' to return to the kernel when the buffer
> > is to be released.
> >
> > The pages awaiting freeing are stored in the newly added
> > sk->sk_user_pages, and each page passed to userspace is get_page()'d.
> > This reference is dropped once the userspace indicates that it is
> > done reading this page.  All pages are released when the socket is
> > destroyed.
> >
> > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >
> > Changes in v1:
> > - Added dmabuf_id to dmabuf_cmsg (David/Stan).
> > - Devmem -> dmabuf (David).
> > - Change tcp_recvmsg_dmabuf() check to skb->dmabuf (Paolo).
> > - Use __skb_frag_ref() & napi_pp_put_page() for refcounting (Yunsheng).
> >
> > RFC v3:
> > - Fixed issue with put_cmsg() failing silently.
> >
>
> What happens if a retransmitted packet is received or an rx window is
> closed and a probe is received where the kernel drops the skb - is the
> iov reference(s) in the skb returned to the pool by the stack and ready
> for use again?

When an skb is dropped, skb_frag_unref() is called on the frags, which
calls napi_pp_put_page(), drops the references, and the iov is
recycled, yes.

--=20
Thanks,
Mina
