Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A9913F6C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 02:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239E110E15C;
	Mon, 24 Jun 2024 00:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M/wL8P0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA3410E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 00:13:42 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52cdfb69724so1265131e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 17:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719188020; x=1719792820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GK3XqR+PJ1d4Fz6hBIhYUON//yKPUubXeIxccDTP36Q=;
 b=M/wL8P0tMeV3Mykdd/d/zJrU7KVDjB6lCyZlt+T3c48DOrqv88PWqK3uCraxWH9ZyK
 DLgX5n5SDh8uBmUnNE2mJC9k3PTkW+RbRZyuchrrqGG6qtZA99gNOkB3DSYWM7gu7yC+
 R2zVJBStkEBk4KiInwiPuPMw900LaKTLp81gvKqmdxieOTPlmBbfkO+pdPxNSBiDhxup
 ZXvOl1lE6jdMmdF5IjGoPwb7zia83ZA+fv2eGqcGjNcUW8uLuK1u6vM9bSXppng46pzP
 k4JH36ptquUVAeLYovq79I7AD+43OZ6ps+yapOZZQcom3XkvXCrUwTKAqiohb4TW8quj
 twCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719188020; x=1719792820;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GK3XqR+PJ1d4Fz6hBIhYUON//yKPUubXeIxccDTP36Q=;
 b=sJAQOnUfYEmGPfslR/LGPSzPp2ge6/wLkmAcSPnhdgenS+EV9R+Yh36DH3xzQfrr93
 o9a0YPyT1aZgvUVlmE6b3xExm2bDMnvHHHBqxFFcYUDCsA634vlEg9lAoIeKWSKqw7mJ
 yGSq3dUx/ydCvP05Ybmpg1A2E/Tj0ecq2wHplIKMewtIhYQqGhzWN0gBD55+b39XBbnH
 xWqihazrzKFwdX8DKa/mcQX/zfmCRkZr38xBq4AbL5GJRgexO5UHhv0dHnVda8KgWy9B
 ulcu7bmSTBvxftNaiVK8oBWIxwKIKVcK19DfZt942vEC+m/lpdJVUBbS6wcd7s5i5Hc0
 Z0OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcSQnmkpXgjgpZ15C6NZTPPGqgByndUK5D0kYWKnbqlUxUQEaXqQvtcdHK+gcGpz9aTMXVWV0B5/1x5OWaPk6F/5Hzmo1Kny8KHJeJILHp
X-Gm-Message-State: AOJu0YxhCT6gk4eanQvrcggCp+e03f2teMbaVnKCsAb4+QsQl13A0YXW
 BrVg61hA1cx+i6ijZEF4HRLM6KvM4Qbus5JfD9Py7k6lpAvkqgsL
X-Google-Smtp-Source: AGHT+IF2Bfeow77JRmsfl+qYe07q4SCYIXRmBXwU95g0HYBerXLLikzR2pgaDVKgp0/53mQUmpDsKw==
X-Received: by 2002:ac2:4437:0:b0:52c:c9d1:ad32 with SMTP id
 2adb3069b0e04-52ce1835a80mr1726400e87.22.1719188020234; 
 Sun, 23 Jun 2024 17:13:40 -0700 (PDT)
Received: from [192.168.8.113] ([148.252.133.212])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725060340csm88197066b.22.2024.06.23.17.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 17:13:39 -0700 (PDT)
Message-ID: <ae0d02f0-b304-4847-a88a-cd5bd4b9bc76@gmail.com>
Date: Mon, 24 Jun 2024 01:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 10/13] tcp: RX path for devmem TCP
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240613013557.1169171-1-almasrymina@google.com>
 <20240613013557.1169171-11-almasrymina@google.com>
 <20a6a727-d9f2-495c-bf75-72c27740dd82@gmail.com>
 <CAHS8izMce36FwLhFB0znHQYmxpe5hmTSXtZA7+b5VsmSJUfhRw@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izMce36FwLhFB0znHQYmxpe5hmTSXtZA7+b5VsmSJUfhRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/21/24 21:31, Mina Almasry wrote:
> On Mon, Jun 17, 2024 at 9:36 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 6/13/24 02:35, Mina Almasry wrote:
>>>
>>> The pages awaiting freeing are stored in the newly added
>>> sk->sk_user_frags, and each page passed to userspace is get_page()'d.
>>> This reference is dropped once the userspace indicates that it is
>>> done reading this page.  All pages are released when the socket is
>>> destroyed.
>>
>> One small concern is that if the pool gets destroyed (i.e.
>> page_pool_destroy) before sockets holding netiov, page pool will
>> semi-busily poll until the sockets die or such and will spam with
>> pr_warn(). E.g. when a user drops the nl but leaks data sockets
>> and continues with its userspace business. You can probably do
>> it in a loop and create dozens of such pending
>> page_pool_release_retry().
>>
> 
> Yes, true, but this is not really an issue with netiovs per se, it's a
> quirk with the page_pool in general. If a non-devmem page_pool is

