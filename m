Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F13176590C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E251510E5C3;
	Thu, 27 Jul 2023 16:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DD810E5C5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:44:55 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4RBc7W0mXFz9rxy;
 Thu, 27 Jul 2023 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1690476295; bh=qXjAfrA/YdJlN3ZhbZFId17gZ3Za9o6+CIkBjVulPak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nNOZcV2ak5uBIrQwo7/60y/UJCfkXEoEW8KzXf6ixuTx9tMyshvH1o5aeDREtsPMS
 zFIieDXJh9huz1pQE1ekGlE5jz2Igrlj9hbWhQJMSSIvrA9ugTUYTGMYFPvvgtUHYu
 IJaYnfP5TEKnsdhfti+q5QbpdtiIh5U9+qk50Scs=
X-Riseup-User-ID: AA0AC672D996569D2E675AEF4419D886149F7F2F4B29F3AF934E5971964366F7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RBc7S0lrbzFpgy;
 Thu, 27 Jul 2023 16:44:51 +0000 (UTC)
Message-ID: <74e5cc8c-a5f8-4c0b-c699-4234e539203f@riseup.net>
Date: Thu, 27 Jul 2023 13:44:49 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tests: Remove CONFIG_DRM_FBDEV_EMULATION on
 .kunitconfig
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org
References: <20230726220325.278976-1-arthurgrillo@riseup.net>
 <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <86fcd546-c2db-41ca-a087-74c3cd5ce341@app.fastmail.com>
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
 Javier Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27/07/23 05:33, Arnd Bergmann wrote:
> On Thu, Jul 27, 2023, at 00:03, Arthur Grillo wrote:
>> Using the `kunit_tool` with the command:
>>
>> tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests/
>>
>> Lead to this error[0]. Fix it by expliciting removing the
>> CONFIG_DRM_FBDEV_EMULATION.
>>
>> [0]
>> ERROR:root:
>> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>>   Selected by [y]:
>>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>>
> 
> I think that's a bug in the Kconfig files that should be fixed
> by enforcing the correct set of dependencies. I have not encountered

Agree, I also didn't find the error on the dependencies, so I made this
patch to see what you guys thought. Maybe Javier's take is the correct
fix.

~Arthur Grillo

> this in my randconfig builds (with a lot of other fixes applied)
> 
> In linux-next, CONFIG_VT cannot be disabled if CONFIG_EXPERT=n,
> so this does not happen.
> 
>> diff --git a/drivers/gpu/drm/tests/.kunitconfig 
>> b/drivers/gpu/drm/tests/.kunitconfig
>> index 6ec04b4c979d..c50b5a12faae 100644
>> --- a/drivers/gpu/drm/tests/.kunitconfig
>> +++ b/drivers/gpu/drm/tests/.kunitconfig
>> @@ -1,3 +1,4 @@
>>  CONFIG_KUNIT=y
>>  CONFIG_DRM=y
>>  CONFIG_DRM_KUNIT_TEST=y
>> +CONFIG_DRM_FBDEV_EMULATION=n
>>
>> base-commit: 45b58669e532bcdfd6e1593488d1f23eabd55428
> 
> Changing the local config should not be required after fixing
> the Kconfig files.
> 
>     Arnd
