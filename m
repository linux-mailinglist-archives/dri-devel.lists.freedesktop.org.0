Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539ABD088F7
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D3610E88C;
	Fri,  9 Jan 2026 10:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Lglx08h8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6AA10E88B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767954636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Or8IAm8DMEjlGLwYFk0TDuR69ADiPuraPWznT0Xmmz4=;
 b=Lglx08h8/AVu7tuEna5FARxNOI5w58kVb51GsP4woPSa4R8z/ukZ15rmLd8fAzbelr8r0Q
 lAQp+6UeubOTisuH2DyK22hnX8Bh89maPxfrFbKDuFVSK+dXJ7YCbjSw47AhzkH3yBvLoo
 yqrmWLjHNuIuguk+1CfWX7BQEmZOP3o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-HVaLeoTaOPOL9ueClWhlgw-1; Fri, 09 Jan 2026 05:30:34 -0500
X-MC-Unique: HVaLeoTaOPOL9ueClWhlgw-1
X-Mimecast-MFC-AGG-ID: HVaLeoTaOPOL9ueClWhlgw_1767954633
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso38713625e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767954633; x=1768559433;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Or8IAm8DMEjlGLwYFk0TDuR69ADiPuraPWznT0Xmmz4=;
 b=tRdtPXm9dv2WRbbbELMWB0WgZHygPmVEHpDVWYwivKtdMksyHhvyhoI9ZJLuttOXAu
 6B1oyqDIF3aWmoNq0oLxoci5IOZ+Lm9PaWQiBzZzip9CugGFIH3gQP9G7IVKs2D/Edua
 QFMxaXhBOUX6UwTXfKcyC+h01lA/dl8ZiQiJ915/69xcreN4IK8gUzjeJRlOj8UaxaSO
 ScCRe6gQPD/alQa6Wj+0vdj/m8VDNjT7cBMJxpRrkhjxIVgDxFn6TSEhffcjbR+z2h0m
 YrEWDrwGexKsyHUHsZoeNGR300S/x2RvTc2xBBhZiD3C920MGmVwhhJQnNKddT27YNDY
 cUmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHnUZkXGKLF4njzQUsNBu6KYzXJiewHMHQcB9hF23Xy/e6KjrJ6nWhf7DzYDdozMC3T49eyQ2xtlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7V9LJAuPDtP72HMafUxOfyDSHe/1l2ou16FYN0o2Tcdptni49
 8p7ZRkLNzHOBoitZay+STP0u1G1/VGDZxpn93s5OSXtM7gp0H1SEWqNWVFqEpLJ4IdBNgyftWSq
 3YWcZsHsYai806m/hbS7uZt583bm0O9FHVxP10hTmWd/2ty3iN1VU7vQaPlnj03zFGyUerw==
X-Gm-Gg: AY/fxX6CEvqdEQuWvt65yIHHdFhluFbDeaZbNJekbXpXkq5VEayzSmCQOfbLP/iXF4b
 YpZIHA3GOtRPzeznaAMaWv0yNWJIqt7C92sTDaBghGCUJ1qeHu41j8yydJ/9WdH/irkoPhBZsyq
 Pj2QUCPPqGOHeiLVfxyJm4OoGlbcBRdVnjARCOUgvWPq20YGq4f7g0R6GN/bWmoqftX1zglDyFT
 jcQjtQkHpAvORLbZ6n+PkY1POmMXNkLQ55P9AaAm39RgX8ejGXXOETNWOHbnInjIiWCmaJQfeXs
 2qE+d87b1FpAUwEOGk6GE1SplXmj5hJMaM7DLOODKGBtVD0AM1UJdj8m4S6mM/BzkTkz4/2+Cms
 /THPkbEG7JN9ceeCGeNVRHD/fQrqZIy6rFTr6dPprdmSJdjuBco9nqYtTUN4Y14hWxZ7r
X-Received: by 2002:a05:600c:190e:b0:477:9aeb:6a8f with SMTP id
 5b1f17b1804b1-47d84b1faffmr112688535e9.9.1767954633375; 
 Fri, 09 Jan 2026 02:30:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJWqmcnhf3Pym5/gUyHqMBkqMpq203LptwKXeouWsLNM1hUThsE3LO+qSzaBLD+lFqXD439A==
X-Received: by 2002:a05:600c:190e:b0:477:9aeb:6a8f with SMTP id
 5b1f17b1804b1-47d84b1faffmr112688175e9.9.1767954632937; 
 Fri, 09 Jan 2026 02:30:32 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f4184cbsm212824775e9.6.2026.01.09.02.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 02:30:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/8] video/aperture: Support coreboot devices
In-Reply-To: <20260108145058.56943-6-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-6-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:30:31 +0100
Message-ID: <87h5svf588.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JmO8h8j1COzDMC4VqnVnya_FXxHpSJKepN_syOvRkKY_1767954633
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

> Add support for coreboot devices. Until now, all devices with system
> framebuffers were on the platform bus. On systems with a coreboot
> firmware, the system framebuffer can be represented as coreboot device
> on the coreboot bus. Handling the related graphics apertures requires
> new interfaces and a custom way of removing the coreboot device. The
> core aperture code is independent from the type of device.
>
> Also move around a comment that refers to both, platform and coreboot,
> devices.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

This patch also has merits on its own IMO. But it depends on patch 4, so I
don't know what the merge strategy could be here.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

