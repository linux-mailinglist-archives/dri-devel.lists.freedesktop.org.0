Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5802AED974
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D682510E3EA;
	Mon, 30 Jun 2025 10:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RyWboPYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5FC10E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751278259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9A7R1NMgwmGs+rq/3fZEJMO/E+9JHfs2TTptrHFa6kI=;
 b=RyWboPYI4fgHqH4zb6vGRztDekHDnLPdslkMmqDMiAGuyha5/3kwqjtFn+CBX1c1FRTXNv
 J5gidUTV24j2dBPcJLFRwAZxe3XnvZP0Ta2mxJGisHd8E3n180W/giyU1sJ+iPg81aDGlo
 HR0ZYZy/6MIM06NRLEuC3NPbOLydkdI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-UqQSNZDeMFuFEUiuyvYkoQ-1; Mon, 30 Jun 2025 06:10:58 -0400
X-MC-Unique: UqQSNZDeMFuFEUiuyvYkoQ-1
X-Mimecast-MFC-AGG-ID: UqQSNZDeMFuFEUiuyvYkoQ_1751278257
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ae0a0683d6dso174748066b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 03:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751278257; x=1751883057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9A7R1NMgwmGs+rq/3fZEJMO/E+9JHfs2TTptrHFa6kI=;
 b=dNq1uocIYA1IwLjPnEnwmmW+rqpYXiM550zlf6YS4P8OjfMGb6JXlYOb0SxhYy2aP3
 FwgJO/m79jZZYTQcyGmvjGyG+ansqA44SFRqR3UaHuf9XTQqvfKZ9UvWs+EyyDe7E8N2
 KaMcZd/8p+lUbT58VI4ukJLl4w0sPKaYWAhAFOUYrMf+22fLi2RKnzL+NHf2RTU4hQDD
 7YaDQGGpLrj00QDxmguHJE0Yvt8etJxYk3eqAEdGOwg93ooFTZHzH2qu2ulODH1jwHIZ
 eJdP0nGuROyTMpRqiGn/mvXna2KzkI19obUcpRS1QF//LCvB9iSq85BDOnPCM4n+7/FJ
 1wfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVucXZcHYNPEewRVd7CEtiLFHys/HAJV+/hC2pUnPpgvKxWfVWVmEAKxaiOCPcr7696Mz6sOQBBWgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGjZbPA5C4GyDcW86MmLi39WGalwIEue2wO6eirtA1fhg+ZjJM
 Wvmgydx5jai55nOfPiogmwA/eD4SMRbWnvsIEXhYTLAH7v8BhNdBWvKG9wuFVikbRYfCp6WYDn6
 +oZKWDaA85EN5VcJkkN30Puo8fv0etRWsBrcDq885gxAwT7GJ2xY+KwpVBK5v8eehK8c6Ew==
X-Gm-Gg: ASbGncspv00ACqByy+FV8N0Pg9ml6/3cpbgsVd16f19zpza3aqX28UyfrBWtWkWEbWy
 Cotzt3X/KPnK/iznKL0h7Y4MPrQCVP6HFkLwy36bKTC/x++WmXmrNwv3yUG5u6y+sWIHaf8veMv
 64YqmM3LE5mx/fmjNnETq20Z5+ii4myCH6NsfN/xjuaLdPeieNl4smLHjiEF89w87x3NI1HlAe9
 bfe5BEtZhtEbkhdYZXDQETjD3oaa6qKuw5Ijdf+sZb8e5rZP3d6au1aqCjE8PPYJ9prfoUbh+1w
 kmS0BYa7iJLRJ2F/pladiqfII57VoMo1VKZ61aCxvZLW1rjIJkVNKwqEeMjYnwntmKksGwrCrfA
 qIF2YrosXNIWwHBk8ocnv1lTcmB/2Otc4rip6NTkgdnaY/6wb93/s4/45JIaJP3PQSqAuVB+n/w
 ==
X-Received: by 2002:a17:907:2d90:b0:ae0:cde3:4bbd with SMTP id
 a640c23a62f3a-ae350105a64mr1132306966b.44.1751278256878; 
 Mon, 30 Jun 2025 03:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8QLpRvbfPVUFa7p0t3e8hsAtXsONL5FPVYF4A4uxvUKJ0kZK4E7910YTHu2a3V2kjkojunQ==
X-Received: by 2002:a17:907:2d90:b0:ae0:cde3:4bbd with SMTP id
 a640c23a62f3a-ae350105a64mr1132304666b.44.1751278256380; 
 Mon, 30 Jun 2025 03:10:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c6bbf2sm633581266b.129.2025.06.30.03.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 03:10:55 -0700 (PDT)
