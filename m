Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AA989EDB6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 10:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5A10E8BB;
	Wed, 10 Apr 2024 08:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZJA8ubNg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2950910E8BB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:36:22 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-516db2214e6so5366994e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712738180; x=1713342980;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j9442A62TET00hjBhezvrYLKwHX+oM+EzqcfF+cyAB4=;
 b=ZJA8ubNgJ9tiz3JTKYahYXW5dnBFe/4h3wGyNLecyuvfzhtkG9CX0p/Vgm1aURlmfZ
 fyZUJVhfLsiQ+o4GfdmwKQ446QArTOvCG78YGJ0SX1ZOuUlZ4P6YxeU6oWSNYsK8W3e9
 lhg0JM8amQvtOYgqoZev5+st3quj/D2tPe2Nng7VSH4coYJqVdMq8vtPPK+HfHh6o2Vb
 hVsPjGjP7JLwwYvdsN1fszDMBnnQ5JB196Ubt7Gdxz6dtVnG78B94ZDqhPYWf3ysS1dy
 Fk5vdZJnT3hJs7FEfCPmc8awYDLc+zukwdTxDDeFuKvQPXi1QH2gr0ziZa9KB5m/DyK0
 WZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712738180; x=1713342980;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j9442A62TET00hjBhezvrYLKwHX+oM+EzqcfF+cyAB4=;
 b=rQoVdD7pA8duKaczqnhYS4MaX0lEnm5TcT4s5jZc+x34jbAPByVmuEJT7GE0JeuVyN
 4MdKdG/8XPighbXZ2yaZ8hsKSGJVkpjeHdQs4xrSB+vcv+mdrf0AED3Vl8LONdRV+BOr
 djKqc+rWFQ78RmWyl7SVfiiN82OPKcI/PRI5nISeCmzwUpqVrdhRCjKK9JFc/X1IdNTF
 W9EDZVePavRrKglXKHDD3im7ouTeuUWeCx+GZRadcz0X/S6orDxgZ+D0613hBgeEJ1ky
 0zB/GRN0VKCKTXT3Z1xPxABkeaNenICJPtOtcv/q01Ntwn16T7tHKz0d81UHV52yAxQY
 N84A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8rW3OZPdW/TmbVoNgA52d29SP9q4pi3VYmQyqRtnEATy/x+Wgaqrrn5Kjp/wQm+nYuctt6UBWzNFZOxeBvaBJ4j6YGDacwe6B3RXY0psr
X-Gm-Message-State: AOJu0Ywzz8VT3VvH9lRbo0MI74yJ664zw13W14ERtVblp+2R22LoCxmR
 3lkI//HPm5FB0qCFYRHjZDXMXUfjW577wVOGJE0914NGOb5YFPUxTuA6pnQc0+k=
X-Google-Smtp-Source: AGHT+IFjuM+EmbthlDbYjlSk1kmQ8trGtibZz10xcKh0nWxgzTalqLJgyFM1d4+Ue232gWWi76+xmw==
X-Received: by 2002:ac2:54a4:0:b0:516:c11a:4dbc with SMTP id
 w4-20020ac254a4000000b00516c11a4dbcmr981724lfk.22.1712738180088; 
 Wed, 10 Apr 2024 01:36:20 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.74])
 by smtp.gmail.com with ESMTPSA id
 iv6-20020a05600c548600b00417bc4820acsm528157wmb.0.2024.04.10.01.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 01:36:19 -0700 (PDT)
Message-ID: <6f356fec-4384-4367-8812-a18b71156116@baylibre.com>
Date: Wed, 10 Apr 2024 10:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
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
 <20240223-am65-cpsw-xdp-basic-v8-2-f3421b58da09@baylibre.com>
 <20240409173948.66abe6fa@kernel.org>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240409173948.66abe6fa@kernel.org>
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

On 4/10/24 02:39, Jakub Kicinski wrote:
> On Mon, 08 Apr 2024 11:38:03 +0200 Julien Panis wrote:
>>   		goto gen_pool_create_fail;
>>   	}
>>   
>> +	pool->desc_infos = kcalloc(pool->num_desc,
>> +				   sizeof(*pool->desc_infos), GFP_KERNEL);
>> +	if (!pool->desc_infos) {
>> +		ret = -ENOMEM;
>> +		dev_err(pool->dev,
>> +			"pool descriptor infos alloc failed %d\n", ret);
> Please don't add errors on mem alloc failures. They just bloat the
> kernel, there will be a rather large OOM splat in the logs if GFP_KERNEL
> allocation fails.
>
>> +		kfree_const(pool_name);
>> +		goto gen_pool_desc_infos_alloc_fail;
>> +	}
>> +
>>   	pool->gen_pool->name = pool_name;
> If you add the new allocation after this line, I think you wouldn't
> have to free pool_name under the if () explicitly.

Hello Jakub,

Thanks for these suggestions, I'll implement them in next version.

Also, about mem alloc failures, shouldn't we free 'pool' on kstrdup_const()
error at the beginning of k3_cppi_desc_pool_create_name() ?
I mean, it's not visible in my patch but I now wonder if this was done
properly even before I modify the file.

Currently, we have:
     pool_name = kstrdup_const(...)
     if (!pool_name)
         return ERR_PTR(ret);

Shouldnt we have instead:
     pool_name = kstrdup_const(...)
     if (!pool_name)
         goto gen_pool_create_fail;
(maybe label to be renamed)
...so that 'pool' can be freed before returning error.

Julien
