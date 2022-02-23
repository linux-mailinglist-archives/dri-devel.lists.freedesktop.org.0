Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB04C197D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 18:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C4010F274;
	Wed, 23 Feb 2022 17:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA7810F273
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 17:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645636072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/lDTI0t8i1/9SFZQVCSdA4ArXAFqxYpZ/S4YM79am4=;
 b=a2HcX/Mr+u0yvCBj3OIOE4UjYukz4bhtqDwafnRuLbk8MfSQGnLc0jgnyxDegav8o0GCmh
 1yk0FcOidDYn/UN0srXKrngiOTxmL5l8DtK6vpDERjVm0OrwYTcbxq1jFHt5z8vMCoA25V
 kEZA80J1gybsEJuA+snDqZorlrAJXa4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-ElvGvIYiPrelxt7TuxTdig-1; Wed, 23 Feb 2022 12:07:51 -0500
X-MC-Unique: ElvGvIYiPrelxt7TuxTdig-1
Received: by mail-wr1-f71.google.com with SMTP id
 c16-20020adfa310000000b001ed9cd8f4c7so1758722wrb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 09:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Y/lDTI0t8i1/9SFZQVCSdA4ArXAFqxYpZ/S4YM79am4=;
 b=eJZTMNCiWcx9TvkGnzEu0dS8/IUEzSHTCWSsDFdagoEOaS+oL+paHzHSBl3HDciuAC
 8wNsoTgmQHDaJfag7xanoDbQbDmEVhZd7rDR5YEfFCIScps5urXTGkEBC4L0+CnJEAlZ
 DBwXaXTjxzKB5NbkjEg4LsK26428CjcF6mumqy/QC34CEb0iOMgwRxnCsh4jhg6alhke
 onbNqNhiDXB4p4KM4h1lqFe3eEmWM1wSg2rBn8Fh+us/K/e9khwcXk2rfrNDB3ibCnNV
 EKuXuBJBodXWsFFoLpJMM8nNw/RU09G16xyLi0SJirW2eRmUimUFHY7V6NHBuxmfzoty
 9a6w==
X-Gm-Message-State: AOAM532Wj0N7sYORDfZ2mMsCPHZXo6mxFqDn7t5Vut3tc75V1MfhZBrV
 G3WtR94LPdtZCbiGLtG2uuM3wjZVM73Ln3qsVaC6q7FW6zjY7gXgm67eTNwnkbvFqkEPrk9ue1X
 JpR84vZtUmNIgsHC2Bztbw7ftkLpT
X-Received: by 2002:a5d:6d8c:0:b0:1ea:7d52:c05c with SMTP id
 l12-20020a5d6d8c000000b001ea7d52c05cmr419030wrs.663.1645636069894; 
 Wed, 23 Feb 2022 09:07:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKZR4WkrB+FwsLwgzEloqYu3XoJEbjd0+5Z1wDhDJLU+YlKf5ciM8sXEoYOr7Uc1PYibAXgw==
X-Received: by 2002:a5d:6d8c:0:b0:1ea:7d52:c05c with SMTP id
 l12-20020a5d6d8c000000b001ea7d52c05cmr419005wrs.663.1645636069646; 
 Wed, 23 Feb 2022 09:07:49 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id j10sm102001wmq.20.2022.02.23.09.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 09:07:48 -0800 (PST)
Message-ID: <15d5a0ce-ca58-e670-99e4-a79e07a0fe22@redhat.com>
Date: Wed, 23 Feb 2022 18:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
 <33b80f9c-d54a-5471-a58b-7a783a7a9e5b@redhat.com>
 <20220223164528.GE3113@kunlun.suse.cz>
 <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
In-Reply-To: <f832a836-b6ee-ffc5-6f83-86c9ba475400@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Simon Trimmer <simont@opensource.cirrus.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/22 17:54, Javier Martinez Canillas wrote:
> On 2/23/22 17:45, Michal Suchánek wrote:
> 
> [snip]
> 
>>>>
>>>> To enable use of VESA modes with simplefb in legacy BIOS boot mode drop
>>>
>>> I think you meant "VESA modes with the sysfb driver" ? or something like
>>> that since otherwise it seems that you meant to use it with the simplefb
>>> (drivers/video/fbdev/simplefb.c) fbdev driver, which doesn't support the
>>> "vga=" param as far as I understand (it just uses whatever was setup).
>>
>> And the vga= is whatever was set up by the realmode code. And the config
>> option for realmode code to do that is selected by vesafb and not
>> simplefb so it does not wotk for simplefb/simpledrm/whatewer when efifib
>> is not built into the kernel.
>>
> 
> Yes, that's what I tried to say. But your commit message says "To enable
> use of VESA modes with simplefb in legacy BIOS boot mode" and that isn't
> accurate AFAIU (unless you meant sysfb instead).

In fact, probably the subject line should also be something like following:

firmware: sysfb: Enable boot time VESA graphic mode selection

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

