Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B422F60ADDE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B8D10E7E7;
	Mon, 24 Oct 2022 14:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A9610E7DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666622270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sj0H0AetxBx+UDf7B/9MIT35ZXn55Y7gNC/8ryl/LHw=;
 b=QNQYfKLhvMphED9zNpHQVI49oT6hO+Y49yf+R58W4s4YED22qoM0PmAYwS5KjF/Jfd8VwA
 FsGD184HQSpSb4YfUfzOWy6mhdNHGxpMSX7uDh95gepPQbsY0zJFuW2hlUTVDjmBkwfyBF
 0SzTghAzz9iUObhifDtnyegE703KLGk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-igzijArZP6KsDTujPd98hg-1; Mon, 24 Oct 2022 10:37:47 -0400
X-MC-Unique: igzijArZP6KsDTujPd98hg-1
Received: by mail-ed1-f72.google.com with SMTP id
 w20-20020a05640234d400b0045d0d1afe8eso9948497edc.15
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sj0H0AetxBx+UDf7B/9MIT35ZXn55Y7gNC/8ryl/LHw=;
 b=qNeawtdRRyNY/ECxgG3/KpWNrXCIIiw27S5e1Ide9YPedfv5gJowNNIOA+ivbFnUyS
 IuSmA482qZ61/dOPztzBm4hyGOCP/qNupy1ehFXmSBmOzLBD8R18MsRA5iEGeb/NOxyP
 bcGJo6mBRnK7LRANd3tyJjMWLN8yELDX/fXGl50fhMw5NlRNrdQ9WY1qGSvhwH1Gwxx8
 hsGAoLor/D+BWIlZf+ErDfc0jKwKISgAQUeRWQjUL0ejNE5/zoCH83iLxLWr5bhS1zT2
 2uUl3w5HzExwvV+FiPcx1UzoSDbOy4fmGXASVi3bY5ZvyG8LwNHPQa0mPd08Xv/OofCV
 YuNw==
X-Gm-Message-State: ACrzQf29x60hG/4gCOhQsEMxIqyK2+azSMl6ybsQAIbhJGfgAUwBu7ZT
 ijdQN4k3rYLrGWECPxu5mIkG1StfrWjnU2HXcnWeeGJfikZZjfEJn6dDT63eqcHH9r6gI25D1vi
 w33ANrgsQE7kF+F/GjpfapDUgCAW9
X-Received: by 2002:a17:906:dac9:b0:780:ab6f:591f with SMTP id
 xi9-20020a170906dac900b00780ab6f591fmr28115671ejb.77.1666622265069; 
 Mon, 24 Oct 2022 07:37:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5laScRkt+5EsmfdhfrsisIZfhqwZSfSpP1Rz+6FzomB1hR4A5mm5gyOzvnRAXCnpM0u8CWVA==
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id
 wu9-20020a170906eec900b0073dc369690fmr27976822ejb.767.1666622254606; 
 Mon, 24 Oct 2022 07:37:34 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a170906540700b0078d9cd0d2d6sm15976572ejo.11.2022.10.24.07.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:37:33 -0700 (PDT)
Message-ID: <ae3497ed-b68d-c36a-6b6f-f7b9771d9238@redhat.com>
Date: Mon, 24 Oct 2022 16:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 00/22] Fallback to native backlight
To: Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
 <746e5cc6-516f-8f69-9d4b-8fe237de8fd6@redhat.com>
 <edec5950-cec8-b647-ccb1-ba48f9b3bbb0@daynix.com>
 <60672af8-05d2-113c-12b9-d635608be0dd@redhat.com>
 <ea69242c-0bc8-c7bb-9602-c7489bb69684@daynix.com>
 <7373e258-f7cc-4416-9b1c-c8c9dab59ada@daynix.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7373e258-f7cc-4416-9b1c-c8c9dab59ada@daynix.com>
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, platform-driver-x86@vger.kernel.org,
 devel@acpica.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/24/22 16:31, Akihiko Odaki wrote:
