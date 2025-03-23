Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDEA6CEA2
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 11:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28E410E0F5;
	Sun, 23 Mar 2025 10:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X6gt7RgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC6E10E0F5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742724747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+RGeNZlfLgFA71NvaffV9ABNJvL+OrnuqdVLC6vsOeg=;
 b=X6gt7RgB0O+WCGJxfWPwOWeAnxL1mHTkyMME16ol+36T5D8KnA6rNQf3Ypek9TcE7RY8Yy
 hs7xy29re5rDj5PPFM8bprClzRyMZc8ZSZfOXvsBDdSf+Zrxt7CF2UKYQ7YzG81G0TIPnW
 cOWDDVuDDs4k29tFmeEBTpGZoBu1hXA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-cXMu6IV3OpuYBxJuQMioVw-1; Sun, 23 Mar 2025 06:12:26 -0400
X-MC-Unique: cXMu6IV3OpuYBxJuQMioVw-1
X-Mimecast-MFC-AGG-ID: cXMu6IV3OpuYBxJuQMioVw_1742724745
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so25449465e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 03:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742724745; x=1743329545;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+RGeNZlfLgFA71NvaffV9ABNJvL+OrnuqdVLC6vsOeg=;
 b=SIqR+8lu8jwVfjeCRsIAkZec7I+luA6wQlwh1ZIvK6eBLAB3qyK5JAtzQF+6fqymFA
 uQ0sej6LS/R0X5eSkQOeK1dfDhjTSwIvYdkJ3nsQyraYJQGlhxwmnjMi3gdsrtLvivlI
 IthvTKK8eNUChc1JxJ+zcOEgsT/rTs04EDXB4hmep7uWm2zgZ93maQ0aagBWCCXZYvW0
 9F6rKjI0QYsKNHfvPjdwpvPbZzzW6b963zCYruzSIOT8jF+r0EtlKdol/h58/wxufjyg
 kBFwO0SojvGjQtadBbtPuhL+1HV+CPyleDyVICgv6YuPxPp1evJ206ki05FgQF8aCXdr
 hLfg==
X-Gm-Message-State: AOJu0YzinaKjBvJlEc3QfG3oOsZ9ZRcfYFxXOPpluoESCw3IT1T+HynC
 7wAoVlCjIu+z8sNoT6wvwM2OAZSaHY3enOU+lKggtz4iLs18P7mB4FJvnGphTJT/tvJcYf/a46b
 eTwVz5THVmRkV9YP3AHRzgXOa4Mh6sRcQtPkdqQTQZEo6CoI5AMpRnYM1ngbBLFWNsw==
X-Gm-Gg: ASbGncs7wz0HxtOGVhVFsSSn8E4KXAeI69IzI72spLNS7k6xQWTlCh+Ed8cuDkvPTGX
 z8H1bQC6CEh7/2P+AR/7Be5mc0rtXNrMGiphCLdJBquKkD6AyLy9yIAr1XyMsDkHrsAYmyU8SZr
 8mrV9U5W7jKfqY+6rtP8hVQInFon6a3UVB0kYmwYe05Y+KrrjLOZSp82RGJsnr3p9ThgKGW/k/8
 D1ywolx/AsBNxSApEeYvzRu+ox54WCbOxqJuZz+WUPWoS/Oh0BIqunV08TjDON7f3krQ9oqzxIV
 9/G4g6R8H9zaHEOkTIe2vGVMig1LTwB0DkvK7xkptYBJ9bEmJqE7Az+duiqHSOGlhoEsK+zlag=
 =
X-Received: by 2002:a05:6000:1842:b0:392:bf8:fc96 with SMTP id
 ffacd0b85a97d-3997f8f8be6mr8428010f8f.4.1742724744717; 
 Sun, 23 Mar 2025 03:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHBFeswIUyvPmRrR6vtrxMneWaFJ4vtS4RkXXBdMHCac7kWr1durqSJC/pjffgXqD4+yeGBw==
X-Received: by 2002:a05:6000:1842:b0:392:bf8:fc96 with SMTP id
 ffacd0b85a97d-3997f8f8be6mr8427992f8f.4.1742724744289; 
 Sun, 23 Mar 2025 03:12:24 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd18505sm80953535e9.11.2025.03.23.03.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 03:12:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/18] drm/ofdrm: Open-code drm_simple_encoder_init()
In-Reply-To: <20250319083021.6472-3-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-3-tzimmermann@suse.de>
Date: Sun, 23 Mar 2025 11:12:21 +0100
Message-ID: <8734f4f43e.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FFKAplqq5veFom0Yih8KUPqwWJc32DGUKCUSbqlYgWg_1742724745
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

> The helper drm_simple_encoder_init() is a trivial helper around
> drm_encoder_init() and therefore deprecated. Open-code the function
> and remove the dependency.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

