Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B768706C4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69941122F1;
	Mon,  4 Mar 2024 16:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="svvV7asc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635601122F1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:16:54 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5132010e5d1so4852297e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 08:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709569012; x=1710173812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CdaQvHwf+ypTWs9CggIGE65EMaPW1/VFzdPOqyKDsys=;
 b=svvV7ascrFOGtnRd07Piq4/A3OY6QDBNU0pDCNxqPR+vOm58xlUhL2sDB35FfL63b3
 4+wBCFWmM4BiA0KnuDXEmVaeOQy2EARKLanreCEzEhhJYubbgAwi/wftd3nDZOoVwf9y
 u/IT8Yk8f9dNiefmDdjiqtpTUFPVyYB+DLEeSDLqLKPIzLRErqLjFv5dHwSksvkIK8vv
 gZy6kzoMtAHm3Pq0GOokjEtk4B42RFTQH8eCIbjVEILS5MFIXEn/SlXCd2gBLxnZ0Io6
 aWy9VkpWB01nuilTH1Oar7RvH5JOKAeeDe73oyujljzYm1yqud+m2rxWD/XT5nx++qcS
 C4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709569012; x=1710173812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CdaQvHwf+ypTWs9CggIGE65EMaPW1/VFzdPOqyKDsys=;
 b=BMO8ZEmh6NKAOu6d+AOU04s/tavYa2n2UYDItNC+Y4toxKTfttDY87bHJC+wbffe1G
 btg7St0I/CY/KhAT5hPDgzNVVVfGTiHqry+kwEBYCPIdeDrkHbXqgSsD5KZvup2eWv9l
 Ybh9hodcMfjYk6lVYR4t2m/IkGMqXnrexFGWdmRGcETlJaFh9sBKk8CqrMiTdVfKLZB0
 dmcPUZH3Ba6kZ2CoZ1tEkQS2QDqufvGjvXV/OJE3UyXkiypVnLxoYDsnMFuyNOZGv7jY
 xzuSvT+9nYJ5Tv22h9tove3Ib9YOGBxvfRyZnZQEdIoJU+qVNGgf8TB0ExqHhQr46tND
 m01Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYTkgKtdyM00Lvzk5rkQ0F7khOYV2Syl1m0vFiryR8R6c3ARxH8ZB/77NAA/2GkYQc0eCgBuj189ZnofJzGeh0bHOF0o74QFJbCaJfiHBl
X-Gm-Message-State: AOJu0YwucjTGN/e4zO0auo+XoTy/HOeuwue/+LfXAN4tTzwLolBFFNnn
 ysYYHZz1Pe7KDqfWZuPnqEZk0x/Gzcy0n1ls5Gc23BWzQOjqkVdnniD0dVOQ25c=
X-Google-Smtp-Source: AGHT+IHyM3uVBBXYWUwq/rKQH24A4FuocxVtTgvm3M0iSLCuJw6g5bXx5w3HG6HcSOEzQFYA4xHIZQ==
X-Received: by 2002:a05:6512:251:b0:512:d877:df6f with SMTP id
 b17-20020a056512025100b00512d877df6fmr5958110lfo.2.1709569011686; 
 Mon, 04 Mar 2024 08:16:51 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a170906265b00b00a441c8c56d0sm5000056ejc.218.2024.03.04.08.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 08:16:51 -0800 (PST)
Message-ID: <52952362-dea8-40ec-a0f3-2bdbe26cb83f@baylibre.com>
Date: Mon, 4 Mar 2024 17:16:48 +0100
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

OK, I will add benchmark numbers in the next version.

I will also fix a potential issue with TX buffer type, which is not properly
handled in this v2. It should be set for each buffer, I think (instead of just
being set for the tx channel before initiating xmit).

Julien

