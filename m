Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366EEC05734
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADA210EA0F;
	Fri, 24 Oct 2025 09:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F9958Z30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FF710EA0F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761299838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EECPZ9d8E6GPLO4i/dKA5m4dqP651VCNME9poiUNpOs=;
 b=F9958Z30q0/3e6wS87x5IcwJJKgbL122UPkU3uJNojD4eNfup4FrkAIWwdadKwkOBl+1Wu
 zm5BjA8zXSv+mhTvH9I8c3s3XmXj7VVOUcJEJWqsn7LhGHllX6A8TmGmZVOiQbu/jr6+I6
 12jXO5EwwU3oQxvgHOOVeJwUF1pmAw8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-OKHDMLebOqKV9OvvGfHx5Q-1; Fri, 24 Oct 2025 05:57:17 -0400
X-MC-Unique: OKHDMLebOqKV9OvvGfHx5Q-1
X-Mimecast-MFC-AGG-ID: OKHDMLebOqKV9OvvGfHx5Q_1761299836
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47113dcc1e0so11335185e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761299836; x=1761904636;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EECPZ9d8E6GPLO4i/dKA5m4dqP651VCNME9poiUNpOs=;
 b=F08e6hE64YwZKYq+rzxTRja/Ra2bG0/xLSDiHC20fZq/khqtUUIdPzFtRCFCelP0Ka
 dFoPabcqlR9cXjlN/R1fQ94oW0/n1CaQFZNLW1nn32XRjgFPxjpy763Fb7EG3/NZDtu3
 5eE+4SSFaPjFTVu5KzRaYQ4mxnzuF3TZGRT7Jz4Om9kmw2a0sIQYRO6qYaltiR8hEjS7
 srGzBB6PXZi9SqZPlBHIK0HN8NKt5vVticiSj2XD0b4M+Dk9VMhBs5mGYcWB/ux+WvB8
 fBCTbBJDtuuVu71mm2hU0s78PqcczXm3+Ia9yXDPjXerKNTCh1QAvupY41BtvgrlYWB1
 1Zgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUwP/omqzwY5QMiYE0U+fZGJgYTHLk1+0brGThhbtkNjjyJ2nVxhle6NudoLV/dDx1XmFB8ZnQfQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl7eYO3Jj7t1RguFMfwFb2PYv0GfKmn6k+dqScKEWD9TrbCuHX
 ZzZYR2vG8TK+WleqE6mNCuWLokeKg+zCgfFL1I4JPp5+k7JK2xMY+mmsezM94w2fpQo7Wti86+D
 dPjeI5u4jxDMf/b9UtZ62xbBoO3jCOHMGYLRQ/PCb7NRcX9ggp2knnkzai96g1wTVayioVg==
X-Gm-Gg: ASbGncvG4TamH3WPZWJwVSXYrane+4LfSExDAEQkfTdwHHfbzTSrOCg6ZXYpofj9oCB
 DslP9u+mQ39pr9ZPmXoeIcHIJ1eWMWG2khTMA5Fr1DC3n1nWb7jtG+LraG8auWH5+zhcQqZ40Hw
 X2INGd0CV8oHlRFHHSLgpau8kTBp6xBQxTKfZpT0WdgkL4XzPjIe4ZWK/EEvpCzjXgWLHhOBRpy
 QtIi8aeU7IjF9Z7oYR1YAPTejCB/FSIl5U77gHlPlpaTU6rKWykEl3CiGKidNc7f7zc7Efc0DZB
 5ggOSt9bfvx705PIEhCLEavfer5JyLMMrt15ah/ZKfIul02CzujP+GuKZVmXBVwAMJyJkJzmiof
 yh6pQu6NPRAX5tGT4ToomEv/mqJ+Tby83jym9yvofy9ewYO9SsPRPQq740Q==
X-Received: by 2002:a05:600c:c16e:b0:46f:b43a:aef2 with SMTP id
 5b1f17b1804b1-475d30d20fbmr14523865e9.38.1761299835792; 
 Fri, 24 Oct 2025 02:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi4kHieaFnLco9wucyoKPkPcEj2osPLAl9lyR18xfQ/pKl2+mHzfqAxTuZr5DT8hf24aXQRA==
X-Received: by 2002:a05:600c:c16e:b0:46f:b43a:aef2 with SMTP id
 5b1f17b1804b1-475d30d20fbmr14523665e9.38.1761299835440; 
 Fri, 24 Oct 2025 02:57:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496afd459sm84966385e9.1.2025.10.24.02.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:57:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org, jonathan@marek.ca
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/5] efi/libstub: x86: Store EDID in boot_params
In-Reply-To: <20251015160816.525825-6-tzimmermann@suse.de>
References: <20251015160816.525825-1-tzimmermann@suse.de>
 <20251015160816.525825-6-tzimmermann@suse.de>
Date: Fri, 24 Oct 2025 11:57:13 +0200
Message-ID: <87o6pw8vwm.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TcYQppzg5Rb8SY3vja8GWd9b2RjkEJqpXb_TmLv4zFE_1761299836
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

> Retrieve the GOP device's EDID information in the kernel's boot
> parameters. Makes the data avaialble to kernel graphics code and
> drives, such as efidrm.
>
> With efidrm, the EDID is now also available to user-space compositors
> via standard DRM interfaces.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

