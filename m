Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6780079A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949BF10E0B5;
	Fri,  1 Dec 2023 09:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188F110E0B5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701424568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AMatjIHd9Tk5Na8CUQZIbQMvS/gfCHln8w3M8+88Qnk=;
 b=J2Et+lPtpL2sBn5140h8FwzZaS1/3V1AehNVlYI9AlaGjfQZB8pcXfEGQKIAxuOJ8W910v
 uvttP6FSV4xhtKcwDiwVeiLlqX4J9PR3pXUcbDi1Rt47WsHQ4a8XX+ZCEraJ44CN+y+tEg
 H0PK+HibkHYa6llnZAckomGQfpYJCGg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-Jdkuv8SPNaag5Gwni0UAUQ-1; Fri, 01 Dec 2023 04:56:07 -0500
X-MC-Unique: Jdkuv8SPNaag5Gwni0UAUQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-332ee20a40fso1539351f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 01:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701424566; x=1702029366;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMatjIHd9Tk5Na8CUQZIbQMvS/gfCHln8w3M8+88Qnk=;
 b=T0SbwsjaYG7mEUA/zMCsvM8IqQqWX0aAijh8b+S+MqB2RO6wvA99jf9YsqfBtUv47Q
 wVee1HBeW0HfLZ6CT5YVi4Ik3mEeCfHX22xdPnntjkYO33mT49+wA3cmv5vnZahEn9rg
 FQMW8jT2dOZoFy7sgEhqPhmC6NxDCtmcy2PmW2Y0z/dQekTtDm+gUTWXTb3r5HCTx/dg
 kWE6QndEvdvO8v0gvMt9ieTk5sT8+4iyRNqEiPt3xDA3rgwKXNXVxeyInOToI10Hzwtm
 QwF3TtC3eami92IJyX0eJbrfpUONlYZI6vXgW3umOmn6mIH+LlV10JkuG0QOmkOf4I91
 yS1A==
X-Gm-Message-State: AOJu0YxOu0cCEDv8uwgpKgGO8fc7HXtcaawkassqywSIO6Ckq7bB9Y25
 0THVL5X2g7i/wG9GcCBI2kGGt8P46/NvHnuiqSXzA1ZfxX5o9b8/Q5bvqu7qzg4pKPfoAsHsngr
 E6Y+B2StGByrwnnPUEY2BwxpuHUd/
X-Received: by 2002:adf:e70e:0:b0:332:c094:fc58 with SMTP id
 c14-20020adfe70e000000b00332c094fc58mr644386wrm.40.1701424566516; 
 Fri, 01 Dec 2023 01:56:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOONX2od7XFZM01C8VjH7MXuBsNPzwhtbrogLN8ZS6GbUumONwXuzXa+GOeKq9RswpItpBaQ==
X-Received: by 2002:adf:e70e:0:b0:332:c094:fc58 with SMTP id
 c14-20020adfe70e000000b00332c094fc58mr644378wrm.40.1701424566231; 
 Fri, 01 Dec 2023 01:56:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q13-20020adffecd000000b0033334410d01sm254018wrs.36.2023.12.01.01.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 01:56:05 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, pjones@redhat.com
Subject: Re: [PATCH 2/4] fbdev/efifb: Use screen_info pointer from device
In-Reply-To: <cf8d6ea2-e725-4794-a40c-206e53785a29@suse.de>
References: <20231129155218.3475-1-tzimmermann@suse.de>
 <20231129155218.3475-3-tzimmermann@suse.de>
 <87v89il2vj.fsf@minerva.mail-host-address-is-not-set>
 <cf8d6ea2-e725-4794-a40c-206e53785a29@suse.de>
Date: Fri, 01 Dec 2023 10:56:05 +0100
Message-ID: <87il5ixn4a.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier
>
> Am 01.12.23 um 09:54 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Use the screen_info instance from the device instead of dereferencing
>>> the global screen_info state. Decouples the driver from per-architecture
>>> code. Duplicated the screen_info data, so that efifb can modify it at
>>> will.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>> 
>> [...]
>> 
>>> +	si = dev_get_platdata(&dev->dev);
>>> +	if (!si)
>> 
>> I would add a comment that this platform data is set when the device is
>> registered by sysfb.
>> 
>>> +		return -ENODEV;
>>> +	si = devm_kmemdup(&dev->dev, si, sizeof(*si), GFP_KERNEL);
>>> +	if (!si)
>>> +		return -ENOMEM;
>>> +
>> 
>> Why a copy? In any case maybe the global screen_info should be duplicated
>> when is set as the device platform data in sysfb_init() ?
>
> We get our own copy of the global screen_info as platform-device data.

Ah, I didn't notice that platform_device_add_data() already did a kmemdup().

> Efifb modifies some of the values in our copy in efifb_setup(). If 
> probing afterwards fails, the kernel might try a different driver, which 
> would then operate on the values modified by efifb. Hence, there's this 
> internal copy. The situation with vesafb is similar.
>

I see what you mean. I was thinking that the same device coulnd't be match
to a different driver anyways but it's true that a fail to would make that
possible.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

