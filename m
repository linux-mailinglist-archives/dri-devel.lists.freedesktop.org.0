Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D81AE85AF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 16:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7349F10E73A;
	Wed, 25 Jun 2025 14:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BHXJYYNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A7310E73A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 14:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750860525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4+K3avD7GoDzKHCaevIc+37/y9NZXSewwiBIBUmICw=;
 b=BHXJYYNm7JEO30nwald4idGy9zPNyQ5qFxvUXsek7QnmrJy6kwGYedvtb6dZ0G0FK4szRI
 5bUJdVigSBoMKTaZ1K3pZ5F01oMdaRWK+DYldVEMM7Ar98Qk3BuE3HwyCzz+S1+1x5hXHB
 4pNKvJrYadS+YmB9Kzxrbqf/3nGf3Hc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-UisvUD02MU6fsbHTrKuSwg-1; Wed, 25 Jun 2025 10:08:44 -0400
X-MC-Unique: UisvUD02MU6fsbHTrKuSwg-1
X-Mimecast-MFC-AGG-ID: UisvUD02MU6fsbHTrKuSwg_1750860522
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ad89c32a8a6so170258266b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 07:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750860521; x=1751465321;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V4+K3avD7GoDzKHCaevIc+37/y9NZXSewwiBIBUmICw=;
 b=ZNXgfaCFxkV8cf6zkjdaK3v07w/emwCTWdn3jQwCsDgshieTHA2ReIGh+EO6Zi9qXo
 igrSXCS9P74pZ3xGBlDGKdUP/X9qHGTV6YTyAqshtprNtPZn393Y84WXBXHVIjSUEf6D
 7JoXoR75ewcv9IiIHqDe1z18gy5tq/BKypNO7HlDoGcBvvSSO1wcsHaIVj1yt1qYly5w
 E1e8nr19kyqjpSMKAl8Umkehmx6plfhrRDbubEyZDCAGiVdiwrlViJVv8xgXF2c2uJ/9
 Jmd7RG+kcv65PZ7nQhjh/YfOk8dI53cGMnA7IPnB7YlwWP3YFLE1JPTqstH+0ox4XIht
 kzPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTspI2ekwziNv6paYGsoq8HzEKYoyXVPQciG4QoRIaZsPMU7XV9s1MlaL45dGNhhWjZp+QOaUqvjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRv2Mfz7m5MhhzTvMSvRUfItJSgoSZsxX8aycgTAVBn8W6cftx
 49qJTFEPBt+eA7fs9A1wwHpuFVTn5+0XDoC2dmtvyTB8X3sLl3KDE+WkFwvjS0RmYovrJ1rOPiN
 ohag8lL1oTAPJh37ejNS4iaJk17BEIXHGkq4lMTt/fYUFIqOnOa46zsBU93OI5VPKMFeGpA==
X-Gm-Gg: ASbGncv4d0y37M2fxsPm5qvCNTMRAxF0rkvqjTU+RRgqtA2xAgdpeIAAk4RJbLTab1R
 TMSNV2kBxd222AFa1iWwHptDgZdv1rzFZbqKqjXEUe2PI2Qd3mkS0//aNFrjHw0DuwkR+OtpFr/
 royv8LQob7PuVtN5tUuoSFzxSiecV4AbZpwtQWOpkLzKRpb2gPiPzNpFhQ/KpmnZlZ8UAzJYiJT
 tIH/nwq1oRU84+I+PDmJtnThipeDWUjo+Mnic6CRL6mmngf6OscPY/eQuNMF0FTn4KVMD+0V1NG
 hgOITesZgB/2MdyC0l6luRRAyRDJVtXB90iqhwsZ/4DnkkgwXzmGkHg/STH/wWU3GJ9uQtsyKvh
 ZjY5Mi5pBJiuYmJb91hcUr7+z6EIOvqaiKGKqEebydSgGx0SK05CpGVtkzr+EFLRrOZDVRdxM2g
 ==
X-Received: by 2002:a17:907:3f16:b0:ade:9b52:4cc0 with SMTP id
 a640c23a62f3a-ae0d0bbff7amr10282666b.26.1750860521301; 
 Wed, 25 Jun 2025 07:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Qpscb/cqw9IejULOiGOs7xdQutSOhkhMnafJly1OjTfXu1ZIPsra55NDTVtRCoKZhHpE3A==
X-Received: by 2002:a17:907:3f16:b0:ade:9b52:4cc0 with SMTP id
 a640c23a62f3a-ae0d0bbff7amr10276266b.26.1750860520679; 
 Wed, 25 Jun 2025 07:08:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0a2d922c9sm362700166b.96.2025.06.25.07.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:08:40 -0700 (PDT)
