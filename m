Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F259C7255B8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9710E449;
	Wed,  7 Jun 2023 07:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3194810E449
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686123064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86qJ/vtJ5+0COg+eCE9cC1XNW8WWzhrqJj3XV1HnHmU=;
 b=LgLRX9tRd2Covg7vKgJXSI2GrQJGlm4sX2GdFdPl4D4GGJc3brO49j0FhnUd0pUz1HEOBk
 9mxHbXn7BxqdBncqUB9adSHIoNi5xWEy3pvOe2LfN/8RPcubnytaFvnIfdKS122jAObgGY
 QN+GedmZolUomLnUUydomn4THB44F/U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-ymg3Xh99OICG8M7eIA4xLA-1; Wed, 07 Jun 2023 03:31:02 -0400
X-MC-Unique: ymg3Xh99OICG8M7eIA4xLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f7e835ce65so9323765e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686123060; x=1688715060;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=86qJ/vtJ5+0COg+eCE9cC1XNW8WWzhrqJj3XV1HnHmU=;
 b=UmnmK7CFTghNiTo+6zCgkKSgd/9PelWQZG77fme1WQCAEKES5MFgGrGDsvz8lSRHGD
 gYGY80JPdV7E/0L5NUAWqeAOUQ5P3bMaf3rajg4kDCLL+lBJOoowb8gkDvC6qlpmcZmM
 3UFJXZ5Ms8fB6oiYH9RCIvOWYO5SOs/cfWjMVgqXmXQtE9TVdvvuOxlwh9uw1qVpM8xK
 3ZiNzCZQKb+APaq+eshqwDfSeGWR2iKqJucbswbCNrktwhstbTHGzrqe4ljdyDPidVZS
 tHR0c7RuIXW7cdiFr+V/zC4FhZz1pT8YojUUh00OrxJfEDCDyHIO2UBiKVDovN1ZVIng
 U5Sg==
X-Gm-Message-State: AC+VfDy4xYgVEtxeInkr9qssFW6PqVQ83I8OllU+X5pZ4qTRPH55mtpF
 TpGvodJh7Ohp5QkMRXDSI/KfIWNx9+4Tvsdi63OuB4qqi0M5mM9PkP52B38wZOxaC1wjaYy6zMG
 XGJwu15XREB1/Kno+OL+J0iCZ+msO
X-Received: by 2002:a05:600c:2117:b0:3f4:2328:b5c2 with SMTP id
 u23-20020a05600c211700b003f42328b5c2mr3787348wml.35.1686123060796; 
 Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uGo6zRkvpQ5estM3pdndUe5o7FAstx3xMsdIS0ZhyvoEoxkSKZkfhbKkJxPjpvFo09QUYlQ==
X-Received: by 2002:a05:600c:2117:b0:3f4:2328:b5c2 with SMTP id
 u23-20020a05600c211700b003f42328b5c2mr3787327wml.35.1686123060473; 
 Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003f4ddde398csm1142560wmj.21.2023.06.07.00.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:31:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 01/30] backlight/bd6107: Compare against struct
 fb_info.device
In-Reply-To: <20230605144812.15241-2-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-2-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:30:59 +0200
Message-ID: <87bkhrhgp8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

