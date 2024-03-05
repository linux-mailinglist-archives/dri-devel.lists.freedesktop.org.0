Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198F87245A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E7310FDCA;
	Tue,  5 Mar 2024 16:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AydxLkZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6904112BF2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709656311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXgCv056O/7zp95FcTfgFnOwWrzQXNCndhaAX1Dnxss=;
 b=AydxLkZzn2J43MHHvIR+6bGFOIHnoYsmI9DNgw0Q9HT0KmQgKRjDxd7uY1a9QwIf4hZ55l
 C3H9utQsqAZ7qE+X307fwnRJfhGgDZYO4Yp1xBfq9v25dTmICUeEp1QRz1OXHoq/g79B54
 AUdlqH/cRIs40v0fQyDpOK3vRrfIP4g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-2v3Nk3NfNaWoCjU95qNkAQ-1; Tue, 05 Mar 2024 11:31:49 -0500
X-MC-Unique: 2v3Nk3NfNaWoCjU95qNkAQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-412db0e24aeso17275045e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 08:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709656308; x=1710261108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LXgCv056O/7zp95FcTfgFnOwWrzQXNCndhaAX1Dnxss=;
 b=KWQ278UNy60oUccDxMK78ndVRNp5ESsfYrTBAwrlVn3KJ6O79T/Sk7yDPOylhe5+b5
 pmmrcPWhy50f1nzWEdWSqYw+0EB+2+OnGsGFiEXxxXwGgadyB12+E5Lh00Oiy3b0Snps
 c68+iujszYZaOdpEBHsQkpWpL9gSEWJqfokYg22fCuN00OJDGrXcXcCM/uIs5iG6jdRF
 HGEi46hKKQ4MHUVLF6aIDhxBo1PBNM5BNY7u9dIMG+q1eukLMScjz9TN75/Ao508UEe7
 5YAkD/LVVvQh4S8jjIOAjRiu6rVe0LTdTHYATrua+O4IRC5MuIokxX+eS45WX47zsFMw
 3Pbw==
X-Gm-Message-State: AOJu0Yz2PyBoQyp23KFJHMi+a1bRxB+z0StzJPdIGyLBHhJuffL8NdW3
 n7ppu0kkB7TUGHCtEimXk59xTdMGXhKEER/leHex8SrRLlWHrr5bV2Jza9Qk4mZEsPq7oETnF3a
 8ucG7PUaBvW34v9VwJLJPVvJtBtWJeRbPXt3MbQnm2bsU9dTjYtx3NqJpVBG2dl/U2w==
X-Received: by 2002:a05:600c:3b87:b0:412:e55e:83de with SMTP id
 n7-20020a05600c3b8700b00412e55e83demr4651292wms.7.1709656308506; 
 Tue, 05 Mar 2024 08:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwWCPNQ67k9EXc/a4VhY4qoHguRPFEF+4DIsDEhV2/uKWWUge72Mjm5EOArMoOwGUPip+I8w==
X-Received: by 2002:a05:600c:3b87:b0:412:e55e:83de with SMTP id
 n7-20020a05600c3b8700b00412e55e83demr4651262wms.7.1709656308137; 
 Tue, 05 Mar 2024 08:31:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 h3-20020adfa4c3000000b0033dd2a7167fsm15503470wrb.29.2024.03.05.08.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 08:31:47 -0800 (PST)
Message-ID: <aa383f43-b57d-47f7-9b54-1169956586cb@redhat.com>
Date: Tue, 5 Mar 2024 17:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] How to test panic handlers, without crashing the kernel
To: John Ogness <john.ogness@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Lukas Wunner <lukas@wunner.de>,
 Uros Bizjak <ubizjak@gmail.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <266579a9-fde6-40ff-b13d-fb2312db406c@redhat.com>
 <87edcpn1l3.fsf@jogness.linutronix.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87edcpn1l3.fsf@jogness.linutronix.de>
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



On 04/03/2024 22:12, John Ogness wrote:
> [Added printk maintainer and kdb folks]
> 
> Hi Jocelyn,
> 
> On 2024-03-01, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> While writing a panic handler for drm devices [1], I needed a way to
>> test it without crashing the machine.
>> So from debugfs, I called
>> atomic_notifier_call_chain(&panic_notifier_list, ...), but it has the
>> side effect of calling all other panic notifiers registered.
>>
>> So Sima suggested to move that to the generic panic code, and test all
>> panic notifiers with a dedicated debugfs interface.
>>
>> I can move that code to kernel/, but before doing that, I would like to
>> know if you think that's the right way to test the panic code.
> 
> One major event that happens before the panic notifiers is
> panic_other_cpus_shutdown(). This can cause special situations because
> CPUs can be stopped while holding resources (such as raw spin
> locks). And these are the situations that make it so tricky to have safe
> and reliable notifiers. If triggered from debugfs, these situations will
> never occur.
> 
> My concern is that the tests via debugfs will always succeed, but in the
> real world panic notifiers are failing/hanging/exploding. IMHO useful
> panic testing requires real panic'ing.

Yes, but for the drm panic, it's still useful to check that the output 
is working (ie: make sure the color format and the framebuffer address 
are good). Also I've reworked the debugfs patch, so I don't have to call 
all panic notifiers. It's now per device, so your can trigger the 
drm_panic handler on a specific GPU.

> 
> For my printk panic tests I trigger unknown NMIs while booting with
> "unknown_nmi_panic". Particularly with Qemu this is quite easy and
> amazingly effective at catching problems. In fact, a recent printk
> series [0] fixed seven issues that were found through this method of
> panic testing.

Thanks for this tip, I used to test with "echo c > /proc/sysrq-trigger" 
in the guest, but that's more permissive. I'm now testing with virsh 
inject-nmi, and drm_panic is still working.
> 
>> The second question is how to simulate a panic context in a
>> non-destructive way, so we can test the panic notifiers in CI, without
>> crashing the machine.
> 
> I'm wondering if a "fake panic" can be implemented that quiesces all the
> other CPUs via NMI (similar to kdb) and then calls the panic
> notifiers. And finally releases everything back to normal. That might
> produce a fairly realistic panic situation and should be fairly
> non-destructive (depending on what the notifiers do and how long they
> take).
> 
>> The worst case for a panic notifier, is when the panic occurs in NMI
>> context, but I don't know how to simulate that. The goal would be to
>> find early if a panic notifier tries to sleep, or do other things that
>> are not allowed in a panic context.
> 
> Maybe with a new boot argument "unknown_nmi_fake_panic" that triggers
> the fake panic instead?
> 
> John Ogness
> 
> [0] https://lore.kernel.org/lkml/20240207134103.1357162-1-john.ogness@linutronix.de
> 

Best regards,

-- 

Jocelyn

