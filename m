Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FB98270D1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 15:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAEC88647;
	Mon,  8 Jan 2024 14:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19AB88647
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704723347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YxB4hJGUskiSNKv+s1TrmZMXKolMvHe6Ob3/kfn7C0U=;
 b=NuJWOqFfnNOY4CHQ++ztn1+YhQGw7qIBLczUcXjtsgmxx8v/CtHk+Ncn72U0Vof+F25VvQ
 ACfDLuRfWvjlZ9T/1XKK8UXAHUp7DMLU4Zg+Thj2vxIbrTCyYp9kTY9zruWf0A5qZxQps2
 C0onssXzU1gq7zUYE7PwM4cr2Z0r5S8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-OS1tK4CLPculFuMpT3E1eQ-1; Mon, 08 Jan 2024 09:15:46 -0500
X-MC-Unique: OS1tK4CLPculFuMpT3E1eQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40d54db2ab5so19118115e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 06:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704723345; x=1705328145;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxB4hJGUskiSNKv+s1TrmZMXKolMvHe6Ob3/kfn7C0U=;
 b=iprBxs5keCBZmXXY5RQa6VbWhzEBRF1aZaHMl2MLwVtGc6nQBV+z10Lm535Ndj/T/E
 HDy4Fxgs1KOcSGr4MXUenDvdDorKM4ZyqedOscfgE3HUmoCT/3c0wYCMr5OsnAqrGPIP
 jsYGmlkm/xYsMszXUTIMOrNfjxyiGvTXf5/0rQdRO+DTv0rknaTZwsXhHVb/I+D2jWm2
 mrI27ZsTIiU1twxJwWXA/IUgSPyU3rCswqjOFDZgVq+gQ5eOFcTE4vbiYkGbmeUABGpP
 7JR/eek1xMBMZp/4HBEKTIrg//a68ig/xW+CbDuDaWOwZeEEXNXxwBBcVC9T+c+ZbdXw
 GU4w==
X-Gm-Message-State: AOJu0Yy/siaHARaa+erqGgR4INf3fsZ3Z1Ffe0MErNWRQqq/TfcDbelD
 YHoC6X5LSosIJONchWxDHy+bG8QpZdP2eA0EzxEdxLktPxAmN9zUQstpD//8VZxj1Vx2wHKwvFY
 +PX71PkKxOHIng9o1b5Eemz60mEc1dmBewdXh
X-Received: by 2002:a1c:4b10:0:b0:40e:48b5:3349 with SMTP id
 y16-20020a1c4b10000000b0040e48b53349mr432182wma.25.1704723345536; 
 Mon, 08 Jan 2024 06:15:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6B2nGNQDVdFDm3USpj0QhZ27T8ggPZi0nN4hlsNXsc4GJ1RmAnYI10aMq5+7l7vGing5psw==
X-Received: by 2002:a1c:4b10:0:b0:40e:48b5:3349 with SMTP id
 y16-20020a1c4b10000000b0040e48b53349mr432170wma.25.1704723344860; 
 Mon, 08 Jan 2024 06:15:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b0040d5c58c41dsm11210711wmo.24.2024.01.08.06.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 06:15:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH] vt: remove superfluous CONFIG_HW_CONSOLE
In-Reply-To: <20240108134102.601-1-lukas.bulwahn@gmail.com>
References: <20240108134102.601-1-lukas.bulwahn@gmail.com>
Date: Mon, 08 Jan 2024 15:15:43 +0100
Message-ID: <87y1czdi7k.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-input@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

Hello Lukas,

> The config HW_CONSOLE is always identical to the config VT and is not
> visible in the kernel's build menuconfig. So, CONFIG_HW_CONSOLE is
> redundant.
>
> Replace all references to CONFIG_HW_CONSOLE with CONFIG_VT and remove
> CONFIG_HW_CONSOLE.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

