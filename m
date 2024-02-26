Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD1867F32
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 18:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D484710E5E1;
	Mon, 26 Feb 2024 17:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wKF5uAwa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA7610E002
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 17:48:29 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3392b12dd21so2820475f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 09:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708969707; x=1709574507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ojp2zJXBZwpD/60KKk/OWh1F7+E9xMLGoW5yyn8MP1Q=;
 b=wKF5uAwanf/6AgAxMSsTz5qg+b5YQdRZssT3mJiJLvRZrT6TuXCJ4V2pLJBGFF/0iF
 tdcALGPuDVOXh3Qwe8qyWReDYahzPEawa9gYN9f0OWgljmqODUMZ2ayw8wmpfogO8fVN
 k6BMnYGQq8msbz4k00DN74Px9M1rRILK0OQy4EmO1Q3YPG3xk2cb+oRfzaM28JzKTXNq
 2/B1a1HfTV85wFsbxyCUwLD3R5O+0bPvbmQJOyeyJ8kjF+kc89pri+IanAAd1cwjcV16
 3njAm5Ih5bkUcTnudbhfaPcuEvFCttN6zCIZXIb0YZyfY4g7YrJ1w2TsAh9Y23e5hnc0
 69SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969707; x=1709574507;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojp2zJXBZwpD/60KKk/OWh1F7+E9xMLGoW5yyn8MP1Q=;
 b=kFu4VJZtVeKTsd1T2CfxZ2ItdlaLfnU2wmgfgBD+5STmGVH+56cxR/9jGSBxIQGD64
 9rp8/uq33BnRCaKrtB4vh5rSP7YgtajCs1LR17sVuPFBvGL/xyAO2ZHvbx3INkxTKtLa
 41CGnfckTlgFRK7Z32Hc/gVZpUqnHTq0yCunhvwQRJLyY1iWQe9MR7clEdNgCZeEFe5O
 EIW3sPMvkkeXO/Lw4e6Bc22dAixfaH05xmU3QKoKjXPmulMxkfo/Iw540r9uoGTrm6SH
 rDKGWUf7T59UY3u8PJ5Mtu8sr2CXwoVboc1ak5u+hcwp/TZPWYL/LpCX7Yl1tzQ4qVlZ
 dSPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpeqGaNQ3f8EDRX7S6zFFf01mFbSboL0pTLMhimOXK9S5BHsFzUa5l1HhPyw9SsmooxEJzxtI7FLNaMVuRI82VzGTQdi+gBPcLsOik8ddD
X-Gm-Message-State: AOJu0Yy67TSpOrM7cUOP2HvJPBy4re9aKdGYDqLkmezgzhWcSk2gD22q
 5dPcOVUFNu0RrRkvt4OkgCD+kXZe0iIZxBVRINVNITqLGDZ30VVLL3MA3pn4QzE=
X-Google-Smtp-Source: AGHT+IFeR4xk7Fwu0u7VFlJ0xMPB7f8Wl3ldtiQ7PBzLuOaNIEmCyOPdZa82wTMgFMPSlFRnwQydCw==
X-Received: by 2002:a05:6000:4ed:b0:33d:6be8:bb61 with SMTP id
 cr13-20020a05600004ed00b0033d6be8bb61mr5836632wrb.35.1708969707330; 
 Mon, 26 Feb 2024 09:48:27 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfe703000000b0033d6fe3f6absm8903931wrm.62.2024.02.26.09.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 09:48:26 -0800 (PST)
Message-ID: <1c2fe59a-daf6-4486-84ca-5880222d24bd@baylibre.com>
Date: Mon, 26 Feb 2024 18:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: ti: am65-cpsw: Add minimal XDP support
Content-Language: en-US
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com>
 <20240226172533.GG13129@kernel.org>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240226172533.GG13129@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hello Simon,

Thank you for the review.

On 2/26/24 18:25, Simon Horman wrote:
> On Fri, Feb 23, 2024 at 12:01:37PM +0100, Julien Panis wrote:
>> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
>> Ethernet driver. The following features are implemented:
>> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
>> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
>> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ...
>
>> @@ -440,6 +476,27 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
>>   	dev_kfree_skb_any(skb);
>>   }
>>   
>> +static struct sk_buff *am65_cpsw_alloc_skb(struct net_device *ndev, unsigned int len)
>> +{
>> +	struct page *page;
>> +	struct sk_buff *skb;
> nit: please arrange local variables in reverse xmas tree order,
>       from longest line to shortest in new code.
>
>       This tool can be useful: https://github.com/ecree-solarflare/xmastree

You mean, for the new functions introduced in this patch only ?

>
>> +
>> +	page = dev_alloc_pages(0);
> nit: Maybe dev_alloc_page() is appropriate here?

Absolutely.

>
>> +	if (unlikely(!page))
>> +		return NULL;
>> +
>> +	len += AM65_CPSW_HEADROOM;
>> +
>> +	skb = build_skb(page_address(page), len);
>> +	if (unlikely(!skb))
> Does page need to be freed here?

Of course it does ! This will be fixed in the next version.

>
>> +		return NULL;
>> +
>> +	skb_reserve(skb, AM65_CPSW_HEADROOM + NET_IP_ALIGN);
>> +	skb->dev = ndev;
>> +
>> +	return skb;
>> +}
> ...

