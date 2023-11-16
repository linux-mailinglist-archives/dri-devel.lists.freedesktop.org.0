Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A047EDFED
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F3A10E286;
	Thu, 16 Nov 2023 11:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE34310E286
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700134525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vHuYUuizMOXdym2WVrnt+tzD4LF9VF0OJSRnj/ZZhrU=;
 b=NzzNiHUvrxLWxTMB4yH/AJlyR5lng2ncOhxC3kNmBdgeFen3X23mvgKNHbawkeTXOXHBQV
 pUtz3ynfrUH03pqvx/77t1dtg/e1smLgHbijI4xDPM/XOJL94z/xnHhUlA2b2oVAie8mil
 S3UKfCn5vG/dEmIABQvsGO0gbrlbvLE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-_O6vr0hfPmeQG0Hl4Puw_Q-1; Thu, 16 Nov 2023 06:35:23 -0500
X-MC-Unique: _O6vr0hfPmeQG0Hl4Puw_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4084d0b171eso9067335e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700134523; x=1700739323;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vHuYUuizMOXdym2WVrnt+tzD4LF9VF0OJSRnj/ZZhrU=;
 b=cL+rw40Ez+jDbZChKdWZfVhiS4uGfkQL+MBF9/G1cN0NgXsM7b8+Heen7v8+kx8UqR
 NwKQvEdJd1X1HXrbvTk4jF/kAc0glf2WPGOrXiRVOmJNdW5SWZmstvLgB0t44Nvr9i9A
 05/M9+7g2lSQsoGPnfcMnB76FBNxSzPqy3zk8wn/ZU8ii6inxO0K9eaNXxAn4QPQrwOt
 I/esJI47Y0XlguvozVQl3WKKv6EcMM/U4Vuwbo/2bw/lQ4WVscdCJobWn998gIuLieYh
 6FWA4Mkm/R9DygFSfMyaNrnDhx/2J6lb5Br1uXA1IY3D9R1hy0dKAeQisO35JC2luL6i
 7DwQ==
X-Gm-Message-State: AOJu0Ywv4oV9T4iGfXEdXdQaM9+RSuWPgNN/Y3yGtpqq7Yuvg7FSBzxM
 J9y96X0NMJO5D7XRR0TVO2wGiD6JLyW9Mme6SKD3JGNJlFG5VMHBOMf+odyUx0yIZiZwO2wx5Pi
 wK9zcuMJ8UEVZn+t2sum0ng+WLNh9
X-Received: by 2002:a05:600c:1f0e:b0:403:aced:f7f4 with SMTP id
 bd14-20020a05600c1f0e00b00403acedf7f4mr1397090wmb.12.1700134522814; 
 Thu, 16 Nov 2023 03:35:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXquGc9BBVzhA3pQ5y5VxKkb1ntqSX7uzGlTp88oTbLAi3A8LRxdPbW7vrN8FyN7RKFdG9Uw==
X-Received: by 2002:a05:600c:1f0e:b0:403:aced:f7f4 with SMTP id
 bd14-20020a05600c1f0e00b00403acedf7f4mr1397075wmb.12.1700134522532; 
 Thu, 16 Nov 2023 03:35:22 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v5-20020a05600c470500b0040a5290dceesm3348135wmo.0.2023.11.16.03.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:35:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 24/32] fbdev/cyber2000fb: Initialize fb_ops with fbdev
 macros
In-Reply-To: <20231115102954.7102-25-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-25-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:35:21 +0100
Message-ID: <87msve2ao6.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in I/O address space. Set the read/write,
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
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

