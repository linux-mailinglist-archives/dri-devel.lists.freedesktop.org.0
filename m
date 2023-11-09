Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589EC7E68D0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 11:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D72110E200;
	Thu,  9 Nov 2023 10:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B6C10E200
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699527128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eIeLWjSN6YQgSOsU/6ObvktclCOq7w5AOZsLl7e9Lg=;
 b=RNXxL5TEq+fC0Mi+o0lKwKQSFXvg+XOQt338sv9HpvFqe+PnNJvrI16jVuwVNJJP2uMGGu
 oEzYeKKFFOOvz5Gk2V2Utp3tiagvu2w4jvgqEYk9xCKqSW0vkFtv7kBy9l0o5q2NhyAkAa
 X/0iautGn74BpdD45CNVY267qejQ9cw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-TYtWGYm6NnuiYVhqjeQgAw-1; Thu, 09 Nov 2023 05:52:07 -0500
X-MC-Unique: TYtWGYm6NnuiYVhqjeQgAw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-66d7b75c854so1011256d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 02:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699527126; x=1700131926;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/fEMZu04vJmPyEDeZ4tFFxfgW3Qd9nS2eGWSB2Vs73s=;
 b=UY/0tqfAS6lxljUp6EYSNy7av6MNDRSoSoQvs0sjoV4cnPGSq4PdY4vVjRDobKZKRX
 Z4M5SgTjhiHY1S02KQ5l5R4HBRVjC2sxMs06lZ4+LndKy3RtTNhVPCfbjl7dXsPWI14S
 RvZGcJTBOzH/6d4SJaTMW52EfG5FiV1ctVFuwyNlSwYX39UhoipWXY3mAobvP66f0ZsF
 5u17pYI9qegafLM5V6WJ53LgcmJJTKxubzedIxGAlM0Yfcv7MeV50suNzReO3aGB05Ne
 6J+rT63KH5dhVrilv06rPs9W/D5JvJnFCWhT6w2X6adEaI5/+UFWAmXAlLkdSc5odPKR
 wmkA==
X-Gm-Message-State: AOJu0YyHpta/8YukTTHB7a1fx6kNf63nMt5kNn/uOBlkYrQwgXBsyYsm
 rLvryYrdxZTV2yTCEtErw6iA9n9dGuMjGC7NZdW+ZQE0V7p8Or3Km6jeyIIuPNYFvqC3HfGq/aX
 1amDxotTHrzzhfAyCeQRIr2/lLi+/
X-Received: by 2002:a05:6214:4a:b0:670:d117:1f9e with SMTP id
 c10-20020a056214004a00b00670d1171f9emr4487358qvr.2.1699527126642; 
 Thu, 09 Nov 2023 02:52:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAk/DQxSd74d4wUNFAZnKsQQezg47K5p4R/fP0LVcZMKk5oMlW4rqzws8VL1bQTjgTMKPmVQ==
X-Received: by 2002:a05:6214:4a:b0:670:d117:1f9e with SMTP id
 c10-20020a056214004a00b00670d1171f9emr4487333qvr.2.1699527126264; 
 Thu, 09 Nov 2023 02:52:06 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 l8-20020a056214104800b0065d89f4d537sm1952390qvr.45.2023.11.09.02.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 02:52:05 -0800 (PST)
