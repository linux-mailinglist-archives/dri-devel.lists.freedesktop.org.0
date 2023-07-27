Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686767658EC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC4010E5B9;
	Thu, 27 Jul 2023 16:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DA510E5B9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:39:52 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RBc1h3nvTzDqbf;
 Thu, 27 Jul 2023 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1690475992; bh=FFIIzSDFzWhjzTAoQx+kYxHQremHuqgqmjsE1yQoPwo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VDJUlpiYbWkKiO3ULFk1IMrggrseH//K+OFwbGwbgodCePev3iCytTsJtqymliySP
 fywxKjWfY4TxTL4kxKztQMiKvaMEP04zJv753tM1FHC/kKeiGM4Icz+zyH0aD8kmYJ
 BZJsep3lmW3NCX6O5wLa4b9hI2qHVKhKu9dvvJlA=
X-Riseup-User-ID: F67B58C44F56A676ECBFC236031820D62C69FE36BC82AE09B363B0E18004D429
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RBc1d2kHLzFpgy;
 Thu, 27 Jul 2023 16:39:48 +0000 (UTC)
Message-ID: <bef940cb-b079-72ce-692c-3b6c6d283265@riseup.net>
Date: Thu, 27 Jul 2023 13:39:40 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on
 .kunitconfig
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org
References: <20230726220325.278976-1-arthurgrillo@riseup.net>
 <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
 <87lef1s5h8.fsf@minerva.mail-host-address-is-not-set>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <87lef1s5h8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: tales.aparecida@gmail.com, Helge Deller <deller@gmx.de>,
 mairacanal@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27/07/23 13:07, Javier Martinez Canillas wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
> 
>> On Thu, Jul 27, 2023, at 00:03, Arthur Grillo wrote:
>>> Using the `kunit_tool` with the command:
>>>
>>> tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests/
>>>
>>> Lead to this error[0]. Fix it by expliciting removing the
>>> CONFIG_DRM_FBDEV_EMULATION.
>>>
>>> [0]
>>> ERROR:root:
>>> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>>>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>>>   Selected by [y]:
>>>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>>>
>>
>> I think that's a bug in the Kconfig files that should be fixed
>> by enforcing the correct set of dependencies. I have not encountered
>> this in my randconfig builds (with a lot of other fixes applied)
>>
>> In linux-next, CONFIG_VT cannot be disabled if CONFIG_EXPERT=n,
>> so this does not happen.
>>
> 
>>> diff --git a/drivers/gpu/drm/tests/.kunitconfig 
>>> b/drivers/gpu/drm/tests/.kunitconfig
>>> index 6ec04b4c979d..c50b5a12faae 100644
>>> --- a/drivers/gpu/drm/tests/.kunitconfig
>>> +++ b/drivers/gpu/drm/tests/.kunitconfig
>>> @@ -1,3 +1,4 @@
>>>  CONFIG_KUNIT=y
>>>  CONFIG_DRM=y
>>>  CONFIG_DRM_KUNIT_TEST=y
>>> +CONFIG_DRM_FBDEV_EMULATION=n
>>>
>>> base-commit: 45b58669e532bcdfd6e1593488d1f23eabd55428
>>
>> Changing the local config should not be required after fixing
>> the Kconfig files.
>>
> 
> CONFIG_VT can only be disabled if CONFIG_EXPERT=y but I also see that it
> does not default to 'y' if !UML. Also FRAMEBUFFER_CONSOLE depends on !UML
> but DRM_FBDEV_EMULATION selects FRAMEBUFFER_CONSOLE if !EXPERT.
> 
> Maybe we should include !UML in that condition to? Something like this:
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 0d499669d653..734332f222ea 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -135,7 +135,7 @@ config DRM_DEBUG_MODESET_LOCK
>  config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
>         depends on DRM
> -       select FRAMEBUFFER_CONSOLE if !EXPERT
> +       select FRAMEBUFFER_CONSOLE if (!EXPERT && !UML)
>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>         default y
>         help
> 
> 
> With that I'm able to run the DRM kunit tests wihtout the mentioned
> problem. But I'm not sure if that is the correct fix or not.

It works here too, I just don't understand why this commit caused this
bug, as it did not touch this line.
> 
