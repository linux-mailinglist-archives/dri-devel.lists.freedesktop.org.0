Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4CD725618
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473BC10E452;
	Wed,  7 Jun 2023 07:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A42E10E452
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686123740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
 b=gZ231ichOXO2PsDCf8N78v1GZF4IuEVoChlFzGhTho8vPdadPGv6BCU3+HNWnxwld7AnSZ
 b37cO1SM9r8OtfjqLmTYk4i8qErdpRr888h3ytpxr8QKrQPgKDU41i/QcWZsNvW3/IteJH
 awYL3CHNBeBASGhvcg0DRLFpJKnOZSA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-Ib75jNanOuKTx0rlpNolZg-1; Wed, 07 Jun 2023 03:42:19 -0400
X-MC-Unique: Ib75jNanOuKTx0rlpNolZg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30ae4ed92eeso3067065f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 00:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686123738; x=1688715738;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
 b=BN2cvHp2z+1YrQ8CxlouUZAn6+joAu+56b2F2p2O+kabVRBOJafoWB/1lG4UAJxSa5
 6wenodM7NSHed2GOZD3xNx+WDClhvOepHkjwikId69QrFyDFOXctYyXXe5k+OZg4Zl/O
 3X6OziCJbiaOiHEmwRDCp4ZwKUot85Cu0FqwAJKHR2cjBrCo0eXfWzQ3jkya/QypsJMk
 zWt2O6hC2QWUAAfmvuoHAjch/htKFVMqmVvkgQhxUzBZTXWxieCvc/mTl3O+tbRok/N8
 guJ5Gs9XQ4PMB6E96iLJejOCDdJqXFOq3+b0lEQ1pXEzTQEfp/qeY61akRcZS1nxFdHx
 X2XA==
X-Gm-Message-State: AC+VfDz5LjtC8opJUcYaoMykreCAlGoSczrwYn3NbLEB8QoMGRKCBJbu
 HWwO5tsy1iIRJq20/+wbCFLTc7WyrPVClmsiSsIyX9ThqZ6pdwrtL9P7p5h7il6cf7sX//vUtu6
 KF8EG3qUs3jJPY4XW3bfbpyUij7oQ
X-Received: by 2002:adf:eb88:0:b0:30e:45ac:810e with SMTP id
 t8-20020adfeb88000000b0030e45ac810emr3734967wrn.36.1686123738653; 
 Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KZwfGmENtFpHBv/PbHt1rJPnSSY7XTJGSBoIFHGMz6zbW+M0/3e5qcpQ+OgRWGlPIuGCuTA==
X-Received: by 2002:adf:eb88:0:b0:30e:45ac:810e with SMTP id
 t8-20020adfeb88000000b0030e45ac810emr3734950wrn.36.1686123738508; 
 Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z13-20020a056000110d00b003047dc162f7sm14752394wrw.67.2023.06.07.00.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 06/30] fbdev/aty128fb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-7-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-7-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:42:17 +0200
Message-ID: <87wn0fg1ly.fsf@minerva.mail-host-address-is-not-set>
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

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

