Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281309BB05D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 10:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237B910E2AD;
	Mon,  4 Nov 2024 09:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OuVqlfgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4C810E2AD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730714191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+O+GodM/+FMt6xYNhMI8LWS+K36k5DEO2ipAK0wzq4Q=;
 b=OuVqlfgUiD9UFcGDAzZkHv+9EO+jBM2aynwVlcEmWxmrJUw1QB9xcVyXgHqnUfqXtuUSgY
 5r8YLycHDXnnOZWAni8b48nSfDJCR4PiAAwXQbA573bP3sst1L1RBkLAHo5ZKXd1v2uvzf
 X/iy/CmxUJ9odxCfZoGwiXc3RfwQImM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-SMyptpXkMYSY4KG_X_wKmA-1; Mon, 04 Nov 2024 04:56:30 -0500
X-MC-Unique: SMyptpXkMYSY4KG_X_wKmA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d4af408dcso1877262f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 01:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730714189; x=1731318989;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+O+GodM/+FMt6xYNhMI8LWS+K36k5DEO2ipAK0wzq4Q=;
 b=Knk5XKlixGX22oQi8VyiJgagYDX4aAeHar9bO5SMf9F+SiqosrUJIXNyfnLHTrZ730
 7f3aDwjYzNaNWVIhybkhvxMoyJt+gdRPSNVcJw5WRp5XZ7jCZ1mCqv+QT01jIVX/9iW9
 L0GoKIOx9gdmDiD3w9mOALcbTFlK846B5NrZ87kWI0RmKBdieFW9VsNpesIyZjxSGTCL
 vyEgBTFUN8yCvNJFbXarvrfppafq5TnQTW924YEwmrmJqQluZAwl2FPaCqKe25K+S5y3
 +8e1DgOa9UU4GjrJVxSOd+3jpr9FdmU4iNbYGgTKsYIy6+yEELCSTHK2uvosAcR9l2/s
 aQ5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWykFxUcSjR4jAS7Z9UF7cXV4c87sTiJ6Mr3IoofK44zmdzcG+MQaCFf9NEEdX3+QZ/DSbeeYCL1Eo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPZH2e0q7lnzCp0pSlXhPpVUifO//r6qM5Wtxi0npD8NAkmWpQ
 yfona2eOrGLRSYXDVdo53Aw9DGFF3omL3AexpMA4sTtIz7SBRntgZUr9lYJIVYWnU/AWuM/9kMN
 zHmm1ZIl0MAeEzahh44in8CmlXc96KIxsGBKaob+SiYdlLbwu8JKQwtzWE1StkIT2Qg==
X-Received: by 2002:a5d:530e:0:b0:37d:4fab:c194 with SMTP id
 ffacd0b85a97d-3806115a933mr20464042f8f.25.1730714189113; 
 Mon, 04 Nov 2024 01:56:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfUOygrLk+iYdGxhbcddNRVSY775g5X2ebYnRvGl9sCoLlnCySDJd+oCk/UgIA9QNvj2TPIQ==
X-Received: by 2002:a5d:530e:0:b0:37d:4fab:c194 with SMTP id
 ffacd0b85a97d-3806115a933mr20464021f8f.25.1730714188683; 
 Mon, 04 Nov 2024 01:56:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e687sm12783275f8f.84.2024.11.04.01.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 01:56:28 -0800 (PST)
Message-ID: <d5c8ea70-8596-42a1-8688-0f6131187b73@redhat.com>
Date: Mon, 4 Nov 2024 10:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/log: Implement suspend/resume
To: Petr Mladek <pmladek@suse.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241023121145.1321921-1-jfalempe@redhat.com>
 <20241023121145.1321921-6-jfalempe@redhat.com>
 <Zxpa2zt1P9Avy4Pm@pathway.suse.cz>
 <27c1a6bf-d1e4-469f-a0d4-3e74ab0d0a07@redhat.com>
 <a6c00956-3733-43a1-9538-aa2758d2b4a3@redhat.com>
 <ZyT7MScAsHxkACfD@pathway.suse.cz>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZyT7MScAsHxkACfD@pathway.suse.cz>
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

On 01/11/2024 17:00, Petr Mladek wrote:
> On Fri 2024-10-25 11:46:16, Jocelyn Falempe wrote:
>> On 25/10/2024 01:11, Jocelyn Falempe wrote:
>>> On 24/10/2024 16:34, Petr Mladek wrote:
>>>> On Wed 2024-10-23 14:00:13, Jocelyn Falempe wrote:
>>>>> The console is already suspended in printk.c.
>>>>
>>>> Does this mean that drm_log_client_suspend() is called
>>>> after suspend_console(), please?
>>>
>>> To be honest, I wasn't able to tell which one is called first, and if
>>> the order is enforced (I didn't check if drivers can be suspended in
>>> parallel, or if it's all sequential)..
>>>
>>> I then checked if it's possible to suspend the console, but didn't found
>>> an easy API to do so, so I went with this lazy patch, just ensuring
>>> we're not writing to a suspended graphic driver.
>>
>> I've run some tests on my hardware, and the console is suspended before the
>> graphic driver:
>>
>> [   56.409604] printk: Suspending console(s) (use no_console_suspend to
>> debug)
>> [   56.411430] serial 00:05: disabled
>> [   56.421877] sd 0:0:0:0: [sda] Synchronizing SCSI cache
>> [   56.421954] sd 4:0:0:0: [sdb] Synchronizing SCSI cache
>> [   56.422545] ata1.00: Entering standby power mode
>> [   56.422793] DRM log suspend
>>
>> But because there is the "no_console_suspend" parameter, and we should make
>> sure to not draw when the graphic driver is suspended, I think this patch is
>> needed, and good enough.
>> I will just rephrase the commit message, to make it clear, that some message
>> won't be drawn, only if "no_console_suspend" is set.
> 
> Ah, I forgot about the "no_console_suspend" parameter. The problem
> with this patch is that it would quietly drop all pending messages.
> 
> drm_log_write_thread() does not have any return value.
> nbcon_emit_next_record() would assume that the message was printed.
> And the kthread would continue emitting next message...
> 
> In compare, CON_SUSPENDED would cause that console_is_usable()
> returns false. As a result, nbcon_kthread_func() would not try
> to emit any message and go into a sleep.
> 
> If we set CON_SUSPENDED then the pending messages will get printed
> after the resume. If we use this patch, the messages would get lost.
> 
> 
> This is why I am not happy with this patch. I would prefer to
> block the console. I see three better solutions:
> 
>    1. Set CON_SUSPENDED from drm_log_client_suspend even when
>       "no_console_suspend" is used.
> 
>       It is a bit dirty and might cause some confusion.
> 
> 
>    2. Add a new flag, e.g. CON_BLOCKED or CON_DRIVER_BLOCKED,
>       which might be used for this purpose.
> 
> 
>    3. Allow con->write_thread() to return an error code.
> 
>       The question is how exactly the error should be handled.
>       The kthread would not know when the printing might succeed
>       again.
> 
> 
> I personally prefer the 2nd variant.

I looked at what serial drivers are doing, because they can also have 
their clock gated in suspend.

Would calling console_stop() in the suspend and console_start() in 
resume work ?

https://elixir.bootlin.com/linux/v6.11.6/source/drivers/tty/serial/serial_core.c#L2462

https://elixir.bootlin.com/linux/v6.11.6/source/kernel/printk/printk.c#L3323

It looks like it should do exactly what we need ?

Best regards,

-- 

Jocelyn

> 
> 
> Best Regards,
> Petr
> 
> PS: I am sorry for the late reply. I had vacation...
> 

