Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB0085B748
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825C310E290;
	Tue, 20 Feb 2024 09:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FYfXiFpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A76810E290
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708421186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6/AuLBRasXrm7J2e/EDk+uBFMWPxSsXqB1INo3NCiU=;
 b=FYfXiFpEnw+GmJiv5Fakdwhv/8EEHmQ7YyT9hA7yuLhAs2nTKrsxNvdiEtAr8+kR8H23S4
 qI5LUSjvMwNfc2o1L0JiU9cQBXUa22MfXHTIUQIIexWqaAkt9xorJTBbyz86pgDmghynUU
 PtDqCHkf63ulUyg0saWFWcq8fOcNOG4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-vfFa4TkcNQqvMtIFWZ3miw-1; Tue, 20 Feb 2024 04:26:25 -0500
X-MC-Unique: vfFa4TkcNQqvMtIFWZ3miw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e40126031so30365205e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708421183; x=1709025983;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d6/AuLBRasXrm7J2e/EDk+uBFMWPxSsXqB1INo3NCiU=;
 b=Sl94WwEaPYiDH2mO/Qb+D1+66eIcWGZr8TT9rHjl2RMKXg3QXNasgHFZMsTdeVn/04
 Oy9W1JJDxZzt03UBrdn/B0mHa6YS6xH5BOfA3K4iXWq48M/VYiQROCgP99477SXlK94K
 /yIZS6O7bS8xELE4p9+EKBoKItdnbB1miEv+3aNkrcEuUNCC1t2q+euQrx5D9QwzeB6I
 nNTGjOljJ9WBXDwHREGm6kYzQD+6dr5ljcToNCHxuICKPz7YH7+WuzsPYjnW+w16FL5Q
 jB6rcCXyvOGr5ps6vxp/sYzj/TjTKgsVIRZtd5vJK1S3Vzal5a75S1TsFOePo0Nn6wzI
 gfZg==
X-Gm-Message-State: AOJu0YwkQ/qNvO94KEsyCwZwsXEnKlIfqkESJfJ4aEii0cMd8fX9hkHR
 X89WAJ1RVjrtNChMvhTZzrWZ2efH9CPRAnhVFK70s7niucDyVzXfEWlFGmIkcU7hVqsytelbgnD
 IhA5jIfmasjwNIWYrHS89aW4brjAVm2YTrKwjlyg7xm5gVVzeoBasTf21cCwB1l5EPs5Zi5d2eQ
 ==
X-Received: by 2002:a05:600c:1f8e:b0:411:e178:2a73 with SMTP id
 je14-20020a05600c1f8e00b00411e1782a73mr10705778wmb.22.1708421183419; 
 Tue, 20 Feb 2024 01:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzVg7vZYHc9003vxmP5eEeeGzAiqN8t1ACQZvgD0y3R9j9HKc3efOeyrsGr5LZTSNXF/ALHw==
X-Received: by 2002:a05:600c:1f8e:b0:411:e178:2a73 with SMTP id
 je14-20020a05600c1f8e00b00411e1782a73mr10705762wmb.22.1708421183102; 
 Tue, 20 Feb 2024 01:26:23 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b004127057d6b9sm747318wmf.35.2024.02.20.01.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:26:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 05/10] backlight/aat2870-backlight: Remove struct
 backlight.check_fb
In-Reply-To: <20240212162645.5661-6-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-6-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:26:22 +0100
Message-ID: <87zfvvij0h.fsf@minerva.mail-host-address-is-not-set>
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

> The driver's implementation of check_fb always returns true, which
> is the default if no implementation has been set. So remove the code
> from the driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

