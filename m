Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A666E75E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 21:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AE210E1B8;
	Tue, 17 Jan 2023 20:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA310E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673985861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzwnjP64jKMnxG92NfKkitU4148esuOMPr7a584cgLk=;
 b=WGD2KmOwXQFRSpUO8M3IN1OsOacaEaemEn9l1+oO+I0+NrVww0iTO4eWpC50u4KyDitmXR
 +w+qV6FTMIGHioYethrHALB/tqGh9Zl8LKP8zZWzTDrye6pKx8jZ4nULjRTUipgKWWftcB
 hzw2zoTDqi0vlkNbN7/z+xu5AlA1VPk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-8BcnpxjHM_mQYXoMHNAqEg-1; Tue, 17 Jan 2023 15:04:18 -0500
X-MC-Unique: 8BcnpxjHM_mQYXoMHNAqEg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c14-20020a05600c0a4e00b003db0fc4cfe6so203608wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 12:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzwnjP64jKMnxG92NfKkitU4148esuOMPr7a584cgLk=;
 b=oquqCVLOYHEgVHOn2Yr11qKcnzGaELZOTAydYeotuxbPlGDqV9S9IxjV4bO3MZ90f4
 4KrE2GwyymHlcOQ6EnAbEF2m/V9Wfo+rUBVljbqgSJ3tb2i5BPIweSLaboRgVIaQUOyQ
 esNQ5uX8bRCswjQFXrt6BSJpE7UvpbVrTfuxJsdcNdR9Zlfm2l0TJWpuZVkMAM7mP8Qz
 9jnqNwm0q0Sv/9ReEygQM9MP4dzPG05ifpXZ1iRO/4HatY5SFfn7QYFMiKqCBehj603w
 zpHOI3LjcLaYKwah0UoCk5wGC2VVx2ETLObzc/9yLpy3kE/yCD58cghzadCESDqDs695
 etcg==
X-Gm-Message-State: AFqh2kpy6bvzeS5l6YR/gMCnWbyO/9kDVYYhzYJ/z7MTmzgpiTRLjmD5
 HzUCffkpG6kBvVMQbEuvS52YGZd2Dw2GLGAJ5TMHlzKb0U7yIfCt96zpeFSHA2N0Wm2Zqr1i7dY
 bGY44l/JC/msxeu0BGFAj/pHgt45O
X-Received: by 2002:a05:600c:4b06:b0:3da:fdf6:6a59 with SMTP id
 i6-20020a05600c4b0600b003dafdf66a59mr75364wmp.33.1673985857058; 
 Tue, 17 Jan 2023 12:04:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuIpUpkEp1rT4yuT2zy4Jbbp9JpTBEf3SA3uw7zXp5dsbH8kudKBX3Hqk6N1uroDz//cIJZHg==
X-Received: by 2002:a05:600c:4b06:b0:3da:fdf6:6a59 with SMTP id
 i6-20020a05600c4b0600b003dafdf66a59mr75351wmp.33.1673985856802; 
 Tue, 17 Jan 2023 12:04:16 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003d974076f13sm40500906wmo.3.2023.01.17.12.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 12:04:16 -0800 (PST)
Message-ID: <077a3ecf-c0e1-7b77-7b46-1acfef734769@redhat.com>
Date: Tue, 17 Jan 2023 21:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm: panel: visionox: add backlight dependency
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@kernel.org>
References: <20230117165522.2104380-1-arnd@kernel.org>
 <CACRpkdb0rA8DmiGj79f6+6qOCChUuQrYzmQ+Yjk6BxeBzjM4_A@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CACRpkdb0rA8DmiGj79f6+6qOCChUuQrYzmQ+Yjk6BxeBzjM4_A@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Ondrej Jirman <megi@xff.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/17/23 19:22, Linus Walleij wrote:
> On Tue, Jan 17, 2023 at 5:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
> 
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The newly added driver uses the backlight subsystem but is missing the
>> corresponding Kconfig dependency:
>>
>> arm-linux-gnueabi-ld: drivers/gpu/drm/panel/panel-visionox-vtdr6130.o: in function `visionox_vtdr6130_probe':
>> panel-visionox-vtdr6130.c:(.text+0xdee): undefined reference to `devm_backlight_device_register'
>>
>> Fixes: 65dc9360f741 ("drm: panel: Add Himax HX8394 panel controller driver")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Patch applied, thanks for fixing this!
> 
> Yours,
> Linus Walleij
>

Thanks Arnd and Linus for fixing this. Sorry that I missed it
while upstreaming the driver.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

