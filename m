Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41033AEB6E3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8A010EA02;
	Fri, 27 Jun 2025 11:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="feZqPXdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EBB10EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751025174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNCLtd/5j3xpGlE8KxmjKTA6IB3ovsHWJ5xcxyIyoHI=;
 b=feZqPXdzh1xozJFyNBy/Tr4MBifSyxUsul5iHOXvA8KwbJwxDGUNqS/4yZtJ9SgzyMrFZJ
 O2Yv9fXXtvbszWEmwuCyQYLgFgXZSSoykplCQTDMVG5SIAoYmjzpGv26loazSdcy7RQGH8
 Kil1pQESPmxOxgPOXXwToAZpQ+Gmt30=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-diVKQBmuPKurQP5mg6GjQQ-1; Fri, 27 Jun 2025 07:52:53 -0400
X-MC-Unique: diVKQBmuPKurQP5mg6GjQQ-1
X-Mimecast-MFC-AGG-ID: diVKQBmuPKurQP5mg6GjQQ_1751025172
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450df53d461so15324905e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751025172; x=1751629972;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MNCLtd/5j3xpGlE8KxmjKTA6IB3ovsHWJ5xcxyIyoHI=;
 b=djAwidpdmqkA6RshY4ViBrjmyFap2UPpQs4VhXJ31KQS4MRhcJDLA8sgqD+Lt2Pb5l
 mC4YPJdjaIkIvh+GpmJzmcUUqJroVj6dxmooM3HjSB7iD4RBKRE8Zqkjr7KiLTCW70qm
 KkT4HcoqeuQVlRSGksuDr/P3WPlRrhNDSuyPgaZaDF/QHZsSyjfViIYS+FzcJJSYRv1N
 yfiucP2PzWWSroTP8qm3j00ahYTS2YcbNAjrUKEdQX03jAMW22t3m+nBREGykwjior5+
 fvint/Lyd309GnnHKscNOMKloL35piYqHA1rfya4ee2CNwrvWwgRg8gN3OHVMOXc502a
 sxqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULXP+91Ce7MS+ULy/uzAcheeAsMdR5A9o3Em99cTm/OWlnZn+HbrlboeenzdQc433CNL5m3f5o5RM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0hFgd2xb30bl90ZMghQoEZkJMdfvLMbVlPj4RK8KjLBIUUw/v
 gjS3ZMhK+g3SA5NaDYZOAEeA5LUyNun84N+hCbLkp7oK1s5OwvA4lQiDb3AxpWjNu3ZZ2qbjBO/
 xTKOgkMMNTZXUSq8A1gq6c9cy7Q0t/KQXdNN5gxr3Q29IUclEKo7aMBaigS1QyZuxhuA83w==
X-Gm-Gg: ASbGncsDPbOUCYzWcOKvpXd0nfhHFUo5ypJN6hh1mRuvve0MWjPrU2o6GrVz0+0CKH+
 8AYT23e2zqoR7BXnIxfE0ysZiW4tOUZt9UiDsINtAB77EU+kZBwn0XKm6Cc9ts854VqkJQwz5Cn
 9Lb2I49Ax/16smVcOXBw9AtyAtoRfGwlNCuf4JDTPed9xMVByESxoR81yWzGvkP/zRh1mPko6Fc
 pI1Ywu7QVPQTnV9Z3DJCqpbbfjVBeKZrdSgu+SS1FKgAA17gP+CbxyD1XLC8y43Ea9KDxOrk+9R
 PT0zCQ9cfHIUARxv1JdKrb7RjN6nfbR2Bjz9yJ8NDjLo1BkNfO9qIJ1EvR6/qA==
X-Received: by 2002:a05:600c:35d1:b0:450:d3b9:4bac with SMTP id
 5b1f17b1804b1-45394179dd4mr1049555e9.28.1751025172094; 
 Fri, 27 Jun 2025 04:52:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPo2dBKUZ/Zkw1L6EzaaAtBgiEo7s2NtlnGP+y82PmhNo6U42m+eKNQAeG/uBgsf87Iii9iQ==
X-Received: by 2002:a05:600c:35d1:b0:450:d3b9:4bac with SMTP id
 5b1f17b1804b1-45394179dd4mr1049205e9.28.1751025171615; 
 Fri, 27 Jun 2025 04:52:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fe0efsm47851935e9.24.2025.06.27.04.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 04:52:51 -0700 (PDT)
Message-ID: <bc3cf135-5432-4cdb-8992-7c400e728a97@redhat.com>
Date: Fri, 27 Jun 2025 13:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627094102.770689-1-jfalempe@redhat.com>
 <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p80TiVihST4LR41FPje5u1jUUOIjUPJpHGgOwoldlvg_1751025172
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 27/06/2025 13:44, Miguel Ojeda wrote:
> On Fri, Jun 27, 2025 at 11:41 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> +/// On arm32 architecture, dividing an u64 by a constant will generate a call
>> +/// to __aeabi_uldivmod which is not present in the kernel.
>> +/// So use the multiply by inverse method for this architecture.
> 
> This sounds more like a normal comment instead of function docs, no?

Yes, I think I'm still confused between // and ///, so I will replace 
with //.
> 
> By the way, formatting:
> 
>      `u64`
>      `__aeabi_uldivmod`

ok, I will do that in v2.

> 
> Thanks for fixing this! It is nice seeing 32-bit arm taking shape.

Thank you for your reactivity

> 
> Cheers,
> Miguel
> 

-- 

Jocelyn

