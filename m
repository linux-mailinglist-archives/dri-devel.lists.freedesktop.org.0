Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67D7DDF97
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 11:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3092010E6BF;
	Wed,  1 Nov 2023 10:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E6010E6BF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698835239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IXci9J0xD0tMPtjPi+KFGNzlE2tvEnYyGsbEz8laLLc=;
 b=DT3bqnwnF3/THMw5nh8A+Rd7DJ04FLdE6REB0+PgevBz/4ijV8wd3KDUNRvyXkB2jWmH97
 /TorFKq0BgSPz07AFJRoAbjj2GToCUNOemyPYLr33QKVq4f7gfsOPKqY+KvUrf0uhqN180
 NbhrfH/dttDejEUgEPclxfh7NLFpVXw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-KObZUDP4OeGTpAFcvrLmzg-1; Wed, 01 Nov 2023 06:40:37 -0400
X-MC-Unique: KObZUDP4OeGTpAFcvrLmzg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5344aaf2703so4860600a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 03:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698835237; x=1699440037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IXci9J0xD0tMPtjPi+KFGNzlE2tvEnYyGsbEz8laLLc=;
 b=J151bs0kriSSHM7XVuqVzh6Vt+IGhHKoYqY5xwBM4I88OVxYDlYVRK8mZ1cK4hoDg+
 jaF0suGJYK8dzxihh6aWoMhiMrcrTXphALGEy4eh8as9jtom3iNQHLAycwvUsLyUYjnm
 +fgDY+8v7bkDUY8fmoFMN/HGBCG89AWd0PK/mKTZYfEVAz3IoNkz1RuUaOa8RiVCCIA2
 4scmWRxsu74j7KIipPrAJPwlSPtA5jYB3lbSFlXw7Ex2ls8klUnWSI/A4VP8qpgGs2pL
 UN2Y6VDpy6lXPj5wlsYNWP9BnjSQfLuSd1WJcVXhuet5Z+rX7Vb6FKWEyBXilvaIaPeV
 rxdg==
X-Gm-Message-State: AOJu0YyuLDE90NJEmwbsZ55tmgsbgngaBzzu1U1IbuGPzPh9QACOicgz
 9MfEaVDQvXXI6RpQQOZufX+eOnt/D52oVBkBrOjSykqkkOYlg1hpuP0n2/2n4WrGnJZv5QubyfN
 piVfMdiHbIrIpRad4zeroMsmdAzN1
X-Received: by 2002:a05:6402:3586:b0:538:a47:89d3 with SMTP id
 y6-20020a056402358600b005380a4789d3mr12770012edc.21.1698835236784; 
 Wed, 01 Nov 2023 03:40:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwEzcZ5PbSGrv84q2mKqUSPtMNw0MIc+7X2PCfPIy0r+a45ZF7Ol+yi88FtHV2yNblOW6pWA==
X-Received: by 2002:a05:6402:3586:b0:538:a47:89d3 with SMTP id
 y6-20020a056402358600b005380a4789d3mr12769999edc.21.1698835236475; 
 Wed, 01 Nov 2023 03:40:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a50d09c000000b005434e3d8e7bsm930845edd.1.2023.11.01.03.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 03:40:35 -0700 (PDT)
Message-ID: <e3d6da15-8d54-fa63-5fcc-79617310244e@redhat.com>
Date: Wed, 1 Nov 2023 11:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV
 GPIOs behind the driver's back
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
 <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
 <16e533e2-81bb-47ba-9e23-460a626bcad7@redhat.com>
 <ZUIbPtEEbl6pjdqg@smile.fi.intel.com>
 <f68dca47-d9ed-a146-b152-c19bcc9d8828@redhat.com>
 <ZUIpmhYlqMXroHfV@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZUIpmhYlqMXroHfV@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/1/23 11:34, Ville Syrjälä wrote:
> On Wed, Nov 01, 2023 at 11:20:23AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/1/23 10:32, Andy Shevchenko wrote:
>>> On Tue, Oct 31, 2023 at 10:15:52PM +0100, Hans de Goede wrote:
>>>> On 10/31/23 17:07, Hans de Goede wrote:
>>>>> On 10/24/23 18:11, Andy Shevchenko wrote:
>>>>>> On Tue, Oct 24, 2023 at 06:57:38PM +0300, Andy Shevchenko wrote:
>>>
>>> ...
>>>
>>>>> As for the CHT support, I have not added that to my tree yet, I would
>>>>> prefer to directly test the correct/fixed patch.
>>>>
>>>> And I hit the "jackpot" on the first device I tried and the code needed
>>>> some fixing to actually work, so here is something to fold into v3 to
>>>> fix things:
>>>
>>> Thanks!
>>>
>>> But let me first send current v3 as it quite differs to v2 in the sense
>>> of how I do instantiate GPIO lookup tables.
>>
>> The problem is there already is a GPIO lookup table registered for
>> the "0000:00:02.0" device by intel_dsi_vbt_gpio_init() and there can
>> be only be one GPIO lookup table per device. So no matter how you
>> instantiate GPIO lookup tables it will not work.
>>
>> The solution that I chose is to not instantiate a GPIO lookup table
>> at all and instead to extend the existing table with an extra entry.
>>
>> Although thinking more about it I must admit that this is racy.
>>
>> So a better idea would be to unregister the GPIO lookup
>> table registered by intel_dsi_vbt_gpio_init() after getting
>> the GPIOs there, that would allow instantiating a new one
>> from soc_exec_opaque_gpio() as it currently does and that
>> would be race free.
> 
> The proper solution would likely be be to pre-parse the sequences
> to determine which GPIOs are actually needed. That would also get
> rid of the bxt_gpio_table[] eyesore.

Interesting suggestion. Note that intel_dsi_vbt_gpio_init() arm
only runs on byt and cht though, so that is something to keep
in mind.

Regards,

Hans

