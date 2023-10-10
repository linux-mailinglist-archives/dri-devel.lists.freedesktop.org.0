Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE57BF629
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 10:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCC810E329;
	Tue, 10 Oct 2023 08:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A599F10E329
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696927134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n//jsDJfypoE/LOiLD/tH7GoyXaKfj2A1kjaWCaSoa4=;
 b=CfaefVF4zsFKBAcFjtJsn0Izn7c/tqh7m7YdAbCPs7fUwoIYhUHd6t9wHw3U2qEVZBKcK0
 3JaZFBO3NWmOw1jIIzmJApfj4BBIfzEJBgvwdvNrnh7+aCDrxSl99qjqLCLJA+exZppu8e
 Inm8932vU88+m1H0CfXeHiq1t/Wy7TQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-gKwkVboIOm-4tKwngQqPtg-1; Tue, 10 Oct 2023 04:38:53 -0400
X-MC-Unique: gKwkVboIOm-4tKwngQqPtg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-405917470e8so40842135e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 01:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696927132; x=1697531932;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n//jsDJfypoE/LOiLD/tH7GoyXaKfj2A1kjaWCaSoa4=;
 b=DzPoVaOuyU0Tmv5J3p7qEiGIOe9EYcdNL6LT1LkhB70SMoVKSogbW5kaHYaBSLcOx5
 K4xbs+FyFeed5xhpF5EiYcvAVUQLM7vdvQbHbLSiwwHrvlF1ss7Z8UgzrR4XUDFGie/o
 hI/K8WI8Go2or0TyN+/zfaGbDcYjfORi4WFAN795QKR2sGWbsNrGemsM83kD2y7klcsR
 JWwJcAiY3FOZfBZF2f0W1Xf0CDe07aWm5h3ksPiPZeSNJF6g7HsdR4UNzJ8EweCDEHkA
 D0BP3Ci3xD1L2yNlL4+kaOeOjc5rscRTbj4FtiCHsZAGXlhjQ/A+ojXvGvc7ihvQ9mRU
 /Yqg==
X-Gm-Message-State: AOJu0YyzLUAm89uiVoRGNPuPAVXtWOag3UP/vGUQe3tWHFUvukQ029+T
 nZ4R64EX3ssS9+QxpPGOs3RiJeeGo4rt7RDpwoQPVOjhyrxqO7XIHgzcHcFznnEUW9CAxNE2PlT
 KUJfvcHR1R6RABF5aJeAXqrsGq6m2ZCOkwW+h
X-Received: by 2002:a05:600c:220b:b0:406:7029:c4f2 with SMTP id
 z11-20020a05600c220b00b004067029c4f2mr15142592wml.26.1696927132138; 
 Tue, 10 Oct 2023 01:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxPcuYqMPw8109qxsMV7LN4jYO5X+gVGkVFnZppMIRXqHgr44a7fh+Ud+Q6ZZnEL2EottGHQ==
X-Received: by 2002:a05:600c:220b:b0:406:7029:c4f2 with SMTP id
 z11-20020a05600c220b00b004067029c4f2mr15142575wml.26.1696927131818; 
 Tue, 10 Oct 2023 01:38:51 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcc8f000000b003fee6e170f9sm13447886wma.45.2023.10.10.01.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 01:38:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/8] drm/solomon: Rename ssd130x driver to ssd13xx
In-Reply-To: <now7afxcqtkizrxy45t5lmit4kpwkoxkogbhgnflje2frspnas@dh65qao7fhfm>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-2-javierm@redhat.com>
 <now7afxcqtkizrxy45t5lmit4kpwkoxkogbhgnflje2frspnas@dh65qao7fhfm>
Date: Tue, 10 Oct 2023 10:38:50 +0200
Message-ID: <87cyxm50th.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

Thanks for the feedback.

> Hi,
>
> On Mon, Oct 09, 2023 at 08:34:15PM +0200, Javier Martinez Canillas wrote:
>> The driver only supports the SSD130x family of Solomon OLED controllers
>> now, but will be extended to also support the SSD132x (4-bit grayscale)
>> and SSD133x (16-bit RGB) controller families. Rename driver to ssd13xx.
>> 
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> I'm not sure it's worth it. I understand what you want to achieve, but
> this will create conflicts, affect the configuration of everyone
> enabling that driver, etc.
>
> And we have plenty of drivers that don't match all the devices they
> support anyway.
>

Yeah, I was on the fence and even discussed this with others. I'm OK with
dropping this patch if the agreegment is that isn't worth it to make the
name more accurate.

> Plus ....
>
>> @@ -11,10 +11,10 @@
>>  #include <linux/i2c.h>
>>  #include <linux/module.h>
>>  
>> -#include "ssd130x.h"
>> +#include "ssd13xx.h"
>>  
>> -#define DRIVER_NAME	"ssd130x-i2c"
>> -#define DRIVER_DESC	"DRM driver for Solomon SSD130x OLED displays (I2C)"
>> +#define DRIVER_NAME	"ssd13xx-i2c"
>> +#define DRIVER_DESC	"DRM driver for Solomon SSD13xx OLED displays (I2C)"
>>  
>>  static const struct regmap_config ssd130x_i2c_regmap_config = {
>>  	.reg_bits = 8,
>
> ... We now end up with a lot of inconsistencies where some things are
> called ssd130x and others ssd13xx.
>

Yes, but I fix that in patch #2.

> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

