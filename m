Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 457287E2CD4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 20:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBCD10E3DD;
	Mon,  6 Nov 2023 19:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0728110E3DD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 19:29:48 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-45f0e332d6bso838187137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 11:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699298987; x=1699903787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7Si+k3SGcxGf6sJGMI/kj5eJZ6V+SjfPyFVm8vGoBA=;
 b=UMKptct2jbuqU0WMvl0decOOrhlWiuU+ZBq6+HOrJSJId91tLr9EAktaaIjBnEtAiC
 SmOq9QGNg8sOfHpW9hvH/10GQl+TYkcT1c5TMwfMMZcLVripVrcGQ/oU/j/G4QQUNubi
 9eIuV9VFfyn63mM5Cz+isW+hd1FwAlni2hl3Cw9hQznOW3Swn6NeQwmvUvjebF5DLoK3
 WUCOLDZOjZbX5kx3gk/f5t3aAjb8/3H/AhrI3+ged0rZzR3hYN1lwEnn+DaCgxZFhSkQ
 +tggaIQgL7fe3Viv0ope/7yLgQKCu+8fZYgDdUWB6Xy9bGxUamgVjPt9B4HU9JOSK3I1
 yPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699298987; x=1699903787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G7Si+k3SGcxGf6sJGMI/kj5eJZ6V+SjfPyFVm8vGoBA=;
 b=aBudmU7m4XeDujBa+TSrHKFgU87bhuEtmXDqFjjrfwkEIzcQxoRsL9Aph6vsOBqDsQ
 i8ox6Ry0ViNqN9YV8sLxgvAJiCBrS+1vXJ3tZ53wjd6X4HL0hd1vJuJpn5mkDIsL+w+h
 Y+7r+sYaqVUBFjbnEbqVAuSxxEiQrLGinLa4gyA64EGDUOmynhAoxr3Ztu1IiTz0ujoO
 i42+uEOKZpZjDl6VFALbWKKDTi/YCoJMwiT1QDe5rQqH/jP+lC6RFrcP4ukBWKxgPFC4
 JkTPceA0einaty8c6avdoz1Eva1lLmnBXsKS7JwZ/zUbavUVW6VrYPBFdBw/PxfYPE1Y
 enDA==
X-Gm-Message-State: AOJu0Yx+zvJVWO9oQJ/Mw/0VsdC34nzN1HGgw8SdFn1IOhBdoGoaV28w
 p+EXQQVjyZhyB4tqhFAd9S8wmhkd46Seqb89vQ2Ut5wOQAXMJiPobwQTog==
X-Google-Smtp-Source: AGHT+IG22F7RZ7INsRT61We/dhQuubrTDUtrXNKt9IRXUitWz7JbG7ca/qoY3u3vM4us0jqLVC7nFfmA8VO3BFOqiRY=
X-Received: by 2002:a67:a247:0:b0:45d:9083:f877 with SMTP id
 t7-20020a67a247000000b0045d9083f877mr7751422vsh.5.1699298986878; Mon, 06 Nov
 2023 11:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
In-Reply-To: <ZUk0FGuJ28s1d9OX@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 6 Nov 2023 11:29:33 -0800
Message-ID: <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
To: Stanislav Fomichev <sdf@google.com>
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

On Mon, Nov 6, 2023 at 10:44=E2=80=AFAM Stanislav Fomichev <sdf@google.com>=
 wrote:
>
> On 11/05, Mina Almasry wrote:
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
> > RFC v3:
> > - Fixed issue with put_cmsg() failing silently.
> >
> > ---
> >  include/linux/socket.h            |   1 +
> >  include/net/page_pool/helpers.h   |   9 ++
> >  include/net/sock.h                |   2 +
> >  include/uapi/asm-generic/socket.h |   5 +
> >  include/uapi/linux/uio.h          |   6 +
> >  net/ipv4/tcp.c                    | 189 +++++++++++++++++++++++++++++-
> >  net/ipv4/tcp_ipv4.c               |   7 ++
> >  7 files changed, 214 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/socket.h b/include/linux/socket.h
> > index cfcb7e2c3813..fe2b9e2081bb 100644
> > --- a/include/linux/socket.h
> > +++ b/include/linux/socket.h
> > @@ -326,6 +326,7 @@ struct ucred {
> >                                         * plain text and require encryp=
tion
> >                                         */
> >
> > +#define MSG_SOCK_DEVMEM 0x2000000    /* Receive devmem skbs as cmsg */
>
> Sharing the feedback that I've been providing internally on the public li=
st:
>

There may have been a miscommunication. I don't recall hearing this
specific feedback from you, at least in the last few months. Sorry if
it seemed like I'm ignoring feedback :)

> IMHO, we need a better UAPI to receive the tokens and give them back to
> the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job done,
> but look dated and hacky :-(
>
> We should either do some kind of user/kernel shared memory queue to
> receive/return the tokens (similar to what Jonathan was doing in his
> proposal?)

I'll take a look at Jonathan's proposal, sorry, I'm not immediately
familiar but I wanted to respond :-) But is the suggestion here to
build a new kernel-user communication channel primitive for the
purpose of passing the information in the devmem cmsg? IMHO that seems
like an overkill. Why add 100-200 lines of code to the kernel to add
something that can already be done with existing primitives? I don't
see anything concretely wrong with cmsg & setsockopt approach, and if
we switch to something I'd prefer to switch to an existing primitive
for simplicity?

The only other existing primitive to pass data outside of the linear
buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
preferred? Any other suggestions or existing primitives I'm not aware
of?

> or bite the bullet and switch to io_uring.
>

IMO io_uring & socket support are orthogonal, and one doesn't preclude
the other. As you know we like to use sockets and I believe there are
issues with io_uring adoption at Google that I'm not familiar with
(and could be wrong). I'm interested in exploring io_uring support as
a follow up but I think David Wei will be interested in io_uring
support as well anyway.

> I was also suggesting to do it via netlink initially, but it's probably
> a bit slow for these purpose, idk.

Yeah, I hear netlink is reserved for control paths and is
inappropriate for data path, but I'll let folks correct me if wrong.

--=20
Thanks,
Mina
