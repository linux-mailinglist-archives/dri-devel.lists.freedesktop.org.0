Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622878A69D7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 13:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E352112BD2;
	Tue, 16 Apr 2024 11:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MC4mVoS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A02112BD2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713267806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wb3JEx20zw4eUQGnsrErjLegQ+vx1DO/aEEtOUxHocU=;
 b=MC4mVoS7IvjErfGFYPRfqZzP2uxQbQLqRorS2xVTfdL+nJch8+jvXRbmHhxeVNzx3pgLMk
 YOMiDoNM5DVhuyOpQfFqWCU2jr5mdy8ww788J7r8/qQHKLQ3i2dpMuUWeuqhUmZYb4R446
 9awOitOjbtmmgXQG1ra84/45RXGUJMQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-7_0qqGt4NYKyZKbduNxy5w-1; Tue, 16 Apr 2024 07:43:25 -0400
X-MC-Unique: 7_0qqGt4NYKyZKbduNxy5w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-416542ed388so14599695e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 04:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713267804; x=1713872604;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wb3JEx20zw4eUQGnsrErjLegQ+vx1DO/aEEtOUxHocU=;
 b=O/mGqZ+agiHseWzCLuap/WtUl3sSVhbRKKFXaRdCFkLFFKGT9EsVPim9VrvG0xQseL
 ddkIls8Zjb06Xgg1dKZ2luS1FHWq45HY1lmyn4I+o77azjWCom3qUyHQl++LZCkbYIcu
 ceKDLd5ts9+qQ3FQXNbCzoTQScE4cyWRFVBuJ9p3SQGInMhzuuyx82M1i58CW7179q0+
 eyRmLjQ3MS78rSxvQxiJsLFNbw3xyOzIugUJlgSWld1gjjGBpaS9+yIk9vCMpSbLUpba
 Xqdz+4T6gDwBDav2BQW0OckS93KAP9CWK7xkBLQvj7vU7zfvP+3B82R9U66VHOWM+DPp
 WW5w==
X-Gm-Message-State: AOJu0YyVpyBCsrdskza2D8tKWIG3wdBkzSQ9h9MaQlxAdodGiY4PkVv8
 L1eJa4csIPVLJLTO/eeSoKT4iP0J0Ty2omMcrqZj/hBOQ/9K4uZfk+SDyl6GuHdTtK39Df9DZU5
 Wadc3fQr4X7Pi8W2XkaxYlzTxNqaSgg7w8yy9pPv2Cjgas9vK6nYBy/sprLnzffCL4mEKYMlEGg
 ==
X-Received: by 2002:a05:600c:511d:b0:417:eb6d:102f with SMTP id
 o29-20020a05600c511d00b00417eb6d102fmr10310752wms.8.1713267803619; 
 Tue, 16 Apr 2024 04:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBtrvHOAoUE4NrCXo5UkEG4yfvCaIFeUBgoM4ZVFIKyJcfP9ptInipYOdi1Z9Hr+WK2KNPRA==
X-Received: by 2002:a05:600c:511d:b0:417:eb6d:102f with SMTP id
 o29-20020a05600c511d00b00417eb6d102fmr10310730wms.8.1713267803111; 
 Tue, 16 Apr 2024 04:43:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c1d9100b00418a386c059sm610078wms.42.2024.04.16.04.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:43:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 16/43] drm/tiny/ofdrm: Use fbdev-shmem
In-Reply-To: <20240410130557.31572-17-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-17-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 13:43:21 +0200
Message-ID: <87cyqp7cti.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 4 ++--

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