True, devmem is just a new convenient way of doing that ...

> destroyed while there are pages waiting in the receive queues to be
> recvmsg'd, the behavior you described happens anyway AFAIU.
> 
> Jakub did some work to improve this. IIRC he disabled the regular
> warning and he reparents the orphan page_pools so they appear in the
> stats of his netlink API.
> 
> Since this is behavior already applying to pages, I did not seek to
> improve it as I add devmem support, I just retain it. We could improve
> it in a separate patchset, but I do not see this behavior as a
> critical issue really, especially since the alarming pr_warn has been
> removed.

... fair enough. I haven't noticed it being removed, but was
thinking to suggest to conver to ratelimited.

>>> +static int tcp_xa_pool_refill(struct sock *sk, struct tcp_xa_pool *p,
>>> +                           unsigned int max_frags)
>>> +{
>>> +     int err, k;
>>> +
>>> +     if (p->idx < p->max)
>>> +             return 0;
>>> +
>>> +     xa_lock_bh(&sk->sk_user_frags);
>>> +
>>> +     tcp_xa_pool_commit_locked(sk, p);
>>> +
>>> +     for (k = 0; k < max_frags; k++) {
>>> +             err = __xa_alloc(&sk->sk_user_frags, &p->tokens[k],
>>> +                              XA_ZERO_ENTRY, xa_limit_31b, GFP_KERNEL);
>>> +             if (err)
>>> +                     break;
>>> +     }
>>> +
>>> +     xa_unlock_bh(&sk->sk_user_frags);
>>> +
>>> +     p->max = k;
>>> +     p->idx = 0;
>>> +     return k ? 0 : err;
>>> +}
>>
>> Personally, I'd prefer this optimisation to be in a separate patch,
>> especially since there is some degree of hackiness to it.
>>
>>
> 
> To be honest this optimization is very necessary from my POV. We ran
> into real production problems due to the excessive locking when we use
> regular xa_alloc(), and Eric implemented this optimization to resolve
> that. I simply squashed the optimization for this upstream series.
> 
> If absolutely necessary I can refactor it into a separate patch or
> carry the optimization locally, but this seems like a problem everyone
> looking to use devmem TCP will re-discover, so probably worth just
> having here?

I specifically mean how it's split into patches within the set. It'd
have been easier to review, understand for people looking it up in
history and so on. However, not insisting on changing it now, might
be safer to leave it alone

>>> +             /* if remaining_len is not satisfied yet, we need to go to the
>>> +              * next frag in the frag_list to satisfy remaining_len.
>>> +              */
>>> +             skb = skb_shinfo(skb)->frag_list ?: skb->next;
>>> +
>>> +             offset = offset - start;
>>
>> It's an offset into the current skb, isn't it? Wouldn't
>> offset = 0; be less confusing?
>>
> 
> Seems so, AFAICT. Let me try to apply this and see if it trips up any tests.
> 
>>> +     } while (skb);
>>> +
>>> +     if (remaining_len) {
>>> +             err = -EFAULT;
>>> +             goto out;
>>> +     }
>>
>> Having data left is not a fault,
> 
> I think it is. The caller of tcp_recvmsg_dmabuf() expects all of
> remaining_len to be used up, otherwise it messes up with the math in
> the caller. __skb_datagram_iter(), which is the equivalent to this one
> for pages, regards having left over data as a fault and also returns
> -EFAULT, AFAICT.

I mean "Having data left is not a fault, not receiving
anything is", and you correctly return a partial result
if that was the case.

>> and to get here you
>> need to get an skb with no data left, which shouldn't
>> happen. Seems like everything you need is covered by
>> the "!sent" check below.
>>
> 
> I think we can get here if we run out of skbs with data, no?

IIRC the caller clamps it so that it's within the skb with
its frags. Well, safer to have the check, I agree. It's just
looked a bit odd since the value is complementary to @sent,
but I guess it's just a way to propagate -EFAULT.

>>> @@ -2503,6 +2504,15 @@ static void tcp_md5sig_info_free_rcu(struct rcu_head *head)
>>>    void tcp_v4_destroy_sock(struct sock *sk)
>>>    {
>>>        struct tcp_sock *tp = tcp_sk(sk);
>>> +     __maybe_unused unsigned long index;
>>> +     __maybe_unused void *netmem;
>>
>> How about adding a function to get rid of __maybe_unused?.
>>
>> static void sock_release_devmem_frags() {
>> #ifdef PP
>>          unsigned index;
>>          ...
>> #endif PP
>> }
>>
> 
> Will do.
> 
>> Also, even though you wire it up for TCP, since ->sk_user_frags
>> is in struct sock I'd expect the release to be somewhere in the
>> generic sock path like __sk_destruct(), and same for init.
>> Perhpas, it's better to leave it for later.

-- 
Pavel Begunkov
