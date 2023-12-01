Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D080065A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079A910E82E;
	Fri,  1 Dec 2023 08:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AB410E82D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701420950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7FboWkjzC+XEr3tqHBpbn40rzt87gmx7n3Z3iOLEN/w=;
 b=VZk6Fes++YHAPBqbFXpS+TSB45rlZiLslw+S7GvSid1pke9bMvOTHJr/L9TdL42wfkGTzb
 QtaoGDSyUFYehWadhn2Oe4fo5DUUn+eIpqUEGh0jtz32D6xyVqZRBk6SG/8qitgUhQe7pO
 Nqj+1Qo7Pwb7s7c7UCwNwiiViDEpzZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-9LG8L68oPmu0g5zYZQXn4w-1; Fri, 01 Dec 2023 03:55:49 -0500
X-MC-Unique: 9LG8L68oPmu0g5zYZQXn4w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40b4ff99db0so19633275e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 00:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701420948; x=1702025748;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7FboWkjzC+XEr3tqHBpbn40rzt87gmx7n3Z3iOLEN/w=;
 b=GTDEuY1nvxsgc2BWaREJ6aIdnJ+uCWppukjNn0zvXTVTuaxaftu/e2KZ/c1+ku9zcM
 CsK/oEZUtEv6wtGGp5yKS7V27C4fKdzwSSRIrEM4QxcTjh3ZMR8uOgh3PAOTRSxShYNf
 RjNBNk0kgyZEfxGuPgQTxiFJpzVDNIeAF+DLTwtV7e/7j/pxWTVluvKGWZzZswCO/QNI
 zhoDgOqpB1ljvcnUSd/TkRcE5CNlujf6kwyptVnvLw45++Zz+FeZTwHgGJn8aMUt6S1o
 c1QvlIhebLYgI51RFh0FIikKF+z2FuRemdps/aEPNPDV1gCWLbAu3GxChzlGf/aFCeok
 ghog==
X-Gm-Message-State: AOJu0Yx1tdWKXBerSDM+5H0CnKI9XCCAvelheGWwxDz5yymfsG6gsHr8
 Tv31+x18xV9+m7KgwMSiWlrXmdeeAHngI+dknE7er0ZbXkQP6gcbXXY9ufO6ZxHFwcLRgj6fJOq
 7G0cYNaOJjf90uKkeIVOeCoeHFkem
X-Received: by 2002:a05:600c:1d0a:b0:40b:5e26:2386 with SMTP id
 l10-20020a05600c1d0a00b0040b5e262386mr452203wms.55.1701420948352; 
 Fri, 01 Dec 2023 00:55:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoi4moS+jvnBF+9D0n2hMCl1cGAFj+B8S0b/YU8hBrPaYnPay/t502w4csLY4P6e9uigE5fw==
X-Received: by 2002:a05:600c:1d0a:b0:40b:5e26:2386 with SMTP id
 l10-20020a05600c1d0a00b0040b5e262386mr452198wms.55.1701420948050; 
 Fri, 01 Dec 2023 00:55:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b0040588d85b3asm8290967wmq.15.2023.12.01.00.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 00:55:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, pjones@redhat.com
Subject: Re: [PATCH 4/4] fbdev/vesafb: Use screen_info pointer from device
In-Reply-To: <20231129155218.3475-5-tzimmermann@suse.de>
References: <20231129155218.3475-1-tzimmermann@suse.de>
 <20231129155218.3475-5-tzimmermann@suse.de>
Date: Fri, 01 Dec 2023 09:55:47 +0100
Message-ID: <87plzql2ss.fsf@minerva.mail-host-address-is-not-set>
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

> Use the screen_info instance from the device instead of dereferencing
> the global screen_info state. Decouples the driver from per-architecture
> code. Duplicated the screen_info data, so that vesafb can modify it at
> will.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Same comments that in patch #2. But regardless:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

