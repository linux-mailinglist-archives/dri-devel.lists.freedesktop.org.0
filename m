Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25CFAECC61
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 14:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9808B10E02A;
	Sun, 29 Jun 2025 12:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AcSwfLw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A0D10E02A
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751198884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y61uksNXY3bfxfbmhRvj/wWi6127GwpvTiXCWAuJy7Y=;
 b=AcSwfLw+eR77dtav8RM5UgkU0RGUt+2bIs7ZQjYUEjgx5mZjp1u36XjAjuwdhhpYiW2JAW
 xzTVFrRSE2AxHXqIdsPjQS+g1gkB9spo/OrjUaahDOpHBjlIqBfAkioc1IRmqxGOFEl7L8
 CYklQjDBIiJZ7xh8FEjOTut4cwSKuSg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-tZMMuGeFOWK9jl4rKrSryQ-1; Sun, 29 Jun 2025 08:08:02 -0400
X-MC-Unique: tZMMuGeFOWK9jl4rKrSryQ-1
X-Mimecast-MFC-AGG-ID: tZMMuGeFOWK9jl4rKrSryQ_1751198881
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ae0a3511145so226456166b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 05:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751198881; x=1751803681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y61uksNXY3bfxfbmhRvj/wWi6127GwpvTiXCWAuJy7Y=;
 b=PWQTwwgxr5MHbog7z91cgxYu4reBNQs/E+dzTb1uLgllx+cPiGfP39RrvnoCAPrDYY
 Wn3QxSnQ/PfU1EFGFISmbTwiRjlTVfVv8X4GmqwjFe7eEOVgmGl2Od4QUSPkvRLC3WP7
 T2+DKk99LieRmCvr9QliUge9DAfZunCPgzn/fZ7R+FTCDAjYn9h+g8DzG9at4FXnJ8et
 xp3Z8mlnfgHF1Lr/oJWBCKQ7yysXITAB5D/t4pcD/eLqm8JO09UDT0wVdfIbWNbyKbFr
 9W69KK+iBhmH8cmEhxqbVFgtcLMwVdloZgFmS43pKIP+2BUACAanuwNYcWBkHHY/MOpk
 Wfjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNdsDkC5h8EpbBMvvie4SL6U+N/JnL3k34Pg2p9jkmLtYvpi2H6k9kOGjXhaV50HLlTCzQJ3Fe6H8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5kc5YQCkzDFV0kVgzIhvKBp+zVwRGbncBjuhLrMEkwtTtNxg7
 8Xz6MtLLJFSv+vhL7D93T8AhWAwZ+zHiCbPQkojXVHcFX20t1YGGhl6tsHdaAZF9VSvUA6rT28I
 OJ4YGoG20JUw0MqtmikTGISCgBJO0eixaO2mVkAGR4+z0+I/tyIhQjgH1yOTuA0WaMcVTNw==
X-Gm-Gg: ASbGncvgyisrPWJU4U8Qfm4rkXXQUYylbK5uYdzreT1SNRWkkCD1IwDZNE2j+39dGcn
 C2BwIlYa7Dzf1rrEteqM7S9dZZTrwQ1rm4J/uaVlQeBlCqA5UvMShssQAO9wd6DGypFJwmYqKq4
 ZJcNSp/6P8z3PV1Abmi0boF7QWYnEeZCrAa2RwD5keppBkw9+/4S4+kdX+UJWn2fdaGFtSXkYk2
 bBpK/WuINPbcxyQfdQukS/z1vJ2v9jsiWUGP8XJ+JBq8fk6vWA8tsTCiWLDHrKxHBcwfDXTPBe6
 jbh+iLC0cyy7jiz1AKy/7js/iVcJkQ3favQM+kcC7VRJRPrvY8gtKj9lbw9qIShSy0WPHPpXXhH
 xuekTahWOlnJZUb2aDXHn2aJ9XctLcrcMn4xv/YsSB/m180wHZIBK9Q918DdkuNXI6dPLUEtpmg
 ==
X-Received: by 2002:a17:907:7207:b0:ae3:6b52:f7dd with SMTP id
 a640c23a62f3a-ae36b52f88amr514354466b.46.1751198881158; 
 Sun, 29 Jun 2025 05:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET079+lNS2Zrgoqy9+whMR/tx3pQQ8PudfiWv0ZLtWOTerBzl2nFJIzCBrV1Me9yEUFQUboA==
X-Received: by 2002:a17:907:7207:b0:ae3:6b52:f7dd with SMTP id
 a640c23a62f3a-ae36b52f88amr514350466b.46.1751198880619; 
 Sun, 29 Jun 2025 05:08:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c6bc2dsm490353166b.136.2025.06.29.05.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 05:07:59 -0700 (PDT)
Message-ID: <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
Date: Sun, 29 Jun 2025 14:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VWvYPGU_B3SiZ_bEylCFjBTse7e-UzmueWo1EELZ0t8_1751198881
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

On 28-Jun-25 1:49 PM, Krzysztof Kozlowski wrote:
> On 27/06/2025 11:48, Luca Weiss wrote:
>> Hi Krzysztof,
>>
>> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>>> Document the interconnects property which is a list of interconnect
>>>> paths that is used by the framebuffer and therefore needs to be kept
>>>> alive when the framebuffer is being used.
>>>>
>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>> @@ -79,6 +79,9 @@ properties:
>>>>    power-domains:
>>>>      description: List of power domains used by the framebuffer.
>>>>  
>>>> +  interconnects:
>>>> +    description: List of interconnect paths used by the framebuffer.
>>>> +
>>>
>>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>>> some sort of resources in unknown way is not simple anymore. You need
>>> device specific bindings.
>>
>> The bindings support an arbitrary number of clocks, regulators,
>> power-domains. Why should I artificially limit the interconnects to only
>> one?
> 
> And IMO they should not. Bindings are not supposed to be generic.

The simplefb binding is a binding to allow keeping the firmware, e.g.
uboot setup framebuffer alive to e.g. show a boot splash until
the native display-engine drive loads. Needing display-engine
specific bindings totally contradicts the whole goal of 

It is generic by nature and I really do not see how clocks and
regulators are any different then interconnects here.

Note that we had a huge discussion about adding clock
and regulators to simplefb many years ago with pretty
much the same arguments against doing so. In the end it was
decided to add regulator and clocks support to the simplefb
bindings and non of the feared problems with e.g. ordening
of turning things on happened.

A big part of this is that the claiming of clks / regulators /
interconnects by the simplefb driver is there to keep things on,
so it happens before the kernel starts tuning off unused resources
IOW everything is already up and running and this really is about
avoiding turning things off.

Regards,

Hans



