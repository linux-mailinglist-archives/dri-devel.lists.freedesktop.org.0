Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A669050E5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 12:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBC310E1D5;
	Wed, 12 Jun 2024 10:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="k3RFPRy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D610E029
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 10:52:13 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-57c5c51cb89so2809752a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718189532; x=1718794332;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E6MPxmewy2rzUFQmlOJrkbH/x+NttzLgmnHZblt7KQw=;
 b=k3RFPRy0vbmCnyPnn5eukqwLYuEtbqJtF+oR0Zty3/s1LfenI5f55Fdh5vxLFk3CSF
 BKLbuB7wCHjaVmQanBdeV6X0FuuOo23eND1J5Z5YSc3MKbMkEcbfBJOFurMMIdVHx0Yy
 hQpxDhDFNbsrjmdRfpupQrrcjYmOCD3Xk2x+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718189532; x=1718794332;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E6MPxmewy2rzUFQmlOJrkbH/x+NttzLgmnHZblt7KQw=;
 b=dG8CPazEIn1J9zhRhNciNENUJaWLWn6jn2i0slgl79w5yMiD1YwaNkHDmvcTjbR9oN
 IYiIVfPHSRT3O38oz2qKVycnnTJRycNFgx76btMqxU4M6ZKY2ynXscVxoivToUGGL/2k
 HuqaoYh3Tc1OMnZLwo2z3qGXHi1slcadH+ucYWmo4qGAQPy/Ta4eIbQNRvE5uI//Iyz4
 5wWBZZ0nuTaW44ccbU2NILYN9/DZRXurcQ1ytyw1BTXelUePmcop7wTevuNObRoGyjf2
 HOVvaZbV9MDbr26BSKbgC6o/FGo7LA+uZDx3U2yooWPrfyUU7Ew/J+LuLX0okogoJrRu
 FM1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMWeUBkmfjEdWJ8LvX77/W6fntHYiHpmvvwRPeRAyfoq695x/YOm5OvrgDnxgljfza2bum8M4MijqM3jhqbEGbGliyriI4GM0rMu4+h7vA
X-Gm-Message-State: AOJu0YzUw73J+Tc4o0BU4nrnPkdw7OtzeT0cbMJHXD6lnQU53c2496zb
 v2k/3aamyT1kEQsogKNX9EkmXG27NsRBCf//ptdyKu6qrPwohuypyMNUJ6l3Zn0=
X-Google-Smtp-Source: AGHT+IFfCRKJRMcbUH5qfrKKOkYtaHlyonkY0ClilIy1hEERijM3zlnyXXu+sq7zhj5tCMRx6eEdRQ==
X-Received: by 2002:a50:8e5d:0:b0:57c:6ae2:abda with SMTP id
 4fb4d7f45d1cf-57ca9743b46mr1353827a12.5.1718189531660; 
 Wed, 12 Jun 2024 03:52:11 -0700 (PDT)
Received: from [192.168.1.83] ([85.148.28.6]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c81c243b5sm5225020a12.34.2024.06.12.03.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 03:52:11 -0700 (PDT)
Message-ID: <92dd137a-73a8-4e0f-b86d-e712230493e5@amarulasolutions.com>
Date: Wed, 12 Jun 2024 12:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] devres: Refactor using guards
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, rafael@kernel.org,
 dri-devel@lists.freedesktop.org, trivial@kernel.org,
 linux-amarula@amarulasolutions.com
References: <20240611093710.1066510-1-andrea.calabrese@amarulasolutions.com>
 <81e1972e636a2d81f34de059a24ac27133da4bb0.camel@pengutronix.de>
 <a2a51ff4-f369-4ed3-b3bd-373fbb590424@amarulasolutions.com>
 <2024061221-italicize-slideshow-015f@gregkh>
Content-Language: en-US
From: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
In-Reply-To: <2024061221-italicize-slideshow-015f@gregkh>
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

Hi Greg,

On 12/06/2024 12:05, Greg KH wrote:
> On Wed, Jun 12, 2024 at 12:00:06PM +0200, Andrea Calabrese wrote:
>> Hi Lucas,
>>
>> On 12/06/2024 11:26, Lucas Stach wrote:
>>> Am Dienstag, dem 11.06.2024 um 11:37 +0200 schrieb Andrea Calabrese:
>>>> Code refactoring using the recent guard and scoped_guard macros
>>>> for automatic cleanup of the spinlocks. This does not change the
>>>> effective behaviour of the kernel, but guarantees a cleaned-up exit from
>>>> each lock, automatically avoiding potential deadlocks.
>>>>
>>>> Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
>>>>
>>>> ---
>>>> Changed commit message from V2. Also changed title, shortened the file
>>>> name.
>>>>
>>>> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
>>>> index 3df0025d12aa..a98720e0cb2b 100644
>>>> --- a/drivers/base/devres.c
>>>> +++ b/drivers/base/devres.c
>>>> @@ -194,14 +194,12 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
>>>>    {
>>>>    	struct devres_node *node;
>>>>    	struct devres_node *tmp;
>>>> -	unsigned long flags;
>>>>    	if (!fn)
>>>>    		return;
>>>> -	spin_lock_irqsave(&dev->devres_lock, flags);
>>>> -	list_for_each_entry_safe_reverse(node, tmp,
>>>> -			&dev->devres_head, entry) {
>>>> +	guard(spinlock)(&dev->devres_lock);
>>> This is not equivalent to the current code. You are dropping the
>>> _irqsave part of the locking scheme, totally changing the semantics
>>> here. This issue is present in multiple places in this patch.
>>>
>>> Regards,
>>> Lucas
>> I don't see where is the issue here, as I am using both guard and
>> scoped_guard similarly to how they are used in drivers/gpio/gpiolib-cdev.c,
>> which I took as a reference for the usage of the construct. If so, probably
>> we may  both be using it wrong.
> Look at the difference between calling:
> 	spin_lock(&lock);
> and
> 	spin_lock_irqsave(&lock, flags);
>
> They are functionally NOT the same.
>
> thanks,
>
> greg k-h

Ouch, I saw it now... I will fix it and send a V4.

Thank you!

Andrea

