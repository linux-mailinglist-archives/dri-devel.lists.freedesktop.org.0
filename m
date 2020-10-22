Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B8295D64
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 13:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F026E0D6;
	Thu, 22 Oct 2020 11:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687F06E0D6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603366343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRLu4wN1ue0b11aM+yogDT84JswXqlLpamLY1BeC9X8=;
 b=Sd8cALZQFfH8LRU9YN24cEHAaJq34imgSaWZBqJ3zHbbqtXDYhtKyTqjrVfRC9Ejfy4n1/
 e/RnLtTn9Ks5K0h/AinCHheCmCL2Ij3IzRcrNUWmw/oJc6r50rDfHIGHj8fy++j/EKGhBR
 chIpCp5Zj/b+L1QILnOsPKa/bYKMASA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-d0iLAcMmNI-CZMU4uT58iQ-1; Thu, 22 Oct 2020 07:32:21 -0400
X-MC-Unique: d0iLAcMmNI-CZMU4uT58iQ-1
Received: by mail-ej1-f72.google.com with SMTP id p18so72026ejl.14
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 04:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cRLu4wN1ue0b11aM+yogDT84JswXqlLpamLY1BeC9X8=;
 b=D7zkgOttbA9W1EcLKhyMS/LQ0pQoY/yH/SNB91UJHROQwYT3hMzzLC2Lt71lqvfL/m
 mlUSgjRLCea1wpFCkeBLW0bJtJzVRaLx71voZOZu9GEDBRfeJGxA9ndKH02tooTgUlja
 62PYQFQy4y96bwF0ithpkjkot2v2r4RVzxSmjUs3eTnE1vJJqEi0fhJe+HOdv3fqK2MY
 Ns8KKoZAa3X6ZStJ2qSf/eLNnLu2GF/JgKlI7kwgLnF78rVE90nmx83NPbjg5nxnrNBY
 oK3ZBUdXFYe0Is70yYHPH9Q1IMkJ55lru5FIGc/cEX8WJRKnONRjf+pqRi7qkpEfMkRz
 Lz2w==
X-Gm-Message-State: AOAM531cTddSw1Z7rlAjREwidzlCrHGEtcv5pqzAUN3Aq3VbdMEdDTMz
 kcpIqrdDamI1Jyy+HmtuSELEveU5Gr3b8lVfOal0TPYC7JQMKK5H21E/+mbHynR2Dk6aGCiuwbA
 mimaR14Ax/7D9MG2J6n+t4tnAkP8w
X-Received: by 2002:a17:907:43c3:: with SMTP id
 i3mr1637679ejs.231.1603366339744; 
 Thu, 22 Oct 2020 04:32:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMW6aVObzm1oXUU7GCr6ibVJPSZGZR2BdW9Lr4vfseEzDrcDiHy7BCt5f2Q2WXEGyuoQIwLA==
X-Received: by 2002:a17:907:43c3:: with SMTP id
 i3mr1637660ejs.231.1603366339466; 
 Thu, 22 Oct 2020 04:32:19 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id c3sm608814edl.60.2020.10.22.04.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 04:32:18 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm: Store USB device in struct drm_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201021130732.4048-1-tzimmermann@suse.de>
 <d5cc8a94-e908-84a1-09b2-fef7a2e78d91@redhat.com>
 <42768db1-37a6-ee8d-aa82-d14fc8806a4b@suse.de>
 <ff855bd4-8b74-15f4-c81e-05ad39ac5885@redhat.com>
 <45390c74-c8dc-7fc4-cae8-f5f73fb2b764@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f10925e3-6eab-dcd8-c5ce-071bca8aaa75@redhat.com>
Date: Thu, 22 Oct 2020 13:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <45390c74-c8dc-7fc4-cae8-f5f73fb2b764@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/22/20 12:57 PM, Thomas Zimmermann wrote:
> Hi Hans
> 
> On 22.10.20 12:17, Hans de Goede wrote:
>> Hi,
>>
>> On 10/22/20 11:30 AM, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> On 22.10.20 11:20, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 10/21/20 3:07 PM, Thomas Zimmermann wrote:
>>>>> The drivers gm12u320 and udl operate on USB devices. They leave the
>>>>> PCI device in struct drm_device empty and store the USB device in their
>>>>> own driver structure.
>>>>>
>>>>> Fix this special case and save a few bytes by putting the USB device
>>>>> into an anonymous union with the PCI data. It's expected that DRM
>>>>> core and helpers only touch the PCI-device field for actual PCI devices.
>>>>>
>>>>> Thomas Zimmermann (3):
>>>>>   drm: Add reference to USB device to struct drm_device
>>>>>   drm/tiny/gm12u320: Store USB device in struct drm_device.udev
>>>>>   drm/udl: Store USB device in struct drm_device.udev
>>>>
>>>> This series looks good to me:
>>>>
>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Thanks a lot. Following Daniel's request, I'll drop patch 1 and instead
>>> do an upcast from drm_device.dev to the USB device structure. The driver
>>> patches 2 and 3 will be slightly different. Unless you object, I''ll
>>> take the r-b into the new patches.
>>
>> I somehow missed Daniel's reply about this.
>>
>> With that said, hmm that is going to be an interesting up-cast, at least
>> for the gm12u320, that is going to look something like this:
>>
>> 	struct usb_device *udev = interface_to_usbdev(to_usb_interface(drm_dev->dev));
>>
>> (I wrote drm_dev instead of dev to make it more clear what is going on)
>>
>> For the DRM_DEV_ERROR() macro you can just use gm12u320->dev.dev ,
>> that will make the errors be printed with the in usb-interface device-name
>> as prefix instead of the usb-device device-name, but that is fine.
>>
>> I wonder of this is all worth it then though, just to save those few bytes ?
>>
> 
> Daniel and I briefly discussed on IRC if we could make drm_device.pdev
> (the PCI dev ) a legacy field in the longer term. All Linux devices
> would be retrieved from drm_device.dev then.

I see. Then I guess the fancy cast which I gave above is the right
way to move forward with this.

>> The first version made some sense since it made how drm devices with
>> usb resp. pci parents are handled consistent. Now it seems to make the code
>> somewhat harder to understand just to save the storage for a single pointer...
> 
> What's the implication of setting drm_device.dev to the value of struct
> usb_device.dev ? That's the device all the code interacts with.

USB drivers bind to USB interfaces, not to the USB device (the parent
of the interfaces). A single USB device may have multiple interfaces,
e.g. an USB headset may implement the USB audio class for the microphone
and headphones function, while having a second interface implementing the
HID interface for things like volume buttons, a play/pause button, etc.

So from the USB device model's pov making the USB device itself the parent
of the drm device is just wrong. I guess it may not cause much issues, but
it very much goes against how USB devices / interfaces are supposed to be
used inside the kernel.

So I guess we should just move forward with a v2 with the long / fancy casts.

As for keeping my Reviewed-by for that v2, yes that is fine.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
