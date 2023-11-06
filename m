Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF1C7E2E36
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF01810E3FF;
	Mon,  6 Nov 2023 20:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4734810E40A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 20:31:59 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-45d955fcabdso982153137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 12:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699302718; x=1699907518;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zK/ivvZpYGK0txvsaPdwVPtPvREv30UHRwOyNyNZQMA=;
 b=uR47+bolpUxYOjCu8xIe9dEs81+RjwB3ft73a7IlTaYRhHxQZEUqS5PCsnGNgjLNUf
 xiqB30ts7+xqNdpyQi1u8iJmRaYfoimsvxDBH7MJwN+llzEp/a4wZqahqHZI2+e63BKS
 dthuNAuEBd/2PSfiBjiHPmTEFsXhSjWmv3l0Y2FaHTgeFXQdREGBPEBKjVJc3jSIvwd/
 28uM0Vabi44V2UQB1zxzhzFT+isXrlF2BgTlRSVfIBhDVVHY8aS6ICyEpFEuwUYUWoSh
 ha3JyVTwE/qvGwEWrPWFLjclOcIBktSTCAhWR3r1MOvZrfdUCjtPIE6gAkOUyE84dpuu
 5lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699302718; x=1699907518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zK/ivvZpYGK0txvsaPdwVPtPvREv30UHRwOyNyNZQMA=;
 b=JHFDtiXnEqfLvXlKiDAuhDhZP6oFk27ADKIZEKESczihkZByNPLUSTXuplFeVXD3MD
 n8vk9pQr/eXtLYtDDPD77H8xAqb/pNYQZTmx7nYLMsW9B9Jtx+bn+TY4/R8Rm3M+PyNf
 aYRHTTtTe1C7HYkEv/h3JM4EFcsmuOp8UDMspZn29sDCOqo8GrURE0PxkGMSG+7DRirb
 ussD/rNgUYm91qWIpTJrbIInVzg6UzeJE6bbdaqhesfPv8weSLRhw0P0IHfUx7uI8El2
 Ga3feVAumBi0Gwl27yyz1usrW62VExSh8EkcTCX2AuxQavTtHQ55JEQjLA62uHJE8ZrZ
 gj9Q==
X-Gm-Message-State: AOJu0Yz3C5wh2EwPjl6xXdUKbJ+TkbAl0IY3aeUSif97AI4o14ko0/or
 w7QBozg9UFiqoBtoTFSwlS4gkgl1INu5J5cHn1EUwg==
X-Google-Smtp-Source: AGHT+IHXiZYAaOksnWLLPOs6G57so9OoaPEW1C9DHD9x8e76vgS0r/0vgZq0RcoBg8Eq1/D+nzKqqaGaoudrdmJ8uT0=
X-Received: by 2002:a67:e083:0:b0:45f:6490:b6c6 with SMTP id
 f3-20020a67e083000000b0045f6490b6c6mr1189218vsl.18.1699302718146; Mon, 06 Nov
 2023 12:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
 <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
