Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3477C725683
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4333E10E082;
	Wed,  7 Jun 2023 07:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D9910E082
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686124542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzwKDEeExwlnpVxIio+gh6QukNcWAFoM0lG5LiuVXys=;
 b=HuuBJK36EksWvyRjsptVOhvlMnoybeuJ8PR+wNYlrY6OfsvKQkn83mi+zYyhRu8xsu0SYm
 u4CDjKd/+HDRfTA8ZmTW9qKT9lvVjIlE/jzKwYwy9LqcBH7SjbuynzBzIM/CQ0jz0pdnup
 3tfbff9ojREJoeWKzoIqtkD0dFIMSwM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-NTzPTV9BP7OAX8JKEztQGQ-1; Wed, 07 Jun 2023 03:55:40 -0400
X-MC-Unique: NTzPTV9BP7OAX8JKEztQGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f611d31577so1488105e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686124539; x=1688716539;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzwKDEeExwlnpVxIio+gh6QukNcWAFoM0lG5LiuVXys=;
 b=kXHFU4e2ECiZjUva791Xq/6V4DaLlbPX/3TILKtpcMN1LtaX/1MPnySoHd+HwWSkIH
 C0YZRRTobNYTQYueJFSJBNW72SSvoSPEJIBZzFQ7aMk3Zku+Y0FX/CS7F5nvOoZTiyUp
 +h8diXpO6XHglYozX0/p/PmKIK2G+fzxAAYQdfSC8Pqby9jPhLKfcUx4r2Rv8WD2aixW
 j7ul2L4ks9KGWMQV7spuQWD05L1nzQJTY/j8WwFOqzMAK4/raYRZ3Sl89LGvFE95pMZi
 a9uxuG5fZXRgqhn5kFf2OYb/8Mmi1V8Viaogz4oCHiznCaipCVieHa3ZxT6Af6DISCxO
 f+pA==
X-Gm-Message-State: AC+VfDyRGcvKaG4KSnEIMF8og5tdhrJf/M6FMbwsn/8RXGowhQVxF0ni
 F7u75jHUwSo3Ag+S1vGRvnQBEVTJ5M+PsY6yTCPEK91u0I9TCE6xFM0cDB/NlNtQoPjr8Jd9A75
 7yxRmfF2P2LweZfLfyBzBvahS1meO
X-Received: by 2002:a05:600c:b89:b0:3f7:3284:4e51 with SMTP id
 fl9-20020a05600c0b8900b003f732844e51mr8903490wmb.4.1686124539609; 
 Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XsE1MIBLkrKPsF0to0MXFrankIK5l3IfIsZWE8tI4gRDcEz1ZX1KmYbQPpdwp7XOKQIbPMQ==
X-Received: by 2002:a05:600c:b89:b0:3f7:3284:4e51 with SMTP id
 fl9-20020a05600c0b8900b003f732844e51mr8903472wmb.4.1686124539336; 
 Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b003f4283f5c1bsm6978981wms.2.2023.06.07.00.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 08/30] fbdev/broadsheetfb: Call device_remove_file()
 with hardware device
In-Reply-To: <20230605144812.15241-9-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-9-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:55:37 +0200
Message-ID: <87r0qng0zq.fsf@minerva.mail-host-address-is-not-set>
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

> Call device_remove_file() with the same device that has been used
> for device_create_file(), which is the hardware device stored in
> struct fb_info.device. Prepares fbdev for making struct fb_info.dev
> optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

