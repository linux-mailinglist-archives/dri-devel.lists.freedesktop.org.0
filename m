Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB73393E5E
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 10:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36546F589;
	Fri, 28 May 2021 08:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C696F589
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622188989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0IXbcSm8mT+lhuVdC+CT+mjkkm7+PBeCbiBVe/0dKys=;
 b=Hmqw1AX7S4zXvvDEq7bHmAyX0gvtM9YfkZOYDL0Mv6CnmA16va4hEKEh4/DTTx8wjAQDSO
 68OR8uw+M607F+nmDTTjpn5VWgQiJtp4fbpsk/5q7YzHn7CuoCyYmZLil7Nm4B+DJR6cXq
 pQx6k9qng0oApZpQE8HhGd7OsLs2h6o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-T-_iBUQnPTKy6O4TEy1Dlw-1; Fri, 28 May 2021 04:03:07 -0400
X-MC-Unique: T-_iBUQnPTKy6O4TEy1Dlw-1
Received: by mail-wr1-f71.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso692629wrc.23
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 01:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0IXbcSm8mT+lhuVdC+CT+mjkkm7+PBeCbiBVe/0dKys=;
 b=pkSuDEtspdIaqWcx95DuE5EsT/XwoPtGfBv7de3OaH1Uzn9ZmVuALDA1PYyMeh5+qB
 LsKIXmd8lIOEJcSJw1mWgeF8HaCh3hSyJNTZv0z7E/vDMHvWGdA5m4QqAUQWmCmveLmM
 zPEqpxd5tlbHY3ur745hP0DcZmIU2AZlbVOk8gLtzzqjc8IK2uKxXILEKH/cuFKN6Zi3
 yW7Hyf/GczJouqX4R/IPNyyklSg9q/8NHrfWdlknPRxCeg13rXl9yueJqI1+ff7ys+kH
 Av7pdakrgn0ORGTJsH7yJXIE+spqjPBAXj6qEQFz/H/b40Ni0wnVPPBr+aTjIird7VaR
 vmOA==
X-Gm-Message-State: AOAM531b/XVeoubL9sHzgjuduRJYYEkoyj1gVfqaTqlz+Vezb1Jcq4Aw
 IH3s6+E3CioYAcXNsF8/GKcRNm7IyzsIkAkmfwsRzMMvES0AeobqCMahAIz6lX9RHP7eq1eWHXV
 Sq7ncjkZ+S369/178fbBGv7an8tYZ
X-Received: by 2002:adf:fdce:: with SMTP id i14mr7029840wrs.303.1622188986614; 
 Fri, 28 May 2021 01:03:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+e8iRBOPicMDS91UKoWmjw1Ow4Oln/9p2aaPMHWdMTZ3KKJsPjuaTgqaOu1DwibvjoXOU8Q==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr7029814wrs.303.1622188986368; 
 Fri, 28 May 2021 01:03:06 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q20sm2949464wrf.45.2021.05.28.01.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 01:03:05 -0700 (PDT)
Subject: Re: [PATCH 2/2] drivers/firmware: consolidate EFI framebuffer setup
 for all arches
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20210521193704.3042024-1-javierm@redhat.com>
 <e23a44ba-5e9d-d27b-b5e8-0cce3b158ed7@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <c6c6b686-6e13-2f1a-0310-b558428304c1@redhat.com>
Date: Fri, 28 May 2021 10:03:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e23a44ba-5e9d-d27b-b5e8-0cce3b158ed7@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Robinson <pbrobinson@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/22/21 7:14 AM, Thomas Zimmermann wrote:

[snip]

>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -127,6 +127,7 @@ config ARM
>>   	select PERF_USE_VMALLOC
>>   	select RTC_LIB
>>   	select SET_FS
>> +	select SYSFB
> 
> Don't select this as part of the architecture. Rather make an option for 
> SYSFB that depends in the architectures that supports it.
>

Thanks a lot for the suggestion! I did this by making SYSFB's Kconfig option
to be default y and depends on the supported architectures as you mentioned.

This not only is a cleaner approach but also will allow to not touch all the
architectures platform code.

I'll wait for a few more days in case someone else has feedback and post a v2.
 
> Best regards
> Thomas
> 
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

