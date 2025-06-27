Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414D8AEB3C3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 12:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED49E10E9B0;
	Fri, 27 Jun 2025 10:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PzHNWuRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1AF10E9B0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751018821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYXXAceZfrCUqpQ9OsgNrpmSa7NX1ldTsGlTcQdd5wI=;
 b=PzHNWuRINO8x9Gopq4f/mEFCrmSvjM688Jqv04bPQzU6SH8cO4ImSmpko5dtFzngoc8i6K
 m2ilxQdRAe/SkQpdZgcoV2YKoGdVSzSYg+wVwHmVPB/9gpmzHMbT/4qnRndTSXMy0gsdx0
 M6sGr2CTgIV0NasJ9vSjKRxOudDkYDQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-wb2xlz2xO6SOG6hvjnJELA-1; Fri, 27 Jun 2025 06:06:58 -0400
X-MC-Unique: wb2xlz2xO6SOG6hvjnJELA-1
X-Mimecast-MFC-AGG-ID: wb2xlz2xO6SOG6hvjnJELA_1751018817
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a6d90929d6so835788f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 03:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751018817; x=1751623617;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uYXXAceZfrCUqpQ9OsgNrpmSa7NX1ldTsGlTcQdd5wI=;
 b=AyK6A1ltGVAHhf62yQ2FQcqXbFJigWNGXQJYli43qoepRw3tkflCtqaPpZYKQgiSTt
 ClNa8LbwSyALf0wHyV98iEm1RryyMNbkr2prRYAtZJXFu6hFhAnFlT3BmVUQ/ajo3I0Z
 Z0LehpoAgN8GQz9oaidOqGvRQ1XuCLl2p7Zg20yjOs6ebjFf1l4SDrMS3ZGwDZNovFwY
 13TMrhSNTCU7kgKncBiSdvkhX9WbIyU5VpqIl7g8ZxtXDUYYr16IosZ8yH/m0B1rvioQ
 W2vAvJMsCAUwOcK4WHW0qKc2TV4IFrJDlXiBH2cpS4fbpwODsVuCAdLAtJGOfCK8puiP
 03qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0luuIA3vMFvq/dK/ez4+KAj8inHXn3a7I3yzqciI848m4khYFiZ5QbMh0GNf8kyIy/2IE86UM5EU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCiw8JSg03DlIkCBZWPPv0Z3DUQilk8GprEXQiYXG2mqhn+VW6
 rclARzMIXtwnjap4fSCIEtwlCRDZjFvBrdYQ5jqp38xURBOv5jvYV5Ax4yBz/qfp+vKfgr0X8mQ
 3SisHa/UlxKerDmyl5msRkfUEOXbHU8UqKa4nh/kzORxcMoGgG1H8do3nHf38LUAMh5Hzdg==
X-Gm-Gg: ASbGncv57+zI59/47gWz0Shcz2uGd3/tWG1cN+z6iwRI1MtGwZDpiDasJdnsCBMoxVw
 Cmnpax2TTfyRDDOgw+AHnithU2i7fiHhSZnRN921JQXAinCvy13qrGI3Vk4p52s+NEjqoBtf7sn
 rVA3bbwvD4AEhCFAOxCwwax3yBiI5Ri8uQPHN/IdZZaXuDFG4ceqk+GzwG5F+zaX5UPbCu9YJ7n
 dn4umXsCMBlVsStS9Q+iASPYhrPgFKH+bX41KAIKyZf40R43qldADowqPYUjPOSEb5xx6bZ4ORe
 lk6FZ6qy3v1F+qwkSNsyF9EY9ZtnH3kAb8a8Hr0UmvI1bKplNKRxnkq/KFFOiEWY2WraRa5abw2
 xAXPl
X-Received: by 2002:a05:6000:23c8:b0:3a4:eef9:818a with SMTP id
 ffacd0b85a97d-3a8ff51fb85mr1792640f8f.27.1751018816827; 
 Fri, 27 Jun 2025 03:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjPZ2YyzP07UvUHeXF1IowQrFwAxVkZWw/RrEy4ehDzyrnnvfw0IfiYAn/CtAHUzPqxVhAtQ==
X-Received: by 2002:a05:6000:23c8:b0:3a4:eef9:818a with SMTP id
 ffacd0b85a97d-3a8ff51fb85mr1792609f8f.27.1751018816340; 
 Fri, 27 Jun 2025 03:06:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f918sm2247895f8f.100.2025.06.27.03.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 03:06:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
In-Reply-To: <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
Date: Fri, 27 Jun 2025 12:06:54 +0200
Message-ID: <87o6u9birl.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zpC8OrwTKl5MWnhERh2sFHj2j1iYSEAAjCCzvb7nYBE_1751018817
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

"Luca Weiss" <luca.weiss@fairphone.com> writes:

> Hi Krzysztof,
>
> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>> Document the interconnects property which is a list of interconnect
>>> paths that is used by the framebuffer and therefore needs to be kept
>>> alive when the framebuffer is being used.
>>> 
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>> 
>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>> @@ -79,6 +79,9 @@ properties:
>>>    power-domains:
>>>      description: List of power domains used by the framebuffer.
>>>  
>>> +  interconnects:
>>> +    description: List of interconnect paths used by the framebuffer.
>>> +
>>
>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>> some sort of resources in unknown way is not simple anymore. You need
>> device specific bindings.
>
> The bindings support an arbitrary number of clocks, regulators,
> power-domains. Why should I artificially limit the interconnects to only
> one?
>

I agree with Luca here. There are device specific bindings for the device
specific drivers. But this is about the generic drivers that are able to
scan out using a system provided framebuffer.

The display controller is setup by the firmware but it might need a set
of clocks, power domains, regulators, etc left enabled in order to work.

It's true that the "simple" is a misnomer, probably these drivers should
had been named sysfb and sysfbdrm, or something along those lines.

> The driver code also has that support added in this series.
>
> Regards
> Luca
>
>>
>> Best regards,
>> Krzysztof
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

