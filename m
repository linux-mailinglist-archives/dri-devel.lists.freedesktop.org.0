Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AD49E3B3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 14:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0465210E163;
	Thu, 27 Jan 2022 13:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C266D10E14D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 13:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643290791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPvrRnVVEino9qy8OfKm/WHwJCSfoI7pu3w1+u7M8xI=;
 b=BCRJV2AAQcpfNNtCaerokYs/l2iG7uc56JnUsbylc2Q8QaTRHOAVc5GQTk5M5rCG8bOxc7
 d3BDbSnZmMAIvKPHAMHEASiYSEZ58ZHuQ3S8cSh1oXRgVcLGjGP6P+DZaqamrmZe6rVMwu
 D//9/4hTa5cK7cvqSWLRz2968IwpYI0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-brtP8QdbPOqz8SqmYB3Chw-1; Thu, 27 Jan 2022 08:39:48 -0500
X-MC-Unique: brtP8QdbPOqz8SqmYB3Chw-1
Received: by mail-ed1-f71.google.com with SMTP id
 l16-20020aa7c3d0000000b004070ea10e7fso1440191edr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 05:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xPvrRnVVEino9qy8OfKm/WHwJCSfoI7pu3w1+u7M8xI=;
 b=XDDnYPspySGd1RPWYRhIPWSr155tOt84KiHOo5Nm7Tp2SCGIIEvHYOsVrLjBJyFYZP
 mVL2prqsTxE8XfNWP8S7rr9W2q1ZiMUC2Cg6Qi/Ik4NdvlW1HV3WpZKOdAINTPODW18H
 5m5f7tIpLL0txW+EeTQdXCMU2lABMWUHWyl6/NsTcCTkOlqFWSedlqdWqPVvQuCD106h
 SqCll6SqMpE/EQFVUEadKdnTb9V1ciIrEVHrHT+QptnxidKYvpX8U9dFInbeeGSnmWWh
 QXP3krH7rMmzw0wFSJCBjlfj4/wm53E3EZ21H+MocpGWdKUaWMjNQUBlv7dYD+TswlWG
 uovA==
X-Gm-Message-State: AOAM530xwwFBpxYbQLO2WTQPkpcpCWeuXrliLNNo06M2uMwy+skTHlvM
 R+89M5Fy/smCUj2zWF7JHeXnWsO4IyfETZJ131o9vlVqSJ0pkn0DTiHM+CTlM7OAqr/CTjm1IdK
 9/j70mFYvLq6biAaPlXp3vp/kKrJh
X-Received: by 2002:a17:906:58ca:: with SMTP id
 e10mr2861530ejs.747.1643290787514; 
 Thu, 27 Jan 2022 05:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3x6gLk3Za/oUrZGpbiSHjgaSEs1kP1E6wSziP4Rh9dA3elmbTGpqVRgSYk1ivKvWhj5KU2g==
X-Received: by 2002:a17:906:58ca:: with SMTP id
 e10mr2861517ejs.747.1643290787302; 
 Thu, 27 Jan 2022 05:39:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id v3sm10721233edy.21.2022.01.27.05.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 05:39:46 -0800 (PST)
Message-ID: <47823b47-3743-e6b7-0665-d5743713d198@redhat.com>
Date: Thu, 27 Jan 2022 14:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: acpi_get_devices() crash when acpi_disabled==true (was [PATCH v2]
 drm/privacy-screen: honor acpi=off in detect_thinkpad_privacy_screen)
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220123091004.763775-1-ztong0001@gmail.com>
 <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
 <CAJZ5v0h51v9fFrJRuaFpSn7J2UEHndEj0f3zpmw=RvgsvAhtvw@mail.gmail.com>
 <049ccc3a-8628-3e90-a4f4-137a286b6dce@redhat.com>
 <CAJZ5v0hJWW_vZ3wwajE7xT38aWjY7cZyvqMJpXHzUL98-SiCVQ@mail.gmail.com>
 <994f94b2-61d3-1754-d733-732a0fb47d50@redhat.com>
 <CAJZ5v0hXKJhCSKki8JHs+Q=3BWYygDNz9LLAaiVKpDvLPr6-ZA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0hXKJhCSKki8JHs+Q=3BWYygDNz9LLAaiVKpDvLPr6-ZA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Tong Zhang <ztong0001@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/27/22 14:33, Rafael J. Wysocki wrote:
> On Thu, Jan 27, 2022 at 2:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 1/26/22 18:11, Rafael J. Wysocki wrote:
>>> On Wed, Jan 26, 2022 at 5:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 1/26/22 16:54, Rafael J. Wysocki wrote:
>>>>> On Wed, Jan 26, 2022 at 2:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> Hi All,
>>>>>>
>>>>>> On 1/23/22 10:10, Tong Zhang wrote:
>>>>>>> when acpi=off is provided in bootarg, kernel crash with
>>>>>>>
>>>>>>> [    1.252739] BUG: kernel NULL pointer dereference, address: 0000000000000018
>>>>>>> [    1.258308] Call Trace:
>>>>>>> [    1.258490]  ? acpi_walk_namespace+0x147/0x147
>>>>>>> [    1.258770]  acpi_get_devices+0xe4/0x137
>>>>>>> [    1.258921]  ? drm_core_init+0xc0/0xc0 [drm]
>>>>>>> [    1.259108]  detect_thinkpad_privacy_screen+0x5e/0xa8 [drm]
>>>>>>> [    1.259337]  drm_privacy_screen_lookup_init+0xe/0xe85 [drm]
>>>>>>>
>>>>>>> The reason is that acpi_walk_namespace expects acpi related stuff
>>>>>>> initialized but in fact it wouldn't when acpi is set to off. In this case
>>>>>>> we should honor acpi=off in detect_thinkpad_privacy_screen().
>>>>>>>
>>>>>>> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
>>>>>>
>>>>>> Thank you for catching this and thank you for your patch. I was about to merge
>>>>>> this, but then I realized that this might not be the best way to fix this.
>>>>>>
>>>>>> A quick grep shows 10 acpi_get_devices() calls outside of drivers/acpi,
>>>>>> and at a first glance about half of those are missing an acpi_disabled
>>>>>> check. IMHO it would be better to simply add an acpi_disabled check to
>>>>>> acpi_get_devices() itself.
>>>>>>
>>>>>> Rafael, do you agree ?
>>>>>
>>>>> Yes, I do.
>>>>
>>>> Did you see my follow-up that that is not going to work because
>>>> acpi_get_devices() is an acpica function ?
>>>
>>> No, I didn't, but it is possible to add a wrapper doing the check
>>> around it and convert all of the users.
>>
>> Yes I did think about that. Note that I've gone ahead and pushed
>> the fix which started this to drm-misc-fixes, to resolve the crash
>> for now.
> 
> OK
> 
>> If we add such a wrapper we can remove a bunch of acpi_disabled checks
>> from various callers.
>>
>>> Alternatively, the ACPICA function can check acpi_gbl_root_node
>>> against NULL, like in the attached (untested) patch.
>>
>> That is probably an even better idea, as that avoids the need
>> for a wrapper altogether. So I believe that that is the best
>> solution.
> 
> Allright, let me cut an analogous patch for the upstream ACPICA, then.

Great, thank you.

I have added a note about checking for when this has found its way
into Linus' tree to my own TODO list, with the goal of doing
a cleanup series removing the then no longer needed acpi_disabled
checks in a bunch of places.

Regards,

Hans

