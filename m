Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5287A8F4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 15:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5507B10F32C;
	Wed, 13 Mar 2024 14:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NPJdBEwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADD610F322
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 14:03:40 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-22002fbbd6bso3394726fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710338619; x=1710943419;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ubMufnhLcTOoAqfT9+1T3xyWYqQSUC7Sbpi7BUH1NZE=;
 b=NPJdBEwBFCo3meszHK0AxPIQltP6cSulW4I19Q0d29AAA2F8znRnI3trH5A02fW8G/
 JH7jjQlxngXC0Nm/n6nsDQVhtaoiq6owD5fwTxCYxKFinPbo6b/TEgcjXyZD7IU+N8GK
 UyhBRwhwe8xEQU/8MR9pGD2xf9FcMzUvM9EumR+Y9C5ZPh79w2QeNCGkoExI7eb0HNTm
 A/ht0rgR5tVIHFBQVnV5zwroV8gHpiK9NAbNPZdx2+oppGaAq2LnMG54653AuPdioGXK
 iigDQR2wOvtdxp8/Z8b7nVM4uu8ezRfA1J89JHD51pXqpcThziFuYdl8kf+2EPYcCYSk
 GD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710338619; x=1710943419;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ubMufnhLcTOoAqfT9+1T3xyWYqQSUC7Sbpi7BUH1NZE=;
 b=Gcl5qpNalKtMn6KL2M6BZUHDI9EtV11sTLCXYG13GtAZpx98sD1Zoc5hIrsOXrp8/0
 45I+KvPu6RCHlaoY6Lv0OayA+IZMBxrPkjHlh/XVEeDH7LGv6ihKLYua5NPjeBt320lO
 7mT3AVHDEDdyfC1K36QmpYKsUrN4jFi0TX++Lyflo/526X3SySHvSZ5NQFgPcHsiJwSg
 Ik/VroGNmTxO+HzG7i2vzYvjDEOdNchHLt/o4kTfpdrylzWjK9Sap9JPv67JVpX91n+Z
 e0gXIbwBzNc/AoGDxz5AtXU8VPYZEtN+8bGDvmxFtold4cW/JkrwfNTZRzAAvC3fazb3
 Y17Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbFlYkzg/OL2l3kijESG7eRd/vikEXBmAClr3lYTZqTRq37mLhIK11vl9CmUyz2P0nsn+2l58Lw9zU9njjvymOgjh7faAtEIiB+tNtRej+
X-Gm-Message-State: AOJu0YwWjLuO8CadqqX4d8/icMOkon+8phfNOWAu8GlpPX7oJ23dkpGr
 HbNiY1YBZeNnW0vPv+OpNhT+FEcMdDq3fPYKR7TzkxQUVGqTnhPCuHxOFiWXC2c=
X-Google-Smtp-Source: AGHT+IEKcPIJIxJN3LZm3uy5vBq1aiBgTaIu0YfiiPG9DOTPOxQSlz/QEM8ItgImfrBXmN837WZOiw==
X-Received: by 2002:a05:6871:b0c:b0:221:1f78:566f with SMTP id
 fq12-20020a0568710b0c00b002211f78566fmr13760475oab.7.1710338619646; 
 Wed, 13 Mar 2024 07:03:39 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.243])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a9d4710000000b006e540a9026fsm478137otf.48.2024.03.13.07.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 07:03:39 -0700 (PDT)
Message-ID: <9016930f-d90b-4a7a-b6fb-80cf56a94bd8@baylibre.com>
Date: Wed, 13 Mar 2024 15:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add minimal XDP support to TI AM65 CPSW Ethernet
 driver
Content-Language: en-US
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v4-0-38361a63a48b@baylibre.com>
 <20240313134441.GA1263398@maili.marvell.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240313134441.GA1263398@maili.marvell.com>
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

On 3/13/24 14:44, Ratheesh Kannoth wrote:
> On 2024-03-12 at 18:52:39, Julien Panis (jpanis@baylibre.com) wrote:
>> This patch adds XDP support to TI AM65 CPSW Ethernet driver.
> is this a net-next item ?

Initially I worked on top of mainline kernel v6.8-rc1. Then, I also ensured that
the series could be applied on top of net-next/main.

>> The following features are implemented: NETDEV_XDP_ACT_BASIC,
>> NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
>>
>> Zero-copy and non-linear XDP buffer supports are NOT implemented.
>>
>> Besides, the page pool memory model is used to get better performance.
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>


