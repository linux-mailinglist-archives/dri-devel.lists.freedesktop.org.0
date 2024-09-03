Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5191969D61
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E2610E571;
	Tue,  3 Sep 2024 12:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zc/rOa8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3E610E570
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725366091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BELKt6Ttgttp44KZLo39NaUCnuGWPJGVPDpp4SZgL/I=;
 b=Zc/rOa8Id4nQTJWC67moQ31ZpBJJqsNp60pAQwqH8eACVSD9lpL8Sf3uujSrH5JTWPqlde
 qW2ktLd8tcBUgkxz7uOezilqJNbghsxPrXAFj4QD2spBLJ3iTVfVjrd8/q5JZinWJEdMlk
 +e+z8ltKGYbAw30yssX09OVGw4OVgzQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-lQP2pDgHNUmo8_B0iaDVvQ-1; Tue, 03 Sep 2024 08:21:30 -0400
X-MC-Unique: lQP2pDgHNUmo8_B0iaDVvQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374cd315c68so1196103f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725366089; x=1725970889;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BELKt6Ttgttp44KZLo39NaUCnuGWPJGVPDpp4SZgL/I=;
 b=nPPIK8T5Xdezi+ZGA7zXviAmeunAzkcUQyzJT42exuKgrozOjZBdWikI9Mn6yD5/q6
 iNVeLcxgwxvhbrEmYO3E8YQXopxZ2KkiqnMXqKvA5JndDoLO0WbNV3ZCK0HTzqpvTlBE
 7wY32boig3tYhyLoUE6gQ35x15Khqd2OLs/bJPv5Bxkrp+nHEoAlsYIWioNzq4msk+sS
 fWMoAC1l+I84q47mppBVrihu6XMQWTh6yQiFIQkT97Rn0e1M9dC/qEHpfN0VriJa/BJW
 dQBFA5RfH4iXcEeXFz2e+HLaVenqScaEj0hAPXqp06YXYSAPc4NIUdh6cXQMT7m4pMxz
 1NsQ==
X-Gm-Message-State: AOJu0YzkPw4cy/CwmZ/ptVlk5aqM71ZLYVTM9RSx7XD5u+9ztFq3Je0U
 /4Bz1oQ4GDSmZxZIsjHfJIgPensDiijW4v3PKnSO5GXNF1x6m+HxEv9HMIA05kAOZfcViqvaFqS
 sAYe6dS7rBOPecdZI2Wm1KwQdvQewHMGUZ19m5AILn8S59ZUHlGbssCXomuVhG6XNkA==
X-Received: by 2002:adf:e444:0:b0:374:c1de:7e64 with SMTP id
 ffacd0b85a97d-374c1de81d6mr5378322f8f.42.1725366089287; 
 Tue, 03 Sep 2024 05:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF8EjxKd2aOIdtAzJFfWCYf1w8V/EizPUPJu8WLhb/9BPY/tZjtvJP/yhzDFusXvOdur9h1Q==
X-Received: by 2002:adf:e444:0:b0:374:c1de:7e64 with SMTP id
 ffacd0b85a97d-374c1de81d6mr5378299f8f.42.1725366088831; 
 Tue, 03 Sep 2024 05:21:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c958c471sm6157477f8f.25.2024.09.03.05.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:21:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 80/81] drm/omapdrm: Remove struct drm_fb_helper from
 struct omap_fbdev.
In-Reply-To: <20240830084456.77630-81-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-81-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:21:27 +0200
Message-ID: <8734mhc4hk.fsf@minerva.mail-host-address-is-not-set>
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

> Store instances of drm_fb_helper and struct omap_fbdev separately.
> This will allow omapdrm to use the common fbdev client, which allocates
> its own instance of struct drm_fb_helper.
>
> There is at most one instance of each per DRM device, so both can be
> referenced directly from the omap and DRM device structures. A later
> patchset might rework the common fbdev client to allow for storing
> both, drm_fb_helper and omap_fbdev, together in the same place.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.h   |  3 ++
>  drivers/gpu/drm/omapdrm/omap_fbdev.c | 42 +++++++++++++++-------------
>  2 files changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
> index 4c7217b35f6b..d903568fd8cc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -32,6 +32,7 @@
>  #define MODULE_NAME     "omapdrm"
>  

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

