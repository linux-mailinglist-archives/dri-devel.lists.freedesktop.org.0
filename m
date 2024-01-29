Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF78403E9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7B210E0BA;
	Mon, 29 Jan 2024 11:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A212112839
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706528167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VSwAcK58hM0Z/l1Z5EfYbk6XVvLfJDSNPQjLmOSbPZ4=;
 b=ioHKdtuPg91pyNlo7GuoifUXNFVOPsLWeAI2dPy9OAAuhFqJJT0O9rnyzId9tkhscQ/+PC
 5S5eitSpI9Az1EJ/uaCbHRrY9h+q+7skATdTD835VR51jJ0Ato3an1lef+kYMEdIRKQm1E
 ODlGYRX+dVdPYM8gPcCPLjKqmn7yaJk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-dF8V4B6cNbWr1Iy9AIOz4g-1; Mon, 29 Jan 2024 06:36:05 -0500
X-MC-Unique: dF8V4B6cNbWr1Iy9AIOz4g-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a2bc664528fso146274966b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706528164; x=1707132964;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VSwAcK58hM0Z/l1Z5EfYbk6XVvLfJDSNPQjLmOSbPZ4=;
 b=HVV0bFAiATf/I69/g6JGXi8T32/cGwA9ZdeLVMdSshyA3sNHG7PJlKr5CT38Ua5Dj0
 kBVzgRUy7iGcrXsC1rYnIERwCubo3Uigcu5LBu5anHYQ0sJrHD2zyVpaSY7QjoV1IthZ
 kxhF35HzRwP/u16UWEWIYWUbMJmqhS3gsVYGTrGiAHejaRVt0qS0RTJb5mhnkFvoCCuL
 uxeQp6y3XUU2Jo84eMYABxIaTgsic4xY9Jz4YyKqJesxISezT5dDP4xiVdqGsqCqwqPT
 J8/ndoU6iJ+jJ8LYfGhLWVbIuff8Vgj5AoeDzaNjCxtO2UEHgocYz9tda9vPoeBVJLp/
 JDVA==
X-Gm-Message-State: AOJu0YwFMKs+m3LVdleb5IRji57nydOidIInGNVhkun6VG8x1n3i5ivp
 /b9EXmgGNPCimZXDD0f7xo88JYrAPJ+vYzps8E/FKgS7Om0d/M7pQy/0kTZd14rim53ew7xQOPa
 Z/MhurPNSrV8EBXi4oOsuCVPNjOh+a/tOUvhOLiZwpq+VCkjMzAgk2XzsaFbzNYoAtw==
X-Received: by 2002:a17:906:3444:b0:a2f:46c7:4658 with SMTP id
 d4-20020a170906344400b00a2f46c74658mr4552864ejb.28.1706528164636; 
 Mon, 29 Jan 2024 03:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIZpOXEoPwROBF4E9qtZt60pik+8hvS2CQTLnSEDgdwAO5aGeS4xjRq4TaN6UUtSXwOCC1SQ==
X-Received: by 2002:a17:906:3444:b0:a2f:46c7:4658 with SMTP id
 d4-20020a170906344400b00a2f46c74658mr4552847ejb.28.1706528164306; 
 Mon, 29 Jan 2024 03:36:04 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 eg13-20020a056402288d00b0055f02e1e83csm836471edb.21.2024.01.29.03.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 03:36:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 5/8] firmware/sysfb: Create firmware device only for
 enabled PCI devices
In-Reply-To: <20240117125527.23324-6-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-6-tzimmermann@suse.de>
Date: Mon, 29 Jan 2024 12:36:03 +0100
Message-ID: <87le88v0bg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Test if the firmware framebuffer's parent PCI device, if any, has
> been enabled. If not, the firmware framebuffer is most likely not
> working. Hence, do not create a device for the firmware framebuffer
> on disabled PCI devices.
>
> So far, efifb tracked the status of the PCI parent device internally
> and did not bind if it was disabled. This patch implements the
> functionality for all firmware framebuffers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  
> +static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
> +{
> +#if defined(CONFIG_PCI)
> +	/*
> +	 * TODO: Try to integrate this code into the PCI subsystem
> +	 */
> +	int ret;
> +	u16 command;
> +
> +	ret = pci_read_config_word(pdev, PCI_COMMAND, &command);
> +	if (ret != PCIBIOS_SUCCESSFUL)
> +		return false;
> +	if (!(command & PCI_COMMAND_MEMORY))
> +		return false;
> +	return true;
> +#else
> +	// Getting here without PCI support is probably a bug.
> +	return false;

Should we warn before return in this case ?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

