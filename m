Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107974767C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C7610E2F7;
	Tue,  4 Jul 2023 16:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A8110E2F7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688487994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3N/Gyf3beclIUSfPsZhAnE2wLloPptbf+HqX/lLqDWc=;
 b=g+DX2seDkWIAuYUabya+xSkyllpMDDn0/1/TOzi3nGYdEqOgirNvjx2Uo0UB1PBu/St1RE
 QqBMSPsIEsyIvpHJhPellrx3jFlzVS+DkrTtWgmE9el3L6MgzqPtWesWLyH0M01CZ74TJw
 0vwnf+NfzIxJVdk5oBK2H4zUtyzMmUA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-Bs0tLfelMNSzEeGuMPhf6g-1; Tue, 04 Jul 2023 12:26:32 -0400
X-MC-Unique: Bs0tLfelMNSzEeGuMPhf6g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbb18e9bd9so27191755e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 09:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688487991; x=1691079991;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3N/Gyf3beclIUSfPsZhAnE2wLloPptbf+HqX/lLqDWc=;
 b=EIUp5AicWAkc6/eqDswmUsSR1tvY/6MkNrOVMXkQhkexBXfk26nvNH3gumNWRnegwu
 iuFkN3aw9EORDdUr6mVWmlMZdUmahV4y28K6Xb33F0FbymIIMXSFX07m9LykwGZP65pH
 BIRwkWfSuZuVOtKKPPSuXqTJb6fI3J+ktDJApXzuEDbux8ohv7g9Q4rNjjAFWOaG9hfX
 dhko65gGL0O4HyHPP0EDNkHRg0cY62WML4qMtPMN9WzkVgy177QJ+DgT96lrQANeVqMp
 8NbVGrKqD6fJeKOGBATgdzDOOL5vWlGmm4xsH+HdQh5AVyKz7ETVIEY4wy/81N3xQvJw
 7KBw==
X-Gm-Message-State: AC+VfDziV7VRwi2Akd0eGkbT5XrJohZpCkW4Kp0/+oQBKXkVm17671ma
 kf2DOHm+f8JZY8rIX0JU4ynCO6x6a6nz+8Q/Fg1KyOWFs5iNORGmTEmhy/MDmqhiQNoou1R6Gcc
 I0qfCCq6Iz9trjpgZuYwTrha1A2cC
X-Received: by 2002:a7b:ca57:0:b0:3fb:af9a:bf30 with SMTP id
 m23-20020a7bca57000000b003fbaf9abf30mr12688269wml.2.1688487991011; 
 Tue, 04 Jul 2023 09:26:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71ufTEe/wWv7h1ExOsJanD4siZOoua0ql6zTBm+MH4Z3jUb1+lMMqlPgaWI376xU4gg3rSqQ==
X-Received: by 2002:a7b:ca57:0:b0:3fb:af9a:bf30 with SMTP id
 m23-20020a7bca57000000b003fbaf9abf30mr12688259wml.2.1688487990852; 
 Tue, 04 Jul 2023 09:26:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s25-20020a7bc399000000b003fa96fe2bebsm25398819wmj.41.2023.07.04.09.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 09:26:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH 03/12] sysfb: Do not include <linux/screen_info.h> from
 sysfb header
In-Reply-To: <20230629121952.10559-4-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-4-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:26:29 +0200
Message-ID: <87cz17lk22.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongarch@lists.linux.dev, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The header file <linux/sysfb.h> does not need anything from
> <linux/screen_info.h>. Declare struct screen_info and remove
> the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

