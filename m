Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B1880069
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723AC10E3DF;
	Tue, 19 Mar 2024 15:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="TmXklku9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502D810E3DF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:18:44 +0000 (UTC)
Received: from [192.168.42.20] (pd9e59c8a.dip0.t-ipconnect.de
 [217.229.156.138]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 873592FC010D;
 Tue, 19 Mar 2024 16:18:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1710861522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLYrKqHUM/IS0ZPTvZGbAWfjnkzw3USLCJuf00OnxW8=;
 b=TmXklku9GoSmsAqKgvFjAdvKArNOxe6Ng926gjBEtTf3XVHFd/jpvZ05aFiBmld1CLguCq
 muxHUNdiSvwyaj1HS4SM2wSgyiAPBU5Dxil0wx0FqvM6OC6irM8F8Sz1HUvSQibYPNc+iL
 4yi62HVK0MqzxvgZENWETG1QP4z7yRg=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <93d70ac3-bb18-4732-abb4-134750a5b50c@tuxedocomputers.com>
Date: Tue, 19 Mar 2024 16:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v3
To: Hans de Goede <hdegoede@redhat.com>
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
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <281f9b71-a565-4ff3-8343-ca36d604584d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Hans,

Am 18.03.24 um 12:11 schrieb Hans de Goede:
> Hi Werner,
>
> Sorry for the late reply.
np
>
> On 2/22/24 2:14 PM, Werner Sembach wrote:
>> Hi,
>>
>> Thanks everyone for the exhaustive feedback. And at least this thread is a good comprehesive reference for the future ^^.
>>
>> To recap the hopefully final UAPI for complex RGB lighting devices:
>>
>> - By default there is a singular /sys/class/leds/* entry that treats the device as if it was a single zone RGB keyboard backlight with no special effects.
> Ack this sounds good.
>
>> - There is an accompanying misc device with the sysfs attributes "name", "device_type",  "firmware_version_string", "serial_number" for device identification and "use_leds_uapi" that defaults to 1.
> You don't need a char misc device here, you can just make this sysfs attributes on the LED class device's parent device by using device_driver.dev_groups. Please don't use a char misc device just to attach sysfs attributes to it.
>
> Also I'm a bit unsure about most of these attributes, "use_leds_uapi" was discussed before
> and makes sense. But at least for HID devices the rest of this info is already available
> in sysfs attributes on the HID devices (things like vendor and product id) and since the
> userspace code needs per device code to drive the kbd anyways it can also have device
> specific code to retrieve all this info, so the other sysfs attributes just feel like
> duplicating information. Also there already are a ton of existing hidraw userspace rgbkbd
> drivers which already get this info from other places.
The parent device can be a hid device, a wmi device, a platform device etc. so I 
thought it would be nice to have some unified way for identification.
>
>>      - If set to 0 the /sys/class/leds/* entry disappears. The driver should keep the last state the backlight was in active if possible.
>>
>>      - If set 1 it appears again. The driver should bring it back to a static 1 zone setting while avoiding flicker if possible.
> Ack, if this finds it way into some documentation (which it should) please make it
> clear that this is about the "use_leds_uapi" sysfs attribute.
Ack
>
>> - If the device is not controllable by for example hidraw, the misc device might also implement additional ioctls or sysfs attributes to allow a more complex low level control for the keyboard backlight. This is will be a highly vendor specific UAPI.
> IMHO this is the only case where actually using a misc device makes sense, so that
> you have a chardev to do the ioctls on. misc-device-s should really only be used
> when you need a chardev under /dev . Since you don't need the chardev for the e.g.
> hidraw case you should not use a miscdev there IMHO.

My train of thought was that it would be nice to have the use_leds_uapi at a 
somewhat unified location in sysfs. The parent device can be of any kind, like I 
mentioned above, and while for deactivating it can easily be found via 
/sys/class/leds/*/device/. For reactivating, the leds entry doesn't exist.

>
>>      - The actual logic interacting with this low level UAPI is implemented by a userspace driver
>>
>> Implementation wise: For the creation of the misc device with the use_leds_uapi switch a helper function/macro might be useful? Wonder if it should go into leds.h, led-class-multicolor.h, or a new header file?
> See above, I don't think we want the misc device for the hidraw case, at which
> point I think the helper becomes unnecessary since just a single sysfs write
> callback is necessary.
>
> Also for adding new sysfs attributes it is strongly encouraged to use
> device_driver.dev_groups so that the device core handled registering /
> unregistering the sysfs attributes which fixes a bunch of races; and
> using device_driver.dev_groups does not mix well with a helper as you've
> suggested.
Ok, I will see when I start implementing.
>
>> - Out of my head it would look something like this:
>>
>> led_classdev_add_optional_misc_control(
>>      struct led_classdev *led_cdev,
>>      char* name,
>>      char* device_type,
>>      char* firmware_version_string,
>>      char* serial_number,
>>      void (*deregister_led)(struct led_classdev *led_cdev),
>>      void (*reregister_led)(struct led_classdev *led_cdev))
>>
>> Let me know your thoughts and hopefully I can start implementing it soon for one of our devices.
> I think overall the plan sounds good, with my main suggested change
> being to not use an unnecessary misc device for the hid-raw case.
>
> Regards,
>
> Hans
>
>
Thanks for the feedback,

Werner

