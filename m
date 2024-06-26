Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0F9184CC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E1010E8FA;
	Wed, 26 Jun 2024 14:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GElyynqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0DE10E8FA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719413280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eYt5kb05tGM80IO8nBGJUTnLOSBS+UoyBRCwpxbLfyI=;
 b=GElyynqPhMHiFrMDlANcsPVOqDlWdtCV9P6hsk7Sy9BGrVHd8dUISKYqkIKXcxw3uDlXZy
 iGYdq4uUoC2x+KmjJP1jSOMrjZ5FO8s7k0W7Z5lSPJlLy4mSDa9c6sm54PUBLQmGe+51E9
 AWRLXb6214DYmU1ZXhHdKYLxkSjlVRk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-6UrtKU4bOk6Fj_-REfx1Mg-1; Wed, 26 Jun 2024 10:47:58 -0400
X-MC-Unique: 6UrtKU4bOk6Fj_-REfx1Mg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42183fdb37cso46848385e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719413277; x=1720018077;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eYt5kb05tGM80IO8nBGJUTnLOSBS+UoyBRCwpxbLfyI=;
 b=O3GZAyShS3ngA6rlXli64M24uNKYiiUv1FeolZWyIuhpZMb8HsNAZDgY5W+79VyJtO
 WL+hD2A/iSxWohiPwkWpU+0nje0PFLiSiy5P++lwOnLjPvvIrh7Qs2pyQ76Lo/RSied1
 7e4D/euNvwzlo8hPV1VFKkDQtd7+tnNkje/GRmj+kCftbqZd3/V2v1AQDoemkDhZlcgt
 I+a08AYurWSRcEM3qGC0OYxEYKV4awjhYsaFNcjhq1nlylrFvDA1FSzvlrjZ7BaAPI2P
 f/PSER/iwJmqESJrq/t5BtEpJ+IvlE+gBwk7WOknNxr71jAof9crGSwWXTCRIh0PMvP9
 pVAw==
X-Gm-Message-State: AOJu0Yx0TPj4+lmBFzWtY5OGprMCn4wSXMPdiI2d2TrFRg56azLGZmlF
 xc5aowyd2Py7Ieny7UW1A7mQQ7vwfTiDKd/E732NRz9fYQZw7Xvf0JjGd6T89+3AH+qLdAXkzOH
 50TzGe6MdDnZxL6swc2Hycz3BFvM96QDpAk4TJ13YzM3tIo5r63z1MfYL9vd6eRquXQ==
X-Received: by 2002:a05:6000:2c5:b0:366:e89c:342b with SMTP id
 ffacd0b85a97d-366e89c34bcmr10728905f8f.52.1719413277552; 
 Wed, 26 Jun 2024 07:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkoG2YOIq/yG0kgniqXpeQXkzwdHGL/u9q030ztQSVeGx9YNZ4Mf5z8xcvsmSAKD0jVbAf7g==
X-Received: by 2002:a05:6000:2c5:b0:366:e89c:342b with SMTP id
 ffacd0b85a97d-366e89c34bcmr10728886f8f.52.1719413277083; 
 Wed, 26 Jun 2024 07:47:57 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638e90ccbsm16017265f8f.59.2024.06.26.07.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:47:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, maraeo@gmail.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, Jani Nikula
 <jani.nikula@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>, Sui Jingfeng <suijingfeng@loongson.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH] firmware: sysfb: Fix reference count of sysfb parent
 device
In-Reply-To: <20240625081818.15696-1-tzimmermann@suse.de>
References: <20240625081818.15696-1-tzimmermann@suse.de>
Date: Wed, 26 Jun 2024 16:47:55 +0200
Message-ID: <871q4jkbfo.fsf@minerva.mail-host-address-is-not-set>
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

> Retrieving the system framebuffer's parent device in sysfb_init()
> increments the parent device's reference count. Hence release the
> reference before leaving the init function.
>
> Adding the sysfb platform device acquires and additional reference
> for the parent. This keeps the parent device around while the system
> framebuffer is in use.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 9eac534db001 ("firmware/sysfb: Set firmware-framebuffer parent device")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: <stable@vger.kernel.org> # v6.9+
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

