Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF5AAE8CD4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264A510E7BB;
	Wed, 25 Jun 2025 18:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="drTXUUfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E4010E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750877032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfMGLbUmp82Vp8zLQyE3ZcrJ967ELQfIfMW3hfSNO04=;
 b=drTXUUfK9GmIEbPzVVrxk0LWakCWy80LR+UDJWLLYwWBExoIxCDWq+OruJMcRD0cqoP8RW
 LtvikdiPVw+ISZNU5GjGf9vV1WMzVr3fua4d9SxfdIVvjypLy91yDGUbxjz1D08pl4SIJW
 dNr6NB4GJwFckyhmYSnyYQolnu+OIaI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-pQPIK_DBNpeKIGZszuiP5w-1; Wed, 25 Jun 2025 14:43:48 -0400
X-MC-Unique: pQPIK_DBNpeKIGZszuiP5w-1
X-Mimecast-MFC-AGG-ID: pQPIK_DBNpeKIGZszuiP5w_1750877027
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ade81d27cddso17159466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877027; x=1751481827;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EfMGLbUmp82Vp8zLQyE3ZcrJ967ELQfIfMW3hfSNO04=;
 b=j0LAamW9qNzw0tMkjLt6Rg1+O1rcIlnXgQbbGOdd1i0jROdHD/gQfej05iHMeYuhq0
 oSDHH44PMMtu5z1OMByIfHIIkZyaHsCk0gxMOzPPeVhspLSXQ7T2o68hZvjUSKkZjSFy
 +R2LDGpmZxR6JqIha0cBSA+UnJrmVQID/Ac6eP507yu3khJVFxuWJBdFTnrJ5r7klQ+e
 EqY9e9gjlIVmLt8cMYJuoqVRXkllYQvVHev3/eoQ3Gw1obSOUeqTp5uabWbEgUMdC62k
 /T/hn78ts1lf/YmwwImsQn/TcHxtllEjSYIP+AgP8VLOn8UJ9idvpAZbm/vvQlS8XinY
 pHcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5RQrUfXET3lX41iAcxTIbrSrvUXidJAVcRozNCNpExtA7PEkYgMeP3m4/i+8k1mXhWR9Uw10t0HA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6lZvHrybY5IkCCejl7+kXs6aZThMJ9XrnUobrUGz6UtEjCU3R
 ETLnReKt0CT9pnaKyPx2LTwKvQrnH9647E7tOBodDzKll2niunanPbWYAWsroAYuFLPcHGkN/CG
 JFZHTUYk21tAkg6XMRCJeMsBbngdjBtFUHtAg72Hd0EukBbwWcNAxorX4qKt88xXSzC8vLw==
X-Gm-Gg: ASbGncsJSijGTbmGcWu8la7UCmO3lg6wmE7iP427CCRvNHUlZKp7OB79JsOrwvzGeOk
 cZ3U22AfyUb5qHLInEAqd09UocODqoPhEV2Mp6I21nD0UoT4QtBmGoUPmjNaXa6BYCCNTw3mSQq
 FO6YduS4qsBers/7VcWUwERKOovtn8tvQ9hM6vokK54nK8T2OWHuqI6LoUEKqIFX8UnQWdGQH8o
 R5RAGvkCnlojTOH9Gk0WMJRfuP1FwQ1WtubbgCdMXXTZvnSKZg0LOi8Dxc0abg+vsJ26/O7P9cf
 cFN85G8c8H9G2YFzM1cnrhzBclZKRgW9tfL8W+Acul+2KjYAESyI6FerruAex0Nm43TbJmaNaOh
 BoABarLhFh2+MfkbjxzCnKdAcASYQ0OyOkRTGwD25GmdQrx+kssPOQ9MLZ1GontVSFtat7RpMVg
 ==
X-Received: by 2002:a17:906:4fc9:b0:ae0:bd4d:4d66 with SMTP id
 a640c23a62f3a-ae0d0bcaf6bmr112316266b.27.1750877027409; 
 Wed, 25 Jun 2025 11:43:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6yAfvOAABPEeadvXNEjRArNtdC8kCRJRHcRqV9aMzVyjyH3zlO48tY6N9PtKcjd+DMp4mkg==
X-Received: by 2002:a17:906:4fc9:b0:ae0:bd4d:4d66 with SMTP id
 a640c23a62f3a-ae0d0bcaf6bmr112312966b.27.1750877026869; 
 Wed, 25 Jun 2025 11:43:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0a9e514f9sm349350466b.63.2025.06.25.11.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 11:43:46 -0700 (PDT)
Message-ID: <eb98477c-2d5c-4980-ab21-6aed8f0451c9@redhat.com>
Date: Wed, 25 Jun 2025 20:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] agp/amd64: Bind to unsupported devices only if AGP is
 present
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aFwIu0QveVuJZNoU@wunner.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pEJdoJk1TzeBoa9C-_3o5Mz7rCLSrUoUb2G_8SN3_OQ_1750877027
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

On 25-Jun-25 4:33 PM, Lukas Wunner wrote:
> On Wed, Jun 25, 2025 at 04:08:38PM +0200, Hans de Goede wrote:
>> Lukas made me aware of this attempt to fix the KERN_CRIT msg, because
>> I wrote a slightly different patch to fix this:
>>
>> https://lore.kernel.org/dri-devel/20250625112411.4123-1-hansg@kernel.org/
>>
>> This seems like a cleaner fix to me and something which would be good
>> to have regardless since currently the driver_attach() call is doing
>> too much work because the promisc table catches an unnecessary wide
>> net / match matching many PCI devices which cannot be AGP capable
>> at all.
> 
> So how do you know that all of these unsupported devices have
> PCI_CLASS_BRIDGE_HOST?

The top of the driver says

 * This is a GART driver for the AMD Opteron/Athlon64 on-CPU northbridge.
 * It also includes support for the AMD 8151 AGP bridge

Note this only talks about north bridges.

Also given the age of AGP, I would expect the agp_amd64_pci_table[]
to be pretty much complete and the need for probing for unknown AGP
capable bridges is likely a relic which can be disabled by default.

Actually the amd64-agp code is weird in that has support for
unknown AGP bridges enabled by default in the first place.

The global probe unknown AGP bridges bool which is called
agp_try_unsupported_boot is false by default.

As discussed in the thread with my patch, we should probably
just change the AMD specific agp_try_unsupported to default
to false too.

> The only thing we know is that an AGP
> Capability must be present.
> 
> In particular, AGP 3.0 sec 2.5 explicitly allows PCI-to-PCI bridges
> in addition to Host-to-PCI bridges.

Ok, so we can add a second entry to the agp_amd64_pci_promisc_table[]
to match PCI to PCI bridges just to be sure, that still feels
cleaner to me.

Regards,

Hans