Message-ID: <98012c55-1e0d-4c1b-b650-5bb189d78009@redhat.com>
Date: Wed, 25 Jun 2025 16:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] agp/amd64: Bind to unsupported devices only if AGP is
 present
To: Ben Hutchings <ben@decadent.org.uk>, Lukas Wunner <lukas@wunner.de>
Cc: David Airlie <airlied@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andi Kleen <ak@linux.intel.com>, Ahmed Salem <x0rw3ll@gmail.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-pci@vger.kernel.org
References: <f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de>
 <b73fbb3e3f03d842f36e6ba2e6a8ad0bb4b904fd.camel@decadent.org.uk>
 <aFalrV1500saBto5@wunner.de>
 <279f63810875f2168c591aab0f30f8284d12fe02.camel@decadent.org.uk>
 <aFa8JJaRP-FUyy6Y@wunner.de>
 <9077aab5304e1839786df9adb33c334d10c69397.camel@decadent.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9077aab5304e1839786df9adb33c334d10c69397.camel@decadent.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Is0RHcBSMG9eVB5QFgOAwKnBe9-v2oK4lLUHrVuqFk_1750860522
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

On 24-Jun-25 11:54 PM, Ben Hutchings wrote:
> On Sat, 2025-06-21 at 16:05 +0200, Lukas Wunner wrote:
>> On Sat, Jun 21, 2025 at 03:51:44PM +0200, Ben Hutchings wrote:
>>> On Sat, 2025-06-21 at 14:29 +0200, Lukas Wunner wrote:
>>>> On Sat, Jun 21, 2025 at 02:07:40PM +0200, Ben Hutchings wrote:
>>>>> On Sat, 2025-06-21 at 11:40 +0200, Lukas Wunner wrote:
>>>>>> Since commit 172efbb40333 ("AGP: Try unsupported AGP chipsets on x86-64 by
>>>>>> default"), the AGP driver for AMD Opteron/Athlon64 CPUs attempts to bind
>>>>>> to any PCI device.
>>>>>>
>>>>>> On modern CPUs exposing an AMD IOMMU, this results in a message with
>>>>>> KERN_CRIT severity:
>>>>>>
>>>>>>   pci 0000:00:00.2: Resources present before probing
>>>>>>
>>>>>> The driver used to bind only to devices exposing the AGP Capability, but
>>>>>> that restriction was removed by commit 6fd024893911 ("amd64-agp: Probe
>>>>>> unknown AGP devices the right way").
>>>>>
>>>>> That didn't remove any restriction as the probe function still started
>>>>> by checking for an AGP capability.  The change I made was that the
>>>>> driver would actually bind to devices with the AGP capability instead of
>>>>> starting to use them without binding.
>>>>
>>>> The message above would not be emitted without your change.
>>>>
>>>> The check for the AGP capability in agp_amd64_probe() is too late
>>>> to prevent the message.  That's because the message is emitted
>>>> before ->probe() is even called.
>>>
>>> I understand that.  But I don't feel that the explanation above
>>> accurately described the history here.
>>
>> So please propose a more accurate explanation.
> 
> Something like "The driver iterates over all PCI devices, checking for
> an AGP capability.  Since commit 6fd024893911 ("amd64-agp: Probe unknown
> AGP devices the right way") this is done with driver_attach() and a
> wildcard PCI ID table, and the preparation for probing the IOMMU device
> produces this error message."
> 
> Thinking about this further:
> 
> - Why *does* the IOMMU device have resources assigned but no driver
>   bound?  Is that the real bug?

Arguably yes, but I assume that this is done because the IOMMU needs
to be setup early, before any drivers probe() methods run.

Note that cbbc00be2ce3 ("iommu/amd: Prevent binding other PCI drivers
to IOMMU PCI devices") which has been reverted did effectively ban
other drivers from binding. So arguably that needs to be unreverted
and then this problem will go away.

> - If not, and there's a general problem with this promiscuous probing,
>   would it make more sense to:
>   1. Restore the search for an AGP capability in agp_amd64_init().
>   2. If and only if an AGP device is found, poke the appropriate device
>      ID into agp_amd64_pci_promisc_table and then call driver_attach().
>   ?

Lukas made me aware of this attempt to fix the KERN_CRIT msg, because
I wrote a slightly different patch to fix this:

https://lore.kernel.org/dri-devel/20250625112411.4123-1-hansg@kernel.org/

This seems like a cleaner fix to me and something which would be good
to have regardless since currently the driver_attach() call is doing
too much work because the promisc table catches an unnecessary wide
net / match matching many PCI devices which cannot be AGP capable
at all.

Regards,

Hans




> 
> Ben.
> 

