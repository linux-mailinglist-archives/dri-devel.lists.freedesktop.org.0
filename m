Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CEE7E318A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7697110E45B;
	Mon,  6 Nov 2023 23:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B10810E45B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 23:37:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A45FCCE0A49;
 Mon,  6 Nov 2023 23:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7A0C433C7;
 Mon,  6 Nov 2023 23:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699313828;
 bh=h0S79LVjAan/iH3IkQASAF7+37BYiP+aZRxXCZvJPsg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LeNrbB8z4RQxY05FYKNoTzKmbq+g4U4chZEqsB8U7wMLOQG5bQ00zLdcyG4zk2FSG
 sirRWy1WHKJhDp/lGJ0F8oiw6DOkHpLvYDGVEKW9C5q4nj0/qBG6zXeKaQkvDK8aUM
 bIFoenc6lxo6qZ+gEpxnFBLEyj0YCdplMxiItzB0OGgld+kfO6gcCZakR1w3AKA1n/
 n08qdlKTcDb7Bq7Gf/jUXn/bc+NR6WHwi5vJfJpTSFNxYJNiHRT29kU9u3xFsSMMve
 JKSRGtgbD1cdZ/3+1ROyEWy5Jo2sgtaWruuPCseAAQcb+VhSeNfdbNIIH+UuAv/Xd7
 3UtKrn82JB/Jw==
Message-ID: <00883386-0c4b-4ba7-84c6-553f468304e6@kernel.org>
Date: Mon, 6 Nov 2023 16:37:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, Stanislav Fomichev <sdf@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
 <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
 <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
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

On 11/6/23 3:18 PM, Mina Almasry wrote:
>>>>>> @@ -991,7 +993,7 @@ struct sk_buff {
>>>>>>  #if IS_ENABLED(CONFIG_IP_SCTP)
>>>>>>      __u8                    csum_not_inet:1;
>>>>>>  #endif
>>>>>> -
>>>>>> +    __u8                    devmem:1;
>>>>>>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
>>>>>>      __u16                   tc_index;       /* traffic control index */
>>>>>>  #endif
>>>>>> @@ -1766,6 +1768,12 @@ static inline void skb_zcopy_downgrade_managed(struct sk_buff *skb)
>>>>>>              __skb_zcopy_downgrade_managed(skb);
>>>>>>  }
>>>>>>
>>>>>> +/* Return true if frags in this skb are not readable by the host. */
>>>>>> +static inline bool skb_frags_not_readable(const struct sk_buff *skb)
>>>>>> +{
>>>>>> +    return skb->devmem;
>>>>>
>>>>> bikeshedding: should we also rename 'devmem' sk_buff flag to 'not_readable'?
>>>>> It better communicates the fact that the stack shouldn't dereference the
>>>>> frags (because it has 'devmem' fragments or for some other potential
>>>>> future reason).
>>>>
>>>> +1.
>>>>
>>>> Also, the flag on the skb is an optimization - a high level signal that
>>>> one or more frags is in unreadable memory. There is no requirement that
>>>> all of the frags are in the same memory type.
>>
>> David: maybe there should be such a requirement (that they all are
>> unreadable)? Might be easier to support initially; we can relax later
>> on.
>>
> 
> Currently devmem == not_readable, and the restriction is that all the
> frags in the same skb must be either all readable or all unreadable
> (all devmem or all non-devmem).

What requires that restriction? In all of the uses of skb->devmem and
skb_frags_not_readable() what matters is if any frag is not readable,
then frag list walk or collapse is avoided.

