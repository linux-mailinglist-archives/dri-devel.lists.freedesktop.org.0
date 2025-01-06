Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2229AA02B65
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 16:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFF910E19C;
	Mon,  6 Jan 2025 15:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cHCfKGrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD24410E19C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 15:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736178187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8+TDjby6KE4EMO7ds4q72h8NVWVA/u8ThRfkShnz9I=;
 b=cHCfKGrmDv7WXECG7t5ayVBcnuEZLtvzHFdxbRqFdWNT85Gb45z7+vndKN2o6MmqNXgjiX
 yKH1Y1b5Fb7rUIj4GJcCCGALRfYXbrx1+mULjw34y+fvpUnTuAKADF28MMI4Oq0osUICPs
 fnmbmWFc8SGriJC61h9JctBNdY3KtWw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-Fkf5jjtEN-6pOG7eAI-cdg-1; Mon, 06 Jan 2025 10:43:06 -0500
X-MC-Unique: Fkf5jjtEN-6pOG7eAI-cdg-1
X-Mimecast-MFC-AGG-ID: Fkf5jjtEN-6pOG7eAI-cdg
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa622312962so590489566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 07:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736178185; x=1736782985;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a8+TDjby6KE4EMO7ds4q72h8NVWVA/u8ThRfkShnz9I=;
 b=PK9KPdO53KydcHrW5r8wJJn2U8hwcPDykCHcFVqBwhcUN9Sw8oJ2MeSR7w0WZwh3Ji
 YrXEZsD3pGEBPnGRL0kov1K+IwWAAch/f3hIRM6RaWOjlKGF42OPVOyHg8i9GL67Y7RG
 YqXBwnEk4on6n6SiIo8gGWjEH70BXytSPY+4ybu3wZmeDurpbTClu2VEuHv05ErHaQbj
 SLvU3ppgVdiU/u2G9FGZ1gQkdDcNY6BjxLGaUT8qeW27uQ/pDI3j/nCfPf+LiuTelR+k
 CtyluK9PTy9yx0heVO9drSMnw+d6N6AsDXZqTufV5AUIJ1almgn2rpyji7d4LXYVuUka
 xeKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKowYoLcOEsVe8LAcSG9IOVj8GsFLmEwivROJVjy6rvD35YLiRXzm13eF2NqN5OUSFEv61CWFQDKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgyMi+m5H53DDzw3oZVKkn/fIPELMmw3C3BlN2vpAj+smoKKOm
 2v3xOmq8MMJTSc37/RmmNyPCYG1LUjeC1hhxmpdev7q9/LfOAa5WftM+KzaV1HyABNsZD3SkfnG
 HOeZvVUZwuLcdm5HeUlRZWXBRDiw7z7d1CIq0WvZ38d54l8i0EiYpoiZmw8pEYzO9Cw==
X-Gm-Gg: ASbGnctGk24lWf0fdJmeF8lwfOxjcaEyZuoR92YbTCA6X1d7k5/3HfwIZ+yVb5DcZbh
 98jp3pbxHawVLtcW6ESdU52Q/jKQNQmx2Ky+SjABdnVSYofT/H8C22brX5/JNjJ4n/2zuGeqvjc
 FfsvIoPg3tUcCXUMpjgms/SzEnc0KlgVv3xHyRPbfmQacXLyi/e4FxpiIwr7DM9rfP6WTjPsD+d
 6zGd2gprrGmv4Pe8za8ipklte+hqQOMdfzLofHcWRSRc+4/eJstNg7qKDzP3sdHZ9CV8D9qX5UR
 OR3L3oW+JNzKly7ki/unWsy1Ehf1APZQtt4t4VNYspg7LWSsJDsBow3n407Y6BQNxfMiAhUf/M/
 xnRN3BfEOjbYc3sCuxvp604I3bfFPB7M=
X-Received: by 2002:a17:907:60d0:b0:aab:933c:4125 with SMTP id
 a640c23a62f3a-aac2702afb5mr5740127866b.10.1736178185487; 
 Mon, 06 Jan 2025 07:43:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoWFIOSEiFHslSxQ8PU0t1ES9RVQ8WPUWcdVI/Jbu6BoiLVlmCy3XsgKJFB9kF05shhAOW7g==
X-Received: by 2002:a17:907:60d0:b0:aab:933c:4125 with SMTP id
 a640c23a62f3a-aac2702afb5mr5740120566b.10.1736178183924; 
 Mon, 06 Jan 2025 07:43:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f218sm23879990a12.26.2025.01.06.07.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 07:43:02 -0800 (PST)
Message-ID: <b1436351-df89-4f57-b394-6cd202d9cb9a@redhat.com>
Date: Mon, 6 Jan 2025 16:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vbox: Enable VBOXGUEST and VBOXSF_FS on ARM64
To: Christian Kujau <lists@nerdbynature.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org
References: <7384d96c-2a77-39b0-2306-90129bae9342@nerdbynature.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7384d96c-2a77-39b0-2306-90129bae9342@nerdbynature.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mO5aWsQW3jCW4cjOriUoN33aqcmkPp2kF7F1-AdE-M4_1736178185
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

On 6-Jan-25 4:32 PM, Christian Kujau wrote:
> Now that VirtualBox is able to run as a host on arm64 (e.g. the Apple M3 
> processors) we can enable VBOXSF_FS (and in turn VBOXGUEST) for this 
> architecture. Tested with various runs of bonnie++ and dbench on an Apple 
> MacBook Pro with the latest Virtualbox 7.1.4 r165100 installed.
> 
> Signed-off-by: Christian Kujau <lists@nerdbynature.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/virt/vboxguest/Kconfig | 2 +-
>  fs/vboxsf/Kconfig              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virt/vboxguest/Kconfig b/drivers/virt/vboxguest/Kconfig
> index cc329887bfae..11b153e7454e 100644
> --- a/drivers/virt/vboxguest/Kconfig
> +++ b/drivers/virt/vboxguest/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VBOXGUEST
>  	tristate "Virtual Box Guest integration support"
> -	depends on X86 && PCI && INPUT
> +	depends on (ARM64 || X86) && PCI && INPUT
>  	help
>  	  This is a driver for the Virtual Box Guest PCI device used in
>  	  Virtual Box virtual machines. Enabling this driver will add
> diff --git a/fs/vboxsf/Kconfig b/fs/vboxsf/Kconfig
> index b84586ae08b3..d4694026db8b 100644
> --- a/fs/vboxsf/Kconfig
> +++ b/fs/vboxsf/Kconfig
> @@ -1,6 +1,6 @@
>  config VBOXSF_FS
>  	tristate "VirtualBox guest shared folder (vboxsf) support"
> -	depends on X86 && VBOXGUEST
> +	depends on (ARM64 || X86) && VBOXGUEST
>  	select NLS
>  	help
>  	  VirtualBox hosts can share folders with guests, this driver
> 

