Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06759F85F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 13:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FDA10E95B;
	Wed, 24 Aug 2022 11:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D90D14B312
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661339309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGfpUpDxvFpN6r02THk4JBCx3yQFLweaGRDNLoZQA9o=;
 b=Wh17cc89dAKmI4/DJZ/IG2YMkLZHPG1Wa7ylZKsVjbT0k6OUQSceoxV/OPEXG0Iq6qKFX6
 92G0ABI3ypPi/PRk89nbV3OP44jJj8gb0ZG1Sv2Bd2vPrB9UW8weGRs5rshaR8vrdb4yFe
 cChfzm+mAd7663Bjr0yFqJ2bO8KOKlU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-QoeJ2XH5M7mc5RrZrqTCsg-1; Wed, 24 Aug 2022 07:08:29 -0400
X-MC-Unique: QoeJ2XH5M7mc5RrZrqTCsg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v14-20020a056402348e00b00446946ba703so6627879edc.23
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 04:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=cGfpUpDxvFpN6r02THk4JBCx3yQFLweaGRDNLoZQA9o=;
 b=1yeLbFW2vjMWd8EDerxYLu4qnp+tEAfaCS8epE3QqLVIorqao6+GPhPxQM9ggh3TfK
 PHFE8+ULBerFVvC3kHfmTb0TNjvzNfeu6PJQsfH9CGhuqrvcrwjjUV5kLrSRD393ykHB
 ogWQfSlr3ScLzQ+6afUkzyR3L0pxaDnh8qsBhma+FT8M8NifYw98cJH2XJkFW32S+Z7y
 XaXIcjvijPRqGqUMeSny02+KEuDqvx5u0ORlTTa3r9gby3RU055sBRq3l+SBQJ3Ia4JV
 ofM9GH5pWCDj9xO8ubeVWdK2nIcwDmm24j9L53yHhcOP/gyYupqxs42Pdiws9Lg3URYn
 9CGQ==
X-Gm-Message-State: ACgBeo3gZPkGbNCpxK5izJpMCH5Y4FdOO9yPwqq206IB8wfoPWw8OkjW
 N5Puk7ndjr+y0H8jjIE8jLtkhwJnKVaaylmIX8vw8AX5a5hPnxCC6cNbwkyuUbQmgDCa5spRLOh
 lXG0QgO5nqikVkFIn9cAdRlHhsh1u
X-Received: by 2002:a05:6402:e98:b0:441:a982:45bc with SMTP id
 h24-20020a0564020e9800b00441a98245bcmr6950966eda.239.1661339306776; 
 Wed, 24 Aug 2022 04:08:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6P/7PaITtSTdw1wLLBypj9uj/nk0N3QwkS9w0y+K1RLj+BScs0w2Xc3OndqaOvHU7KZQ6oZg==
X-Received: by 2002:a05:6402:e98:b0:441:a982:45bc with SMTP id
 h24-20020a0564020e9800b00441a98245bcmr6950924eda.239.1661339306456; 
 Wed, 24 Aug 2022 04:08:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 kv22-20020a17090778d600b00730560156b0sm1047279ejc.50.2022.08.24.04.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 04:08:24 -0700 (PDT)
Message-ID: <e56d7379-5f6f-9ae0-cd74-f570df990c1d@redhat.com>
Date: Wed, 24 Aug 2022 13:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 01/29] ACPI: video: Add
 acpi_video_backlight_use_native() helper
To: Daniel Dadap <ddadap@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-2-hdegoede@redhat.com>
 <641cb059-48f5-5f05-5ec2-610f1215391c@nvidia.com>
 <20e4ffcf-2a3a-e671-5f98-1602b78df3cb@nvidia.com>
 <331ebd23-d2a4-bb33-5462-b9bd3284ab69@redhat.com>
 <5cfb26a2-ec7b-578e-dc01-79776dc7e0c9@nvidia.com>
 <94c69af4-5a30-0b80-fce1-64d01858d79b@redhat.com>
 <98cb14c9-6b9a-9410-98e3-24c31950597d@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <98cb14c9-6b9a-9410-98e3-24c31950597d@nvidia.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 8/17/22 22:18, Daniel Dadap wrote:
> On 8/17/22 10:05 AM, Hans de Goede wrote:

<snip>

