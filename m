Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52605AB7A65
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 02:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972A710E034;
	Thu, 15 May 2025 00:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ICIVapwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428AF10E034
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747268074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNzHUEUeO2dhjTSVzvgUR5Z+U81BlGK7DOEGqJYrY1c=;
 b=ICIVapwT+ltb/ndbQX4pHJikd3vnPZvfsaSJrlAUwZNwyBEIyFnMjwaJfuv4NtXrjUyn5N
 BlW7XCgIGshn3CQAA9JgAqtMxE1mdMrDLDnGsG0gc9iBCwryvsbIk5vi7jzPb+z7CgnG7d
 KLTqH0DxGlZcEneuCR95/+UAdaOW7pw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-0z3H5xaMP-u1wvAPchfmKg-1; Wed, 14 May 2025 20:14:33 -0400
X-MC-Unique: 0z3H5xaMP-u1wvAPchfmKg-1
X-Mimecast-MFC-AGG-ID: 0z3H5xaMP-u1wvAPchfmKg_1747268073
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f6e59df2f3so8090706d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 17:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747268073; x=1747872873;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kNzHUEUeO2dhjTSVzvgUR5Z+U81BlGK7DOEGqJYrY1c=;
 b=UdZdfIJp1akVLUUh5D/XsC8enc/w+5YvKuJJWmN/Vm84WlhCXZMd8GHdW63nGyGATg
 GqWUxUX2z1Aooy8v9Zzy/09rCqMsdRcu+lmIdILo9VJuqGtJQfLU56spBJnAQaQZUFES
 /V2bimPmOZGJ9k5rPcpVRFVfUay/YyFnqdCnNz9Y5hXoQazrPPr6n9k3e8l0gMu9MBbN
 BTdJOIrdSPVftT/ZB6MrPxwFWwKc9/HL8sp3pNdvwjfbAbaOG0gcOMEOVtNCrCGBEfpE
 e5OagbfYH6DSO0A6aGfr7wTwHqxg9LNuOrgaifQjAAi9SPnuc4nU+nYiSjBD0vugVdoD
 gEBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoqhF+eCF3JMeor2nnhEIJ9EDReqSE5YPEyZlw/MUmpxtnXaimwX+TZNNloAbarHd7btx2DARk5l8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQhRkxnkptSTLApi0H43Ijf1jywGE1DWZyqXFHINvllSlJPEz7
 /9x0eFSs6oz61NvRB5SPvj2NSNrw03GxGbQS2H+hmWBitQtAV1ArSk9JjhvRnwHu30CavxnpISW
 +tA7YcN7me6DdZERLpkBScDSKPKmzquqWVRe5pTl8qrfxkQ9FU2QLQfEV3nWLaXVpjw==
X-Gm-Gg: ASbGncuBiyOzA59bNjqu8AsvuuUYRqqIE3p0fPeS7g42VWxWcbq4G9iAVsUKk0Xz4ih
 A+3KYn4Q57RI+AkzdDnv8fQJnVcZrDFjLqpBxEm0gLbTtmhjQcrAk08IyuA+9sP4ICtvfK1ZpjZ
 ItKQXj4QjKeQTELOvKl/wfyCYiZK5O+r6gbDeGRC5lvcm2Tchu4BXfua3AXhLKmZJrkw5mJVSgs
 CEsu9KJlfMTvFormKRFYXgi5IKo7/jkdf0dBZGH4y3SAs0BOpqfKnJKfdpR4wHPyW3TjQ44i1I7
 yaUArH8CR6c0yDY25i8delMlz4+UV1zBnYKauNX8Hsvgm7GS/+bzUcIL2A==
X-Received: by 2002:a05:6214:d0c:b0:6e8:fe16:4d44 with SMTP id
 6a1803df08f44-6f896ea9057mr99475036d6.31.1747268072568; 
 Wed, 14 May 2025 17:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsr7IFrS3iOvG8LAJsmK3Z9rLV7eHpX1e12kq9yRd9jWKqc02gH6HkR1aDUM2ojcwgcm4bmg==
X-Received: by 2002:a05:6214:d0c:b0:6e8:fe16:4d44 with SMTP id
 6a1803df08f44-6f896ea9057mr99474556d6.31.1747268072185; 
 Wed, 14 May 2025 17:14:32 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba?
 ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f6e39e0c8csm87119136d6.18.2025.05.14.17.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 17:14:31 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <5f412ff9-c6a3-4eb1-9c02-44d7c493327d@redhat.com>
Date: Wed, 14 May 2025 20:14:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 01/43] llist: move llist_{head,node} definition to
 types.h
To: Byungchul Park <byungchul@sk.com>, linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, yskelg@gmail.com,
 yunseong.kim@ericsson.com, yeoreum.yun@arm.com, netdev@vger.kernel.org,
 matthew.brost@intel.com, her0gyugyu@gmail.com
References: <20250513100730.12664-1-byungchul@sk.com>
 <20250513100730.12664-2-byungchul@sk.com>
In-Reply-To: <20250513100730.12664-2-byungchul@sk.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fwtc4uvmT3IBTz2LHV6N2odqLBNHjtQe3NRX3BvdAYc_1747268073
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 5/13/25 6:06 AM, Byungchul Park wrote:
> llist_head and llist_node can be used by very primitives. For example,

I suppose you mean "every primitives". Right? However, the term 
"primitive" may sound strange. Maybe just saying that it is used by some 
other header files.

Cheers,
Longman

> dept for tracking dependencies uses llist in its header. To avoid header
> dependency, move those to types.h.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>   include/linux/llist.h | 8 --------
>   include/linux/types.h | 8 ++++++++
>   2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/llist.h b/include/linux/llist.h
> index 2c982ff7475a..3ac071857612 100644
> --- a/include/linux/llist.h
> +++ b/include/linux/llist.h
> @@ -53,14 +53,6 @@
>   #include <linux/stddef.h>
>   #include <linux/types.h>
>   
> -struct llist_head {
> -	struct llist_node *first;
> -};
> -
> -struct llist_node {
> -	struct llist_node *next;
> -};
> -
>   #define LLIST_HEAD_INIT(name)	{ NULL }
>   #define LLIST_HEAD(name)	struct llist_head name = LLIST_HEAD_INIT(name)
>   
> diff --git a/include/linux/types.h b/include/linux/types.h
> index 49b79c8bb1a9..c727cc2249e8 100644
> --- a/include/linux/types.h
> +++ b/include/linux/types.h
> @@ -204,6 +204,14 @@ struct hlist_node {
>   	struct hlist_node *next, **pprev;
>   };
>   
> +struct llist_head {
> +	struct llist_node *first;
> +};
> +
> +struct llist_node {
> +	struct llist_node *next;
> +};
> +
>   struct ustat {
>   	__kernel_daddr_t	f_tfree;
>   #ifdef CONFIG_ARCH_32BIT_USTAT_F_TINODE

