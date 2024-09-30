Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1698A4CE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432E610E4B5;
	Mon, 30 Sep 2024 13:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UMKb9bj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E899C10E4AD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727702771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iU6oHSTtkrHoG6AEjnDSNeGcEonnUQr+lho5LZwZCqk=;
 b=UMKb9bj0nG6LoZuxMPNa9E13DkZFo01rWYxB8kWGqTJxeNpXbmfLG8AusASUzz1u/EHx7w
 Kcv1JDOFlqf7199QAiDVfeSXUhGsRZdUIT6blhTRwAWP+8JQymWW6RxnqsrkC1P7oRB9El
 qtn0YmLs4ywgsM9E3WYJit5KrubXdsQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-kEibeW0BNsGg9MDN5Dm-oA-1; Mon, 30 Sep 2024 09:26:09 -0400
X-MC-Unique: kEibeW0BNsGg9MDN5Dm-oA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37cc9b5e533so1670593f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 06:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727702767; x=1728307567;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iU6oHSTtkrHoG6AEjnDSNeGcEonnUQr+lho5LZwZCqk=;
 b=D914lbPh3hNs7y3j03sGwwCHeiiIwObtMPEMsBAJFzfX2KRBkAXewDNQiA8onvxS1Y
 4RAkHz4nDHp/7jJmHBann9/X+eRB3oabdhSof7+13UlnUAmyXHCKqLoBqEK5ESLNWlD5
 nqRmTCc87JpzJLty/HB67I0mkkNKnVD8uusOI6rcXeFamr7JZQ2dT+beURUCi9yhQtNh
 R1jmxHq7Sd6CFhCjtiAjJwjUHJpbRUGlHylYBY3NlsKcR1loS8gBcwAFaf38tkCFrKUi
 CYySnWUf29CRMYaRu40jgEDYxIQSPHCHLDqtYsuhXChhhYi/HmxMgUygymnQu+iuGmXd
 A9gQ==
X-Gm-Message-State: AOJu0YyOwyYJo4qDbQpbJNzfvt57GQ+98QVlzzq3Sw4Jru3+uNCdKULY
 p+rnDJIn9PAuMCcQiVmtwpHX7h5LwSYb6AAQSd+zpfLfodamfGE3rOYl8rnIvqa5Mg6lLBbD80H
 zyx/Eg16ZlDezFwJ4lxx8yq5SwNMbvYd/8J3GBvHTwhaybn1YIm4ACFN5CmDev4qMvA==
X-Received: by 2002:a5d:5548:0:b0:37c:cfbb:d356 with SMTP id
 ffacd0b85a97d-37cd5aebe7bmr5906738f8f.28.1727702767555; 
 Mon, 30 Sep 2024 06:26:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC2V0F7vlRZz80HkueMTZBFg2rvllHK+Q0YOx0BGeDwQemdMjl0P56KLvckcpsgdHBb03bCA==
X-Received: by 2002:a5d:5548:0:b0:37c:cfbb:d356 with SMTP id
 ffacd0b85a97d-37cd5aebe7bmr5906722f8f.28.1727702767137; 
 Mon, 30 Sep 2024 06:26:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f57dec19bsm104420285e9.26.2024.09.30.06.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:26:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/28] drm: Remove DRM aperture helpers
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
References: <20240930130921.689876-1-tzimmermann@suse.de>
Date: Mon, 30 Sep 2024 15:26:05 +0200
Message-ID: <87ed518e8i.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> DRM's aperture helpers are merely wrappers around the respective
> helpers in drivers/video/. The DRM interface existed first, but was
> later generalized for use with fbdev and a few other graphics-related
> places in the kernel. It is time to remove the DRM wrappers and call
> the video helpers directly.
>
> No functional changes intended. This series should replace one interface
> with another. Individual patches could go into the various trees and the
> DRM wrappers can be removed when all driver changes have been merged.
>

Thanks for doing this cleanup. Makes a lot of sense for me to drop it.

For the whole series:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

