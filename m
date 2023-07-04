Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381F747661
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D6C10E18E;
	Tue,  4 Jul 2023 16:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5910E18E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688487826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2FITFWtbRXE3gky2EO4aMziTa3J/r1+wMO4yc2vs7Pc=;
 b=cEmRqCFJky+Y1njU1kLwe5XQcJQIdkA0lRBWm709fwb139FCHQwkjr5D9gH5Mk2w8Mj4Sw
 G2jxdpp8xXsHYmlySxmzPHo9O2rNrOZxbuvPoenihq3JpFM8gee4oJ+uSlLrNcB+phAvqB
 vHIBlqGnGvBQgzlBV/nodS7oIWapKBc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-4t2LoqAVNp--3NO6wNd9gA-1; Tue, 04 Jul 2023 12:23:43 -0400
X-MC-Unique: 4t2LoqAVNp--3NO6wNd9gA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f81dda24d3so63661805e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 09:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688487822; x=1691079822;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2FITFWtbRXE3gky2EO4aMziTa3J/r1+wMO4yc2vs7Pc=;
 b=OCjap5t6CZBoQEq/wpJMhXvuEzXj4lgI/7R6/Wy443wsPwoeqB1XhRFeq15hGmTGdp
 QX7M72lPKOYTC5+kaiq14bi73+Ds+hqgGpWB0Xt86fRCgLEOAIQNpW22aPLVjlGypGg4
 z3o1YFtmcF6BiAwJaU9ewpHfblvjrEovY70ljAhyXNttcxpVZ5SyEN0N8o9fOj5cDAUn
 ATl74PCnwUE17YryPdwHxMps/zX+QmD6nNMhVLCcF0N2Xp1lCqSjwKRYAyyZ4fmECcgV
 3M6f1NIHwx+HZT6GQve2ju+cXGJhY+7HUjMYzXQFicrfyPV3OfpuFjBzSW5/wxxyLYkE
 iBAg==
X-Gm-Message-State: AC+VfDyCJOq6tDTEU+JHMexH96kfH7lH2uhBr21PvcRs6vXIunNrW/ut
 rbxmde5Og+ou2pUM2zocfEttGRS50xaNLq+njN2cOvvVnQMNVW5Z2n5xmiQbSGJa4YaJlNnZ5QR
 hdNFKyDOCAydrnA3ermzg54ui2JGi
X-Received: by 2002:a05:600c:2145:b0:3fb:415f:a85b with SMTP id
 v5-20020a05600c214500b003fb415fa85bmr18158821wml.3.1688487822321; 
 Tue, 04 Jul 2023 09:23:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7T04nL74CM9kmUBFWNxbGLn7ruUc6nb3zVFQfaw7cBAYtqvH64gACvFSpImO/HrduwXThnBg==
X-Received: by 2002:a05:600c:2145:b0:3fb:415f:a85b with SMTP id
 v5-20020a05600c214500b003fb415fa85bmr18158793wml.3.1688487821958; 
 Tue, 04 Jul 2023 09:23:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003faabd8fcb8sm24447459wmi.46.2023.07.04.09.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 09:23:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH 01/12] efi: Do not include <linux/screen_info.h> from
 EFI header
In-Reply-To: <20230629121952.10559-2-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-2-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:23:40 +0200
Message-ID: <87ilazlk6r.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The header file <linux/efi.h> does not need anything from
> <linux/screen_info.h>. Declare struct screen_info and remove
> the include statements. Update a number of source files that
> require struct screen_info's definition.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

