Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C38CCBFA
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 08:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B733510E055;
	Thu, 23 May 2024 06:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="nQiezvDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BE010E055
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 06:02:57 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-36c67760b1aso29953095ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 23:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1716444176; x=1717048976;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=txOSv1K2CA1USg0Ze10vD1qMyJxbEs9Mfk9GiCoI090=;
 b=nQiezvDBLIfP9aUvVzF675tjSIfPYRpcE9IXhr0QkvmIOPvU8BngBw0tWvctVe2wAm
 iT3vqLM+apWzY6M9Gwz692zVBZWoUJJWvoucNptbX2y8cTJmNh63GTjHz5OA5feYfaeg
 0au0L1blJYdXT81P9FyhPuGDxVObTRN2sRkmiVaCAwPcbMLHeTMow9Daqga9IevFmrQE
 18GulWoZX+fOd8RLcfOqsRcr9LP5FGOf0uY6+cUJz4PwmPcZElLILZXunSoWRjXqpBP8
 q+ZJbdBNZmTcvWgueC0NqGebwuKMzzxB/CPhm9pTCXrSrbPVQveQpSRmnW8N3Y2KSeZv
 KW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716444176; x=1717048976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=txOSv1K2CA1USg0Ze10vD1qMyJxbEs9Mfk9GiCoI090=;
 b=BZqsr1Z8PaScETuW53GaAzw/A0waMni70Rp9Vl28JLmk8DX4ThzIZ8+XdCKXoN6kl8
 +2DLUAcfKV2zWRGzWozZSaJan8+sTgBfJ3E+xRPN+l+u9OyeAcZqJ9g/CAymhnnWSSTt
 Rhae9NoTnjsk1V761a5kmgQtLf/Z0VV+9i+uP4g2qJlkTnKaSpWn8z8b5SG3t/I7zVZM
 XAQGq8zH58UIhyqsG6h26Z5d4YYknAmp9OH6MWLuQ5ZtJBZ0J1mfzYU+TlOfxByujzEl
 cUcx8B4lAti/JChcfOyOmdfv8brebU5U4EYEsN0qTxHiPJyN13DUtPBcX18r2wvDn0V7
 mMPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4swl1Fp5Zt9cVZy34kuepTRWKvrOJNqynpkxol/3SVjSvkuRiSdRL6d4tzn/EnHaAJMwgI9VMYoJ3qI4dLaVGkF7mucNUurHguM9XGtCu
X-Gm-Message-State: AOJu0YyF1ZyZKRAppn+mbTd1Y5FMU7f1rU4h5JXF8TI+xc6xS3+daxgG
 oJSMlkYAQBb9P/m3/LrtLEY7hOTpC+xh63eJ2NViqLO+1sJUQ7AaDMs8psapjro=
X-Google-Smtp-Source: AGHT+IEHlOqXvdbfYiugVF0TXgIiftVk0fEr87owHTsVUKSpnXRyU8iozPM5JlvqTh0LUpuxvOHGhg==
X-Received: by 2002:a05:6e02:1447:b0:36c:7f3d:59a with SMTP id
 e9e14a558f8ab-371f7c80fe6mr48056835ab.4.1716444176327; 
 Wed, 22 May 2024 23:02:56 -0700 (PDT)
Received: from [192.168.1.16] (174-21-188-197.tukw.qwest.net. [174.21.188.197])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-634117190absm23448503a12.87.2024.05.22.23.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 23:02:55 -0700 (PDT)
Message-ID: <9097e78d-0e7d-43bd-bafd-e53a4872a4d1@davidwei.uk>
Date: Wed, 22 May 2024 23:02:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 11/14] tcp: RX path for devmem TCP
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-12-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240510232128.1105145-12-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-05-10 16:21, Mina Almasry wrote:
> +/* On error, returns the -errno. On success, returns number of bytes sent to the
> + * user. May not consume all of @remaining_len.
> + */
> +static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
> +			      unsigned int offset, struct msghdr *msg,
> +			      int remaining_len)
> +{
> +	struct dmabuf_cmsg dmabuf_cmsg = { 0 };
> +	struct tcp_xa_pool tcp_xa_pool;
> +	unsigned int start;
> +	int i, copy, n;
> +	int sent = 0;
> +	int err = 0;
> +
> +	tcp_xa_pool.max = 0;
> +	tcp_xa_pool.idx = 0;
> +	do {
> +		start = skb_headlen(skb);
> +
> +		if (skb_frags_readable(skb)) {
> +			err = -ENODEV;
> +			goto out;
> +		}
> +
> +		/* Copy header. */
> +		copy = start - offset;
> +		if (copy > 0) {
> +			copy = min(copy, remaining_len);
> +
> +			n = copy_to_iter(skb->data + offset, copy,
> +					 &msg->msg_iter);
> +			if (n != copy) {
> +				err = -EFAULT;
> +				goto out;
> +			}
> +
> +			offset += copy;
> +			remaining_len -= copy;
> +
> +			/* First a dmabuf_cmsg for # bytes copied to user
> +			 * buffer.
> +			 */
> +			memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
> +			dmabuf_cmsg.frag_size = copy;
> +			err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
> +				       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
> +			if (err || msg->msg_flags & MSG_CTRUNC) {
> +				msg->msg_flags &= ~MSG_CTRUNC;
> +				if (!err)
> +					err = -ETOOSMALL;
> +				goto out;
> +			}
> +
> +			sent += copy;
> +
> +			if (remaining_len == 0)
> +				goto out;
> +		}
> +
> +		/* after that, send information of dmabuf pages through a
> +		 * sequence of cmsg
> +		 */
> +		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
> +			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
> +			struct net_iov *niov;
> +			u64 frag_offset;
> +			int end;
> +
> +			/* !skb_frags_readable() should indicate that ALL the
> +			 * frags in this skb are dmabuf net_iovs. We're checking
> +			 * for that flag above, but also check individual frags
> +			 * here. If the tcp stack is not setting
> +			 * skb_frags_readable() correctly, we still don't want
> +			 * to crash here.
> +			 */
> +			if (!skb_frag_net_iov(frag)) {
> +				net_err_ratelimited("Found non-dmabuf skb with net_iov");
> +				err = -ENODEV;
> +				goto out;
> +			}
> +
> +			niov = skb_frag_net_iov(frag);

Sorry if we've already discussed this.

We have this additional hunk:

+ if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
+ 	err = -ENODEV;
+ 	goto out;
+ }

In case one of our skbs end up here, skb_frag_is_net_iov() and
!skb_frags_readable(). Does this even matter? And if so then is there a
better way to distinguish between our two types of net_iovs?
