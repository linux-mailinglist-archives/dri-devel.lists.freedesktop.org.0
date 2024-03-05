Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290C6871BEE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F1610E0B0;
	Tue,  5 Mar 2024 10:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Yp6hRZCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CF710E0B0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:46:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-412eced6d1aso3226595e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 02:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709635563; x=1710240363;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JVA1JqDTMPvckuRaTHq5sqq6pnFxGrbQ8TF6seYnelo=;
 b=Yp6hRZCsFC33wO5Y8u0MgOs/oSSok1vx7NvYFtU+c79JT+GOrvGDUL11vez5M4Kf3G
 y+VCnvywzsHZx/ig7rFHm5WORnbHV1RHBLhjhS5UklTKKJr2SasbelaiP1neuXoTYih8
 AJ7HUSxDEvMWHP8qe6lHNLszluzWCOqIQ/wgGlAz5Ub8JSUgsgn/yjT05TGj8qtl+fne
 AtPNd5CC5hdfLpOIq2s4ifSDLB+8oiRWPDWaxz7NJKcwo3+FdB1D57f6vqZHm0Dlgg+p
 91R+d/97dRsHtWLoQmTQam1gpI/20XVUwR1+HRlSsw2/xkAkoGE5kYVKMs0V+n+bebKK
 GsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709635563; x=1710240363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVA1JqDTMPvckuRaTHq5sqq6pnFxGrbQ8TF6seYnelo=;
 b=GHkmkmSOu4+P8Xoxye7dGaOgaQn0M/YD19N02wCwYm4pkmKsPcW7KEayOjAJt6IAzM
 ax+jCwSH49MUVDF2AClyxbPdmVVTR0p67cjK8ev3mODPsBdyvJ0KUjajqW/Z8grQLxYz
 pxoW1e4ABpvhNJmvJjhUCPZ80w59iwFEpIocmDBroS4jYJ6TQEaMBaIAi/vFM0Le5AIp
 cIutk2U439G0QylU+ATdvpJYBOKxmcdvGa2N5Y8ep0ieRbpkYNaRXFYNStIO1DmgMqyu
 9k3wySKkBx88X/p7r1BJRtLMzG5iiIyteans7zmA+7nqZUIcqa3VWZqEhZIDUhb8k4K5
 Z/rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4WUHb0ZwjwTP22S0+WHLW8CeDCtJ6L+Ww5124zFtsF3zMISZMWNtLI9XoaZ6YAQ5J56Br1nX4FjnY4EmXlnnqJU8L4WAvy+Gyi7+aoNHj
X-Gm-Message-State: AOJu0Yw2dHmgZqN/sjblWOTWsXVrf43TmQlqwyJMDmiP1rmPufrD8nJu
 VoYs5YQKGYyOFxJ2sIZ9fIeoNEzuKmpnIsyDJFcG29srkDuSqXmZkc8i7FuygyE=
X-Google-Smtp-Source: AGHT+IE/L4A6bnauZ4LpcW6naeeYuRNA8WEWJrlnt645s9ZaWVjgn/tE11DGJ0F5XhXa7k+kx2lEzw==
X-Received: by 2002:a05:6000:1249:b0:33d:2226:a28b with SMTP id
 j9-20020a056000124900b0033d2226a28bmr7827513wrx.37.1709635563236; 
 Tue, 05 Mar 2024 02:46:03 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d644f000000b0033e052be14fsm14577187wrw.98.2024.03.05.02.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 02:46:02 -0800 (PST)
Message-ID: <3a5f3950-e47f-409a-b881-0c8545778b91@baylibre.com>
Date: Tue, 5 Mar 2024 11:46:00 +0100
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
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <356f4dd4-eb0e-49fa-a9eb-4dffbe5c7e7c@lunn.ch>
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

On 3/1/24 17:38, Andrew Lunn wrote:
> On Fri, Mar 01, 2024 at 04:02:53PM +0100, Julien Panis wrote:
>> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
>> Ethernet driver. The following features are implemented:
>> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
>> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
>> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
>>
>> The page pool memory model is used to get better performance.
> Do you have any benchmark numbers? It should help with none XDP
> traffic as well. So maybe iperf numbers before and after?
>
> 	Andrew

Argh...Houston, we have a problem. I checked my v3, which is ready for
submission, with iperf3:
1) Before = without page pool -> 500 MBits/sec
2) After = with page pool -> 442 MBits/sec
-> ~ 10% worse with page pool here.

Unless the difference is not due to page pool. Maybe there's something else
which is not good in my patch. I'm going to send the v3 which uses page pool,
hopefully someone will find out something suspicious. Meanwhile, I'll carry on
investigating: I'll check the results with my patch, by removing only the using of
page pool.

Julien



