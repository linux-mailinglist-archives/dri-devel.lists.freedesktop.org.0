Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B09976228
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E03710EAE5;
	Thu, 12 Sep 2024 07:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PhVzEHVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6CC10EAE5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:08:04 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so287721866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726124882; x=1726729682;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xZKbfHe/Y7RlXZ/W3t1cweBaPU+ICS2PqyHDJekyF60=;
 b=PhVzEHVQ80kT6wWTYoSXhHjQMML49W5U2+K20cUi0feufShstg743YhDenTyWs8CGI
 JcvanOMeVrPbnDMEZPfrdo4pSEc4QqVjxUqZE5AZAxYSYABtArf1lTgZYuqEYOZTvwMu
 LNfNZduizTpUPnEDt078Q6xPHnynpPAsnY8GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726124882; x=1726729682;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xZKbfHe/Y7RlXZ/W3t1cweBaPU+ICS2PqyHDJekyF60=;
 b=cxBBv0rs7GdZ47t3ekNX6r4og6EOKjfEd/mK91dDyP36eBFnTnBsZEFMT2UJpA8DGC
 6l6AwMnAtFoRfNSGPWh18ldLxQRkW2Y7BeIF3sRDS504bPR8QqkKDQ+KrxRpym3GoKkr
 RUciwzxG77QPJVbT7ut12Bp/Jxa1qP6MNXeTkD69a7IO967mAkt/DMhwekM7ekVibgKQ
 qRmJIVK7wSGRGkX64IU7z55PHoj+Id7wbup0lDuQ421zEk4Wtot7wXH2MuzD5IPUkLns
 icSRvEZm7xW7HsDvLkJ0COEEd4XWXufWVIMIoNCDq44NawqcZS+2pqmmO9+R/Fkl3Dgj
 ajug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF/aw1XUnYviQPuVoZO/qV1V610tFRWiDDjDgWaVSmKvRBHzCfChZW8AkK0LELEQujTIrXw/F1qTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI4O03bRX5LZ9albdpyMIh/uDtUuKvAzvS6KdLmh3OPGpyXPE5
 h6AGAXgPmEA39duxNLSFv3iUV7l8CBMP1CaQd6ZRtcu8MdBFMGvtgSsGAOeK7PY=
X-Google-Smtp-Source: AGHT+IGHISnlSNhHeoc3GINqKa3Em67GuB645weeVsFGNyNWVqPoHRyIMev8KPgsvWvCx3HsS6rbAA==
X-Received: by 2002:a17:906:fd8b:b0:a75:7a8:d70c with SMTP id
 a640c23a62f3a-a902a3d186bmr179232666b.4.1726124882308; 
 Thu, 12 Sep 2024 00:08:02 -0700 (PDT)
Received: from [192.168.1.37] ([95.236.207.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835d87sm708853866b.6.2024.09.12.00.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 00:08:01 -0700 (PDT)
Message-ID: <7268ba61-bff1-483f-a64a-c93dd14193e8@amarulasolutions.com>
Date: Thu, 12 Sep 2024 09:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4] devres: Refactor using guards
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dri-devel@lists.freedesktop.org,
 l.stach@pengutronix.de, trivial@kernel.org,
 linux-amarula@amarulasolutions.com
References: <20240910131520.150610-2-andrea.calabrese@amarulasolutions.com>
 <2024091122-batboy-grumpily-520f@gregkh>
Content-Language: en-US
From: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
In-Reply-To: <2024091122-batboy-grumpily-520f@gregkh>
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

Hello Greg,

> On Tue, Sep 10, 2024 at 03:15:21PM +0200, Andrea Calabrese wrote:
>> Code refactoring using the recent guard and scoped_guard macros
>> for automatic cleanup of the spinlocks. This does not change the
>> effective behaviour of the kernel, but guarantees a cleaned-up exit from
>> each lock, automatically avoiding potential deadlocks.
> The "guarantee" is there today, right?  So this isn't really anything
> other than a "convert to use new apis", right?
Basically, yes. That is why I thought it was trivial...
>
> If so, I need to see a LOT of verification that the output is the same,
> and that it has been properly tested.  Converting working code for no
> real reason other than "let's change this!" isn't always a good idea.

I agree that this has to be tested more. Right now, I tested it on my
laptop, on virtme-ng and qemu and had no problem. If you have any
suggestion on increasing the number of tests, I will test it also on that
(the more, the merrier).
Regarding the "let's change this", well, I thought it had to be done at
some point, since the API for RAII-like declarations are all there.

>> Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
>>
>> ---
>> Diff from V3: as Greg KH and Lucas Stach noticed, there was a
>> behavioural change between the two versions: I used guard(spinlock),
>> while the expected behaviour should have come from a spinlock_irqsave
>> guard. This has been fixed.
> No diffstat?
Diffstat should be:
devres.c |  109 
+++++++++++++++++++++++----------------------------------------
1 file changed, 40 insertions(+), 69 deletions(-)

sorry for not including it (although the patch was generated 
automatically...
oh well).

Best regards,

Andrea Calabrese