In-Reply-To: <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 6 Nov 2023 12:31:44 -0800
Message-ID: <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 11:34=E2=80=AFAM David Ahern <dsahern@kernel.org> wr=
ote:
>
> On 11/6/23 11:47 AM, Stanislav Fomichev wrote:
> > On 11/05, Mina Almasry wrote:
> >> For device memory TCP, we expect the skb headers to be available in ho=
st
> >> memory for access, and we expect the skb frags to be in device memory
> >> and unaccessible to the host. We expect there to be no mixing and
> >> matching of device memory frags (unaccessible) with host memory frags
> >> (accessible) in the same skb.
> >>
> >> Add a skb->devmem flag which indicates whether the frags in this skb
> >> are device memory frags or not.
> >>
> >> __skb_fill_page_desc() now checks frags added to skbs for page_pool_io=
vs,
> >> and marks the skb as skb->devmem accordingly.
> >>
> >> Add checks through the network stack to avoid accessing the frags of
> >> devmem skbs and avoid coalescing devmem skbs with non devmem skbs.
> >>
> >> Signed-off-by: Willem de Bruijn <willemb@google.com>
> >> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> >> Signed-off-by: Mina Almasry <almasrymina@google.com>
> >>
> >> ---
> >>  include/linux/skbuff.h | 14 +++++++-
> >>  include/net/tcp.h      |  5 +--
> >>  net/core/datagram.c    |  6 ++++
> >>  net/core/gro.c         |  5 ++-
> >>  net/core/skbuff.c      | 77 ++++++++++++++++++++++++++++++++++++-----=
-
> >>  net/ipv4/tcp.c         |  6 ++++
> >>  net/ipv4/tcp_input.c   | 13 +++++--
> >>  net/ipv4/tcp_output.c  |  5 ++-
> >>  net/packet/af_packet.c |  4 +--
> >>  9 files changed, 115 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> >> index 1fae276c1353..8fb468ff8115 100644
> >> --- a/include/linux/skbuff.h
> >> +++ b/include/linux/skbuff.h
> >> @@ -805,6 +805,8 @@ typedef unsigned char *sk_buff_data_t;
> >>   *  @csum_level: indicates the number of consecutive checksums found =
in
> >>   *          the packet minus one that have been verified as
> >>   *          CHECKSUM_UNNECESSARY (max 3)
> >> + *  @devmem: indicates that all the fragments in this skb are backed =
by
> >> + *          device memory.
> >>   *  @dst_pending_confirm: need to confirm neighbour
> >>   *  @decrypted: Decrypted SKB
> >>   *  @slow_gro: state present at GRO time, slower prepare step require=
d
> >> @@ -991,7 +993,7 @@ struct sk_buff {
> >>  #if IS_ENABLED(CONFIG_IP_SCTP)
> >>      __u8                    csum_not_inet:1;
> >>  #endif
> >> -
> >> +    __u8                    devmem:1;
> >>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
> >>      __u16                   tc_index;       /* traffic control index =
*/
> >>  #endif
> >> @@ -1766,6 +1768,12 @@ static inline void skb_zcopy_downgrade_managed(=
struct sk_buff *skb)
> >>              __skb_zcopy_downgrade_managed(skb);
> >>  }
> >>
> >> +/* Return true if frags in this skb are not readable by the host. */
> >> +static inline bool skb_frags_not_readable(const struct sk_buff *skb)
> >> +{
> >> +    return skb->devmem;
> >
> > bikeshedding: should we also rename 'devmem' sk_buff flag to 'not_reada=
ble'?
> > It better communicates the fact that the stack shouldn't dereference th=
e
> > frags (because it has 'devmem' fragments or for some other potential
> > future reason).
>
> +1.
>
> Also, the flag on the skb is an optimization - a high level signal that
> one or more frags is in unreadable memory. There is no requirement that
> all of the frags are in the same memory type.

The flag indicates that the skb contains all devmem dma-buf memory
specifically, not generic 'not_readable' frags as the comment says:

+ *     @devmem: indicates that all the fragments in this skb are backed by
+ *             device memory.

The reason it's not a generic 'not_readable' flag is because handing
off a generic not_readable skb to the userspace is semantically not
what we're doing. recvmsg() is augmented in this patch series to
return a devmem skb to the user via a cmsg_devmem struct which refers
specifically to the memory in the dma-buf. recvmsg() in this patch
series is not augmented to give any 'not_readable' skb to the
userspace.

IMHO skb->devmem + an skb_frags_not_readable() as implemented is
correct. If a new type of unreadable skbs are introduced to the stack,
I imagine the stack would implement:

1. new header flag: skb->newmem
2.

static inline bool skb_frags_not_readable(const struct skb_buff *skb)
{
    return skb->devmem || skb->newmem;
}

3. tcp_recvmsg_devmem() would handle skb->devmem skbs is in this patch
series, but tcp_recvmsg_newmem() would handle skb->newmem skbs.

--=20
Thanks,
Mina
