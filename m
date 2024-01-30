Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C556F842BDA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 19:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85F41133FD;
	Tue, 30 Jan 2024 18:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C2B1133FD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 18:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706639728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOdYfwIYC5N4y+doDXlGO/PH5vC47bZ8gY5CXDn+WTw=;
 b=O98eqlynoad/chdcUr7nUZo/SLRt6/O7szr9azrMwECScNulUs0I5D9dkz4R3q/uvTOyKZ
 ZmR7ZcS6ZywyWhOqsTkg72WoyOv68k6qlXC315mjpFIRBmI2TWlwSmo2h1jG3Ye0vf/5Fc
 tzDYqetckn0Z6J845AToSYLwuVxEAOo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-iF28hyyHOd-OpafZzYQH-g-1; Tue, 30 Jan 2024 13:35:25 -0500
X-MC-Unique: iF28hyyHOd-OpafZzYQH-g-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-50e91f9d422so4455009e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706639724; x=1707244524;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IOdYfwIYC5N4y+doDXlGO/PH5vC47bZ8gY5CXDn+WTw=;
 b=bo6CDCc7TfCehrEdh7JMjPmJIQmm9SWKaN03F0nsIxpubR5FHcx8Yt2EBtiJck/EMB
 TiFQJntqaHbYoByKzYG4+q0VBwaKaw8ipKkr4uJZSacFRiWxfvGHyaTjdcncdzx/yeNF
 Fg03HV62lfxnjbszsuyek/wkAW5mcPhb2BbvsNTlA+qXI3QdIc3MO65/5aYtbCPxURHp
 DIH7wlCL0vzoxJFkr5WxdfD5OyMDxCfeU3M7D1aIJq3INjFB977aWz5u1lblxfzgmFV5
 WJNy5FigLVbQwJoUAJijReUp5K0BV0e6p9ZCQip7vMq5S11L8TEtA6tIqNSh1xUcJRt4
 v5Ew==
X-Gm-Message-State: AOJu0Yx96nL4NNaTmrkA6OGYVnKg8FIANCBLg1Zocy6NmlJJ4grNLTZW
 S+HCnvXGAhhpki0H/q8OoL9Ymlv5rsCrHj0IgO6k2GdSSxzy/bnfs7M7m4ewkRFZzJj6yADfDGA
 8+WwHgf/o79wRe9GTOknq+mZzmZNhFY5JvUTgqdOPteP7CJCxbQ3sqo5PtILoEu0eCA==
X-Received: by 2002:a05:6512:3118:b0:50e:937e:b00e with SMTP id
 n24-20020a056512311800b0050e937eb00emr6754060lfb.46.1706639724469; 
 Tue, 30 Jan 2024 10:35:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0lPG90dR+JaL7x5rEP1i/zj5JCA86gd1b2bt/YA8OReAEDomZA4lkHoV4BguYPqMnadNhaQ==
X-Received: by 2002:a05:6512:3118:b0:50e:937e:b00e with SMTP id
 n24-20020a056512311800b0050e937eb00emr6754042lfb.46.1706639723972; 
 Tue, 30 Jan 2024 10:35:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 md5-20020a170906ae8500b00a318d32ac79sm5433103ejb.146.2024.01.30.10.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 10:35:22 -0800 (PST)
Message-ID: <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
Date: Tue, 30 Jan 2024 19:35:21 +0100
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
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

On 1/30/24 19:09, Werner Sembach wrote:
> Hi Hans,
> 
> resend because Thunderbird htmlified the mail :/

I use thunderbird too. If you right click on the server name
and then go to "Settings" -> "Composition & Addressing"
and then uncheck "Compose messages in HTML format"
I think that should do the trick.

> Am 30.01.24 um 18:10 schrieb Hans de Goede:
>> Hi Werner,
>>
>> On 1/30/24 12:12, Werner Sembach wrote:
>>> Hi Hans,
>>>
>>> Am 29.01.24 um 14:24 schrieb Hans de Goede:
> <snip>
>>> I think that are mostly external keyboards, so in theory a possible cut could also between built-in and external devices.
>> IMHO it would be better to limit /dev/rgbledstring use to only
>> cases where direct userspace control is not possible and thus
>> have the cut be based on whether direct userspace control
>> (e.g. /dev/hidraw access) is possible or not.
> 
> Ack
> 
> <snip>
> 
>>> So also no basic driver? Or still the concept from before with a basic 1 zone only driver via leds subsystem to have something working, but it is unregistered by userspace, if open rgb wants to take over for fine granular support?
>> Ah good point, no I think that a basic driver just for kbd backlight
>> brightness support which works with the standard desktop environment
>> controls for this makes sense.
>>
>> Combined with some mechanism for e.g. openrgb to fully take over
>> control as discussed. It is probably a good idea to file a separate
>> issue with the openrgb project to discuss the takeover API.
> 
> I think the OpenRGB maintainers are pretty flexible at that point, after all it's similar to enable commands a lot of rgb devices need anyway. I would include it in a full api proposal.

Ack.

> On this note: Any particular reason you suggested an ioctl interface instead of a sysfs one? (Open question as, for example, I have no idea what performance implications both have)

sysfs APIs typically have a one file per setting approach,
so for effects with speed and multiple-color settings you
would need a whole bunch of different files and then you
would either need to immediately apply every setting,
needing multiple writes to the hw for a single effect
update, or have some sort of "commit" sysfs attribute.

With ioctls you can simply provide all the settings
in one call, which is why I suggested using ioctls.

Regards,

Hans



