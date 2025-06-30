Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F076AED582
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 09:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F83210E3A3;
	Mon, 30 Jun 2025 07:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J2/zltMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB57010E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751268409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PliJmn1HXur6pMQoL8rB2hExixfTgf4evesy0cgfaZA=;
 b=J2/zltMCgVKvKaClGM3ObITh7/WhCX5c5JMUaudD/Sxd6VM+Af+A7Rs2DIrZrQI/v6yjJy
 1z8qwaoXlPpd9ZyioIud0rC/+nfx8IFmwKHgCrpwc5b8cS7sLYj6JISQcqvTZOfvysw0bd
 utbEDFHAEUPITiPbPeTN53wcpTMVtkM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-0myLh-4IMLCdQm0Vmr4WXw-1; Mon, 30 Jun 2025 03:26:45 -0400
X-MC-Unique: 0myLh-4IMLCdQm0Vmr4WXw-1
X-Mimecast-MFC-AGG-ID: 0myLh-4IMLCdQm0Vmr4WXw_1751268405
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-adb33457610so185853766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 00:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751268405; x=1751873205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PliJmn1HXur6pMQoL8rB2hExixfTgf4evesy0cgfaZA=;
 b=bIEo1VHPpEeHAZ31xgdJjgmkphIcGonO0PemCjOkIvfs+4fI5bBtKf54FMTuIOg/5o
 v71h8HrR6TWlRFEVy3CcCHIf70tIkXSGmO36XmwW+pPFMfh88dsdJUDrk8SPmU5kUCUi
 P6ain2bsVMg/K25+rx0kUuWNAqLy7RitAItnxavumoocEJD5ZwEmVcx/hk+cuxOjl1DS
 yKky9HefIii6S883LMGAcusDEfbZwMkoVYYwn0wuinCDUGY7i5TCWFHvQuXeYQUIO/lI
 Ewu6d9P5DsxqIDlKZ6NaBGnRN2sGVXqRv50GG6SMqL5jbahrVgKMUx0Ay27D0rhFNBNR
 C1aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7Nhsgd24L/hrWr+u5EB2diT4u4kAnn+5gSYtqnq3PeOnmmpFD035C168XQowLh4PwCPaxq2eaWts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxudP9lIp/xsZlXoiUA9Tu41hSR7Zt0pgfgCm+7A+YYsBmEVCq
 A6NmUk4uslAZpeX+01k2K3USwIni1QV0MyzHpxmsEE1d/nSw4A5DZtW5KQ21bCmYMcZCYbnLm+R
 W+xxWHMISsaIofpheC9S27vdJ3GkaKYQgRwm65FoybzCCQVWvCAApd1fX1+hZFdfcHYh2sA==
X-Gm-Gg: ASbGnctqmIWQLct3CksDnIb46ma3i3iANEyPPaPZWG2CwZ4/xQP8utsfDAGE/wezbN9
 dLRPkF7Pymk/9/kAyq74NHbr6/w1sUHYDkKcyhFl0MvmdQM/v/pNZajsv6Zvm+dTvI/d0xVbg8i
 2GbrcMv+D0u4PkKa9LBFNkaFtwwS/62Iy4K2YKTtBrBLamVfolVzIWfYFIV5aWBWADrkm0pOCYa
 JIIMbmJN46QD37h5frtS3OXmJYe2w8EkK2qYppzhhl9hoTCCfTGiWLWS/JMESIsWLN6/AEUo2gU
 AsRdpS/HHmwWVDEf4O7tZt0koBirQSevB88wGW2W/mK54xTAbC2hQELsBUmUy5WEqN9CvMduKhh
 IYxPF+RgniCCD3Cq5udzS68nyPqExCJqj0UdRT9WQRpZxd5VMzW+M/10qiqxl3bI/nOO4LQukPg
 ==
X-Received: by 2002:a17:907:9611:b0:ade:4593:d7cd with SMTP id
 a640c23a62f3a-ae34fd7dba9mr1214867366b.13.1751268404579; 
 Mon, 30 Jun 2025 00:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiYh3llMDXU4xGZ9swkyEgz9p+asDK16qOjNtV3Z/UlrkO6eBkaLFQvar4Jfxyj+guT7BUfw==
