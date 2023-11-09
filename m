Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C62697E6923
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 12:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079AC10E8A9;
	Thu,  9 Nov 2023 11:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37810E201
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 11:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699527948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AtRUDPzty4xk6G3YrueIs/2p0T2ePc3PiZweAufe498=;
 b=GpMpeR7T/5VxZaBBi/W2hcO5a9V6JB5WYHfUfAYrfB5lTusyJli7U8yB5elPVmvKgV2+9N
 Vf05bM/m7O88NkjDnRItYWRpP/foxoKaVFz7H+nNDl34QdgoKgldeb9I9vNp6xn0/nHpdk
 8sHIj42g6m4BvgeijdvGgR8pD4Awu3k=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-7ULQilAZO1WOrTan9lFj4A-1; Thu, 09 Nov 2023 06:05:44 -0500
X-MC-Unique: 7ULQilAZO1WOrTan9lFj4A-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-da37e78401aso151699276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 03:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699527944; x=1700132744;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AtRUDPzty4xk6G3YrueIs/2p0T2ePc3PiZweAufe498=;
 b=m7v0l0szkjUndsF/hl/TSMMGBDlbijzK73I1VE8VF4Dw7ML6me83FP0oyL/WI7yqCT
 5ZN1/khWEgLQRJR45uvsKrEOKVLJ7npqViAoHAnC0CvM7wobNvAkDVdI3nD6JDsb9FU5
 1KFlSa4cBUIeWjjoyr5jtSfNKvT5BzvyP5TuVhYydgoqJASsk/sAvLHViTv27T+lreXH
 m19N56CAu6LFOShhi7SF0In+3gKYXipAvMlx3hZYV/zpr7gi6bRQI07wPLrwmTdh4Fgm
 NxrcVLyWThM/jgcaJaj7+UQxNluDGBnC7Y1idN8G8JoozHftEYEeNN2KuKKu79yQtls+
 AwDg==
X-Gm-Message-State: AOJu0YwJehByjl2N+3x796FUJGbeEniKfE5398X0EDSFEmWMcKBgr3k6
 WZ24cTv4Q6rxMlzXN40VNYAMBwuxoLi9tHABmRqo+EsMdXpJcyBo30KLAR5UKS7i521ZOa+m24G
 8cskLzTGbsmh/4QakVKzc32GVdp7+
X-Received: by 2002:a25:9346:0:b0:dae:e380:3afa with SMTP id
 g6-20020a259346000000b00daee3803afamr1116267ybo.2.1699527944401; 
 Thu, 09 Nov 2023 03:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOFSam8Y2WZfjs6lyrCBJqDmNWulDFM0w0FKUbNkESWMi4P7ZtSYxs4i3pcukjOXBjSX6POg==
X-Received: by 2002:a25:9346:0:b0:dae:e380:3afa with SMTP id
 g6-20020a259346000000b00daee3803afamr1116194ybo.2.1699527942695; 
 Thu, 09 Nov 2023 03:05:42 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 g23-20020ac870d7000000b004181e5a724csm1813782qtp.88.2023.11.09.03.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 03:05:42 -0800 (PST)
Message-ID: <3a1b5412bee202affc6a7cc74cd939e182b9a18e.camel@redhat.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Stanislav Fomichev
 <sdf@google.com>
Date: Thu, 09 Nov 2023 12:05:37 +0100
In-Reply-To: <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mina Almasry <almasrymina@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 linux-arch@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S.
 Miller" <davem@davemloft.net>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-11-06 at 14:55 -0800, Willem de Bruijn wrote:
> On Mon, Nov 6, 2023 at 2:34=E2=80=AFPM Stanislav Fomichev <sdf@google.com=
> wrote:
> >=20
> > On 11/06, Willem de Bruijn wrote:
> > > > > IMHO, we need a better UAPI to receive the tokens and give them b=
ack to
> > > > > the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job don=
e,
> > > > > but look dated and hacky :-(
> > > > >=20
> > > > > We should either do some kind of user/kernel shared memory queue =
to
> > > > > receive/return the tokens (similar to what Jonathan was doing in =
his
> > > > > proposal?)
> > > >=20
> > > > I'll take a look at Jonathan's proposal, sorry, I'm not immediately
> > > > familiar but I wanted to respond :-) But is the suggestion here to
> > > > build a new kernel-user communication channel primitive for the
> > > > purpose of passing the information in the devmem cmsg? IMHO that se=
ems
> > > > like an overkill. Why add 100-200 lines of code to the kernel to ad=
d
> > > > something that can already be done with existing primitives? I don'=
t
> > > > see anything concretely wrong with cmsg & setsockopt approach, and =
if
> > > > we switch to something I'd prefer to switch to an existing primitiv=
e
> > > > for simplicity?
> > > >=20
> > > > The only other existing primitive to pass data outside of the linea=
r
> > > > buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
> > > > preferred? Any other suggestions or existing primitives I'm not awa=
re
> > > > of?
> > > >=20
> > > > > or bite the bullet and switch to io_uring.
> > > > >=20
> > > >=20
> > > > IMO io_uring & socket support are orthogonal, and one doesn't precl=
ude
> > > > the other. As you know we like to use sockets and I believe there a=
re
> > > > issues with io_uring adoption at Google that I'm not familiar with
> > > > (and could be wrong). I'm interested in exploring io_uring support =
as
> > > > a follow up but I think David Wei will be interested in io_uring
> > > > support as well anyway.
> > >=20
> > > I also disagree that we need to replace a standard socket interface
> > > with something "faster", in quotes.
> > >=20
> > > This interface is not the bottleneck to the target workload.
> > >=20
> > > Replacing the synchronous sockets interface with something more
> > > performant for workloads where it is, is an orthogonal challenge.
> > > However we do that, I think that traditional sockets should continue
> > > to be supported.
> > >=20
> > > The feature may already even work with io_uring, as both recvmsg with
> > > cmsg and setsockopt have io_uring support now.
> >=20
> > I'm not really concerned with faster. I would prefer something cleaner =
:-)
> >=20
> > Or maybe we should just have it documented. With some kind of path
> > towards beautiful world where we can create dynamic queues..
>=20
> I suppose we just disagree on the elegance of the API.
>=20
> The concise notification API returns tokens as a range for
> compression, encoding as two 32-bit unsigned integers start + length.
> It allows for even further batching by returning multiple such ranges
> in a single call.
>=20
> This is analogous to the MSG_ZEROCOPY notification mechanism from
> kernel to user.
>=20
> The synchronous socket syscall interface can be replaced by something
> asynchronous like io_uring. This already works today? Whatever
> asynchronous ring-based API would be selected, io_uring or otherwise,
> I think the concise notification encoding would remain as is.
>=20
> Since this is an operation on a socket, I find a setsockopt the
> fitting interface.

FWIW, I think sockopt +cmsg is the right API. It would deserve some
explicit addition to the documentation, both in the kernel and in the
man-pages.

Cheers,

Paolo

