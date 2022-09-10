Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3AF5B4862
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 21:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97C010E294;
	Sat, 10 Sep 2022 19:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E2310E294
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 19:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662839431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3TVEUmu90c/ThSjVVWzaHbJBH7HKgmorVzGvfwRjE8=;
 b=UyLCDaa+xbZDCLEHD/QK/MYsgLR1eXKCVUYYDP9vmgPlM4Mc2+bACPsVRm+wKQKoTzKL2l
 eC+6gGmcQpct8r7YVNQHflTrqX4ajasRXmHNcdR250EelVPSRL0bB6tQUaQ9uWgEaSa4ba
 f3w5b8nAUqDcgqQvdOO24odn4Zr8M8U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-qAAhV02EO7SziYyKhgFqiA-1; Sat, 10 Sep 2022 15:50:30 -0400
X-MC-Unique: qAAhV02EO7SziYyKhgFqiA-1
Received: by mail-ej1-f70.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so2132454ejb.19
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 12:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=q3TVEUmu90c/ThSjVVWzaHbJBH7HKgmorVzGvfwRjE8=;
 b=RMXCGP6ZT8DfD5KLlzbDxWpgptq4rM91FQLbHI7exFYFfxHy3QnXkCmp3ozI6At8K6
 vl1SK89JpjLeCMpwN+KSGZ8jeFA2+mujp5kIj6+5brmuo9I/1MYHbfFJk3z628dV07iB
 6DPyuS90AIJyvPF4TJPnlccHRT4Au8gh/sB0HjhuOH/v7/ybONf8aW/aJ8QOikZjCHpS
 P1eanwP0KkRAh3s1C7myw1lNaPkcZTulCAeD3vef00nVZ86KtOffwJfQVLUcxk8luVfo
 I8Wj71DiT2Ko7rlpcHreAK7weKcNd57iDUzqLVCMbIgjH3v58SCf5r/oYyKSbyHoQA0D
 dEnA==
X-Gm-Message-State: ACgBeo2YrFsgayne0ruK/TLft4UFljmVUI/IYQ/LQO/pyAjLacySPtv1
 rJljepYrxewlki7bq6jQgc/0OeIVfTyDCQKeLzdfW4eSvm9gz2awNsoXVirc4SbvUdda7lQGErh
 8UzmQ8zm0YJt+ljFPL5TkNWQKCsu2
X-Received: by 2002:a17:907:a424:b0:774:7eb9:9274 with SMTP id
 sg36-20020a170907a42400b007747eb99274mr9635970ejc.301.1662839428939; 
 Sat, 10 Sep 2022 12:50:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6AzNcpJNtfulcwdXuEU6XQeCz0jx8CGxvU3Tk5sCMEbNtu+KZBvxeAIVNbmRtCMTO653znZA==
X-Received: by 2002:a17:907:a424:b0:774:7eb9:9274 with SMTP id
 sg36-20020a170907a42400b007747eb99274mr9635965ejc.301.1662839428732; 
 Sat, 10 Sep 2022 12:50:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a05640213cb00b00447bd64d4f6sm2683802edx.73.2022.09.10.12.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 12:50:28 -0700 (PDT)
Message-ID: <1c320c35-fc93-f95e-5615-5a08412f2c5a@redhat.com>
Date: Sat, 10 Sep 2022 21:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/3] drm/gma500: Fix (vblank) IRQs not working after
 suspend/resume
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220906203852.527663-1-hdegoede@redhat.com>
 <20220906203852.527663-4-hdegoede@redhat.com>
 <CAMeQTsYwrtAwb2_Lj2RyrWCov88Nq=-_tScD5dXC548Fog3X0w@mail.gmail.com>
 <69fc33c6-b6b0-ba98-d2c6-0fb35df63933@redhat.com>
 <CAMeQTsae12K7WzCBQSVoMk5+CO1H6tO=r0iAfsqNo96ekp4SmA@mail.gmail.com>
 <07347903-f8b2-d2ad-4c86-651243a2090a@redhat.com>
In-Reply-To: <07347903-f8b2-d2ad-4c86-651243a2090a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

On 9/9/22 10:45, Hans de Goede wrote:
> Hi,
> 
> On 9/9/22 09:34, Patrik Jakobsson wrote:
>> On Thu, Sep 8, 2022 at 3:39 PM Hans de Goede
>> <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 9/8/22 15:26, Patrik Jakobsson wrote:

<snip>

>>>> On Poulsbo I can see
>>>> interrupts not getting handled during suspend/resume even with this
>>>> patch applied.
>>>
>>> "during" ?  I guess you mean _after_ a suspend/resume ?
>>
>> Yes. I get: irq 16: nobody cared (try booting with the "irqpoll" option).
>> But perhaps the system is just too slow to respond.

So I've just tested on a Sony Vaio VPCX11S1E (Atom Z540 with PSB graphics)
and with my entire patch-set (did not test without) suspend/resume works
fine there without any "irq xx: nobody cared" messages.

Note that on the Vaio VPCX11S1E the gma500 is using irq 18 rather then
16 and that irq is not shared with anything. So I wonder if this is
related to the irq being shared?

Regards,

Hans

