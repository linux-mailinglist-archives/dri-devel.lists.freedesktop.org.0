Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA11C8A9865
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DCB10FBFD;
	Thu, 18 Apr 2024 11:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tuZLsytu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A143710F947
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:17:55 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso641227a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713439073; x=1714043873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dadbVw0ZN8KGcZgqWT52RSFUotZfDdsINMbi0GWd0pk=;
 b=tuZLsytumaj+cuGbawISj5ha+xkOuIzaEsHDnfnPNxdC6e+D+k1DM9I4q5eZ7Kw9er
 O/D2NOOn9X1HGkHtrGm86kM6/dTUDnVR9fXyTIyos3jWSF4JCGT30seW/gTkZmiEBGUV
 cOEMMIDqwG2S3lCzPCi7ToEceOnozME5Nx3M8mB8PCaCZGgKQnJr8yB0KdA9PGNY58vW
 QVw1KYXtnhjRDeg6vfwRNeYoxLYu93OXHyQGelBLg1fXSoifkl3Db+nkXz0D4KlyosKA
 X9/vywLIx7eqqH8nEY17hc20jSjNHczFuxZYNv3zmjwvypw0sGZKARu0dev9c37fuTqI
 k0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713439073; x=1714043873;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dadbVw0ZN8KGcZgqWT52RSFUotZfDdsINMbi0GWd0pk=;
 b=pU7q1mQ+R5g7m0NFphs5ncsrYA145mhdCzIGpugG4wl+yORivdIKLxMblWPyigPX08
 wNQ40EqC1EuHS8d/OjBsc7ld4AiMYFWPckWHwblcI7JPXGgV5AHC2XSoVytUDTQofktH
 B2K2r9eS6aR+ecb/SsVxq72KkrFlaeKyL2BxLsdEnZOytteYd4tQdccD94GekbF1RI6E
 v8ZNiIF9onhsomtvJGx6PLB4O2XFy9jzntlD5oe5uOIWPQOxMxbNDeFqcOITES68cxX+
 afw05Rv8Rk6vY7vzHzlMEb6lY9qbRUXEf931EBZo5jI0LVoAcz4sfur0cG63fTkzNXEM
 OXzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBw7ZVCMJKmw+YATngTaIZ6fmH844AK7LgoIrGKHj5qb16U9GeaV1rMPBAt4/DH2MaxDcElxrplT0MqIuB1M1EiGopIe7lMGbalPoB5xhm
X-Gm-Message-State: AOJu0YwSmvJMLPPPnxdzzFFcuQBAQ9LuHY89ENw6k2ZSm0Qf8/wcid1p
 ofTYDMEKNQDZTZ6BRVeOr7zAQyAnXprgYmF5xCnd7DjPZFMozwsar8/s8r6nORo=
X-Google-Smtp-Source: AGHT+IHmqSTkMUPGya8bnbl4tVCYR5pgohc+bRojwZq6H6mlk6lXfXDEJpU5L7fvxPN2Mb70UrGa9g==
X-Received: by 2002:a17:906:1156:b0:a55:54ec:a2fe with SMTP id
 i22-20020a170906115600b00a5554eca2femr1963102eja.29.1713439073194; 
 Thu, 18 Apr 2024 04:17:53 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a170906431500b00a521e5856f6sm747685ejm.51.2024.04.18.04.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 04:17:52 -0700 (PDT)
Message-ID: <08319f88-36a9-445a-9920-ad1fba666b6a@baylibre.com>
Date: Thu, 18 Apr 2024 13:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
To: Siddharth Vadapalli <s-vadapalli@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>,
 Jacob Keller <jacob.e.keller@intel.com>
Cc: danishanwar@ti.com, yuehaibing@huawei.com, rogerq@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
 <260d258f-87a1-4aac-8883-aab4746b32d8@ti.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <260d258f-87a1-4aac-8883-aab4746b32d8@ti.com>
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

On 4/18/24 13:00, Siddharth Vadapalli wrote:
> On 12-04-2024 21:08, Julien Panis wrote:
>> This patch adds XDP support to TI AM65 CPSW Ethernet driver.
>>
>> The following features are implemented: NETDEV_XDP_ACT_BASIC,
>> NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
>>
>> Zero-copy and non-linear XDP buffer supports are NOT implemented.
>>
>> Besides, the page pool memory model is used to get better performance.
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> Hello Julien,
>
> This series crashes Linux on AM62ax SoC which also uses the
> AM65-CPSW-NUSS driver:
> https://gist.github.com/Siddharth-Vadapalli-at-TI/5ed0e436606001c247a7da664f75edee
>
> Regards,
> Siddharth.

Hello Siddharth.

Thanks for the log. I can read:
[    1.966094] Missing net_device from driver

Did you check that nodes exist in the device tree for the net devices ?

Julien

