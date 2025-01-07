Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B053CA04402
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3177710E71C;
	Tue,  7 Jan 2025 15:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZGlL+Aiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D32310E71C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736263009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ma3/zh91C/LiLjTFUq58PsMa7gSqvD7Ef9W+toJutkk=;
 b=ZGlL+AiuKWUe9XVFgcdU4uquPN/Xv87WR+JPJHcmwS6Sf8gOO41tMfTrxbUWq10VOZdDjP
 xqh+hojzbZyVQR4Fw9fXaYjnrr2eUKiAx34Hx6BZny8zI6SqARHHdif4wGAsCOOuqN0ZpH
 NMXQdWEeeaSvh51qlf+tOGr8N4ooAao=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-Y7dr9GSAOseuvzsLLj1OCA-1; Tue, 07 Jan 2025 10:16:48 -0500
X-MC-Unique: Y7dr9GSAOseuvzsLLj1OCA-1
X-Mimecast-MFC-AGG-ID: Y7dr9GSAOseuvzsLLj1OCA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e1339790so9448315f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 07:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736263007; x=1736867807;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ma3/zh91C/LiLjTFUq58PsMa7gSqvD7Ef9W+toJutkk=;
 b=E/jBZ8Lv9UFOLnEhdK8zoSFjy7rdSxiubvqZrcEnkJoGsCVkmjasadrJ0KPW9BE5Mv
 GbLHKiRz12aNTI4mNXF+mv3WsDJvY7G787WXMhTcGQdRpWO6GRfjttHF0kSE1ABY1Hre
 phTDh9myieoOARhGuZbW1YS/420L1Kv2o8tzZ077CROabTg2PPhWCw80y4TgXSWFknz6
 jD9u33Ta/kqLoQuzciX/8sxEqmKWuaek9BlqTn1jWl78jeK54F+esW3TG25I5sEEIAVu
 gjYYAi4KvppiDMi1UFt3WOFGBNkbhY8Q5/6OPjAsvCSFiX+Jxb9JZgsnvtY9Z1BXNpdu
 gosg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX373KKFZIGQMqCRpyLr1N6MMeRV1wq6Nz0/etvtsn755QEOCnztcKPLHnw8kwVUWJRPAV5tnySOVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk90Pgv9J1ZMsG8Oxk44XJAylgVQrD8qRmsk4644P4s0djM1Rc
 X2gSnZgRDCP3UTHpUpQzsXZOM8HH6GSfhvRoQQLdr2On92+2cemj7rykyQYKWxRXtIpwX7AkO9Z
 RmIvMSy7pfny3cpvmLsw1KJRvX1SdmXMdZACKKEkftxKbJhR/s/a9vROnQnkQ5xtkGg==
X-Gm-Gg: ASbGncugw/+knbPtGRwAkLFJuboArCSkjZdglKmFV1jgHibsAqfozEHtJaPJntR/wnE
 61c90yvLaVXU1mbN7U/kI8uikKsJytLIB4ytyMIlv/389gwlP/NtNe1WvfaOk8tYr9JGz2wszCI
 ySMreBx62Q8wF3p6RCQseFnQbTswF6zP2jlZJjbNxgIgWQxICiq56Yfrfv3jqeYsRLAX/0EJO45
 ZOHFhmSaviYVI4opyhMAT/Tx8C9DMS4HIpDLcb810R9ztyN7YgjQKbZiX0csm8As2izoe3AyPAe
 juqJzYkAPqfjBbgHwuv9bZ6ukxy6OuE8p1RYfZUtiJMGV3YTtRWKo640Vig/GbIivH0hXvowJRq
 EhwcYc0TEsoSD/4pvrutBrbkhj8jh/y0=
X-Received: by 2002:adf:ae01:0:b0:38a:615c:825b with SMTP id
 ffacd0b85a97d-38a615c8353mr15606231f8f.21.1736263005771; 
 Tue, 07 Jan 2025 07:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9Eqpa+YyRD8YF7F9Tb5CZKRDg6aF0h++RnF6RkL7nTIJkdzBiIwiqHG0JFE3gBl2fKiBe7w==
X-Received: by 2002:adf:ae01:0:b0:38a:615c:825b with SMTP id
 ffacd0b85a97d-38a615c8353mr15606194f8f.21.1736263005378; 
 Tue, 07 Jan 2025 07:16:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f013946sm2414147366b.136.2025.01.07.07.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:16:44 -0800 (PST)
Message-ID: <7854ef21-0a4f-4afa-a1f7-90e5cec19032@redhat.com>
Date: Tue, 7 Jan 2025 16:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vbox: Enable VBOXGUEST and VBOXSF_FS on ARM64
To: Christian Kujau <lists@nerdbynature.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org
References: <1c6f68d1-a51a-1c38-2eca-89fa63dc30c6@nerdbynature.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1c6f68d1-a51a-1c38-2eca-89fa63dc30c6@nerdbynature.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CkRnPqIJQk9y6vfA22UdFh5iqBMb3DtiyWySxkrdBMU_1736263007
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

Hi Christian,

On 7-Jan-25 4:01 PM, Christian Kujau wrote:
> Now that VirtualBox is able to run as a host on arm64 (e.g. the Apple M3 
> processors) we can enable VBOXSF_FS (and in turn VBOXGUEST) for this 
> architecture. Tested with various runs of bonnie++ and dbench on an Apple 
> MacBook Pro with the latest Virtualbox 7.1.4 r165100 installed.
> 
> Signed-off-by: Christian Kujau <lists@nerdbynature.de>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thank you for the new version, note that v2 has already been applied
to the vfs tree though.

This is fine, the missing changelog is really not a big deal and
the changelog gets dropped on applying the patch anyways.

So this is all merged up now.

Regards,

Hans




> 
> ---
> v3: version history added, along with Hans' Reviewed-by
> 
> v2: vboxvideo change removed, see:
>     https://lore.kernel.org/lkml/7384d96c-2a77-39b0-2306-90129bae9342@nerdbynature.de/
> 
> v1: initial version, see:
>     https://lore.kernel.org/lkml/a969298e-0986-470c-9711-703af784d672@redhat.com/
> 
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

