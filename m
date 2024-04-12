Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344F78A300B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 16:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F3610F661;
	Fri, 12 Apr 2024 14:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ypwlYyyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F01C10F65E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 14:01:35 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-518931f8d23so376095e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712930494; x=1713535294;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wM/qLHmObCPp0A36qPqz30NvxHM7nS4FGirrfQUSiU8=;
 b=ypwlYyyEA9KaSKOBuVKgvl8JOrlV4JdmZyhGiXa7SZYjS4z5C+Yakc4cIK9wM1UIoH
 5Ne1i3WSUuAJxoPlApHyUYBSx+qgBRyd8qAMwtSULSed3amFYCaEWZabcfCoJflLgHcs
 oNYdXkGcJBLuZp2vKYFcVLwTGsTye1eQ7U5ahcvv94ewlszvzZRkmICvDXo2ZJGQdonp
 YGMqNe74aToEV7eAZaPXGQQpdOS/MaL8m97y4LjKs7uO/PhVPlDUB7KdM/7Bg0QKblRp
 knzyyGzMy2Hp6pp3wmdzaoskcf1z+74qo5H+XqhAIdUNqhx278OGVaErGbIDhB4vAaMX
 g//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712930494; x=1713535294;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wM/qLHmObCPp0A36qPqz30NvxHM7nS4FGirrfQUSiU8=;
 b=i8rThDT3/mfETWceXexQcHBKJBNg+SNFQk+WxL5WAfjpOIQjUl6ew7jKK8g7K9HZaH
 q8oP7s/mUM4dvOfXulKYSB7sC/oSLl1RBHAmLkB6woWMcxd6d7QQI7swZe/Vsqaxl8AO
 EVh9y/WZ17PTgCuJmgbwd0MTJKEVjwb+NQZ0DXZ3WPkKIpUXmlIr6ikCMth84FLGxEhs
 tq5ySJ1xo67Kuc3ApdEKLiuZ0sl0h0CfHSZcXC9pH1nB/b/dlSYq6sXSY/4gz8MY5QHG
 AjVOiVlyI4ixXeBLt+ABV7Es54w3iXIcWRA5hA6WuIwwww83pqZ3rT+UTZb3n3fzmzG1
 T5iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNRP0UEjrIZ7YhX+yVyBD3H6CH3/2yjiEb1dZcu3PRq4NJFglko2QvxaePWwuXKqOWgpj17UwXqumCjMub0wDNihirlImgLonFZmdT5QPu
X-Gm-Message-State: AOJu0Yz0HIGghPALgG+IZTnjChHFRCwY4z+OOnlyqM5Se4A3HOGKdbDF
 XooSbVr3tliXw9MqjyEHGBuIuo9oF5+tb0JYTgVR71bBxy0Od795B+GX/PRlfp0=
X-Google-Smtp-Source: AGHT+IEYkdfZvzjzQTuqNwyv3/1I2wTibAdy/3l+Tqdqfg9DbDMvxlxElX4Ty3O747WwsNgGkO2d6A==
X-Received: by 2002:ac2:44c7:0:b0:516:cc9f:f8a with SMTP id
 d7-20020ac244c7000000b00516cc9f0f8amr1646189lfm.66.1712930494023; 
 Fri, 12 Apr 2024 07:01:34 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adfeb47000000b0033ec9ddc638sm4339471wrn.31.2024.04.12.07.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 07:01:33 -0700 (PDT)
Message-ID: <568a7740-ff47-49f0-978d-14cfe14f2b80@baylibre.com>
Date: Fri, 12 Apr 2024 16:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
To: Jacob Keller <jacob.e.keller@intel.com>,
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
 Naveen Mamindlapalli <naveenm@marvell.com>
Cc: danishanwar@ti.com, yuehaibing@huawei.com, rogerq@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <e60c4a55-09bb-4bd7-a22c-9ab38bea174c@intel.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <e60c4a55-09bb-4bd7-a22c-9ab38bea174c@intel.com>
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

On 4/10/24 01:51, Jacob Keller wrote:
>
> On 4/8/2024 2:38 AM, Julien Panis wrote:
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
>> ---
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

Thank you for your review Jacob.
I'll add your 'Reviewed-by' tag for PATCH 1/3 in next version. Unfortunately,
I will not for PATCH 2/3 and 3/3 because there will be too many changes,
following Jakub's comments.

