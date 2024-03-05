Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211128722DD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 16:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753EC10E476;
	Tue,  5 Mar 2024 15:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iQXfAzJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9300510E476
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 15:33:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-412e80e13abso13674205e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709652784; x=1710257584;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8r7IHy7kVKfRTqD23CgO2t0WRZctdWLP4DagcY/UzEU=;
 b=iQXfAzJSmAFESAOCxlDm+P/ioFn/EnVooIG1zG1H2IrGfm/Ciwt8OvnDZOunrldQEg
 1LySGW4mbO20PbKa41f3+A/z/zoZKXKi6w7y70W3Rw2ouN/5W6CfMxE2MyJNM+nUR60I
 HFEfadSLoTjeZoyyi2G6VRF1JjfwlEbuVatR9GHKo89f9jwkAokFHUNwECvjaz1o7aqf
 1s9G7MJkP6YEGLeQqXbioVijdc47HarhdwYjL0HkBQAvYe+c/Vd/as0NOa691fMGziT1
 0vDzbc+2Cc6Hxq6PJZogbq4eas9bw/I745NiTP6u0AYk3naFiAFeoaBEDCTgZg4zFDPh
 TWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709652784; x=1710257584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8r7IHy7kVKfRTqD23CgO2t0WRZctdWLP4DagcY/UzEU=;
 b=euJeXi004Uxvi9k8RWNGPrVlNWCbCLpn+nGQ5Udg0uT7vx6o0xsILs4qEcDvtckmXf
 7pQFpFAKSYQpfF2louJNgIlK/ao/XX6peXDX1qIL0b2FWjePpEv88zKhLbOvF3KfJ5CS
 KICr1DvGiOX0IUkjoGZ4d9AO0TH/rYq7lLEby7s+9X/FvraixuMvOaHy5DYGlUJhoJL+
 7sN+p4VnZwPKDLZMhf+XSJzcs5no6sXbiFL0NabW9Z+/NPc0XdrliXp2+jph1DBYfsFA
 8WXBSkaEZlNEssMnue9FtFtnzD4MnY7p+4vUyN+imzyYCMnoJOBQU8waFyo3Ltc4tTrm
 Xmfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCzIoXuAdHaYMWvBPq9FGydc7WK1iuWR4p3VUVRDi4TVwByGmrG5bUYpK+IUijjf8RxmKP6eJu5jElhtnka+i/OnDmGZXGn8xkr2KyA+5B
X-Gm-Message-State: AOJu0YzlKFpztA/mbnZFbrfbg2wKKyiJteTkfNZXxtt2+LlzfN5Dx28b
 NcB5BZtfdZLhf34W3hPUp9pUCXBGxRh5jJSShOSjlmpwIp9ECrbK4ojD4dTLwn8=
X-Google-Smtp-Source: AGHT+IEVNqjI7TrOIyxyC0zXS0GjDY1acqoeUroBUXxj1W59e4andupDbOlOfQsujmcheNGf/bEuNg==
X-Received: by 2002:adf:b209:0:b0:33e:4797:5fa7 with SMTP id
 u9-20020adfb209000000b0033e47975fa7mr1964612wra.42.1709652784359; 
 Tue, 05 Mar 2024 07:33:04 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
 by smtp.gmail.com with ESMTPSA id
 y10-20020adff14a000000b0033e1be7f3d8sm12894093wro.70.2024.03.05.07.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 07:33:03 -0800 (PST)
Message-ID: <f0a9524a-08cd-4ec2-89f8-4dff9dd3e09e@baylibre.com>
Date: Tue, 5 Mar 2024 16:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] net: ethernet: ti: am65-cpsw: Add minimal XDP
 support
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v2-2-01c6caacabb6@baylibre.com>
 <356f4dd4-eb0e-49fa-a9eb-4dffbe5c7e7c@lunn.ch>
 <3a5f3950-e47f-409a-b881-0c8545778b91@baylibre.com>
 <be16d069-062e-489d-b8e9-19ef3ef90029@lunn.ch>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <be16d069-062e-489d-b8e9-19ef3ef90029@lunn.ch>
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

On 3/5/24 14:28, Andrew Lunn wrote:
> On Tue, Mar 05, 2024 at 11:46:00AM +0100, Julien Panis wrote:
>> On 3/1/24 17:38, Andrew Lunn wrote:
>>> On Fri, Mar 01, 2024 at 04:02:53PM +0100, Julien Panis wrote:
>>>> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
>>>> Ethernet driver. The following features are implemented:
>>>> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
>>>> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
>>>> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
>>>>
>>>> The page pool memory model is used to get better performance.
>>> Do you have any benchmark numbers? It should help with none XDP
>>> traffic as well. So maybe iperf numbers before and after?
>>>
>>> 	Andrew
>> Argh...Houston, we have a problem. I checked my v3, which is ready for
>> submission, with iperf3:
>> 1) Before = without page pool -> 500 MBits/sec
>> 2) After = with page pool -> 442 MBits/sec
>> -> ~ 10% worse with page pool here.
>>
>> Unless the difference is not due to page pool. Maybe there's something else
>> which is not good in my patch. I'm going to send the v3 which uses page pool,
>> hopefully someone will find out something suspicious. Meanwhile, I'll carry on
>> investigating: I'll check the results with my patch, by removing only the using of
>> page pool.
> You can also go the other way. First add page pool support. For the
> FEC, that improved its performance. Then add XDP, which i think
> decreased the performance a little. It is extra processing in the hot
> path, so a little loss is not unsurprising.
>
> What tends to be expensive with ARM is cache invalidation and
> flush. So make sure you have the lengths correct. You don't want to
> operate on more memory than necessary. No point flushing the full MTU
> for a 64 byte TCP ACK, etc.
>
>        Andrew

I changed back code step by step and could find what makes a significant
difference. Here are the main tests achieved (results in Mbits/sec):

1) Page pool without XDP code -> res = 442
Conclusion: No difference with or without XDP code.

2) From 1), page pool removed and replaced by previous memory model
based on dev_alloc_page() function -> res =418
Conclusion: Your advice was good, that's better with page pool. :)

3) From 2), am65_cpsw_alloc_skb() function removed and replaced by
netdev_alloc_skb_ip_align(), as used by the driver before -> res = 506
Conclusion: Here is where the loss comes from.
IOW, My am65_cpsw_alloc_skb() function is not good.

Initially, I mainly created this 'custom' am65_cpsw_alloc_skb() function
because I thought that none of XDP memory models could be used along
with netdev_alloc_skb_ip_align() function. Was I wrong ?
By creating this custom am65_cpsw_alloc_skb(), I also wanted to handle
the way headroom is reserved differently.

Julien