X-Received: by 2002:a17:907:9611:b0:ade:4593:d7cd with SMTP id
 a640c23a62f3a-ae34fd7dba9mr1214864766b.13.1751268404067; 
 Mon, 30 Jun 2025 00:26:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353639bf1sm624173066b.32.2025.06.30.00.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 00:26:43 -0700 (PDT)
Message-ID: <72aab355-263c-4f63-8818-3d76bd3f6826@redhat.com>
Date: Mon, 30 Jun 2025 09:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <d8d85415-efc4-4a11-842e-23272cae29f7@suse.de>
 <b94b752c-d7f7-41d6-ac79-d21427f20964@kernel.org>
 <f15a775d-d82f-4ac9-9d88-159ffcf7e81c@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f15a775d-d82f-4ac9-9d88-159ffcf7e81c@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GkJNSPV7oa2xUMkSLAlrIi9DXmAq5SROsGyunXxQ3tE_1751268405
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

Hi,

On 30-Jun-25 8:34 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.06.25 um 13:50 schrieb Krzysztof Kozlowski:
>> On 27/06/2025 13:34, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 27.06.25 um 10:08 schrieb Krzysztof Kozlowski:
>>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>>>> Document the interconnects property which is a list of interconnect
>>>>> paths that is used by the framebuffer and therefore needs to be kept
>>>>> alive when the framebuffer is being used.
>>>>>
>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>>>    1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>> @@ -79,6 +79,9 @@ properties:
>>>>>      power-domains:
>>>>>        description: List of power domains used by the framebuffer.
>>>>>    +  interconnects:
>>>>> +    description: List of interconnect paths used by the framebuffer.
>>>>> +
>>>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>>>> some sort of resources in unknown way is not simple anymore. You need
>>>> device specific bindings.
>>> In this context, 'simple' means that this device cannot change display
>>> modes or do graphics acceleration. The hardware itself is not
>>> necessarily simple. As Javier pointed out, it's initialized by firmware
>> If hardware is not simple, then it needs specific bindings.
>>
>>> on the actual hardware. Think of 'VGA-for-ARM'. We need these resources
>>> to keep the display working.
>> I don't claim you do not need these resources. I claim device is not
>> simple thus does not suit rules for generic bindings. Generic bindings
>> are in general not allowed and we have them only for very, very simple
>> devices.
>>
>> You say this is not simple device, so there you go - specific binding
>> for this complex (not-simple) device.
> 
> No, I didn't. I said that the device is simple. I did not say that the device's hardware is simple. Sounds nonsensical, but makes sense here. The simple-framebuffer is just the range of display memory that the firmware configured for printing boot-up messages. We use it for the kernel's output as well.  Being generic and simple is the exact raison d'etre for simple-framebuffer.  (The display property points to the actual hardware, but we don't need it.)

I believe part of the problem here is the simple part of the simplefb
name in hindsight that is a mistake and we should have called the thing
firmware-framebuffer since its goal is to pass along a firmware setup
framebuffer to the OS for displaying stuff.

As for the argument for having a firmware-framebuffer not being allowed
because framebuffers are to complex to have a generic binding, that
ship has long sailed since we already have the simplefb binding.

And since we already have the binding I do not find this not being
simple a valid technical argument. That is an argument to allow
having a generic binding at all or to not have it at all, but here
we already have the binding and this is just about evolving the binding
with changing hw needs.

And again this reminds me very much of the whole clocks / regulators
addition to simplefb discussion we had over a decade ago. Back then
we had a huge thread, almost a flamefest with in my memory over
a 100 emails and back then the only argument against adding them
was also "it is not simple", which IMHO really is a non argument for
an already existing binding. Certainly it is not a good technical
argument.

During the last decade, after clocks and regulators were added to
the binding. simplefb has been used successfully on millions (billions?)
handover the firmware framebuffer to the OS for bootsplash use,
replacing various vendor hacks for this. Disallowing the addition of
interconnect support to the simplefb binding will only result in
various vendor hacks appearing in vendor kernels for this, which
I believe is something which we should try to avoid.

So as the maintainer of the simplefb kernel driver for over a decade
I strongly advice the DT maintainers to accept this bindings patch
and from my my side this still is:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


