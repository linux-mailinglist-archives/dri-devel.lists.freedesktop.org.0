Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47EE957097
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CE010E223;
	Mon, 19 Aug 2024 16:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jEsy7iOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EEA10E207
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724085674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sQyHttrBtLhi/oG6jgxpPMBUYcZOG59jM7Kv+K2onC4=;
 b=jEsy7iOios3uP4aXUb3H9I+9YAS+S4rKrykxysqDp7FSaTBf553vFgLSd+lug6cbaH/5NV
 qjldjLo4U3Eoz+yn2iAf7neXCs9FKQmAHmOkvpsmEotdB9Fbga0tXf3m7d6XQ1nE/ZySTP
 kn+t6B7C1LPaeK41yH69hACVP5CIHyQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-Y6QzDn8jPbK5ItactgHiQw-1; Mon, 19 Aug 2024 12:41:13 -0400
X-MC-Unique: Y6QzDn8jPbK5ItactgHiQw-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-71065f49b10so3969862b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085672; x=1724690472;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQyHttrBtLhi/oG6jgxpPMBUYcZOG59jM7Kv+K2onC4=;
 b=AWyNEvBz3Yb/oZmyGLtQ68UzENd/bLVR8lde0c5feR49MvhYls8OOofO8u8GGkSC/a
 ILBFYiFI+86ApQwKss27IkTHAfy2XxoouNUoriG7pMb96vHnmv65zfkVYIEjHEk/aHed
 WGB2gX8BGg1Jy0COgrHmF+CB9bjO1p0M7hrA6ZKaUeGARhvtUqsJ/4gefrkjSABzv0Qe
 CRi/v4IrYvABB3aSu+DxYjfLFURTxszIKNVf60qi8XVuUg3pBbqQaXAWa7NMDbFMk/VZ
 n1N1WInbX8/+OZ3vx0Gf+IetYyjKwaTD+IYCswT1JvRG0ANGeNTe6qlw/T+IzmVQHaAm
 3IEw==
X-Gm-Message-State: AOJu0YxYOs/D9bW1tahFiCfAy6q2ytUIZ1C+O0h02kiTD1VQ+dxb74pO
 L+CCdH3lznsA4YQquuXsLVm0eBUdO74B8uEfmvllEGUe7+o4khQbw9NHHJixArWszDYe3jlGhq6
 Ss71luwa/bQkYnHS9MTkTl1tMmZZKtoEsrMRPKryDcQCD8mFL5eWGyt4nMAMsguMElZnZN0o2QW
 Rw
X-Received: by 2002:a05:6a21:3944:b0:1c4:ce43:7dd1 with SMTP id
 adf61e73a8af0-1c904f90c9dmr11465764637.20.1724085671795; 
 Mon, 19 Aug 2024 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWbLTAHBQpebC83mbq0CLnlglkWZHDsgxNbLZIw6fOMIdWWrAP8SjyYuTq6n8R0zn4nWNw7g==
X-Received: by 2002:a05:6a21:3944:b0:1c4:ce43:7dd1 with SMTP id
 adf61e73a8af0-1c904f90c9dmr11465743637.20.1724085671437; 
 Mon, 19 Aug 2024 09:41:11 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127addcc5fsm6777501b3a.9.2024.08.19.09.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:41:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 58/86] drm/simpledrm: Run DRM default client setup
In-Reply-To: <20240816125408.310253-59-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-59-tzimmermann@suse.de>
Date: Mon, 19 Aug 2024 18:41:08 +0200
Message-ID: <87le0sa2jf.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

