Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B69BB7F4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 15:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310A10E466;
	Mon,  4 Nov 2024 14:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dsZ99HrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF9E10E45B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730730980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYv5vbThzgM6TqwmtQ00YHFrZj4olBrKvIHPrLfcMxM=;
 b=dsZ99HrPKjaDQaYrg6EmwuDw9fKMX9ZhaBODNcMOZtxHLrqIVQXrnQ3H6RxmqskfvcDncd
 M4Y+J98ERiUEZQCU2fJ+JOZvkkokRYmM5LFOZnsR3d00zkKXfGXutFFBVjwQ69beSWLlRI
 UApj8ijz8oMRWMkyIqa813ECEQzMDLQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-iD-tXTzaPo-XOXHuh956rw-1; Mon, 04 Nov 2024 09:36:19 -0500
X-MC-Unique: iD-tXTzaPo-XOXHuh956rw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-539f067414fso2482200e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 06:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730730978; x=1731335778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cYv5vbThzgM6TqwmtQ00YHFrZj4olBrKvIHPrLfcMxM=;
 b=wHXAAQn+wogpMe5EaI8ma9H61xBUZ/lbvpqjBbvFejM3nlzwcm02VuiYFgn1mFew68
 d5zVCX1KxAO8GxsFvAqWak2Juazxchju49GzbSqDlgE7o5wRIWEP7mjhbOi8Gs1rDeE9
 Cfjsjq4GfxsQa+0OJyu7MJcMXccBco9KIvo6/8oVgCKTOg5AWn5/WisTRPB9R+KRmLWw
 sznfQQu63OwPrhyQLOnZZYqlx6AXb5J+5rncfgARj20JZkbLMSVosvyhyfrC9PA2i6ey
 hF0+oo55sCBvDYtwRIaRUg8oeiB+6s18rf+sBWQsQqWpnhk+QocAjz/G8NboQuFESXDd
 r+sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5jjZk6IuAS0Kfasgm2DdY9qgLRCeRilQMCpPkQ+VlZlVELA81mtCzjW7lqlWpC6SddSCMkmqFOtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOPzSmuFJ5j1x8HyLjimlIfwBbbGcmeOpkpPhHkLZpc4EDrpXW
 977rcRLqKGeWOrrTWBY6ADrZMCehxfi5GTaaeXe2KwoxtBlNYBdBagGl4hNt5mwmdkqM+jz8oTf
 UCNA8oA5ZobN2I5j0juSDjJPJVBLEfrMeHszpdZ6JLvvoC9mjCGlUmVbGswni45k2Kw==
X-Received: by 2002:a05:6512:10cb:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-53b348d8f8dmr14808737e87.29.1730730976569; 
 Mon, 04 Nov 2024 06:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ97CKyrAMWrqbI1YmP6iHAxPErbFd+1wOPyRpIRe9ENekBpxVLZS5MNlcxqS2cN4d8fsTKw==
X-Received: by 2002:a05:6512:10cb:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-53b348d8f8dmr14808716e87.29.1730730976065; 
 Mon, 04 Nov 2024 06:36:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e74casm13314836f8f.65.2024.11.04.06.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 06:36:15 -0800 (PST)
Message-ID: <0d478a44-ae01-46a8-b4e7-a28c480e23be@redhat.com>
Date: Mon, 4 Nov 2024 15:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/log: Implement suspend/resume
To: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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
 <d5c8ea70-8596-42a1-8688-0f6131187b73@redhat.com>
 <84o72vcm46.fsf@jogness.linutronix.de> <ZyjXB52dbhjZEHp6@pathway.suse.cz>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZyjXB52dbhjZEHp6@pathway.suse.cz>
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

On 04/11/2024 15:15, Petr Mladek wrote:
> On Mon 2024-11-04 11:52:33, John Ogness wrote:
>> On 2024-11-04, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> I looked at what serial drivers are doing, because they can also have
>>> their clock gated in suspend.
>>>
>>> Would calling console_stop() in the suspend and console_start() in
>>> resume work ?
>>
>> Yes. That is what it is for.
> 
> It seems that you are right. I have never really investigated the purpose
> of this API /o\
> 
Thanks, I will send a v6 with that change.

> One problem with this API is that it does not check whether the
> console is registered. I wonder whether it might cause problems.

At least for drm_log, register_console() will always be called before.
> 
> For example, we should not set the CON_ENABLE flag when the console is not
> registered. Doing so would cause register_console() to always enable
> the console, even when it is not preferred.
> 
> Additionally, nbcon_kthread_wake() uses con->rcuwait, which is initialized
> by nbcon_alloc() called from register_console(). Fortunately, nbcon_alloc()
> is always called even if the console is not enabled in the end, but this
> might change in the future and cause subtle errors.
> 
> [ After even more thinking ]
> 
> I wonder whether console_start()/console_stop() should really
> manipulate CON_ENABLE flag. It might be historical solution when
> @console_suspended was a global variable.
> 
> But it has changed with the commit 9e70a5e109a4a2336 ("printk: Add
> per-console suspended state").
> 
> It might make more sense when console_start()/console_stop()
> manipulates CON_SUSPENDED flag. Then it would make sense
> to rename them suspend_this_console()/resume_this_console().
> 
> What do you think?

Maybe when registering the console, having a flag to say "I want this 
console to be suspended with the console subsystem" or "I want to handle 
suspend/resume on my own, and call the relevant functions" would be better ?

That would avoid having the same console being suspended/resumed twice, 
and making clear what to expect.

Of course "no_console_suspend" won't really work for drivers handling 
suspend/resume themselves.

-- 

Jocelyn
> 
> Best Regards,
> Petr
> 

