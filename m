Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F507EE057
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594AC10E5CA;
	Thu, 16 Nov 2023 12:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3643E10E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700136350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WOSU9nPcc5buhfeYjOi7yXkwoaqROWwqoyQZ/1RMnoc=;
 b=SZ9RfvvS77IvvyyEO3AXVRxBN3RShu6KITpMOM2fIUJSxanuPzvkh1lF9oCtcw6KpfFEes
 RGSKZqGqYoZXjwA00naiEsB+My+pcuIz/9fqXlBWw7Ly7ZuFBVNWpDBWaGQVEki0EJmLE9
 r8Aq/7YzBHjMsdpTy/TGvCq8xxHPD9M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-XUxAwBf6P76j3rKIRsiXew-1; Thu, 16 Nov 2023 07:05:49 -0500
X-MC-Unique: XUxAwBf6P76j3rKIRsiXew-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4084a9e637eso4046725e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 04:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700136348; x=1700741148;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WOSU9nPcc5buhfeYjOi7yXkwoaqROWwqoyQZ/1RMnoc=;
 b=i/6jYJUbLo+1K6ej3kbHch+HsA7fdXo25NOfcLzu2J0qiNzXLean5UuB16hQar8G+a
 mfb3pay4a+kxGwRTWSMaWNHEL5GvWHcQRE3QzHGZB/GmldHzGJiaPsRbaPR4ldAlSNYY
 Zt/uwdfRwOflLc6dhOI6Hrwh/wnmrbcl55KaIW4FeQnavBAyHfDs4YLLSNBu6gxW+LEx
 NCZthS4aFmhuq8LY99HznnMNA7kqanwJ+GQzq4EJZB/f7sMcZ/JQxaKhtt4Dt17AGIZ+
 xlY7y/8fz+82AftMiqI+AS4tY+q8Pz0rag6YAH8SKwml1WBKf7mxcgKg/pbg/YShdIsE
 focw==
X-Gm-Message-State: AOJu0YxOLlDyU4EZ0JHsSVPhiTo0Hy4Hu2oWfGCLXoCd4i3so6ckETRJ
 kINK5JKF/nDgML6rr9eX1vifr1X9Nmlap3/BnGKz4YbqG+JS+J3H+J1+OrrvH+8ZlItRfX7LwkE
 TIJHwJPYsqwCfTgCPBbnTWjexS09C
X-Received: by 2002:a05:600c:350a:b0:406:c6de:2bea with SMTP id
 h10-20020a05600c350a00b00406c6de2beamr12718852wmq.17.1700136348199; 
 Thu, 16 Nov 2023 04:05:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdWVhOqGTW375pLi3FYuX9g67/Iptv+/PMA1d+/llKPmaAQmCrDgOhPFR2NRaqiQaHtXiX+Q==
X-Received: by 2002:a05:600c:350a:b0:406:c6de:2bea with SMTP id
 h10-20020a05600c350a00b00406c6de2beamr12718834wmq.17.1700136347857; 
 Thu, 16 Nov 2023 04:05:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h38-20020a05600c49a600b004064ac107cfsm3277181wmp.39.2023.11.16.04.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:05:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 27/32] fbdev: Rename FB_SYS_FOPS token to FB_SYSMEM_FOPS
In-Reply-To: <20231115102954.7102-28-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-28-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 13:05:47 +0100
Message-ID: <87bkbt3ntw.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rename the token to harmonize naming among various helpers. For
> example, I/O-memory helpers use FB_IOMEM_FOPS.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

I wonder if the object names should also be changed to fb_iomem_fops.o
and fb_sysmem_fops.o for consistency with the Kconfig symbols names.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