Message-ID: <484bb47b-3e20-41fa-a4e4-f8fe2369d7df@redhat.com>
Date: Mon, 30 Jun 2025 12:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
 <20250630-stirring-kiwi-of-adventure-8f22ba@houat>
 <b9f010ca-1564-4a3a-b004-ef179d5c90a6@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b9f010ca-1564-4a3a-b004-ef179d5c90a6@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AfrXHVKPE05robtf844AVr76_D6NekNM2grPLypNE3g_1751278257
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On 30-Jun-25 11:36 AM, Krzysztof Kozlowski wrote:
> On 30/06/2025 10:38, Maxime Ripard wrote:
>> On Mon, Jun 30, 2025 at 10:24:06AM +0200, Krzysztof Kozlowski wrote:
>>> On 29/06/2025 14:07, Hans de Goede wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 28-Jun-25 1:49 PM, Krzysztof Kozlowski wrote:
>>>>> On 27/06/2025 11:48, Luca Weiss wrote:
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
>>>>>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>>>>>>> Document the interconnects property which is a list of interconnect
>>>>>>>> paths that is used by the framebuffer and therefore needs to be kept
>>>>>>>> alive when the framebuffer is being used.
>>>>>>>>
>>>>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>>>> ---
>>>>>>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>>>>>>  1 file changed, 3 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>>>> @@ -79,6 +79,9 @@ properties:
>>>>>>>>    power-domains:
>>>>>>>>      description: List of power domains used by the framebuffer.
>>>>>>>>  
>>>>>>>> +  interconnects:
>>>>>>>> +    description: List of interconnect paths used by the framebuffer.
>>>>>>>> +
>>>>>>>
>>>>>>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>>>>>>> some sort of resources in unknown way is not simple anymore. You need
>>>>>>> device specific bindings.
>>>>>>
>>>>>> The bindings support an arbitrary number of clocks, regulators,
>>>>>> power-domains. Why should I artificially limit the interconnects to only
>>>>>> one?
>>>>>
>>>>> And IMO they should not. Bindings are not supposed to be generic.
>>>>
>>>> The simplefb binding is a binding to allow keeping the firmware, e.g.
>>>> uboot setup framebuffer alive to e.g. show a boot splash until
>>>> the native display-engine drive loads. Needing display-engine
>>>> specific bindings totally contradicts the whole goal of 
>>>
>>> No, it does not. DT is well designed for that through expressing
>>> compatibility. I did not say you cannot have generic fallback for simple
>>> use case.
>>>
>>> But this (and previous patchset) grows this into generic binding ONLY
>>> and that is not correct.
>>
>> Can we have a proper definition of what a correct device tree binding is
>> then?
>>
>> It's a bit surprising to have *that* discussion over a binding that is
>> now well older than a decade now, and while there is definitely some
>> generic bindings in ePAPR/DT spec, like the CPU ones.
> 
> Hm? In ARM world at least they are specific, e.g. they have specific
> compatibles.
> 
>>
>> If you don't consider that spec to be correct DT bindings, please
>> provide a definition of what that is, and / or reasonable alternatives.
>>
>> Also, no, a device specific binding isn't reasonable here, because we
>> *don't* have a device. From a technical standpoint, the firmware creates
> 
> You touch internal parts of the SoC and you list very specific SoC
> parts. Interconnect is internal part of the SoC and only specific
> devices are using it.
> 
> You define here generic SW construct for something which is opposite of
> generic: the interconnect connecting two specific, unique components of
> one, given SoC.
> 
>> the framebuffer, Linux just uses it. Just like you don't have a
>> device/platform specific compatible for PSCI, SCPI, et al.
> 
> They follow some sort of spec and still they do not reference chosen
> SoC-design-specific properties.

It does not look like this discussion is going anywhere,
despite 2 drm subsystem maintainers and the simplefb
maintainer telling you that this is what is necessary
and also that we believe this is the right thing todo.

IOW despite 3 domain experts telling you we want this,
you keep coming up with vague, not really technical
argument about this not being generic / simple enough.

Looking at this from a driver pov interconnects are just
another resource we need to avoid from turning off.

And this is simple and generic, the actual display-engine
drivers are very complex and when powering things up
this needs to be done in a very specific order with
specific delays. That is hw-specific. The simplefb/simpledrm
code does not need any of this knowledge everything is
already setup. The simple* drivers just needs to claim all
listed resources in an arbitrary order and without any delays
as someone who has written many many drivers this is
about as simple and generic as it can get.

But as mentioned it looks like this discussion is going
anywhere. Is there some sort of arbitration / appeal
process which we can use when DT-maintainers block
a binding which has been acked and is seen as necessary
by the subsystem maintainers of the subsystem for which
the bindings are ?

Regards,

Hans


