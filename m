Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D5F7E2CEF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 20:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951FD10E3E9;
	Mon,  6 Nov 2023 19:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6D310E3E9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 19:34:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 330F2B80DE6;
 Mon,  6 Nov 2023 19:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA7AC433C9;
 Mon,  6 Nov 2023 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699299294;
 bh=Hl1nfA1hQNe7leKhITV5rp/ybaYc2SObTEPuCoXKzsU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A19kRBUhdf908QakvSgKid7H5ILLcRyl3LZTCq1N1NbR7P1t/sgJRPyq2mGHLHvNQ
 c1PmQQF3vJZi27wlDydYRDaG8WnnwIr0O2WZfJhX3FpFS6CHEqJ6CuB7YqBNsWEaZE
 xyOMV1pLvMG22qoj0QveUa+peLUS08xdNIur+5Fr3xrEIfcoB+ObeLmiFlg1mq0m3q
 0yN7lT3Uys4lMsk11MZaPaYEVjqE3WuxO6HHuReiJN0i9RJhbO12h4kRSoBuzqWNjB
 idZCa47/HKlp/rFMD73n780muQHc7iYP5/kr+yLw9PIA6OnA231CX8KwxAGpxy4SoF
 Lhij6W8x3MIrw==
Message-ID: <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
Date: Mon, 6 Nov 2023 12:34:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
Content-Language: en-US
To: Stanislav Fomichev <sdf@google.com>, Mina Almasry <almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
 <ZUk03DhWxV-bOFJL@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <ZUk03DhWxV-bOFJL@google.com>
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

On 11/6/23 11:47 AM, Stanislav Fomichev wrote:
> On 11/05, Mina Almasry wrote:
>> For device memory TCP, we expect the skb headers to be available in host
>> memory for access, and we expect the skb frags to be in device memory
>> and unaccessible to the host. We expect there to be no mixing and
>> matching of device memory frags (unaccessible) with host memory frags
>> (accessible) in the same skb.
>>
>> Add a skb->devmem flag which indicates whether the frags in this skb
>> are device memory frags or not.
>>
>> __skb_fill_page_desc() now checks frags added to skbs for page_pool_iovs,
>> and marks the skb as skb->devmem accordingly.
>>
>> Add checks through the network stack to avoid accessing the frags of
>> devmem skbs and avoid coalescing devmem skbs with non devmem skbs.
>>
>> Signed-off-by: Willem de Bruijn <willemb@google.com>
>> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
>> Signed-off-by: Mina Almasry <almasrymina@google.com>
>>
>> ---
>>  include/linux/skbuff.h | 14 +++++++-
>>  include/net/tcp.h      |  5 +--
>>  net/core/datagram.c    |  6 ++++
>>  net/core/gro.c         |  5 ++-
>>  net/core/skbuff.c      | 77 ++++++++++++++++++++++++++++++++++++------
>>  net/ipv4/tcp.c         |  6 ++++
>>  net/ipv4/tcp_input.c   | 13 +++++--
>>  net/ipv4/tcp_output.c  |  5 ++-
>>  net/packet/af_packet.c |  4 +--
>>  9 files changed, 115 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
>> index 1fae276c1353..8fb468ff8115 100644
>> --- a/include/linux/skbuff.h
>> +++ b/include/linux/skbuff.h
>> @@ -805,6 +805,8 @@ typedef unsigned char *sk_buff_data_t;
>>   *	@csum_level: indicates the number of consecutive checksums found in
>>   *		the packet minus one that have been verified as
>>   *		CHECKSUM_UNNECESSARY (max 3)
>> + *	@devmem: indicates that all the fragments in this skb are backed by
>> + *		device memory.
>>   *	@dst_pending_confirm: need to confirm neighbour
>>   *	@decrypted: Decrypted SKB
>>   *	@slow_gro: state present at GRO time, slower prepare step required
>> @@ -991,7 +993,7 @@ struct sk_buff {
>>  #if IS_ENABLED(CONFIG_IP_SCTP)
>>  	__u8			csum_not_inet:1;
>>  #endif
>> -
>> +	__u8			devmem:1;
>>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
>>  	__u16			tc_index;	/* traffic control index */
>>  #endif
>> @@ -1766,6 +1768,12 @@ static inline void skb_zcopy_downgrade_managed(struct sk_buff *skb)
>>  		__skb_zcopy_downgrade_managed(skb);
>>  }
>>  
>> +/* Return true if frags in this skb are not readable by the host. */
>> +static inline bool skb_frags_not_readable(const struct sk_buff *skb)
>> +{
>> +	return skb->devmem;
> 
> bikeshedding: should we also rename 'devmem' sk_buff flag to 'not_readable'?
> It better communicates the fact that the stack shouldn't dereference the
> frags (because it has 'devmem' fragments or for some other potential
> future reason).

+1.

Also, the flag on the skb is an optimization - a high level signal that
one or more frags is in unreadable memory. There is no requirement that
all of the frags are in the same memory type.
