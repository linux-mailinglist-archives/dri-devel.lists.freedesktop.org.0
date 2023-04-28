Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FBF6F19BB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4430A10EC13;
	Fri, 28 Apr 2023 13:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F2210EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682688951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=hASw8Ds9rxX4zNktmNJ2ozlDJzyKFLSgKL5f+8tGhWIKOHpnQzZ16GNH0nSqgUo6Q15raj
 OLeC+qpk9nBLIvVsDYo9YRRqoOieueW1Co2mAeUWSuxT2FRSknRkkEHQp/aFsMi1Yj+n3R
 Uf5oitvyt8g9fDEgdwAtlFNaYKYxbJI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-j0C4dg7wNwuDy8DVnWdjFQ-1; Fri, 28 Apr 2023 09:35:50 -0400
X-MC-Unique: j0C4dg7wNwuDy8DVnWdjFQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f187a7a626so35572175e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688949; x=1685280949;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=X0NOt56Z99PTu3NifqgWOIeeX/PfAPWH0IoWb2FNvVw211IsCxkLmkgO6uZXbItZzm
 1HWC0LbsZh7dSXGIr7pxYBHtrTxsFMbOu+B3/mHRbPcTEFyQCUy6zmtuayxgXGwTKIcQ
 dLdbzM+WWsRLe1jLXxCEiX6QfBKCy7sNvrehWm0IQF5Yn9F90CNKL2sZV9KglUyc+iCv
 JI0AFd81qteNcAQ0XK2Y0eAVJ8+aN3p24F4b9Q8o0V4UyphG4L4SQgm4UBUihqNTa0UQ
 4iem9IGf64tuertLjMCLSnEgm5oDEz4X4j7y1u1LvFh5dfiYfTMA7Z8KlVdHIXaUyqT6
 Hzmw==
X-Gm-Message-State: AC+VfDyN9L/Yp4tNo3p8y1PAl8gEvH9a9hRu5Te7mgHGiQTrP0UhcAKs
 e7APN82Irp1atYvwLuXO+QRWYkKerzoUteRB+slYV04nrs60spEAmqn4nZREVWwoRWb1nZN1q4v
 ISVQMQL366yOXKOJG/s7tY8E9EO97
X-Received: by 2002:a05:600c:3787:b0:3f1:9540:d5fe with SMTP id
 o7-20020a05600c378700b003f19540d5femr4051764wmr.21.1682688949731; 
 Fri, 28 Apr 2023 06:35:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/iFaoJZ3rsWlljzHqhReT6yt4/v8GHbSfXzBE1A6dFaGWOiZETix4CxAv9bDK3RcekxAnWg==
X-Received: by 2002:a05:600c:3787:b0:3f1:9540:d5fe with SMTP id
 o7-20020a05600c378700b003f19540d5femr4051750wmr.21.1682688949452; 
 Fri, 28 Apr 2023 06:35:49 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c228b00b003f1736fdfedsm24460490wmf.10.2023.04.28.06.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:35:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 04/19] fbdev/arcfb: Use struct fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-5-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-5-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 15:35:48 +0200
Message-ID: <87a5ysgmdn.fsf@minerva.mail-host-address-is-not-set>
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

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

