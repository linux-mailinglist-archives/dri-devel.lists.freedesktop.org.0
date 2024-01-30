Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01CB842D3E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D07E10E2B4;
	Tue, 30 Jan 2024 19:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066E010E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706643976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AgaXuTc9A121GAs0+EjFCIWMRfllZdxTyYxhjcWlwnw=;
 b=FBPPyximO2+exE7J6D06RoF4O5sheZtHQqWBjirTY/ZiPI9PQrpgINlbj+5ZDr9s36FfSQ
 5LZPq4fP6qlp3+2vNS/qoR0SRPjj8GpFv7uLC4AoJSU0VIRK6/TyVsoHWYAQM1UfZzNN5Z
 V7ZNkLYQl0jbN3h8MJRdQF5C9o5Bwzc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-vIE1egmhMTO5Z9OXsFjZsA-1; Tue, 30 Jan 2024 14:46:13 -0500
X-MC-Unique: vIE1egmhMTO5Z9OXsFjZsA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5596f90d5c8so2062024a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 11:46:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706643972; x=1707248772;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AgaXuTc9A121GAs0+EjFCIWMRfllZdxTyYxhjcWlwnw=;
 b=tDOjtkBF2+b8EcsPglBho7M+QgqKfI4oNLDV7Rhqjpg6YdXUlTJdRSkiZpncV7j/8f
 u/kjcKhgcXIKF3zxcQSZ70rOo38umSLtz8ceGb7ikYDOCcLqVUpd1N9+d+xV7JZWfWSr
 YTDJxHcfHXscmGxPjnj0oc3vN848ye0QAEiG6jR5fipdgSsdzcDTdQTTKV4jrSfwM6jI
 8z7yjpW0j2gneSinidgVS9IP28oheg0XB3ReHrCMrz946dRv7ic3Vq2AxlmQlXQVg1qm
 w+06qSlEwFxPWzwP8fCq6QcC13zGNR8VghsueSLleo4SQmSRIICd4/h0493cLElMPGv1
 7IQg==
X-Gm-Message-State: AOJu0YzKRWrhnGdFpYFVilBtOCX/QvDTqJIBBUmr0g+lcIQE9gYyGJGh
 w99JZuk14Prezyo7pgd28gh9C1oWZCBHdL7IWT0+AG2X/YsE7DuOTFiYvM70oomRZtDTm21W3Lo
 XeVeYbHHHGMfZG+qx4NKzk/O6CUPsk32edtBd8w5IDpA0NWCDCUthe0Y4XkjnOY2zBQ==
X-Received: by 2002:a05:6402:1494:b0:55f:27ce:bdbe with SMTP id
 e20-20020a056402149400b0055f27cebdbemr170149edv.30.1706643972237; 
 Tue, 30 Jan 2024 11:46:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG3TnmkyVSLJ0RspKn4cgq88d4joiQUfQVNCaPE98eCrjjOlpr522oXhAQNoj/aCiDPjBuBw==
X-Received: by 2002:a05:6402:1494:b0:55f:27ce:bdbe with SMTP id
 e20-20020a056402149400b0055f27cebdbemr170135edv.30.1706643971866; 
 Tue, 30 Jan 2024 11:46:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05640205d100b0055f05342a41sm2295577edx.44.2024.01.30.11.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 11:46:11 -0800 (PST)
Message-ID: <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
Date: Tue, 30 Jan 2024 20:46:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Werner Sembach <wse@tuxedocomputers.com>, Pavel Machek <pavel@ucw.cz>
References: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
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
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/30/24 20:08, Werner Sembach wrote:
> Hi,
> 
> Am 30.01.24 um 19:35 schrieb Hans de Goede:
>> Hi,
>>
>> On 1/30/24 19:09, Werner Sembach wrote:
>>> Hi Hans,
>>>
>>> resend because Thunderbird htmlified the mail :/
>> I use thunderbird too. If you right click on the server name
>> and then go to "Settings" -> "Composition & Addressing"
>> and then uncheck "Compose messages in HTML format"
>> I think that should do the trick.
> Can't set this globally or other people will complain that my replies delete company logos in signatures xD. But usually the auto detection of Thunderbird works.
>>
>>> Am 30.01.24 um 18:10 schrieb Hans de Goede:
>>>> Hi Werner,
>>>>
>>>> On 1/30/24 12:12, Werner Sembach wrote:
>>>>> Hi Hans,
>>>>>
>>>>> Am 29.01.24 um 14:24 schrieb Hans de Goede:
>>> <snip>
>>>>> I think that are mostly external keyboards, so in theory a possible cut could also between built-in and external devices.
>>>> IMHO it would be better to limit /dev/rgbledstring use to only
>>>> cases where direct userspace control is not possible and thus
>>>> have the cut be based on whether direct userspace control
>>>> (e.g. /dev/hidraw access) is possible or not.
>>> Ack
>>>
>>> <snip>
>>>
>>>>> So also no basic driver? Or still the concept from before with a basic 1 zone only driver via leds subsystem to have something working, but it is unregistered by userspace, if open rgb wants to take over for fine granular support?
>>>> Ah good point, no I think that a basic driver just for kbd backlight
>>>> brightness support which works with the standard desktop environment
>>>> controls for this makes sense.
>>>>
>>>> Combined with some mechanism for e.g. openrgb to fully take over
>>>> control as discussed. It is probably a good idea to file a separate
>>>> issue with the openrgb project to discuss the takeover API.
>>> I think the OpenRGB maintainers are pretty flexible at that point, after all it's similar to enable commands a lot of rgb devices need anyway. I would include it in a full api proposal.
>> Ack.
>>
>>> On this note: Any particular reason you suggested an ioctl interface instead of a sysfs one? (Open question as, for example, I have no idea what performance implications both have)
>> sysfs APIs typically have a one file per setting approach,
>> so for effects with speed and multiple-color settings you
>> would need a whole bunch of different files and then you
>> would either need to immediately apply every setting,
>> needing multiple writes to the hw for a single effect
>> update, or have some sort of "commit" sysfs attribute.
>>
>> With ioctls you can simply provide all the settings
>> in one call, which is why I suggested using ioctls.
> 
> Ack
> 
> If the static mode update is fast enough to have userspace controlled animations, OpenRGB is calling that direct mode. Is it feasible to send 30 or more ioctls per second for such an direct mode? Or should this spawn a special purpose sysfs file that is kept open by userspace to continuously update the keyboard?

ioctls are quite fast and another advantage of ioctls is
you open the /dev/rgbledstring# device only once and
then re-use the fd for as many ioctls as you want.

Regards,

Hans

