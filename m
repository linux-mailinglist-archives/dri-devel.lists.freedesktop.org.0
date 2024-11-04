Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF69BB2C7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 12:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A1D10E3D5;
	Mon,  4 Nov 2024 11:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WZDz9AaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A4410E3D5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 11:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y9ExVeNjKF0SfMQEmzTjWWX5US8Priue+XLniaZh+Qs=; b=WZDz9AaASfdZwB+BONRbuqU3Wv
 QNpbAAt+sTh/U7VGjUC7WCNg/pCt4bq6dqjddhX15WsAKGPT0XTFc9mggSyeJofShH3kNxIHSMDR7
 NyyVndtl8U9meMwJeff94rSB9tqQ0VQw7FYmJiv7TJuVYlqZ7q37NhUNc4VBajprhXAl9An00HU9a
 PhkS85FDtvp9p4DH1e30Ibe0V3bgPblSlcOh9MZnUD+gefH2t8n9ZXRShMEGxsbYyWCSZDdypIQyM
 Hj0zggcvqYoBJeAYCdX4uXsmFwFblS1R1iZ/AAFxCL5jvCysNYQPBRZzEQkrCgMcGTfRyLA0GdK4z
 90eb4IsA==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t7v46-001WwT-Gt; Mon, 04 Nov 2024 12:16:10 +0100
Message-ID: <06b96a7f-c9bb-4a65-8077-ba10e0ea1e7d@igalia.com>
Date: Mon, 4 Nov 2024 08:16:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] mm: move ``get_order_from_str()`` to internal.h
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, Barry Song <baohua@kernel.org>,
 David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Lance Yang <ioworker0@gmail.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20241101165719.1074234-2-mcanal@igalia.com>
 <20241101165719.1074234-5-mcanal@igalia.com>
 <9d5ce0af-6fca-422f-b1f8-650879f8ff5a@linux.alibaba.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <9d5ce0af-6fca-422f-b1f8-650879f8ff5a@linux.alibaba.com>
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

Hi Baolin,

On 03/11/24 23:25, Baolin Wang wrote:
> 
> 
> On 2024/11/2 00:54, Maíra Canal wrote:
>> In order to implement a kernel parameter similar to ``thp_anon=`` for
>> shmem, we'll need the function ``get_order_from_str()``.
>>
>> Instead of duplicating the function, move the function to a shared
>> header, in which both mm/shmem.c and mm/huge_memory.c will be able to
>> use it.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   mm/huge_memory.c | 38 +++++++++++++++-----------------------
>>   mm/internal.h    | 22 ++++++++++++++++++++++
>>   2 files changed, 37 insertions(+), 23 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index f92068864469..a6edbd8c4f49 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -958,26 +958,6 @@ static int __init setup_transparent_hugepage(char 
>> *str)
>>   }
>>   __setup("transparent_hugepage=", setup_transparent_hugepage);
>> -static inline int get_order_from_str(const char *size_str)
>> -{
>> -    unsigned long size;
>> -    char *endptr;
>> -    int order;
>> -
>> -    size = memparse(size_str, &endptr);
>> -
>> -    if (!is_power_of_2(size))
>> -        goto err;
>> -    order = get_order(size);
>> -    if (BIT(order) & ~THP_ORDERS_ALL_ANON)
>> -        goto err;
>> -
>> -    return order;
>> -err:
>> -    pr_err("invalid size %s in thp_anon boot parameter\n", size_str);
>> -    return -EINVAL;
>> -}
>> -
>>   static char str_dup[PAGE_SIZE] __initdata;
>>   static int __init setup_thp_anon(char *str)
>>   {
>> @@ -1007,10 +987,22 @@ static int __init setup_thp_anon(char *str)
>>                   start_size = strsep(&subtoken, "-");
>>                   end_size = subtoken;
>> -                start = get_order_from_str(start_size);
>> -                end = get_order_from_str(end_size);
>> +                start = get_order_from_str(start_size, 
>> THP_ORDERS_ALL_ANON);
>> +                end = get_order_from_str(end_size, THP_ORDERS_ALL_ANON);
>>               } else {
>> -                start = end = get_order_from_str(subtoken);
>> +                start_size = end_size = subtoken;
>> +                start = end = get_order_from_str(subtoken,
>> +                                 THP_ORDERS_ALL_ANON);
>> +            }
>> +
>> +            if (start == -EINVAL) {
>> +                pr_err("invalid size %s in thp_anon boot 
>> parameter\n", start_size);
>> +                goto err;
>> +            }
>> +
>> +            if (end == -EINVAL) {
>> +                pr_err("invalid size %s in thp_anon boot 
>> parameter\n", end_size);
>> +                goto err;
>>               }
> 
> There are already checks for ‘start’ and ‘end’ below, and will print 
> error messages if error occurs. So I suspect whether these repeated 
> checks and error infor are helpful.

The idea is to explicitly show to the user which part of the kernel
parameter is broke. Instead of saying that something is broken, it is
going to return that, for example, "33K" is invalid.

Best Regards,
- Maíra

> 
> Anyway, I don't have a strong preference.
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

