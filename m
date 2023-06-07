Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD472567D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3514010E455;
	Wed,  7 Jun 2023 07:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0C10E456
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686124516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
 b=dQ+LGMm3qhCBheOFOJsgUvhyj/4bCJKIG1eoZQa+lHQu8F7AP+p72iFmSAF+f/v56LzgIF
 maiOiEihhXCvhi14r+WGY6cb3OVmZc+0MRQFnDGmTdBFxyFIsK5AAeVburilz9z/YVAIGl
 8BLPkTUt6sWqQGMudZ9d6CWl4jeyVqU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-AA0uSDk_Oqu3Kgugk3ChWA-1; Wed, 07 Jun 2023 03:55:15 -0400
X-MC-Unique: AA0uSDk_Oqu3Kgugk3ChWA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4edb90ccaadso4456754e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686124513; x=1688716513;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
 b=VnjwAqqdLUHOfpxBhFj9KucNN8CugSkXsXMvHIcej8oZ/MboCQqljyIxBkrIMmkE/x
 oLKK0p2iWiVbhvncO66bu5EdrciGOnVOuNIAH3KVdUzA+q92+cb0KxsZ0FKM40AGbPrq
 tK++5V+iqWD4J6kpMpAeGY1gr5yObSasMvKlagz/gYvwgp7QyLirr7NbkesTDfyOIEgV
 aNTu9rdYXkxfWITcX9yEu5KsWTBbSHWYHAJ9DmM4nICXG/LDYvM0ryOUVRdHM8I/1dup
 KaaAu68P+SaufkRvge55AyfEADXEAyNTU5ylwAEqjRfnfZqfrsRz873JFyuO7/1FmcLQ
 929A==
X-Gm-Message-State: AC+VfDwIIHKRiNceSV0cePdYgUK850XKj7kDEes5gLoZ9Z8YX8tSa5v+
 7ln5OUejAAbopFxZLXQb97oC6DP8bciX8htoEO+0VxUu6s3tenWeqm9R00r9U13J4F1NCia0NDA
 7kjGDMOFeO6kvZj71qdoMZgGA+E6l
X-Received: by 2002:ac2:5a19:0:b0:4f3:bb14:bd40 with SMTP id
 q25-20020ac25a19000000b004f3bb14bd40mr1643611lfn.36.1686124513740; 
 Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5iJQ/YOY5BYJYpCuij2Dk8TuMWnzRrrUQf5oe61hk5gDfo5VjRa0aD7EjgG4gko6svJeBZBA==
X-Received: by 2002:ac2:5a19:0:b0:4f3:bb14:bd40 with SMTP id
 q25-20020ac25a19000000b004f3bb14bd40mr1643602lfn.36.1686124513442; 
 Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z9-20020a5d4d09000000b0030e5c8d55f2sm480065wrt.6.2023.06.07.00.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 07/30] fbdev/aty128fb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-8-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-8-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:55:12 +0200
Message-ID: <87ttvjg10f.fsf@minerva.mail-host-address-is-not-set>
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

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

