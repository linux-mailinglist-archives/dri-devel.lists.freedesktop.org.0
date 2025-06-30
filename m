Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C12AEDA81
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073E310E407;
	Mon, 30 Jun 2025 11:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qpm35KlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD31A10E407
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 11:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751281830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M51SNgRSdkBVqofCljCWPGL6IaM6V48QvSeJNOH04Cs=;
 b=Qpm35KlZ3gTiIsi1emYhjlNyyUsE62HUF5XwZmFhaoceH06YRln/JAIePT82phOXoMVyZ3
 zelt1u5DGV/lJR17c+mxK59Pfd/z94hdxe3MgaAITvpPDyhWUiNrjDbKxjjUu8zbBT/hon
 N5mHOf1nC5c+0/P4HbkQxCw3JZ3YyDo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-2ZZ4WQ7UNYuSB8rheqFqmg-1; Mon, 30 Jun 2025 07:10:27 -0400
X-MC-Unique: 2ZZ4WQ7UNYuSB8rheqFqmg-1
X-Mimecast-MFC-AGG-ID: 2ZZ4WQ7UNYuSB8rheqFqmg_1751281826
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-60728151592so2040894a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 04:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751281826; x=1751886626;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M51SNgRSdkBVqofCljCWPGL6IaM6V48QvSeJNOH04Cs=;
 b=Mf/v4Qt+4OwSxgON/ezx+sZkj/2zKqD9McFR9EsDPygvHojwlC3KmUBnopGIUE8Zkg
 AiCOdl9sKl/0lfdPw9fVIbKFaEGuMPaKX/9Zs7Eanh1HUQa+o8fFfS5FAQIGyb1eoz9s
 24WpxRqCwMqkbheZ1K+0qyf2dbi3yLBs+OixN4nahyQSXQStK9f9gGoT7/6S8QDv2VJ3
 GQz7VN3z/cOzTqEjs6YWgsihkQskJFJEu7SH1MT7BJJ6Ad60qk0UIV9ZP+5Yls31LZay
 FwWUfHnvEFfG6oPm34U10qTSw1jSEs4ecW0utlfg6C1QrvlPa3RXbl1wuF3VgS2pEe8W
 /LqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXXCPT2I3unHMpV2lNAHXc4jUfdULkshySXUrQ56XT9OMGC3DWm8TPKhyCUJ5PTM5u0+Vo1tPn1uc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzutaED2tDO8zNn7Xto7dTeqXQ3bwPoxAHawQ6d5yWFW0A5xxba
 dKuqwz8MJvpb0Klzx4uPEdpe1NerS23Hq+o9L+3s2gzGd+efIL/LPv1U/6F2JoCyYccv24WiIe7
 CHwtPzSuoYBJGh1qFZ2HnAftL39xqZEFZ1D5ExwRQY7L9WvXFWpAskhHlAgDwtvkMd0eq4g==
X-Gm-Gg: ASbGncsxgqyObbcQHo/CvQ6EzNMwhspO1bMF6xq/NfgXnjCreSr73Q1n+7UWTfkkxg2
 hGyovICnXUQHsfi+C3AQMttixUoR+rtt4UdAFfJSIT/mxKIQFXyPQhC3PcbQmxcn8SIqJB4+0UG
 c9pwQ3dXIhwRHxaTnXd4O/MOfKiRIlTG/AQddVJFwTnM1XGBI3CWRV0/MIs/8gzflz1J4WqkW2D
 bRfomxbFceWfSMdjHg/yJyEk8IJRqt2G34FBa4tFMdAfZ+e9rFtH6zZ4HW7BK7Ec5kEO990fAie
 g045ljxeQaGOPhKfhw1dpqVZBO06HqXI/WavtEjNOFmUU2tE7NlXeQl9GalZQ2oei12M178vkd0
 uQrx+fCapTyOW0d4B69VrhVYJPQsDshTYHP9zsQBtVR3/1nAD/qeDAR1TH8bQDO5XQ9ZGkT7BNQ
 ==