> On 2022/10/24 23:06, Akihiko Odaki wrote:
>> On 2022/10/24 22:21, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 10/24/22 14:58, Akihiko Odaki wrote:
>>>> On 2022/10/24 20:53, Hans de Goede wrote:
>>>>> Hi Akihiko,
>>>>>
>>>>> On 10/24/22 13:34, Akihiko Odaki wrote:
>>>>>> Commit 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native()
>>>>>> helper") and following commits made native backlight unavailable if
>>>>>> CONFIG_ACPI_VIDEO is set and the backlight feature of ACPI video is
>>>>>> unavailable, which broke the backlight functionality on Lenovo ThinkPad
>>>>>> C13 Yoga Chromebook. Allow to fall back to native backlight in such
>>>>>> cases.
>>>>>
>>>>> I appreciate your work on this, but what this in essence does is
>>>>> it allows 2 backlight drivers (vendor + native) to get registered
>>>>> for the same panel again. While the whole goal of the backlight refactor
>>>>> series landing in 6.1 was to make it so that there always is only
>>>>> *1* backlight device registered instead of (possibly) registering
>>>>> multiple and letting userspace figure it out. It is also important
>>>>> to only always have 1 backlight device per panel for further
>>>>> upcoming changes.
>>>>>
>>>>> So nack for this solution, sorry.
>>>>>
>>>>> I am aware that this breaks backlight control on some Chromebooks,
>>>>> this was already reported and I wrote a long reply explaining why
>>>>> things are done the way they are done now and also suggesting
>>>>> 2 possible (much simpler) fixes, see:
>>>>> https://lore.kernel.org/linux-acpi/42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com/
>>>>>
>>>>> Unfortunately the reported has not followed-up on this and
>>>>> I don't have the hardware to test this myself.
>>>>>
>>>>> Can you please try implementing 1 of the fixes suggested there
>>>>> and then submit that upstream ?
>>>>>
>>>>> Regards,
>>>>>
>>>>> Hans
>>>>>
>>>>
>>>> Hi Hans,
>>>>
>>>> Thanks for reviewing and letting me know the prior attempt.
>>>>
>>>> In this case, there is only a native backlight device and no vendor backlight device so the duplication of backlight devices does not happen. I think it is better to handle such a case without quirks.
>>>
>>> Adding a single heuristic for all chromebooks is something completely different
>>> then adding per model quirks which indeed ideally should be avoided (but this
>>> is not always possible).
>>>
>>>> I understand it is still questionable to cover the case by allowing duplication when both of a vendor backlight device and native one. To explain my understanding and reasoning for *not* trying to apply the de-duplication rule to the vendor/native combination, let me first describe that the de-duplication which happens in acpi_video_get_backlight_type() is a heuristics and limited.
>>>>
>>>> As the background of acpi_video_get_backlight_type(), there is an assumption that it should be common that both of the firmware, implementing ACPI, and the kernel have code to drive backlight. In the case, the more reliable one should be picked instead of using both, and that is what the statements in `if (video_caps & ACPI_VIDEO_BACKLIGHT)` does.
>>>>
>>>> However, the method has two limitations:
>>>> 1. It does not cover the case where two backlight devices with the same type exist.
>>>
>>> This only happens when there are 2 panels; or 2 gpus driving a single panel
>>> which are both special cases where we actually want 2 backlight devices.
>>>
>>>> 2. The underlying assumption does not apply to vendor/native combination.
>>>>
>>>> Regarding the second limitation, I don't even understand the difference between vendor and native. My guess is that a vendor backlight device uses vendor-specific ACPI interface, and a native one directly uses hardware registers. If my guess is correct, the difference between vendor and native does not imply that both of them are likely to exist at the same time. As the conclusion, there is no more motivation to try to de-duplicate the vendor/native combination than to try to de-duplicate combination of devices with a single type.
>>>>
>>>> Of course, it is better if we could also avoid registering two devices with one type for one physical device. Possibly we can do so by providing a parameter to indicate that it is for the same "internal" backlight to devm_backlight_device_register(), and let the function check for the duplication. However, this rule may be too restrict, or may have problems I missed.
>>>>
>>>> Based on the discussion above, we can deduce three possibilities:
>>>> a. There is no reason to distinguish vendor and native in this case, and we can stick to my current proposal.
>>>> b. There is a valid reason to distinguish vendor and native, and we can adopt the same strategy that already adopted for ACPI video/vendor combination.
>>>> c. We can implement de-duplication in devm_backlight_device_register().
>>>> d. The other possible options are not worth, and we can just implement quirks specific to Chromebook/coreboot.
>>>>
>>>> In case b, it should be noted that vendor and native backlight device do not require ACPI video, and CONFIG_ACPI_VIDEO may not be enabled. In the case, the de-duplication needs to be implemented in backlight class device.
>>>
>>> I have been working on the ACPI/x86 backlight detection code since 2015, please trust
>>> me when I say that allowing both vendor + native backlight devices at the same time
>>> is a bad idea.
>>>
>>> I'm currently in direct contact with the ChromeOS team about fixing the Chromebook
>>> backlight issue introduced in 6.1-rc1.
>>>
>>> If you wan to help, please read:
>>>
>>> https://lore.kernel.org/linux-acpi/42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com/
>>>
>>> And try implementing 1 if the 2 solutions suggested there.
>>>
>>> Regards,
>>>
>>> Hans
>>
>> Hi,
>>
>> I just wanted to confirm your intention that we should distinguish vendor and native. In the case I think it is better to modify __acpi_video_get_backlight_type() and add "native_available" check in case of no ACPI video as already done for the ACPI video/native combination.
>>
>> Unfortunately this has one pitfall though: it does not work if CONFIG_ACPI_VIDEO is disabled. If it is, acpi_video_get_backlight_type() always return acpi_backlight_vendor, and acpi_video_backlight_use_native() always returns true. It is not a regression but the current behavior. Fixing it requires also refactoring touching both of ACPI video and backlight class driver so I guess I'm not an appropriate person to do that, and I should just add "native_available" check to __acpi_video_get_backlight_type().
>>
>> Does that sound good?
> 
> Well, it would not be that easy since just adding native_available cannot handle the case where the vendor driver gets registered first. Checking with "native_available" was possible for ACPI video/vendor combination because ACPI video registers its backlight after some delay. I still think it does not overcomplicate things to modify __acpi_video_get_backlight_type() so that it can use both of vendor and native as fallback while preventing duplicate registration.

