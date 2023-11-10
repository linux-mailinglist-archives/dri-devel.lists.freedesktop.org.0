Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B847E7C10
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 13:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A10210E99D;
	Fri, 10 Nov 2023 12:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1B310E99D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699618265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7fCuXz89goAk8Vt7qNUZu+b7kKfusXy0WvYDR11XmRk=;
 b=BtDnA1vfr4LpOiKWP73xgnG7lO91XjkBAmLrqZ6j1LzTc8tJxFLXw2jH8cvbBTAB6v2LLa
 3ocIG6gE59g4ng4AA+QZN+NDaI/LowhE2yRgD6OqBvSQeymmtwckfAOOh9tIyW8dA8+nOD
 KNesiZCjGKI7XB9lQY+QdhZgIuvFG/c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-YQzG5Z7jORmWthh1KE_Ldg-1; Fri, 10 Nov 2023 07:11:03 -0500
X-MC-Unique: YQzG5Z7jORmWthh1KE_Ldg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-408534c3ec7so12671695e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 04:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699618262; x=1700223062;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7fCuXz89goAk8Vt7qNUZu+b7kKfusXy0WvYDR11XmRk=;
 b=NeQElncWnnkuHzRtcDh4Ca57zYfT+YL4f0ZBOjSQZPQ8I7qa7vnyj9kFmErCw1/s01
 /wmBLtzzkpgnwo4wQMyRjnrYe3ynm8/2NnBVUXfrICsdoaoV3sZQT5RMmYQdK6WWo2aa
 91UHFT8pdaV6ZmTNQH647cEiGOWI716vfPw/ADVONkAzYlsTQDdATbGHJ8aNoToqHjb/
 eMHmKDvm2jPS1RIy5l8jA8l5ccoXImPTGs+tEAwiRo8iS4dzUxLtmYt7kNzOzwKlw2Ra
 oPEa1PdpHTn4sEFBUlV08NOt5TN4aYac/twlrYIvtdn0bNjNfpngP46BU4KA3YPFjdSX
 N5nQ==
X-Gm-Message-State: AOJu0Yyld7qgtDWhAUjVDrv7XLTRJvZV7LURiS+5mtZ4TmmTZkiWonFq
 uComPksK5H2g8dM/utzhSWkb+5mrMIfardetpEYjy3lTWc5+6rzAGUEgV+Fgkci/LTLJiLFL0+5
 pEau47QVJW+8lKu3hpMlfgXExaY5/QUqZ/NO3
X-Received: by 2002:a05:600c:190d:b0:408:4d0e:68b2 with SMTP id
 j13-20020a05600c190d00b004084d0e68b2mr6677896wmq.36.1699618262548; 
 Fri, 10 Nov 2023 04:11:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnQ+ojOf2ajiSmBmN3mG/STAgZbDHejKyB0rLbX5CDgW3NWQYnPG6aNRfVTdkRaPHIh/mwvQ==
X-Received: by 2002:a05:600c:190d:b0:408:4d0e:68b2 with SMTP id
 j13-20020a05600c190d00b004084d0e68b2mr6677880wmq.36.1699618262272; 
 Fri, 10 Nov 2023 04:11:02 -0800 (PST)
Received: from localhost ([90.167.86.3]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c300a00b0040773c69fc0sm4867955wmh.11.2023.11.10.04.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 04:11:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] vgacon: drop IA64 reference in VGA_CONSOLE dependency list
In-Reply-To: <20231110114400.30882-1-lukas.bulwahn@gmail.com>
References: <20231110114400.30882-1-lukas.bulwahn@gmail.com>
Date: Fri, 10 Nov 2023 13:11:00 +0100
Message-ID: <87v8a9ajvv.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Commit e9e3300b6e77 ("vgacon: rework Kconfig dependencies") turns the
> dependencies into a positive list of supported architectures, which
> includes the IA64 architecture, but in the meantime, this architecture is
> removed in commit cf8e8658100d ("arch: Remove Itanium (IA-64)
> architecture").
>
> Drop the reference to IA64 architecture in the dependency list of the
> VGA_CONSOLE config definition.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

