Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836ED9254F6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0A610E6C6;
	Wed,  3 Jul 2024 07:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hTyE90hr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A84F10E6C6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719993451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATgbDzJNw/2oGwBMOiWIjN3Qn1UCklmeTzoV2zYR45Y=;
 b=hTyE90hrZpPA7rCvoJMFBttsO84hdETHQoiOo1/6jzwCukxY6T2bJqoE6G7z6J9+icfcYG
 AV8QBOcXUB6QoJI9IMwhAm8nFAhK13lqnAX9/y5aAnaatKQBzWTyqkW3hob8jBfxMtWMoI
 asOHuqBjUXLAYd31D9SeL1stxR9nv4g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-lXq-bvKXOH-EZRKCFgOUqg-1; Wed, 03 Jul 2024 03:57:30 -0400
X-MC-Unique: lXq-bvKXOH-EZRKCFgOUqg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3630a676a07so3194512f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 00:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719993449; x=1720598249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ATgbDzJNw/2oGwBMOiWIjN3Qn1UCklmeTzoV2zYR45Y=;
 b=vVvSaoNk2HXq0SBivnUiSfLTjDIWLN2jZj1B8uRP8g+E2BP0sYqJSJtTA97vzpd1Oh
 omfPbmYms+Hvf/9cg0nbcz/gDNkpwYl89rnBkz2JoFpDGVXn/qOrGygdULDBztRRsKZL
 cIURFqqb/sygryy1Qo2WK6jWF6FVRfhuw79Yvi9+8TYqISrouZPPef6GbQIt0p9m4yp9
 8QO6KrptXOZAt7ED+kx8sTAYQRNanUTUSq9hXBXZDSKTMxmgiNy3pc1EMK/QRUCIBlzk
 t+9ZhcBdzWe29fhI/cUL8g8n2gYsv2elyCKzU0gVbyG2ej7vu8Dxp2yHAZLtkdfuEuiH
 s7kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMv2m0tVX5UR1Vb2keq1z+ksxg57DpH4gHjM07hO47yDdbwj9XWjWm9526cGehGlGZQZ3AOOMbD5oUtv9YEBQUlR1p6yje3CBtOTBu8EkF
X-Gm-Message-State: AOJu0YwWpQqDf9LgRp/yrO1nQ3zXPvoSM/RZJ12aGhZWv5I/X5EP8Zbf
 e23MetGeDkMaON5RRi55OEtOssc03SVUxQuTSkYk91uXFpSNsVUh584U2l17PStS1U9rtL2jHzH
 rww6t7gWw4KrgbTeKV7xlqMdFLuD/XaUkDSYZ6JiwIqwfl3FktOWxSbKTkfZeAyaGgw==
X-Received: by 2002:a05:6000:400d:b0:366:e685:d0cb with SMTP id
 ffacd0b85a97d-3677569762bmr7597298f8f.6.1719993449009; 
 Wed, 03 Jul 2024 00:57:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgd9U2eqDjR78JXH16dEWMefFhv6oCfwMwNT/hPSpZD56c2ut2zLCAdpneI7XMTfA346aUUg==
X-Received: by 2002:a05:6000:400d:b0:366:e685:d0cb with SMTP id
 ffacd0b85a97d-3677569762bmr7597268f8f.6.1719993448595; 
 Wed, 03 Jul 2024 00:57:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd623sm15223623f8f.16.2024.07.03.00.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 00:57:28 -0700 (PDT)
Message-ID: <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
Date: Wed, 3 Jul 2024 09:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202407021326.E75B8EA@keescook>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 02/07/2024 22:29, Kees Cook wrote:
> On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new struct kmsg_dump_detail, that will hold the
>> reason and description, and pass it to the dump() callback.
> 
> Thanks! I like this much better. :)
> 
>>
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>>
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>>
>> v2:
>>   * Use a struct kmsg_dump_detail to hold the reason and description
>>     pointer, for more flexibility if we want to add other parameters.
>>     (Kees Cook)
>>   * Fix powerpc/nvram_64 build, as I didn't update the forward
>>     declaration of oops_to_nvram()
> 
> The versioning history commonly goes after the "---".

ok, I was not aware of this.
> 
>> [...]
>> diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
>> index 906521c2329c..65f5a47727bc 100644
>> --- a/include/linux/kmsg_dump.h
>> +++ b/include/linux/kmsg_dump.h
>> @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
>>   	u64	next_seq;
>>   };
>>   
>> +/**
>> + *struct kmsg_dump_detail - kernel crash detail
> 
> Is kern-doc happy with this? I think there is supposed to be a space
> between the "*" and the first word:
> 
>   /**
>    * struct kmsg...
> 
> 
Good catch, yes there is a space missing.

I just checked with "make htmldocs", and in fact 
include/linux/kmsg_dump.h is not indexed for kernel documentation.
And you can't find the definition of struct kmsg_dumper in the online doc.
https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper

> Otherwise looks good to me!
> 

Thanks.

As this patch touches different subsystems, do you know on which tree it 
should land ?

-- 

Jocelyn

