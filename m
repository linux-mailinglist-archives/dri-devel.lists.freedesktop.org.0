Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F74E725933
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2794210E47C;
	Wed,  7 Jun 2023 09:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5690710E47C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
 b=D8jLe4RTtmfGhAcEJxXjAFPx7HjW1vCUC0xw3TIAStKvl36v4DdnO6lLtAn3uwfqjeFSs7
 pUX2ZppUU/gdj50lNON9jlqEMFAkU2xNOgL849yENUDtB8mXiXC40FGwmslqB/55o2ITUu
 vn+nAPQ4jP2U7ZVVwdwvP8CxrBSw+4c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-ShSG8Df4NJeVL8PvZzCB9w-1; Wed, 07 Jun 2023 05:02:30 -0400
X-MC-Unique: ShSG8Df4NJeVL8PvZzCB9w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30aeef6f601so3225586f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128549; x=1688720549;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
 b=B+zPWu2DZi3deUNBseW/kT7iGm86DrxuHbaMuu8rjEp4z0oW7Ax8vCTZOqFwJSEqJ3
 0r/vxZzPSbA1WSMPWEDifL0U+1ebsiRx8VBrpi05S3606AItuAvowGHLg2nwCzV57HbZ
 KRV01VwWrZenDO3yIveDQ4KJRWMENwGJn0tG3cB2sEz4ZOCEBFrfuoNjSihquWC8CljR
 MGMt1EwF3Y5znyPYNUqMyJty1A2RHJKqBm0dapm1esnW4B6ZFeOCRksfhaRnY6QeADqv
 2xZjVSxIFRJ1P9a6DDGLm7gZ4O4GeWBD2Zvwavsef6zZlsQV4JbmCXtVtYLEUe8AUCnc
 vVtA==
X-Gm-Message-State: AC+VfDwHwS/trt+Oys1CwMVwc14gdWJrAQiHQL2W3NKZWTWEfeIq/ejV
 +CIdXrPEAxEetHwxwW70ZFTwR1DAgMPK++VtpEls55R9OGBV7nxdFP67cWtJQ9ykjfgN5MW4O/l
 oYfwUaMCwdGqW0Q/lYsbFBup/Rs9K
X-Received: by 2002:a5d:5611:0:b0:30a:f030:8637 with SMTP id
 l17-20020a5d5611000000b0030af0308637mr3810377wrv.22.1686128549046; 
 Wed, 07 Jun 2023 02:02:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tdzlumiDh+lcZSgp5sjiYX3gXCJJUKDHiUf2E4K2nudny411fzwbP2HTNQbZ/H/p4MQRLhw==
X-Received: by 2002:a5d:5611:0:b0:30a:f030:8637 with SMTP id
 l17-20020a5d5611000000b0030af0308637mr3810350wrv.22.1686128548788; 
 Wed, 07 Jun 2023 02:02:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y4-20020a056000108400b0030e5da3e295sm449804wrw.65.2023.06.07.02.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:02:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 15/30] fbdev/nvidiafb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-16-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-16-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:02:27 +0200
Message-ID: <877csffxwc.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

