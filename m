Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3366479A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 18:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B08910E631;
	Tue, 10 Jan 2023 17:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EFC10E631
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673372609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8Y3pexWhwKnwismKyLBmb21oGlkflU/IM7CX+KUhW8=;
 b=jO/cmpEmKhmHbYlcJte7zCu4vVSWU7WufP6VvHLAlFjEusiBipbaS5xUlnVQzkNkKqbkVj
 t1/z7kWV+tZVtEo14/Lo4x/glGDSnMH7yvjHYuNnrtjm6dDgSLnzO5+NDX/kgUw5L3o134
 Z+gg04VYcXeEDjk1E6d1bfxsguJO8Jk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-YUr8_lwjMcWcoU3ZUa5iQg-1; Tue, 10 Jan 2023 12:43:28 -0500
X-MC-Unique: YUr8_lwjMcWcoU3ZUa5iQg-1
Received: by mail-wr1-f72.google.com with SMTP id
 t2-20020adfa2c2000000b002bbdae91832so1743512wra.21
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c8Y3pexWhwKnwismKyLBmb21oGlkflU/IM7CX+KUhW8=;
 b=Tryq3e9HQaNijG5e1LoWudtdHBmnjDC3jjPz+ByREXgz7OULa2lFHUmbnaMWWPwnnZ
 FUdM13c/kMw1tmfwXch9w4EPmp2llX9Zzs0glVspEVrwlvAIQgHNyeHgSysOxPJ7lu4p
 T6R3YQVZmQ5wg+nsV7fyUemfRz9FlLHT9VQIoip3cyG3thFKsMhwFHRksZuinF4Nrdiy
 wAsctDx2hSvdRuTjBZUT1MocHaswbQhUQSJAofiR/Zoi4KESDVNnlK/p3PhY7OinsWzu
 3GZqNGq/ddvowj3TJxHBeQHZjIbDKsfw7B1M5PqhRNMRFVT7IeW+mIRdebd2evmFm1W+
 ucMg==
X-Gm-Message-State: AFqh2kp+mebk6N2sMryamB7nKVeidX9lfVo08conYvKhSHlf8j1QqSgd
 aaPeY/ttiQFccNPrYyGi904jSQSY9eChsFHgop7PMexGYW5HmyvoLoF5bg7NUgHEbfdhaLiO/qo
 MPhBgvD2ExBehldY8esd44NRrc3My
X-Received: by 2002:a05:600c:3485:b0:3d1:ee6c:f897 with SMTP id
 a5-20020a05600c348500b003d1ee6cf897mr50288327wmq.3.1673372607715; 
 Tue, 10 Jan 2023 09:43:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxU+5jK6DCKCFcOjrGESz1FsScmmigeVbnmUI9PNQjGsaat4nrYN0f6poWVOX7lRHhoUaFUg==
X-Received: by 2002:a05:600c:3485:b0:3d1:ee6c:f897 with SMTP id
 a5-20020a05600c348500b003d1ee6cf897mr50288302wmq.3.1673372607455; 
 Tue, 10 Jan 2023 09:43:27 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002238ea5750csm13837334wrx.72.2023.01.10.09.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 09:43:27 -0800 (PST)
Message-ID: <7a61ea5f-c6e0-1f6b-fc5c-40bdf2c6293e@redhat.com>
Date: Tue, 10 Jan 2023 18:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm: Drop ARCH_MULTIPLATFORM from dependencies
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
 <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
 <20221210092155.elcuvcbb4ukktxjp@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221210092155.elcuvcbb4ukktxjp@pengutronix.de>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/10/22 10:21, Uwe Kleine-König wrote:
> Hello Arnd,
> 
> On Fri, Dec 09, 2022 at 11:53:49PM +0100, Arnd Bergmann wrote:
>> On Fri, Dec 9, 2022, at 23:05, Uwe Kleine-König wrote:
>>> Some of these dependencies used to be sensible when only a small part of
>>> the platforms supported by ARCH=arm could be compiled together in a
>>> single kernel image. Nowadays ARCH_MULTIPLATFORM is only used as a guard
>>> for kernel options incompatible with a multiplatform image. See commit
>>> 84fc86360623 ("ARM: make ARCH_MULTIPLATFORM user-visible") for some more
>>> details.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>
>> Makes sense,
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Thanks. (But honestly I'm not surprised you agree to this patch after
> our conversation on irc :-)
>

This makes sense to me as well, but it would be great if someone else
from DRM can review/ack before pushing it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
  
>>> diff --git a/drivers/gpu/drm/omapdrm/Kconfig 
>>> b/drivers/gpu/drm/omapdrm/Kconfig
>>> index 455e1a91f0e5..76ded1568bd0 100644
>>> --- a/drivers/gpu/drm/omapdrm/Kconfig
>>> +++ b/drivers/gpu/drm/omapdrm/Kconfig
>>> @@ -2,7 +2,7 @@
>>>  config DRM_OMAP
>>>  	tristate "OMAP DRM"
>>>  	depends on DRM && OF
>>> -	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
>>> +	depends on ARCH_OMAP2PLUS
>>>  	select DRM_KMS_HELPER
>>>  	select VIDEOMODE_HELPERS
>>>  	select HDMI
>>
>> Since the original purpose of the ||ARCH_MULTIPLATFORM was to allow
>> building the driver on more targets, I wonder if we should instead
>> make that ||COMPILE_TEST, which would also allow building it on
>> x86 and others.
> 
> I wondered about that, too, but thought that would be a new patch.
>

Agreed that making it || COMPILE_TEST should be in a separate patch.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

