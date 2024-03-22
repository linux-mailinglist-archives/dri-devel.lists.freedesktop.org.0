Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A0A886A99
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 11:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2480910E37D;
	Fri, 22 Mar 2024 10:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cOf7Awtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DE610E37D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711104218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e4hqr5sqga/uu4OSt9i/tA6ZdLVrKguR4cLu3EI2g3Y=;
 b=cOf7Awtlm66/grHI/GtbzfU3c1FKuTshw8yAvxFfro6uWZREYmkxt1oRD8q51PyqLfwfBB
 RYFNEeHcdkFTPqyn/tARoplktR+5lxjr2No1pZzu0sEMnbF/vwu+AAolUqH2fbO602EEpV
 fG5nxqQuG0CpiTSXZm9DVZJzvDHPAGE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-Bk6P1J8AOZSvDRuAYPurnw-1; Fri, 22 Mar 2024 06:43:37 -0400
X-MC-Unique: Bk6P1J8AOZSvDRuAYPurnw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4140d2917e6so10863445e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 03:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711104216; x=1711709016;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e4hqr5sqga/uu4OSt9i/tA6ZdLVrKguR4cLu3EI2g3Y=;
 b=g8TSa5J5dgxw1exDZxOmKKtToqG/73iJYy16voo80IwY0pmzFvZsl1046ZMRQy4Opd
 uWqRJxjypEiNh96p6oCqMzk21xD4PXHhJEGReM3JBqFPB4Yz30zoyALGJmJ/lR/wq+UD
 M2abQXIv0qc52cTSsvjswy7GbZnHgP4hQiM0kVnMXKgIFQjvgwucfKp0Dn/CQ3fuZMRC
 uIehWv+YJj5L1Ej/YjmCkHtit5+9FMPoDvJiph6yqBrss5ZzndJC3EClCkAw1zzXfiKz
 fWJhx+sXRuYSGdcY+13yrQ1Ecx9piuGRKh7XJsparEotfSUVDI1665MvSw/51M68oHp6
 9U1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnsd1UlohnG495omVRlviQJGxb4ajMshi8FHDC91Z+Y7kzmkwRi+a2QhLrhn2nE1/LcXxOi9zqLhYKO6pEdL8jRGbSgaJ+7DB9EYM5HylZ
X-Gm-Message-State: AOJu0YypwMIshGX9xd9CyvlWEoGUN/LMmDJqxW4rKDeEAn5ghC7T8J0a
 ccJj1V6MbCHf3Rz4V6nWRpe2miM/OpxSZRQXeMdZcONOp+g68GubeAsmV5epFkZstsdVvcchfFn
 wrGGHWvW9Umz5XjAW+eNdHf3OWngnoazBoo4CCfD1Lq680X02eJVnmlWw2i8f3cz01g==
X-Received: by 2002:a5d:4145:0:b0:33e:9451:c299 with SMTP id
 c5-20020a5d4145000000b0033e9451c299mr1237989wrq.26.1711104216100; 
 Fri, 22 Mar 2024 03:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsAkU+2jK4kRfvDnw8i0oVWh6n19VVa3BIi69kxPxPYLEkn3rIbnPUV1SFTkGh0njd+owt8g==
X-Received: by 2002:a5d:4145:0:b0:33e:9451:c299 with SMTP id
 c5-20020a5d4145000000b0033e9451c299mr1237971wrq.26.1711104215672; 
 Fri, 22 Mar 2024 03:43:35 -0700 (PDT)
Received: from localhost ([90.167.87.57]) by smtp.gmail.com with ESMTPSA id
 n10-20020adfe34a000000b0033de10c9efcsm1771312wrj.114.2024.03.22.03.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 03:43:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, nbowler@draconx.ca, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Arnd
 Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 stable@vger.kernel.org
Subject: Re: [PATCH] fbdev: Select I/O-memory framebuffer ops for SBus
In-Reply-To: <20240322083005.24269-1-tzimmermann@suse.de>
References: <20240322083005.24269-1-tzimmermann@suse.de>
Date: Fri, 22 Mar 2024 11:43:31 +0100
Message-ID: <877chu1r8s.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Framebuffer I/O on the Sparc Sbus requires read/write helpers for
> I/O memory. Select FB_IOMEM_FOPS accordingly.
>
> Reported-by: Nick Bowler <nbowler@draconx.ca>
> Closes: https://lore.kernel.org/lkml/5bc21364-41da-a339-676e-5bb0f4faebfb@draconx.ca/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 8813e86f6d82 ("fbdev: Remove default file-I/O implementations")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.8+
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

