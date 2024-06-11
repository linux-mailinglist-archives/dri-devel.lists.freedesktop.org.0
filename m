Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A520790463B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 23:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9D510E10A;
	Tue, 11 Jun 2024 21:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ed1cFV8V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D559510E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718141072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kwi6qR7i5j222N4J5ge6XLRF/OTcTMPoCLriE5Gui2Q=;
 b=ed1cFV8V+7tPpcspR5ARKiLxDXt9JR8OYiG9IjQgQ+PdyjNR+whBTenq+2ik/BthuxwSr8
 DPfdXUTmus6wbKBCffql4ddzs0DcSSCjknWYMVhajw0brCpZ47otNNXvblZw2xmYW3Cv8X
 dlHfUnB5qb+H+ic4S831p5b9lnk8D0A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-CDpC_0OtNSWi2IWIagtjuQ-1; Tue, 11 Jun 2024 17:24:31 -0400
X-MC-Unique: CDpC_0OtNSWi2IWIagtjuQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35f20e2f13dso1791989f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718141070; x=1718745870;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kwi6qR7i5j222N4J5ge6XLRF/OTcTMPoCLriE5Gui2Q=;
 b=dkHsNOVYsWTqGnpWfHUBoljP8Gwp0fe5L1vO1vE6raMLlAJRqdbDzkEx7Kh94nDuTf
 4RJB7fZau/ka7rquEgfp4ixzsVwp81oDQqa8tUoVTtzx/0jeYTIpD9i8kfeOHHwgwN09
 6xnxMWxusUC7NMZowJ1/kUS+U6Gnbn5GSnc9U6jz5GQWuG48BYpC+AFXsQujZ/ePCJXx
 /9SP+XylrpXWful5elHStqAEOmxcFnidyh903KaWESch+Uo1x0ax+ED8bxP4PfDLv4/F
 J5LaZN1pyU4/xVhpFu62tAmdouiR4M6RczV6OMbieFTMAektidwP9ORrsZKbwlNnVfAU
 ZcTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWeULnsS9sHVdT8RvqQniRrGmDegIr4rcXUNL5najJRJp3AxpKwiwMND063DYiZ5uIx6Hu0bxANlLugkaO4llkWR/P1hdlVy1TSueB7oeJ
X-Gm-Message-State: AOJu0YwkRmb/A6yFlBC1ut8nmmOCKoQlh4Ujra4AZuxRG+maVEy92VJN
 uYg5lC09P3PwHSrFajSlgK75+PlIFgT5FdzRmdYcFiUdXrjNq4xhnSgGRWFKS/pge+EMdjkS+UK
 ywScg3Tt8yeq8ksU7Lf2iiScgcOLImACwqTQmYqJvKE3XbToeA+N8stKkrSwmdCz7hQ==
X-Received: by 2002:adf:ee0d:0:b0:35f:1f80:1fa8 with SMTP id
 ffacd0b85a97d-35f1f802197mr5672718f8f.34.1718141069992; 
 Tue, 11 Jun 2024 14:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHBBTWZibR1MV4vH2a0NLkyidmwyfZ12S/ifHe7Sk/bckt//fu9s+WNF25Hd6AqZ58+o6TGA==
X-Received: by 2002:adf:ee0d:0:b0:35f:1f80:1fa8 with SMTP id
 ffacd0b85a97d-35f1f802197mr5672705f8f.34.1718141069543; 
 Tue, 11 Jun 2024 14:24:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f2c3fd63fsm3019565f8f.51.2024.06.11.14.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 14:24:28 -0700 (PDT)
Message-ID: <37402257-fbcb-449a-82a7-4acf878bb09d@redhat.com>
Date: Tue, 11 Jun 2024 23:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/nouveau: remove unused struct 'init_exec'
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: daniel@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kherbst@redhat.com, lyude@redhat.com
References: <20240517232617.230767-1-linux@treblig.org>
 <de79f41d-3a9b-4f15-b270-246af8b4c5b0@redhat.com>
 <Zmgo8leSWpsjVVBS@gallifrey>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Zmgo8leSWpsjVVBS@gallifrey>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 6/11/24 12:37, Dr. David Alan Gilbert wrote:
> * Danilo Krummrich (dakr@redhat.com) wrote:
>> On 5/18/24 01:26, linux@treblig.org wrote:
>>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>>
>>> 'init_exec' is unused since
>>> commit cb75d97e9c77 ("drm/nouveau: implement devinit subdev, and new
>>> init table parser")
>>> Remove it.
>>>
>>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>>
>> Acked-by: Danilo Krummrich <dakr@redhat.com>
>>
>> To which series does this patch belong?
> 
> Actually all of them were independent patches on drm
> some of which are all in, so it can be taken by itself.
> 
>> Need me to apply it?
> 
> Yes please!

Applied to drm-misc-fixes, thanks!

> 
> Thanks,
> 
> Dave
> 
>> - Danilo
>>
>>> ---
>>>    drivers/gpu/drm/nouveau/nouveau_bios.c | 5 -----
>>>    1 file changed, 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
>>> index 79cfab53f80e..8c3c1f1e01c5 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
>>> @@ -43,11 +43,6 @@
>>>    #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
>>>    #define LOG_OLD_VALUE(x)
>>> -struct init_exec {
>>> -	bool execute;
>>> -	bool repeat;
>>> -};
>>> -
>>>    static bool nv_cksum(const uint8_t *data, unsigned int length)
>>>    {
>>>    	/*
>>

