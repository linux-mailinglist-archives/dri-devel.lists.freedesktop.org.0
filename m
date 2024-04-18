Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F68A9C28
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2AC10F09B;
	Thu, 18 Apr 2024 14:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jq8c3uWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28D910F09B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:03:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-518a56cdbcfso1452116e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449001; x=1714053801;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=29NSP3ckhchgCk/BenPgTMkiEk28YJODiPFZQnpe0GQ=;
 b=jq8c3uWSMvtWtc13VNfEPXXVsBPj+zkXUVUqaAqssw3rzicFbQGsBL037zEzbTqgrh
 DzqFmkz6ldZFP/xQ6U/sr32d86Xco+fIv9pLiatLyPUfwHx83OCiVnnSoh4a/SLn2rHt
 +TBd6GKYxia8Gu7boyAafjAYoIk0c6qWJyLvV/gUPLBk/jElBxSaL1WrfUHOu2A+ghwu
 YqSFSdty6JqeKS/XX9jE3NQKlsEACU8DO0HsnYAnzWTdh49KAz9p+tg8Thx9LTpAQ4kU
 dghEufVi8zb3De/o9ax7Lqt2kZnBABd1whuop2qQcrbhZUsYbwKn6VdaG06G6Hh7fEZp
 Wr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449001; x=1714053801;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=29NSP3ckhchgCk/BenPgTMkiEk28YJODiPFZQnpe0GQ=;
 b=QktNPOL+F0JqyJ5W6dUdFO77WoH6OD90q5ePK2Yb04jqWUvVJkVdZw2CeDbrwzBZQZ
 soijXOgqdgMP02MOdPMqSRyAPJkyshrYfmoUKXwVHtNJSm2z6FbxFzGiIOnqKD7nnLZy
 jelYCgHt/XpTjGNay/P8l1+4f0HVaBYeipw/Ls6fblyTDhmm0U289g3BG6hrk1N4xzl7
 ilgRpnLTowF2uxyEXcRv5pWGd4rKNYVo9biNYnnvMA5QioX4kk5BSL5BWQ6vLtWN3z5C
 BhVSkpewVAqEeRD3fyZ9o4fg3V8fOUnSaYNupaQ/6rhL4rFn7wC8B60ymjf99Rn95Jk2
 2Nig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhZyWR5bfFaMLV2lXlV8aNqF3C42mboFVdg5Wbp8iN6jZ3sqxmC3VJPIY0bEF0zR7awE04HgsPVkk1K291eNSkDK34DhtB0y/6FQ4lksXJ
X-Gm-Message-State: AOJu0YwZwAnBkDPCFkarsa9766uXBuM6hEr9N2hhSHt7cM2Iy81GhwMn
 3Yi+0KuvDmNKojEP8ayKMdf8dlCyDFVWKXS8jir0oguepwcQSfgFn4NgJrLuUis=
X-Google-Smtp-Source: AGHT+IEEaAqAaRn0OgbuNYh5fB4s3wbKRYCkPSN2nyv1oCLgvcIRJoVOQEt5V3SOR++8k+CwHg+lTQ==
X-Received: by 2002:ac2:5b5b:0:b0:518:d5c4:d9b7 with SMTP id
 i27-20020ac25b5b000000b00518d5c4d9b7mr1966338lfp.16.1713449000512; 
 Thu, 18 Apr 2024 07:03:20 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a17090633d900b00a51cdde5d9bsm931130eja.225.2024.04.18.07.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 07:03:19 -0700 (PDT)
Message-ID: <7f7fb71a-6d15-46f1-b63c-b569a2e230b7@baylibre.com>
Date: Thu, 18 Apr 2024 16:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>,
 Jacob Keller <jacob.e.keller@intel.com>, danishanwar@ti.com,
 yuehaibing@huawei.com, rogerq@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
 <260d258f-87a1-4aac-8883-aab4746b32d8@ti.com>
 <08319f88-36a9-445a-9920-ad1fba666b6a@baylibre.com>
 <1da48c7e-ba87-4f7a-b6d1-d35961005ab0@ti.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <1da48c7e-ba87-4f7a-b6d1-d35961005ab0@ti.com>
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

On 4/18/24 13:25, Siddharth Vadapalli wrote:
> On Thu, Apr 18, 2024 at 01:17:47PM +0200, Julien Panis wrote:
>> On 4/18/24 13:00, Siddharth Vadapalli wrote:
>>> On 12-04-2024 21:08, Julien Panis wrote:
>>>> This patch adds XDP support to TI AM65 CPSW Ethernet driver.
>>>>
>>>> The following features are implemented: NETDEV_XDP_ACT_BASIC,
>>>> NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
>>>>
>>>> Zero-copy and non-linear XDP buffer supports are NOT implemented.
>>>>
>>>> Besides, the page pool memory model is used to get better performance.
>>>>
>>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>>> Hello Julien,
>>>
>>> This series crashes Linux on AM62ax SoC which also uses the
>>> AM65-CPSW-NUSS driver:
>>> https://gist.github.com/Siddharth-Vadapalli-at-TI/5ed0e436606001c247a7da664f75edee
>>>
>>> Regards,
>>> Siddharth.
>> Hello Siddharth.
>>
>> Thanks for the log. I can read:
>> [    1.966094] Missing net_device from driver
>>
>> Did you check that nodes exist in the device tree for the net devices ?
> Yes it exists. The device-tree used was also built with linux-next
> tagged next-20240417. The node corresponding to eth0 is cpsw_port1 which
> is present and enabled in the device-tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=next-20240417#n644
>
> Regards,
> Siddharth.

I could reproduce the bug by disabling 'cpsw_port2' in my device tree,
which is 'k3-am625-sk.dts' for the board I use.

A condition is missing in am65_cpsw_create_xdp_rxqs() and
am65_cpsw_destroy_xdp_rxqs() functions.

For these 2 functions, the code which is in the for loop should be
run only when port ethX is enabled. That's why it crashes with
your device tree (cpsw_port2 is disabled, which is not the case by
default for the board I developed with).

I'll send a patch to fix the issue. Thanks for reporting it.

Julien
