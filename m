Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115D788A415
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED6B10E132;
	Mon, 25 Mar 2024 14:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="b5roYG+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E3410E132
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711376285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNtX5yAkkt8k9VBgHWUC/ykg5bc+/xilFSnEjQF3IZA=;
 b=b5roYG+gbWD7nHzK7/GXLBHm1uqv1wi+4yThIgVYVNFSVJTRap3ZWCsQoK/V+TOkrwpsmj
 3i6Asyarxq1bV/FgLdZcCQenVvljOSF9CvlyEXPKRtXGCB7o/EoTB9kWZX0Bj+qgj7McYa
 YJMCtTR17S9vRQPgnwEldgmOhPXR74s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-63lycoppOYGJ70F0hyTY2A-1; Mon, 25 Mar 2024 10:18:03 -0400
X-MC-Unique: 63lycoppOYGJ70F0hyTY2A-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a4455ae71fcso277015166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 07:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711376282; x=1711981082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BNtX5yAkkt8k9VBgHWUC/ykg5bc+/xilFSnEjQF3IZA=;
 b=bWgNINAzOop5oshwzWIU+SInDdhWM9wxZ7T0hfP+34jvEAE5SCpHwiU9kaGNyC6QNh
 hMw+jnRhZb0e1jjtewmsxhTEHq6OG0VxrrUDVSrbLEb/PdUpTCf7I6+35bxl8ed3EDAo
 +Rrb7c8oydBLZ+VSAh3IsPnUcNRJKingzvNbVmIDTIOk+URgL237B5Ji3MJtdXmZRYgx
 xhgSgI/38ZWgW8t3l7MI1uZt+rm1HOg3nyVD+E5qxlrGG3SSbhH/2DCNe0THOkoBjFSy
 tIep0a9YU/Ux9XPUI2x2EvR31JUNftTA58dEhNkCuoceUVW42ttgpZtls3S7SJFJNCrt
 n6aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqpAY1atVlVASCk9gVRtPVaeE6lWulGG1Y8H2ZByMdqPMAL3YAnC9b1At+w0T7l7eJKzikWpxHWhyErTvXfwjBztHoJ1vLByt7BCTdTbca
X-Gm-Message-State: AOJu0YwPHsEk6vUUONNaJ8wALhGFe1UeRIQTBHDLuM7AVbQzj+JntnzT
 jNvkJlKyqrIJCCT9j+LOI14NuITuNDHq6G95DjgBbUtcxWO1JolWhFejQNISpwvNoeonNYJl3sh
 hK3YvKDKLGej2BfLOTBZQcJ4Wu6H1O73yBphKa8n5i06EIJe+wDOG64coWX7CqQyxxA==
X-Received: by 2002:a17:907:7288:b0:a4a:3955:460e with SMTP id
 dt8-20020a170907728800b00a4a3955460emr2087392ejc.58.1711376282429; 
 Mon, 25 Mar 2024 07:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW0YWck1DWw8Dv5EVQKUHP4XBaO0+niUWuB7OcyHAKltXPcN/qGoPKNNrjuxrBHLNCPgrHTQ==
X-Received: by 2002:a17:907:7288:b0:a4a:3955:460e with SMTP id
 dt8-20020a170907728800b00a4a3955460emr2087369ejc.58.1711376282067; 
 Mon, 25 Mar 2024 07:18:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 zh20-20020a170906881400b00a47531764fdsm1691993ejb.65.2024.03.25.07.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 07:18:01 -0700 (PDT)
Message-ID: <8264bce7-eda0-4e1c-8c72-a6a78ee3a7bd@redhat.com>
Date: Mon, 25 Mar 2024 15:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v3
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <281f9b71-a565-4ff3-8343-ca36d604584d@redhat.com>
 <93d70ac3-bb18-4732-abb4-134750a5b50c@tuxedocomputers.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <93d70ac3-bb18-4732-abb4-134750a5b50c@tuxedocomputers.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Werner,

On 3/19/24 4:18 PM, Werner Sembach wrote:
> Hi Hans,
> 
> Am 18.03.24 um 12:11 schrieb Hans de Goede:
>> Hi Werner,
>>
>> Sorry for the late reply.
> np
>>
>> On 2/22/24 2:14 PM, Werner Sembach wrote:
>>> Hi,
>>>
>>> Thanks everyone for the exhaustive feedback. And at least this thread is a good comprehesive reference for the future ^^.
>>>
>>> To recap the hopefully final UAPI for complex RGB lighting devices:
>>>
>>> - By default there is a singular /sys/class/leds/* entry that treats the device as if it was a single zone RGB keyboard backlight with no special effects.
>> Ack this sounds good.
>>
>>> - There is an accompanying misc device with the sysfs attributes "name", "device_type",  "firmware_version_string", "serial_number" for device identification and "use_leds_uapi" that defaults to 1.
>> You don't need a char misc device here, you can just make this sysfs attributes on the LED class device's parent device by using device_driver.dev_groups. Please don't use a char misc device just to attach sysfs attributes to it.
>>
>> Also I'm a bit unsure about most of these attributes, "use_leds_uapi" was discussed before
>> and makes sense. But at least for HID devices the rest of this info is already available
>> in sysfs attributes on the HID devices (things like vendor and product id) and since the
>> userspace code needs per device code to drive the kbd anyways it can also have device
>> specific code to retrieve all this info, so the other sysfs attributes just feel like
>> duplicating information. Also there already are a ton of existing hidraw userspace rgbkbd
>> drivers which already get this info from other places.
> The parent device can be a hid device, a wmi device, a platform device etc. so I thought it would be nice to have some unified way for identification.

I think that some shared ioctl for identifying devices which need a misc-device
makes sense. But for existing hidraw supported keyboards there already is existing
userspace support, which already retreives this in a hidraw specific manner.

And I doubt that the existing userspace projects will add support for a new method
which is only available on new kernels, while they will also need to keep the old
method around to keep things working with older kernels.

So at least for the hidraw case I see little value in exporting the same info
in another way.



>>
>>>      - If set to 0 the /sys/class/leds/* entry disappears. The driver should keep the last state the backlight was in active if possible.
>>>
>>>      - If set 1 it appears again. The driver should bring it back to a static 1 zone setting while avoiding flicker if possible.
>> Ack, if this finds it way into some documentation (which it should) please make it
>> clear that this is about the "use_leds_uapi" sysfs attribute.
> Ack
>>
>>> - If the device is not controllable by for example hidraw, the misc device might also implement additional ioctls or sysfs attributes to allow a more complex low level control for the keyboard backlight. This is will be a highly vendor specific UAPI.
>> IMHO this is the only case where actually using a misc device makes sense, so that
>> you have a chardev to do the ioctls on. misc-device-s should really only be used
>> when you need a chardev under /dev . Since you don't need the chardev for the e.g.
>> hidraw case you should not use a miscdev there IMHO.
> 
> My train of thought was that it would be nice to have the use_leds_uapi at a somewhat unified location in sysfs. The parent device can be of any kind, like I mentioned above, and while for deactivating it can easily be found via /sys/class/leds/*/device/. For reactivating, the leds entry doesn't exist.

That is an interesting point. But I would expect any process/daemon which wants to
reactivate the in kernel LED class support to be the same process as which
deactivated it. So that daemon can simply canonicalize the /sys/class/leds/*/device
symlink or canonicalize the entire /sys/class/leds/*/device/use_leds_uapi path
and store the canonicalized version for when the daemon wants to reactivate things.

So I still think that having the miscdevice just for enumeration and
use_leds_uapi purposes is overkill.

Regards,

Hans