In the mean time this has already been fixed by a single patch of just a few
lines, rather then requiring 22 patches, see:

https://lore.kernel.org/dri-devel/20221024141210.67784-1-dmitry.osipenko@collabora.com/

Regards,

Hans




>>>>>> Akihiko Odaki (22):
>>>>>>     drm/i915/opregion: Improve backlight request condition
>>>>>>     ACPI: video: Introduce acpi_video_get_backlight_types()
>>>>>>     LoongArch: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: acer-wmi: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: asus-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: asus-wmi: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: compal-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: eeepc-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: fujitsu-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: ideapad-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: msi-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: msi-wmi: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: nvidia-wmi-ec-backlight: Use
>>>>>>       acpi_video_get_backlight_types()
>>>>>>     platform/x86: panasonic-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: samsung-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: sony-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: thinkpad_acpi: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: toshiba_acpi: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: dell-laptop: Use acpi_video_get_backlight_types()
>>>>>>     platform/x86: intel_oaktrail: Use acpi_video_get_backlight_types()
>>>>>>     ACPI: video: Remove acpi_video_get_backlight_type()
>>>>>>     ACPI: video: Fallback to native backlight
>>>>>>
>>>>>>    Documentation/gpu/todo.rst                    |  8 +--
>>>>>>    drivers/acpi/acpi_video.c                     |  2 +-
>>>>>>    drivers/acpi/video_detect.c                   | 54 ++++++++++---------
>>>>>>    drivers/gpu/drm/i915/display/intel_opregion.c |  3 +-
>>>>>>    drivers/platform/loongarch/loongson-laptop.c  |  4 +-
>>>>>>    drivers/platform/x86/acer-wmi.c               |  2 +-
>>>>>>    drivers/platform/x86/asus-laptop.c            |  2 +-
>>>>>>    drivers/platform/x86/asus-wmi.c               |  4 +-
>>>>>>    drivers/platform/x86/compal-laptop.c          |  2 +-
>>>>>>    drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>>>>>>    drivers/platform/x86/eeepc-laptop.c           |  2 +-
>>>>>>    drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>>>>>>    drivers/platform/x86/ideapad-laptop.c         |  2 +-
>>>>>>    drivers/platform/x86/intel/oaktrail.c         |  2 +-
>>>>>>    drivers/platform/x86/msi-laptop.c             |  2 +-
>>>>>>    drivers/platform/x86/msi-wmi.c                |  2 +-
>>>>>>    .../platform/x86/nvidia-wmi-ec-backlight.c    |  2 +-
>>>>>>    drivers/platform/x86/panasonic-laptop.c       |  2 +-
>>>>>>    drivers/platform/x86/samsung-laptop.c         |  2 +-
>>>>>>    drivers/platform/x86/sony-laptop.c            |  2 +-
>>>>>>    drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>>>>>>    drivers/platform/x86/toshiba_acpi.c           |  2 +-
>>>>>>    drivers/video/backlight/backlight.c           | 18 +++++++
>>>>>>    include/acpi/video.h                          | 21 ++++----
>>>>>>    include/linux/backlight.h                     |  1 +
>>>>>>    25 files changed, 85 insertions(+), 66 deletions(-)
>>>>>>
>>>>>
>>>>
>>>
> 

