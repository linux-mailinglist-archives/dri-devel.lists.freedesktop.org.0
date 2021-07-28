Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF63D8857
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 08:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160B36E133;
	Wed, 28 Jul 2021 06:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1292 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jul 2021 06:56:43 UTC
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
 [192.185.45.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245906E428
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:56:43 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id 65CDB400DA486
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 01:35:10 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 8d9qmT1pYrJtZ8d9qmDk9l; Wed, 28 Jul 2021 01:35:10 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yd5qvDofzDaNNwpGdbNUuqb18y/xFATzxRujwJoGZRA=; b=J4h6G/X4eMPiS5plAUkSA/Q49M
 5sq+dCc2pmKO2STKNpc0FdVq64215CCBw+l/N782ccpFVyhUZOeVY38y02Orn1PT7UEA/RM2VnnTn
 JOn6O8FeW6M7x4e7aG0Jmm6SUOs9ZQupTaNHnFE19WtTW1Sg96Es9aWB9eHreB7w1zcqev+lQECi8
 dMlzL3ujizfpr2MQYqLp81YiC8gwOZbTDYyX6bUcCnZvyXLY1+zZ6mu4qvdtGC+6hw3hahpuZ/U0W
 uzLvkc0jFOHE93UXdFJADtpBy4YD4MZmZE4+cpv8b0XNIs5c1r7BxhHEBzIz4ApbdZog2VRHGqQxG
 OgK0bfLQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:44914
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1m8d9p-003qHh-4N; Wed, 28 Jul 2021 01:35:09 -0500
Subject: Re: [PATCH 19/64] ip: Use struct_group() for memcpy() regions
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-20-keescook@chromium.org> <YQDxaYrHu0PeBIuX@kroah.com>
 <baead202-569f-775f-348c-aa64e69f03ed@embeddedor.com>
 <YQD2/CA7zJU7MW6M@kroah.com>
 <e3193698-86d5-d529-e095-e09b4d52927b@embeddedor.com>
Message-ID: <b46e1ac6-ee40-1d23-dbba-b985d9764971@embeddedor.com>
Date: Wed, 28 Jul 2021 01:37:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e3193698-86d5-d529-e095-e09b4d52927b@embeddedor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1m8d9p-003qHh-4N
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:44914
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 38
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 netdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/28/21 01:31, Gustavo A. R. Silva wrote:
> 
> 
> On 7/28/21 01:19, Greg Kroah-Hartman wrote:
>> On Wed, Jul 28, 2021 at 01:14:33AM -0500, Gustavo A. R. Silva wrote:
>>>
>>>
>>> On 7/28/21 00:55, Greg Kroah-Hartman wrote:
>>>> On Tue, Jul 27, 2021 at 01:58:10PM -0700, Kees Cook wrote:
>>>>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>>>>> field bounds checking for memcpy(), memmove(), and memset(), avoid
>>>>> intentionally writing across neighboring fields.
>>>>>
>>>>> Use struct_group() in struct flowi4, struct ipv4hdr, and struct ipv6hdr
>>>>> around members saddr and daddr, so they can be referenced together. This
>>>>> will allow memcpy() and sizeof() to more easily reason about sizes,
>>>>> improve readability, and avoid future warnings about writing beyond the
>>>>> end of saddr.
>>>>>
>>>>> "pahole" shows no size nor member offset changes to struct flowi4.
>>>>> "objdump -d" shows no meaningful object code changes (i.e. only source
>>>>> line number induced differences.)
>>>>>
>>>>> Note that since this is a UAPI header, struct_group() has been open
>>>>> coded.
>>>>>
>>>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>>>> ---
>>>>>  include/net/flow.h            |  6 ++++--
>>>>>  include/uapi/linux/if_ether.h | 12 ++++++++++--
>>>>>  include/uapi/linux/ip.h       | 12 ++++++++++--
>>>>>  include/uapi/linux/ipv6.h     | 12 ++++++++++--
>>>>>  net/core/flow_dissector.c     | 10 ++++++----
>>>>>  net/ipv4/ip_output.c          |  6 ++----
>>>>>  6 files changed, 42 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/include/net/flow.h b/include/net/flow.h
>>>>> index 6f5e70240071..f1a3b6c8eae2 100644
>>>>> --- a/include/net/flow.h
>>>>> +++ b/include/net/flow.h
>>>>> @@ -81,8 +81,10 @@ struct flowi4 {
>>>>>  #define flowi4_multipath_hash	__fl_common.flowic_multipath_hash
>>>>>  
>>>>>  	/* (saddr,daddr) must be grouped, same order as in IP header */
>>>>> -	__be32			saddr;
>>>>> -	__be32			daddr;
>>>>> +	struct_group(addrs,
>>>>> +		__be32			saddr;
>>>>> +		__be32			daddr;
>>>>> +	);
>>>>>  
>>>>>  	union flowi_uli		uli;
>>>>>  #define fl4_sport		uli.ports.sport
>>>>> diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
>>>>> index a0b637911d3c..8f5667b2ea92 100644
>>>>> --- a/include/uapi/linux/if_ether.h
>>>>> +++ b/include/uapi/linux/if_ether.h
>>>>> @@ -163,8 +163,16 @@
>>>>>  
>>>>>  #if __UAPI_DEF_ETHHDR
>>>>>  struct ethhdr {
>>>>> -	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
>>>>> -	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
>>>>> +	union {
>>>>> +		struct {
>>>>> +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
>>>>> +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
>>>>> +		};
>>>>> +		struct {
>>>>> +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
>>>>> +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
>>>>> +		} addrs;
>>>>
>>>> A union of the same fields in the same structure in the same way?
>>>>
>>>> Ah, because struct_group() can not be used here?  Still feels odd to see
>>>> in a userspace-visible header.
>>>>
>>>>> +	};
>>>>>  	__be16		h_proto;		/* packet type ID field	*/
>>>>>  } __attribute__((packed));
>>>>>  #endif
>>>>> diff --git a/include/uapi/linux/ip.h b/include/uapi/linux/ip.h
>>>>> index e42d13b55cf3..33647a37e56b 100644
>>>>> --- a/include/uapi/linux/ip.h
>>>>> +++ b/include/uapi/linux/ip.h
>>>>> @@ -100,8 +100,16 @@ struct iphdr {
>>>>>  	__u8	ttl;
>>>>>  	__u8	protocol;
>>>>>  	__sum16	check;
>>>>> -	__be32	saddr;
>>>>> -	__be32	daddr;
>>>>> +	union {
>>>>> +		struct {
>>>>> +			__be32	saddr;
>>>>> +			__be32	daddr;
>>>>> +		} addrs;
>>>>> +		struct {
>>>>> +			__be32	saddr;
>>>>> +			__be32	daddr;
>>>>> +		};
>>>>
>>>> Same here (except you named the first struct addrs, not the second,
>>>> unlike above).
>>>>
>>>>
>>>>> +	};
>>>>>  	/*The options start here. */
>>>>>  };
>>>>>  
>>>>> diff --git a/include/uapi/linux/ipv6.h b/include/uapi/linux/ipv6.h
>>>>> index b243a53fa985..1c26d32e733b 100644
>>>>> --- a/include/uapi/linux/ipv6.h
>>>>> +++ b/include/uapi/linux/ipv6.h
>>>>> @@ -130,8 +130,16 @@ struct ipv6hdr {
>>>>>  	__u8			nexthdr;
>>>>>  	__u8			hop_limit;
>>>>>  
>>>>> -	struct	in6_addr	saddr;
>>>>> -	struct	in6_addr	daddr;
>>>>> +	union {
>>>>> +		struct {
>>>>> +			struct	in6_addr	saddr;
>>>>> +			struct	in6_addr	daddr;
>>>>> +		} addrs;
>>>>> +		struct {
>>>>> +			struct	in6_addr	saddr;
>>>>> +			struct	in6_addr	daddr;
>>>>> +		};
>>>>
>>>> addrs first?  Consistancy is key :)
>>>
>>> I think addrs should be second. In general, I think all newly added
>>> non-anonymous structures should be second.
>>
>> Why not use a local version of the macro like was done in the DRM header
>> file, to make it always work the same and more obvious what is

Yep; I agree. That one looks just fine. :)

--
Gustavo
