Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693E17DDF46
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 11:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB2910E6B4;
	Wed,  1 Nov 2023 10:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF34010E6B4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698834027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxZkGQlELPKTx4ZEkf/xjndhXilo1fuybmUWb62vNJo=;
 b=gIVL6jFvUCxhvmI82KrOqK2QfyultKd0jcLr3cUkKCc4AufJz0bg/PfZf5aR1BHVnLlyuD
 TiR5NxNaxzVjFNWS4+/kWLBAxzw6TlIOVcZTnfGEZyALCZCmDJzxK/t3HEPTmem3/vzqh2
 KdzWYcQF6vx0vB4+IsNSbKFkDC0FYsA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-8whVQ_2ROB6dj8f4cAbNmw-1; Wed, 01 Nov 2023 06:20:26 -0400
X-MC-Unique: 8whVQ_2ROB6dj8f4cAbNmw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-54356d8ea43so1783510a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 03:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698834025; x=1699438825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxZkGQlELPKTx4ZEkf/xjndhXilo1fuybmUWb62vNJo=;
 b=ZF6Ljw1K/K/WhiPZMPsnPXgme+JLrsTiOBsYlDtj32VgLYm9uVzdRN3gSVl+vFpPyt
 ZunqBhBJWHFw+WUhlCcwOjAs6DHRXMn7M1++zc0AONdGEPaIXARCSXAnBLqsAjNIY7Iz
 AKLTN7h59gqhbPRvZaVyUcu7jeBE4XYbnoAEOGNH3E8pgIGoFOcCLZYW0+bwAt6zJZkk
 4iUme/UHcQIDj/x2yHjso90wYINAQYpharWOZFMt0KqdScEa7zxuYf1kAovREoEU1Lke
 9udrAiDrJjSSbxNKeowtPPfOHnI58lDYj7DtibZUqEQthbjy6nENuCZrPk1SmnTq5Cpz
 +Ikw==
X-Gm-Message-State: AOJu0YwFCaV9+/kWLTafaphsMONyCzY1MxQtJ97SvZHJ7pwsLRfc7eZf
 Nl3TyiGgAnqOnjUmexEU0yZ51Ydwi5KAJtMCYgBIZ6IAUKITOX4VOwHO//Ygsp2OgPwFEOaWuAb
 gRMoHE8IGUmdxWtoBIP7EIcQvH4fy
X-Received: by 2002:a50:ef0e:0:b0:540:9444:c281 with SMTP id
 m14-20020a50ef0e000000b005409444c281mr12883096eds.24.1698834025201; 
 Wed, 01 Nov 2023 03:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx5HMtvWX7uX1/e+f0BpfFb0fDc18xYncSC48psIYMvU8Wo7A5K4aVkm5jCQ14ieNxwK4o2Q==
X-Received: by 2002:a50:ef0e:0:b0:540:9444:c281 with SMTP id
 m14-20020a50ef0e000000b005409444c281mr12883084eds.24.1698834024911; 
 Wed, 01 Nov 2023 03:20:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 q29-20020a50cc9d000000b0053e2a64b5f8sm894534edi.14.2023.11.01.03.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 03:20:24 -0700 (PDT)
Message-ID: <f68dca47-d9ed-a146-b152-c19bcc9d8828@redhat.com>
Date: Wed, 1 Nov 2023 11:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
 <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
 <16e533e2-81bb-47ba-9e23-460a626bcad7@redhat.com>
 <ZUIbPtEEbl6pjdqg@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZUIbPtEEbl6pjdqg@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/1/23 10:32, Andy Shevchenko wrote:
> On Tue, Oct 31, 2023 at 10:15:52PM +0100, Hans de Goede wrote:
>> On 10/31/23 17:07, Hans de Goede wrote:
>>> On 10/24/23 18:11, Andy Shevchenko wrote:
>>>> On Tue, Oct 24, 2023 at 06:57:38PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
>>> As for the CHT support, I have not added that to my tree yet, I would
>>> prefer to directly test the correct/fixed patch.
>>
>> And I hit the "jackpot" on the first device I tried and the code needed
>> some fixing to actually work, so here is something to fold into v3 to
>> fix things:
> 
> Thanks!
> 
> But let me first send current v3 as it quite differs to v2 in the sense
> of how I do instantiate GPIO lookup tables.

The problem is there already is a GPIO lookup table registered for
the "0000:00:02.0" device by intel_dsi_vbt_gpio_init() and there can
be only be one GPIO lookup table per device. So no matter how you
instantiate GPIO lookup tables it will not work.

The solution that I chose is to not instantiate a GPIO lookup table
at all and instead to extend the existing table with an extra entry.

Although thinking more about it I must admit that this is racy.

So a better idea would be to unregister the GPIO lookup
table registered by intel_dsi_vbt_gpio_init() after getting
the GPIOs there, that would allow instantiating a new one
from soc_exec_opaque_gpio() as it currently does and that
would be race free.

> Meanwhile I will look into the change you sent (and hopefully we can
> incorporate something in v3 for v4).

Ok, lets go with your v3.

I'll prepare a patch  to move the unregistering of the existing
conflicting GPIO lookup from intel_dsi_vbt_gpio_cleanup()
to the end of intel_dsi_vbt_gpio_init() to avoid the conflict
we have there.

Note you still need the first part of my patch which is
an unrelated bugfix:

--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -219,8 +219,7 @@ static void soc_exec_gpio(struct intel_connector *connector, const char *con_id,
 	} else {
 		gpio_desc = devm_gpiod_get_index(dev_priv->drm.dev,
 						 con_id, gpio_index,
-						 value ? GPIOD_OUT_LOW :
-						 GPIOD_OUT_HIGH);
+						 value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
 		if (IS_ERR(gpio_desc)) {
 			drm_err(&dev_priv->drm,
 				"GPIO index %u request failed (%pe)\n",

Regards,

Hans


