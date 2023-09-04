Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C75FB7917AE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 14:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BEE10E1D4;
	Mon,  4 Sep 2023 12:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7054F10E367
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693832370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zEV+8LVB0e1YVGA/3PaV1RliEe0ZafqnElnGxMEFxlo=;
 b=AYJDEEcc+Ui+3vgPX45vT/4XC4eP1Tb6WEVrknTTafPsCQUNyjYD6UOB6PjMIn2SIE3hIO
 NwGnNWr3O9YsJAASHU7aupR3okRGYZo0lCFenPysYxORsjYQpz/2/mh9jCALEUWNJXWRQN
 FH54GScAa+++RhlqG9XKwtnnTahZsgs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-pJaQ9GuBNQm-Ttx1SYaPTA-1; Mon, 04 Sep 2023 08:59:29 -0400
X-MC-Unique: pJaQ9GuBNQm-Ttx1SYaPTA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30932d15a30so805325f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 05:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693832368; x=1694437168;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zEV+8LVB0e1YVGA/3PaV1RliEe0ZafqnElnGxMEFxlo=;
 b=Li8lpmaCMSuk1aOw6MsMdkcl4E28/vefVYl68YQy07PTjX3jOhyy7ToS+JOEwYTv7F
 SrKElcQd2kMReJ8j/utdUNdhrlwL72hVm5xjDr8bHxveKI/TA/RqOWZx1l8hHBEZtQOA
 gt7ZMmiVUkn3s3D4pqtSyzPWA0HIrgB512DGGROmSd8DrySJhVwe8NOKqXRlI6Nqfkk5
 FX7eVon2ReaXUcqA6J/wCvcsNclYytKBvN0w4yr1pYpNc7QLZebkZ/BNHAyxpWRTS50D
 89mmAN6neyoNgiT6oF5H2eg1yY0hcpTzsdKETHd4Zxr18cgO9iQ4gVViatMJOheNnO6f
 IEtQ==
X-Gm-Message-State: AOJu0YzGn3Bvebdu82htWFpkNKW8JzbUlv9pAAM5zsLm6qBWZ5nbQYyd
 B54XBxQQHTf6Y9pYYFCYJhTGLQa2g1xman+eLHbtOftuyFezvDqIKSOxq3IWJWqIZHdxqOoEhd6
 C0zusO8LgbZe6h8fKKlOYxyQvrEeY
X-Received: by 2002:a5d:4591:0:b0:31d:d977:4e3d with SMTP id
 p17-20020a5d4591000000b0031dd9774e3dmr7801068wrq.19.1693832368175; 
 Mon, 04 Sep 2023 05:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKikRn5bbMbcnbDDAwQ42B3JKHCa5zsGawpabxpCAhlcfEHQ3tfQsF2MOZFWXS2OqG+gZYTw==
X-Received: by 2002:a5d:4591:0:b0:31d:d977:4e3d with SMTP id
 p17-20020a5d4591000000b0031dd9774e3dmr7801053wrq.19.1693832367823; 
 Mon, 04 Sep 2023 05:59:27 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4147000000b0031de43fe9bfsm14636476wrq.0.2023.09.04.05.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 05:59:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
In-Reply-To: <20230828132131.29295-2-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 14:59:26 +0200
Message-ID: <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Generate callback functions for struct fb_ops with the fbdev macro
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
> the generated functions with fbdev initializer macros.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> ---

The patch looks good to me, but I've a question below.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

>  drivers/video/fbdev/smscufx.c | 85 +++++++++--------------------------
>  1 file changed, 22 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c

[...]

>  static const struct fb_ops ufx_ops = {
>  	.owner = THIS_MODULE,
> -	.fb_read = fb_sys_read,
> -	.fb_write = ufx_ops_write,
> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(ufx_ops),
>  	.fb_setcolreg = ufx_ops_setcolreg,
> -	.fb_fillrect = ufx_ops_fillrect,
> -	.fb_copyarea = ufx_ops_copyarea,
> -	.fb_imageblit = ufx_ops_imageblit,
> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(ufx_ops),
>  	.fb_mmap = ufx_ops_mmap,

There are no generated functions for .fb_mmap, I wonder what's the value
of __FB_DEFAULT_DEFERRED_OPS_MMAP() ? Maybe just removing that macro and
setting .fb_mmap = fb_deferred_io_mmap instead if there's no custom mmap
handler would be easier to read ?

Alternatively, __FB_DEFAULT_DEFERRED_OPS_MMAP() could still be left but
not taking a __prefix argument since that is not used anyways ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

