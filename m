Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDF91A067
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC99810EA50;
	Thu, 27 Jun 2024 07:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EyLJ7Udo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDC110EA56
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719473372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ArljJjB0JyJS00KNOlxMunWxUs1/GD1Wf4W99edQFdU=;
 b=EyLJ7UdomRa9e5Z3kF/dB3puDnEMRL8o8z/0OQy9cUudAiFpF01X+0Xn+XRnlLE6HGwfzJ
 V7L4YL7i5TNl5ZTcnSqPbmLmefjxtcaJqjgscy9uMf9Sphe19AfO38egrTFrRexM4WN3pm
 lwVMhmkUfRxfFVzZCr0xGAuqg7zAN+o=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-LOV1Ol-DMgWRm0H2I-ULZg-1; Thu, 27 Jun 2024 03:29:30 -0400
X-MC-Unique: LOV1Ol-DMgWRm0H2I-ULZg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52ce007cdd4so3808087e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 00:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719473369; x=1720078169;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ArljJjB0JyJS00KNOlxMunWxUs1/GD1Wf4W99edQFdU=;
 b=HDaNohq1hKvKEb2pbu/Vywt75r91HYcl5K9wsLwgdCjNhgxvVgv6F42PGIMMJTyVNX
 1zP3woizjVX9leAttNcWLJgFKr8kS0Aq1udBqHsA/Mr8W/DdBH8U0S534NYVGN99WT8s
 ygD+Ony+bmc6DO1iUHd+ejKjoj4jpBSsxGH+CVnZ7TC8ZiNgAd/ZfHCNOeR2B6oyjItB
 XEE0bfo0hqsHURf5bBUBWtFCObGMSsH8r/Q0qd04LCX1Xm+7bmBAg1yIy3Kvbcm4NyGT
 KSzRyD3CKbmrr+aMlpgqEFY1vNoN6XypkDqtCL1msBqTvQRJ/HLhgOH7TjYt6VTrfO4V
 52Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBQg6RowkEGISc2iZ8p1yRiazIIHFpr+8GWgDux0vduAECIa3S2O/XP2g/vlH2t6LY0REz+jiS1iGFNQBAWKlS0QqajVJem60rEryuIZ+r
X-Gm-Message-State: AOJu0Yz6Fni4sHnh7ZwYWAwwyU2RDMajytJF13Qn/mPMQY+E2HXlic66
 pGvsus4YEN2edp+SkmwkB992/m8YWtu5iRmzAbtu/fqsltHHYQso3yDCgfmE3xJkWBKlyM+LWOr
 fb3iP8wOJtlxEDGsaMvRS8lB5YLGOqakZfTfjEhCv6+dPCjv0aiik/BjR42l/s4GDoQ==
X-Received: by 2002:a05:6512:688:b0:52c:8837:718a with SMTP id
 2adb3069b0e04-52ce185cffdmr9405295e87.43.1719473369045; 
 Thu, 27 Jun 2024 00:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbOO3gAiuM5teegTvAjdpAZYISeHz2jPAZuVwH5HNKIpTCZBH+tcy4/G9Q3EUr6abmm1rODg==
X-Received: by 2002:a05:6512:688:b0:52c:8837:718a with SMTP id
 2adb3069b0e04-52ce185cffdmr9405275e87.43.1719473368602; 
 Thu, 27 Jun 2024 00:29:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8245e7csm52601955e9.3.2024.06.27.00.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 00:29:28 -0700 (PDT)
Message-ID: <4aa3a028-04e5-4658-9879-df60dab06c54@redhat.com>
Date: Thu, 27 Jun 2024 09:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
To: Petr Mladek <pmladek@suse.com>
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
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
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
References: <20240625123954.211184-1-jfalempe@redhat.com>
 <ZnvKcnC9ruaIHYij@pathway.suse.cz>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZnvKcnC9ruaIHYij@pathway.suse.cz>
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



On 26/06/2024 10:00, Petr Mladek wrote:
> On Tue 2024-06-25 14:39:29, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new parameter "const char *desc" to the kmsg_dumper
>> dump() callback, and update all drivers that are using it.
>>
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>>
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   arch/powerpc/kernel/nvram_64.c             |  3 ++-
>>   arch/powerpc/platforms/powernv/opal-kmsg.c |  3 ++-
>>   drivers/gpu/drm/drm_panic.c                |  3 ++-
>>   drivers/hv/hv_common.c                     |  3 ++-
>>   drivers/mtd/mtdoops.c                      |  3 ++-
>>   fs/pstore/platform.c                       |  3 ++-
>>   include/linux/kmsg_dump.h                  | 13 ++++++++++---
>>   kernel/panic.c                             |  2 +-
>>   kernel/printk/printk.c                     |  8 +++++---
>>   9 files changed, 28 insertions(+), 13 deletions(-)
> 
> The parameter is added into all dumpers. I guess that it would be
> used only drm_panic() because it is graphics and might be "fancy".
> The others simply dump the log buffer and the reason is in
> the dumped log as well.

Ok, I also tried to retrieve the reason from the dumped log, but that's 
really fragile.

> 
> Anyway, the passed buffer is static. Alternative solution would
> be to make it global and export it like, for example, panic_cpu.

It's not a static buffer, because the string is generated at runtime.
eg: https://elixir.bootlin.com/linux/latest/source/arch/arm/mm/init.c#L158

So it will be hard to avoid race conditions.

> 
> Best Regards,
> Petr
> 

