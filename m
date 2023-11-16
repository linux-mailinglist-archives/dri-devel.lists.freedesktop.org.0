Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287717EDE66
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EB110E5B0;
	Thu, 16 Nov 2023 10:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1B910E5B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700130234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mZuQXo9gnkbNsHEOB2zSY3qjcWzrlb81dsj8lBIB1oQ=;
 b=it3iQiuGm4SZMuNN1x06MoymumAO2v7tVtX1KgT/EtIlauao4ewsBTgGMu9pZHn4UQyx8P
 3v1siaXSwMPtH54iaCFz56d0Z3+4HHK4a0au15rk3i7t92UkGwnXlizuAOfp33B9TAy3jj
 lqeTkB4jAeJVoPLUaUY4ph+6IPIXVqs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-0Lch6e_PP5ySbEZTeJeUJQ-1; Thu, 16 Nov 2023 05:23:52 -0500
X-MC-Unique: 0Lch6e_PP5ySbEZTeJeUJQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4091c9bdb8eso8628255e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130231; x=1700735031;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mZuQXo9gnkbNsHEOB2zSY3qjcWzrlb81dsj8lBIB1oQ=;
 b=JR0pdNv2Rgj0MbU3ECtUb6iTMfrD+EBLyHZcvgKu6XhXUyXz+PgYYLBcQw7EpHBGAn
 rCwqJsUOQGtJLm3eBTCviRSxCskPME/TNnV1fF8eHmSJ50/5j22Z9gh7w2J3uwZisgah
 WU48C5GtfeQQrAlo0hS21lG8uxYfF0wa2d9sMR9qFiopEr/tWgbiAVedks/A17qUCh4s
 DhlgCz18xueqncoG9Pz2RupTbFBazIZV/IF/I20QNY2sIUUpGud0KbXCMBlaDsZhR/75
 OgDFpBMe6vdP+V1zzhGsYa+levCjxhCun/MAts7LheYCSlRTBqM3JgeOsogA7smZcxCj
 RggA==
X-Gm-Message-State: AOJu0YyeGWegDIKWTiiH9JtX9+Mb5i7dR7FKT1q5dP8Epkl0Eg8CvpU+
 c56WwyfqckiP/p69v4oz7ITVUEQ9UtQGFWxt7Gk5BjdG1rpYeV+Jhqw/bn1C/raq1tcV2NUH0oI
 Ti+ulC5lUIUlBVcLs9yc9LAF6w3sD
X-Received: by 2002:a05:600c:1906:b0:409:6e0e:e95a with SMTP id
 j6-20020a05600c190600b004096e0ee95amr1138237wmq.19.1700130231650; 
 Thu, 16 Nov 2023 02:23:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAVDQkmo3j+8iWEwGwvFmLiS/SO/vAfk2hJXFP092iyiMamOm6OHU8ASafyrHF8vMvPKAMmg==
X-Received: by 2002:a05:600c:1906:b0:409:6e0e:e95a with SMTP id
 j6-20020a05600c190600b004096e0ee95amr1138222wmq.19.1700130231264; 
 Thu, 16 Nov 2023 02:23:51 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b003fee6e170f9sm2986310wmf.45.2023.11.16.02.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:23:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 10/32] auxdisplay/ht16k33: Initialize fb_ops with fbdev
 macros
In-Reply-To: <20231115102954.7102-11-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-11-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:23:50 +0100
Message-ID: <87r0kq3sjt.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in virtual address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Robin van der Gracht <robin@protonic.nl>
> ---
>  drivers/auxdisplay/Kconfig   | 5 +----
>  drivers/auxdisplay/ht16k33.c | 7 ++-----
>  2 files changed, 3 insertions(+), 9 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

