Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEADFC8D8AC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9226510E7EB;
	Thu, 27 Nov 2025 09:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hAHDD2d1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EAF10E7EB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764235769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FivHe085VyKmEM4e4H3s/6qlA5f1/aMn6I7D0ri0pbs=;
 b=hAHDD2d187WyKnZmkIJABbLkfNOtYV+HkZMtxJUqDJFZQz9uiVIR4HkVvB0R92HD31QI8o
 +wStp0kmm1VSj5fZIYkpjqH2/oTun1/gL5CY1DjhLHGoN5uMXIMI0Z6VfdK8xcxorp77JY
 ZRLoikqV+UnypCp7/H/1UcSWPl7/y6k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-6qecRodUOhWR3sNO21qBqw-1; Thu, 27 Nov 2025 04:29:27 -0500
X-MC-Unique: 6qecRodUOhWR3sNO21qBqw-1
X-Mimecast-MFC-AGG-ID: 6qecRodUOhWR3sNO21qBqw_1764235766
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477b8a667bcso6729205e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 01:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764235766; x=1764840566;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FivHe085VyKmEM4e4H3s/6qlA5f1/aMn6I7D0ri0pbs=;
 b=Gncj7raLrPjxG2fPF8ijCRPiHjYjzL9ihSE1iXGzZhVuHDX3DT0Hk0VV2xNToFeLzD
 ACXf8N/z6IzeNnHw5WnZIpJDTwvoFkkP4/LBnFPi1cyFUzpNPVk3OVmtCQ+j2QYRyKke
 eejgjVKbt/5SYJkRzaH2gErrRW/cFy/2tnaMBVS5doyWX82mvVPauP5PoZ0VZe1uNvAn
 2b979T/YR5x6enL/FGUBWSQvy+hry4xjNFf1Gzi+WDGUo1g5cLWhiP7U+lOY4tvu3gn8
 YIzT3JtWkKi3nTKvOgZae8gudo0GsZSop+F+Q8KHGhVN4ReL9vUI10KRDaqz/1BZm7m2
 R0jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAc5jrbrSdG7hOSaSDXgrfWmjPRNPI6M7e8DSaljWCYqqbaGtWj6DLowjl3vlei3fDnFzP3Q3PFyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCuIFmP1RYllkjz+w2MUWJZu7+LVPM4lHAVo4m9h+JVcV8Oefl
 oLyGC9BQ1VJDOUNc7Xp+tbA3+/eFlI6kmzMDEbs+usoZUJ9IXLrLHBA5Ta+nEmUtvBc6MX/jokV
 JRd8H+bHXPfdhMBNLQmOYT+YtxYjgistkn8QONoMcKn4iqX2XOqydZeH/5IKl02rfyHhvwQ==
X-Gm-Gg: ASbGncv5OLhUTLDyvBghk2SDSXL0SwAwPgb1k+5Cf0EtMGdyTDOyNswKGN0MKZ22c6p
 vnabTmr/3458Eq6CHAC7Frj0nLc27U1paY7sgkkX31NKg2vcF/hQEiipptiCN9Kk/VD+5hHY7rW
 9fulpOFjXQ/UwfI4KfyNQfDrigVfDEOquoiVl/8PdHubQZbx8wKMWNZNC6TrAmeyQViYgCZu6VM
 fI7byOC19eCwAW/rZMrz9gbkcQ1DBO3IMOYWSMOoBLaHz7O7XJstP6OGcOWpyU82a3+tT/PtsTI
 NLA5xtSXx2MANBrJuu1aWF9cxS6nQ75Mun7DZ0SlimvaTlQmhXz5LSVpKJbyl/+hm0oKNEX0LNi
 k6twVgPV5zqN2Y0Cj/TbRbF/jtO61cwCcDysVPg==
X-Received: by 2002:a05:600c:4f10:b0:475:dd89:abc with SMTP id
 5b1f17b1804b1-47904ad9360mr102616785e9.11.1764235766351; 
 Thu, 27 Nov 2025 01:29:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/61wewSyWPQfiE8PyLsZyw2At5CoUrRgGvgFTPMPz+Z0JFmhRGxXKmrnIksk0w7jCCxwvww==
X-Received: by 2002:a05:600c:4f10:b0:475:dd89:abc with SMTP id
 5b1f17b1804b1-47904ad9360mr102616525e9.11.1764235765951; 
 Thu, 27 Nov 2025 01:29:25 -0800 (PST)
Received: from localhost ([90.167.95.237]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5d6064sm2479744f8f.13.2025.11.27.01.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 01:29:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/panic: Report invalid or unsupported panic modes
In-Reply-To: <20251127090349.92717-1-tvrtko.ursulin@igalia.com>
References: <20251127090349.92717-1-tvrtko.ursulin@igalia.com>
Date: Thu, 27 Nov 2025 10:29:23 +0100
Message-ID: <87v7ivq0wc.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pFlo6Zdbp8wPIwMx0kXaNTpvXNXdOnTsmuI0zRjzuTQ_1764235766
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

Tvrtko Ursulin <tvrtko.ursulin@igalia.com> writes:

Hello Tvrtko,

> Currently the user can write anything into the drm.panic_screen modparam,
> either at runtime via sysfs, or as a kernel boot time argument. Invalid
> strings will be silently accepted and ignored at use time by defaulting to
> the 'user' panic mode.
>
> Let instead add some validation in order to have immediate feedback when
> something has been mistyped, or not compiled in.
>
> For example during kernel boot:
>
>  Booting kernel: `bsod' invalid for parameter `drm.panic_screen'
>
> Or at runtime:
>
>  # echo -n bsod > /sys/module/drm/parameters/panic_screen
>  -bash: echo: write error: Invalid argument
>
> Change of behavior is that when invalid mode is attempted to be
> configured, currently the code will default to the 'user' mode, while with
> this change the code will ignore it, and default to the mode set at kernel
> build time via CONFIG_DRM_PANIC_SCREEN.
>
> While at it lets also fix the module parameter description to include all
> compiled in modes.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 77 ++++++++++++++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 14 deletions(-)
>

I agree that the behaviour is better after your change. The code looks
good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

