Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE48A6B03
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9454610E918;
	Tue, 16 Apr 2024 12:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ftk5y6Y6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370BA10E918
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713270812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v7Qp1T9S7HE2g/JJFKnqDgN9CYpgdMoSmaFgUHqF32E=;
 b=Ftk5y6Y6a3z+SfqjiLZT5K2s6isq5KMEiHlLdQwB4SDMYb6e+OV9gedsvpBmKpizxI1NKJ
 fTWxTYlIayWHkyeU75KLFRIksY+cJH/zZpZ1MWrKMr+S8d981edUbFXu2oSOEFp62uopxR
 tFmt3ICCiu/ul8pEPk2B4RWl/XyYpW0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-AH0nYHtaMqOR_fd8pLznUg-1; Tue, 16 Apr 2024 08:33:30 -0400
X-MC-Unique: AH0nYHtaMqOR_fd8pLznUg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-345aa380e51so2434998f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713270809; x=1713875609;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v7Qp1T9S7HE2g/JJFKnqDgN9CYpgdMoSmaFgUHqF32E=;
 b=CK9z6Xyk/FZ4EEzOPQLllVnLtwNdZv+Itb5cTitTu4csTlll0dymYh0+97veLTW5rF
 4ZzZbc1TxIO7XkhQJJfIQAuOWcxBZpaJE2MopEMdqOWOxwes6MX6CSmOScO8DozSWXhJ
 sDX2aVVTd7R5A4jkV6ILqJQBMhOigzTGBmjq0Et3YFLkU3x0cskViBGSZG4n6bbze2Ky
 YsNFL4iUkdcQoI95uUx/uGcuIMdTTIOfTXDolspuyx8uFqp4xw3XojwZtwxYX+kUOYyY
 l8AIr40xHnFp6incb58d5aejRpCF5dObnQ5WClmiT5i6atEd7Ps02KjsbrJQWoswfxek
 9pzg==
X-Gm-Message-State: AOJu0Yx5ZILn2BzbxibHE2Gv8viHK5KdS2O70RUP2x/cgBZ6F79t1be6
 kYrGCdR1nJEsU+fzSJLbz52RfrxB515bhy1aBKOHUmfN4DQZrJks5wnD66sIrGk7SlwmXdkkbMu
 FLr0+ilus0T40Z4qRomLijg361BBjU1Vep3PsS8BrwsDtG/WEooETQ6rhF//YA3cGXQ==
X-Received: by 2002:adf:ec0c:0:b0:346:ad3d:e4bd with SMTP id
 x12-20020adfec0c000000b00346ad3de4bdmr9295354wrn.17.1713270809733; 
 Tue, 16 Apr 2024 05:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSGIVn0oN8p0J5DpAR4GFROh4k+wVlggK07cYyOtf/EtHkuYsVImIhcSZt2w1Z/UnzTXDUDQ==
X-Received: by 2002:adf:ec0c:0:b0:346:ad3d:e4bd with SMTP id
 x12-20020adfec0c000000b00346ad3de4bdmr9295337wrn.17.1713270809373; 
 Tue, 16 Apr 2024 05:33:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i4-20020a5d6304000000b003437ad152f9sm14780054wru.105.2024.04.16.05.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:33:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>
Subject: Re: [PATCH v2 24/43] drm/imx/lcdc: Use fbdev-dma
In-Reply-To: <20240410130557.31572-25-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-25-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:33:28 +0200
Message-ID: <87sezl5vxj.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by lcdc. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> ---
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

