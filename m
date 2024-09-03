Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07AC969BB9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3637110E4C5;
	Tue,  3 Sep 2024 11:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B4c/I6mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1178010E4C4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Six38zRCaVcSjI7X8SSQRqVfbWN9LoiIAfaa2uKesPo=;
 b=B4c/I6mh9JYhm93yYH/LYAZcUCd+SMVox5Eb8VyI9bMV2A5q2LPcRR5x/7a0IfTVuS3YTb
 1NcQ1PjK6qzQq7EDzckCa/aKas1Dp+uoZ6qXGfwQMCCZ4TiK+IpxgDlG1yBDaNmH5/2KfA
 9ev6kG0cNSfqeG23XGHLD7aKZ5hhhts=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-nATZRGAFMU6uLbVcEnK30g-1; Tue, 03 Sep 2024 07:27:48 -0400
X-MC-Unique: nATZRGAFMU6uLbVcEnK30g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374aef640a4so2421452f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362867; x=1725967667;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Six38zRCaVcSjI7X8SSQRqVfbWN9LoiIAfaa2uKesPo=;
 b=tFEMU98Ilbv/buMNVfmke3AXGHbOqPkcdIXrJ/RqoqHdf6WCy2SvBa4BQUDVZKcvUG
 3yr0BqTYtykN1zlfMV6brDFlp/6XZY+8RrOElrSwy+/j4vVuy0owQuaTWH5so0HLe3vh
 K+g0HGfUsopdl7h/qf+1w8HNnB+x01QKpD8ZoTt1aXttKMqordgIgsUOalfUX+yAMAEP
 0pxy8W7IRcuhSwJAjaAWtv0kpewIH14wW/P25hjcLBRFDFCaXF9jYZtF3m4rIyh31gqK
 NP0lvjFBcRlnMhx2oRXseupzFkUrIBBg4yaw2tNZ417LsLIRJYcUm3IOnjz8GGsBCyc9
 JPoA==
X-Gm-Message-State: AOJu0Yw5cBdvm519ZGCZHUP9tyHuAaQB5rGgOTbFyqjw0tLU+30RjEwZ
 Iqag3/9PJBd1hR9T+H7l4fVDg02SuytIzhB6xYFbiC6StihQ/BDQtS8TR3Vr9m9qjEiQ5sEojGh
 b0cSNzKaZlDDMSSe+4ZRfvR5ER/ONAu3RkBWoua0xK3gBRI9uvbXrvpJfd9JL0i3U2Q==
X-Received: by 2002:adf:fcc5:0:b0:374:c782:8d5d with SMTP id
 ffacd0b85a97d-374c7828f39mr5378709f8f.10.1725362866995; 
 Tue, 03 Sep 2024 04:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp94tO1qK4mqf4zM7tEKst5ObXZnlzOtHmVRYL5VNue/xInqnwrhNf4Qo0JnEU9e1wjil+MA==
X-Received: by 2002:adf:fcc5:0:b0:374:c782:8d5d with SMTP id
 ffacd0b85a97d-374c7828f39mr5378690f8f.10.1725362866488; 
 Tue, 03 Sep 2024 04:27:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ef7e109sm13887878f8f.67.2024.09.03.04.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:27:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 25/81] drm/mcde: Run DRM default client setup
In-Reply-To: <20240830084456.77630-26-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-26-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:27:45 +0200
Message-ID: <87bk15f03y.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The mcde driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/mcde/mcde_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