>>> One further potential difficulty that I anticipate is that not all dynamic mux systems use the EC backlight driver (or a similar, GPU-agnostic driver), and rather have whichever GPU happens to be connected at the time be responsible for the backlight. I had initially thought that supporting the EC backlight interface was a requirement for OEMs to implement dynamic mux support, but I recently learned this is not true in all cases. On Windows, this requires coordinating the backlight controls of the two GPU drivers across a mux switch, to load the state of the switched-away-from GPU and set it on the switched-to GPU. I imagine for these systems we may need to do some similar save/restore, probably managed by vga-switcheroo, but it would require having both GPU drivers register their own native backlight handlers (and possibly while one of them is not connected to the panel).
>> Right, systems where the backlight control basically gets muxed from one GPU to the other GPU together with the panel's video-data lines exist. Currently Linux already register both native GPU backlight handlers in this case. e.g. /sys/class/backlight/intel_backlight and /sys/class/backlight/nouveau_bl.
>>
>> Userspace (atleast GNOME) has code which checks which GPU is actually connected to the panel using the panel's drm connector's status on each GPU (only one of which should report connected) and then uses the backlight interface associated with the connected connector.
>>
>>> Dynamic mux switching isn't actually supported on Linux, yet, so we should be able to kick this particular can a little further down the road, but in the meantime we should probably start planning for how best to handle this sort of system under the "only one backlight handler per panel" model. Maybe the vga-switcheroo handler can register its own backlight handler, that then negotiates the actual backlight settings between the relevant GPU drivers, possibly through a new vga-switcheroo client callback. I'll have to think about this a bit more.
>> The "only one backlight handler per panel" model is actualy "only one backlight handler per panel"-connector since the new API uses drm properties on the drm connector object. With 2 GPUs both using their native backlight control there will be 2 connectors and userspace will/must use the one which is actually reporting that it is connected to the panel so this will work fine.
> 
> 
> That is a useful distinction. Would it fall under userspace's reponsibility, then, to keep the brightness level synchronized across drm_connectors that share a panel via a mux when performing a switch?

Yes typically the 2 different GPU drivers know nothing about the other GPU and I think it would be good to keep things that way. When switching userspace will see a disconnect on the panel connector on one GPU and then a connect on the connector on the other GPU at which point it knows that it should set the brightness on the now connected connector instead of on the old one.

> I suppose it's a cleaner design to leave it up to userspace to select which backlight interface to manipulate.

Ack.

> That is a harder decision for userspace to make with the existing design, which doesn't cleanly map sysfs backlight interfaces to individual connectors, but if the UAPI is going to change to a drm_connector property, backlight interfaces are obviously strongly correlated with the connectors.

Right.

>  I'm not sure how easy it is for userspace to solve the problem of maintaining consistent brightness levels across a mux switch for an OLED panel, where there really isn't a concept of a "backlight" to speak of, but I suppose it wouldn't be any easier to do that in the kernel (e.g. with vga-switcheroo).

The OLED brightness is send over DP-aux to the panel AFAIK, so as long as both drivers export the raw range of the panel's setting and don't try to get smart and scale or whatever then their should be a 1:1 mapping. Ideally for something like this both drivers would be using some shared drm-helper code / library to talk to the backlight, thus guaranteeing that both drivers interpret the scale the same.


>> If anything the nvidia-wmi-ec-backlight case is a but more tricky, the "only one backlight handler per panel" thing is actually more of a "only one backlight handler per laptop" rule which is intended for (to be written) drm helpers for the new properties to be able to get the handler from the backlight class in the non native case by just taking the first registered backlight handler.
>>
>> This means that in a dual GPU setup with nvidia-wmi-ec-backlight both GPU's panel connector objects will have their brightness properties pointing to / proxying the same backlight class device. Userspace should really be only writing to the one which is actually connected though. I guess we could even enforce this
>> in the kernel and reject brightness property writes on unconnected connectors.
>>
>>>> Please let me know if the proposed solution works for you and
>>>> if you want me to make ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY a
>>>> module-option for the next version.
>>>
>>> I do think it should be workable, apart from the concern I mentioned above about knowing when to set the module option to disable the ACPI video backlight driver.
>> Note the option does not disable the ACPI video backlight driver. It disables the acpi_video code timing out and deciding to go ahead and register its backlight itself (providing that at the moment of timeout acpi_video_get_backlight_type() returns acpi_backlight_video). Any code (e.g. the nvidia binary driver) can still call acpi_video_register_backlight() itself to try and register even if the timeout handling has been disabled.
>>
>> The idea is that without the timeout the probe order looks like this:
>>
>> 1. acpi_video initializes, does not register backlight
>> 2. GPU driver initalizes, it either registers a native backlight handler;
>>     or it calls acpi_video_register_backlight()
>> 3. acpi_video_register_backlight() runs (if called) and calls:
>>     acpi_video_get_backlight_type()
>> 4.1 if acpi_video_get_backlight_type() returns acpi_backlight_video
>>     /sys/class/backlight/acpi_video# is/are registered
>> 4.2 if acpi_video_get_backlight_type() returns somerthing else, e.g.
>>     acpi_backlight_nvidia_wmi_ec, acpi_video_register_backlight()
>>     does nothing
>>
>>
>> The timeout is to ensure that 3. still happens, even if
>> there is no native GPU driver, because of e.g.
>> nomodeset on the kernel cmdline.
>>
>> With the nvidia binary driver, that driver can call
>> acpi_video_register_backlight() if necessary so the timeout
>> is not necessary.
>>
>> I'm currently preparing v3 of this patchset. I'll modify the
>> patch introducing the timeout to make it configurable
>> (with 0 disabling it completely).
> 
> 
> Okay. That clarification makes sense. Would it be reasonable to disable the timeout by default on systems with Win8 or later _OSI?

Hmm, there are Win8 or later systems which actually need acpi_video because the other method(s) to control the backlight don't work (we have a list of quirks for those) and more importantly there are Win8 or later systems where the video bios tables say: "Don't use the GPU for backlight control". We do need the acpi_video_register_backlight() call to happen on both those cases eventually. Also this will lead to 2 different code-paths making things more complicated, so no I don't think that that is a good idea.

Regards,

Hans

