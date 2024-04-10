Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F389F92C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C002E112053;
	Wed, 10 Apr 2024 14:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TvDTw0Iz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1615A1133BF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 14:02:05 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d895138d0eso28892861fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712757724; x=1713362524;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U2BLuV2TaoJubB+i1BbXKPJs9YF+spnADheAPSMmIQo=;
 b=TvDTw0IzqR5BdC3lA4O/2n0IM2H7E7AoGrv4KccpIsUagVPVyVkiRHuLScfbgwtY99
 0cEJ4y0sN7N2k7srsyzYhtz2iOKpgbiTeTDpKspbniRe1/U7sIaevlAexhttUB54lgvT
 TyLrM+eQI9BEdV3cy/xcvMOx5+o9JOS6OTp7eP7/i4dCIHjhzBQQZEN7kheiC61orqkl
 Pi9mu5JGuPpnKjHLPcUfLhKPAIBaSa4LkVG1z+9VC22YoAdhtWRdF41/a6JzkxLj+M7S
 wYVhlgQcNJfTPTAFzZpgEYxvTbhZOze9JuBZBuTY2H0oTp5gIZ0JGrWGhRSXXJn/QXWU
 R1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712757724; x=1713362524;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U2BLuV2TaoJubB+i1BbXKPJs9YF+spnADheAPSMmIQo=;
 b=BR7rt1cY/2neIUrPTZkq2o2aFxjWitf0oyfo9NuVLGgBeVztpxIjLET7DALse40utS
 z+t8qOrRi/fFrwX9baZ+LjBqMZAlF299gXdeh97864NgIpGNhkPrIzN4WxQSh74PUbM3
 XyjHmFnUD+VRb4U9MyG09Xn93ZawNEJ5f94uDxK7PvsESGSz77u8Q7f35hSxs6awa2+X
 0IkusBwfL1BSGi4ozkMdzjSgDOIrgXr2EpbGU/b/9VbBJ5LhRCWG8LdPaUP9lMoagegA
 XdbJV9v3FpVg4q6bv3s3HatvgEDaiz212jVLneLntlgOAgH7iK9ZECGOTf5iAu9dFPhP
 284Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV3KtEB7cIh3Xn7OBbI5yXfXLpQHYaQmZFbNuB018JEocc/7gRcLZotybTO+c2f7YtZcBUeTK2OVAr3B/qHbuLXwwhYXrFt3NlnDRo7qW8
X-Gm-Message-State: AOJu0Yx5/Moo379C0jed8cXWk20h6qCkx34FR8Iykw9c4362MZD+3Gux
 SVnR0Fq+QaSE0Qa9XBfUotLaJiPMbUgALraFF4SPb3zsh935p+EPovBKlrRwSRA=
X-Google-Smtp-Source: AGHT+IHDued1BgxOQepma0f2LhqTqT7GeyNGendravbhe/f3zWxtfonddLPg0YjH5l/Vd7JY0K220Q==
X-Received: by 2002:a05:651c:19a9:b0:2d8:3fc1:3b20 with SMTP id
 bx41-20020a05651c19a900b002d83fc13b20mr2155380ljb.31.1712757723799; 
 Wed, 10 Apr 2024 07:02:03 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b00416a6340025sm2350977wmo.6.2024.04.10.07.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 07:02:03 -0700 (PDT)
Message-ID: <9cb903df-3e83-409a-aa4b-218742804cc6@baylibre.com>
Date: Wed, 10 Apr 2024 16:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 3/3] net: ethernet: ti: am65-cpsw: Add minimal
 XDP support
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>, danishanwar@ti.com,
 yuehaibing@huawei.com, rogerq@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v8-3-f3421b58da09@baylibre.com>
 <20240409174928.58a7c3f0@kernel.org>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240409174928.58a7c3f0@kernel.org>
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

On 4/10/24 02:49, Jakub Kicinski wrote:
> On Mon, 08 Apr 2024 11:38:04 +0200 Julien Panis wrote:
>> +static struct sk_buff *am65_cpsw_alloc_skb(struct am65_cpsw_rx_chn *rx_chn,
>> +					   struct net_device *ndev,
>> +					   unsigned int len,
>> +					   int desc_idx,
>> +					   bool allow_direct)
>> +{
>> +	struct sk_buff *skb;
>> +	struct page *page;
>> +
>> +	page = page_pool_dev_alloc_pages(rx_chn->page_pool);
>> +	if (unlikely(!page))
>> +		return NULL;
>> +
>> +	len += AM65_CPSW_HEADROOM;
>> +
>> +	skb = build_skb(page_address(page), len);
> You shouldn't build the skb upfront any more. Give the page to the HW,
> once HW sends you a completion - build the skbs. If build fails
> (allocation failure) just give the page back to HW. If it succeeds,
> however, you'll get a skb which is far more likely to be cache hot.

Not sure I get this point.

"Give the page to the HW" = Do you mean that I should dma_map_single()
a full page (|PAGE_SIZE|) in am65_cpsw_nuss_rx_push() ?


>
>> +	if (unlikely(!skb)) {
>> +		page_pool_put_full_page(rx_chn->page_pool, page, allow_direct);
>> +		rx_chn->pages[desc_idx] = NULL;
>> +		return NULL;
>> +	}