Message-ID: <e584ca804a2e98bcf6e8e5ea2d4206f9f579e0ce.camel@redhat.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Nov 2023 11:52:01 +0100
In-Reply-To: <20231106024413.2801438-11-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
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
> +/* On error, returns the -errno. On success, returns number of bytes sen=
t to the
> + * user. May not consume all of @remaining_len.
> + */
> +static int tcp_recvmsg_devmem(const struct sock *sk, const struct sk_buf=
f *skb,
> +=09=09=09      unsigned int offset, struct msghdr *msg,
> +=09=09=09      int remaining_len)
> +{
> +=09struct cmsg_devmem cmsg_devmem =3D { 0 };
> +=09unsigned int start;
> +=09int i, copy, n;
> +=09int sent =3D 0;
> +=09int err =3D 0;
> +
> +=09do {
> +=09=09start =3D skb_headlen(skb);
> +
> +=09=09if (!skb_frags_not_readable(skb)) {

As 'skb_frags_not_readable()' is intended to be a possibly wider scope
test then skb->devmem, should the above test explicitly skb->devmem?

> +=09=09=09err =3D -ENODEV;
> +=09=09=09goto out;
> +=09=09}
> +
> +=09=09/* Copy header. */
> +=09=09copy =3D start - offset;
> +=09=09if (copy > 0) {
> +=09=09=09copy =3D min(copy, remaining_len);
> +
> +=09=09=09n =3D copy_to_iter(skb->data + offset, copy,
> +=09=09=09=09=09 &msg->msg_iter);
> +=09=09=09if (n !=3D copy) {
> +=09=09=09=09err =3D -EFAULT;
> +=09=09=09=09goto out;
> +=09=09=09}
> +
> +=09=09=09offset +=3D copy;
> +=09=09=09remaining_len -=3D copy;
> +
> +=09=09=09/* First a cmsg_devmem for # bytes copied to user
> +=09=09=09 * buffer.
> +=09=09=09 */
> +=09=09=09memset(&cmsg_devmem, 0, sizeof(cmsg_devmem));
> +=09=09=09cmsg_devmem.frag_size =3D copy;
> +=09=09=09err =3D put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_HEADER,
> +=09=09=09=09       sizeof(cmsg_devmem), &cmsg_devmem);
> +=09=09=09if (err || msg->msg_flags & MSG_CTRUNC) {
> +=09=09=09=09msg->msg_flags &=3D ~MSG_CTRUNC;
> +=09=09=09=09if (!err)
> +=09=09=09=09=09err =3D -ETOOSMALL;
> +=09=09=09=09goto out;
> +=09=09=09}
> +
> +=09=09=09sent +=3D copy;
> +
> +=09=09=09if (remaining_len =3D=3D 0)
> +=09=09=09=09goto out;
> +=09=09}
> +
> +=09=09/* after that, send information of devmem pages through a
> +=09=09 * sequence of cmsg
> +=09=09 */
> +=09=09for (i =3D 0; i < skb_shinfo(skb)->nr_frags; i++) {
> +=09=09=09const skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> +=09=09=09struct page_pool_iov *ppiov;
> +=09=09=09u64 frag_offset;
> +=09=09=09u32 user_token;
> +=09=09=09int end;
> +
> +=09=09=09/* skb_frags_not_readable() should indicate that ALL the
> +=09=09=09 * frags in this skb are unreadable page_pool_iovs.
> +=09=09=09 * We're checking for that flag above, but also check
> +=09=09=09 * individual pages here. If the tcp stack is not
> +=09=09=09 * setting skb->devmem correctly, we still don't want to
> +=09=09=09 * crash here when accessing pgmap or priv below.
> +=09=09=09 */
> +=09=09=09if (!skb_frag_page_pool_iov(frag)) {
> +=09=09=09=09net_err_ratelimited("Found non-devmem skb with page_pool_iov=
");
> +=09=09=09=09err =3D -ENODEV;
> +=09=09=09=09goto out;
> +=09=09=09}
> +
> +=09=09=09ppiov =3D skb_frag_page_pool_iov(frag);
> +=09=09=09end =3D start + skb_frag_size(frag);
> +=09=09=09copy =3D end - offset;
> +
> +=09=09=09if (copy > 0) {
> +=09=09=09=09copy =3D min(copy, remaining_len);
> +
> +=09=09=09=09frag_offset =3D page_pool_iov_virtual_addr(ppiov) +
> +=09=09=09=09=09      skb_frag_off(frag) + offset -
> +=09=09=09=09=09      start;
> +=09=09=09=09cmsg_devmem.frag_offset =3D frag_offset;
> +=09=09=09=09cmsg_devmem.frag_size =3D copy;
> +=09=09=09=09err =3D xa_alloc((struct xarray *)&sk->sk_user_pages,
> +=09=09=09=09=09       &user_token, frag->bv_page,
> +=09=09=09=09=09       xa_limit_31b, GFP_KERNEL);
> +=09=09=09=09if (err)
> +=09=09=09=09=09goto out;
> +
> +=09=09=09=09cmsg_devmem.frag_token =3D user_token;
> +
> +=09=09=09=09offset +=3D copy;
> +=09=09=09=09remaining_len -=3D copy;
> +
> +=09=09=09=09err =3D put_cmsg(msg, SOL_SOCKET,
> +=09=09=09=09=09       SO_DEVMEM_OFFSET,
> +=09=09=09=09=09       sizeof(cmsg_devmem),
> +=09=09=09=09=09       &cmsg_devmem);
> +=09=09=09=09if (err || msg->msg_flags & MSG_CTRUNC) {
> +=09=09=09=09=09msg->msg_flags &=3D ~MSG_CTRUNC;
> +=09=09=09=09=09xa_erase((struct xarray *)&sk->sk_user_pages,
> +=09=09=09=09=09=09 user_token);
> +=09=09=09=09=09if (!err)
> +=09=09=09=09=09=09err =3D -ETOOSMALL;
> +=09=09=09=09=09goto out;
> +=09=09=09=09}
> +
> +=09=09=09=09page_pool_iov_get_many(ppiov, 1);
> +
> +=09=09=09=09sent +=3D copy;
> +
> +=09=09=09=09if (remaining_len =3D=3D 0)
> +=09=09=09=09=09goto out;
> +=09=09=09}
> +=09=09=09start =3D end;
> +=09=09}
> +
> +=09=09if (!remaining_len)
> +=09=09=09goto out;
> +
> +=09=09/* if remaining_len is not satisfied yet, we need to go to the
> +=09=09 * next frag in the frag_list to satisfy remaining_len.
> +=09=09 */
> +=09=09skb =3D skb_shinfo(skb)->frag_list ?: skb->next;

I think at this point the 'skb' is still on the sk receive queue. The
above will possibly walk the queue.

Later on, only the current queue tail could be possibly consumed by
tcp_recvmsg_locked(). This feel confusing to me?!? Why don't limit the
loop only the 'current' skb and it's frags?

> +
> +=09=09offset =3D offset - start;
> +=09} while (skb);
> +
> +=09if (remaining_len) {
> +=09=09err =3D -EFAULT;
> +=09=09goto out;
> +=09}
> +
> +out:
> +=09if (!sent)
> +=09=09sent =3D err;
> +
> +=09return sent;
> +}
> +
>  /*
>   *=09This routine copies from a sock struct into the user buffer.
>   *
> @@ -2314,6 +2463,7 @@ static int tcp_recvmsg_locked(struct sock *sk, stru=
ct msghdr *msg, size_t len,
>  =09=09=09      int *cmsg_flags)
>  {
>  =09struct tcp_sock *tp =3D tcp_sk(sk);
> +=09int last_copied_devmem =3D -1; /* uninitialized */
>  =09int copied =3D 0;
>  =09u32 peek_seq;
>  =09u32 *seq;
> @@ -2491,15 +2641,44 @@ static int tcp_recvmsg_locked(struct sock *sk, st=
ruct msghdr *msg, size_t len,
>  =09=09}
> =20
>  =09=09if (!(flags & MSG_TRUNC)) {
> -=09=09=09err =3D skb_copy_datagram_msg(skb, offset, msg, used);
> -=09=09=09if (err) {
> -=09=09=09=09/* Exception. Bailout! */
> -=09=09=09=09if (!copied)
> -=09=09=09=09=09copied =3D -EFAULT;
> +=09=09=09if (last_copied_devmem !=3D -1 &&
> +=09=09=09    last_copied_devmem !=3D skb->devmem)
>  =09=09=09=09break;
> +
> +=09=09=09if (!skb->devmem) {
> +=09=09=09=09err =3D skb_copy_datagram_msg(skb, offset, msg,
> +=09=09=09=09=09=09=09    used);
> +=09=09=09=09if (err) {
> +=09=09=09=09=09/* Exception. Bailout! */
> +=09=09=09=09=09if (!copied)
> +=09=09=09=09=09=09copied =3D -EFAULT;
> +=09=09=09=09=09break;
> +=09=09=09=09}
> +=09=09=09} else {
> +=09=09=09=09if (!(flags & MSG_SOCK_DEVMEM)) {
> +=09=09=09=09=09/* skb->devmem skbs can only be received
> +=09=09=09=09=09 * with the MSG_SOCK_DEVMEM flag.
> +=09=09=09=09=09 */
> +=09=09=09=09=09if (!copied)
> +=09=09=09=09=09=09copied =3D -EFAULT;
> +
> +=09=09=09=09=09break;
> +=09=09=09=09}
> +
> +=09=09=09=09err =3D tcp_recvmsg_devmem(sk, skb, offset, msg,
> +=09=09=09=09=09=09=09 used);
> +=09=09=09=09if (err <=3D 0) {
> +=09=09=09=09=09if (!copied)
> +=09=09=09=09=09=09copied =3D -EFAULT;
> +
> +=09=09=09=09=09break;
> +=09=09=09=09}
> +=09=09=09=09used =3D err;

Minor nit: I personally would find the above more readable, placing
this whole chunk in a single helper (e.g. the current
tcp_recvmsg_devmem(), renamed to something more appropriate).

Cheers,

Paolo