X-Received: by 2002:a05:6402:2550:b0:60c:4220:5d89 with SMTP id
 4fb4d7f45d1cf-60c88e049ffmr10654096a12.23.1751281826059; 
 Mon, 30 Jun 2025 04:10:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq6/wmQdRyWuusd+TrsspGtgm4nht0FD4qB/wN9wyan/H6VbfFrLbQcWsRb+AImUtwr0ZQ5A==
X-Received: by 2002:a05:6402:2550:b0:60c:4220:5d89 with SMTP id
 4fb4d7f45d1cf-60c88e049ffmr10654051a12.23.1751281825601; 
 Mon, 30 Jun 2025 04:10:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c831cb724sm5730480a12.53.2025.06.30.04.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 04:10:25 -0700 (PDT)
Message-ID: <e0bcd0a8-dbb5-4272-a549-1029f4dd0e41@redhat.com>
Date: Mon, 30 Jun 2025 13:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] agp/amd64: Bind to unsupported devices only if AGP is
 present
From: Hans de Goede <hdegoede@redhat.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Ben Hutchings <ben@decadent.org.uk>, David Airlie <airlied@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
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
 <98012c55-1e0d-4c1b-b650-5bb189d78009@redhat.com>
 <aFwIu0QveVuJZNoU@wunner.de>
 <eb98477c-2d5c-4980-ab21-6aed8f0451c9@redhat.com>
In-Reply-To: <eb98477c-2d5c-4980-ab21-6aed8f0451c9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -2COxr1m2sa7Y2Y10Lr9BYlYiulRSd2IaqKYtGtPq8U_1751281826
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

Hi,

On 25-Jun-25 8:43 PM, Hans de Goede wrote:
> Hi,
> 
> On 25-Jun-25 4:33 PM, Lukas Wunner wrote:
>> On Wed, Jun 25, 2025 at 04:08:38PM +0200, Hans de Goede wrote:
>>> Lukas made me aware of this attempt to fix the KERN_CRIT msg, because
>>> I wrote a slightly different patch to fix this:
>>>
>>> https://lore.kernel.org/dri-devel/20250625112411.4123-1-hansg@kernel.org/
>>>
>>> This seems like a cleaner fix to me and something which would be good
>>> to have regardless since currently the driver_attach() call is doing
>>> too much work because the promisc table catches an unnecessary wide
>>> net / match matching many PCI devices which cannot be AGP capable
>>> at all.
>>
>> So how do you know that all of these unsupported devices have
>> PCI_CLASS_BRIDGE_HOST?
> 
> The top of the driver says
> 
>  * This is a GART driver for the AMD Opteron/Athlon64 on-CPU northbridge.
>  * It also includes support for the AMD 8151 AGP bridge
> 
> Note this only talks about north bridges.
> 
> Also given the age of AGP, I would expect the agp_amd64_pci_table[]
> to be pretty much complete and the need for probing for unknown AGP
> capable bridges is likely a relic which can be disabled by default.
> 
> Actually the amd64-agp code is weird in that has support for
> unknown AGP bridges enabled by default in the first place.
> 
> The global probe unknown AGP bridges bool which is called
> agp_try_unsupported_boot is false by default.
> 
> As discussed in the thread with my patch, we should probably
> just change the AMD specific agp_try_unsupported to default
> to false too.
> 
>> The only thing we know is that an AGP
>> Capability must be present.
>>
>> In particular, AGP 3.0 sec 2.5 explicitly allows PCI-to-PCI bridges
>> in addition to Host-to-PCI bridges.
> 
> Ok, so we can add a second entry to the agp_amd64_pci_promisc_table[]
> to match PCI to PCI bridges just to be sure, that still feels
> cleaner to me.

ping? It would be good to get some consensus on how to
fix this and move forward with a fix. Either the patch from
this thread; or my patch:

https://lore.kernel.org/dri-devel/20250625112411.4123-1-hansg@kernel.org/

Works for me, the most important thing here is to get this
regression fixed.

Regards,

Hans

