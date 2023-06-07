Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78F472718C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 00:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE9D10E0F0;
	Wed,  7 Jun 2023 22:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9173910E0F0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 22:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686176613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m3wnM605gKMmCudt2hcJJr2EFLF4uSnPgF/R0Xs7/Z4=;
 b=hBp06NkP9boYZ402W2v8+ZZmZUxyn4IZ+kdLls75XEc/x6JFu/ahkrNMzWW2o26QaIyvkL
 O2UeFW77657y69Xhrd4K+tRt2xHeNlgzIQ99cUt2QP4K17bKWM2tAYrKL92HXIRaugrv6q
 U1NXKrfKtAiDXlKeTdCqqQnTET+GpWA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-PhtgH2c2MnSoPbYQJJoz6A-1; Wed, 07 Jun 2023 18:23:30 -0400
X-MC-Unique: PhtgH2c2MnSoPbYQJJoz6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f7ef0e0292so6279475e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 15:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686176609; x=1688768609;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3wnM605gKMmCudt2hcJJr2EFLF4uSnPgF/R0Xs7/Z4=;
 b=AbfJ7btAkw3xETOXp/rXScxo66Qf+VQ7x+QlLdLGEmW9Rum+9gWjV/ATDtyJBdzdFF
 BgyS41jglWDuMXZA41ol6Xl74WKv/+l88n6OyRJj/5sLroxxrtXecnh0WPT2qQ8ZpjoE
 UGvZIfpV6+ApBt/JCIsAlS9Zfm87Wzf9b5gz9r/AO0vDVU1klwTWuxc/pLkoUjnbmBL4
 Tj+sU2tNdI43a8kbmliHmrUIfZLzhqbfdSG/yomH5mPmgYJ+1wt8xkNPN7TxuZUt5bDn
 qSplEWxF4zL2kHuEHPr6z9x990mc+5tf0CqQ/o/ZoKQoX192MIWQrRKo8PARpNA1hmAJ
 p+vw==
X-Gm-Message-State: AC+VfDyGwgCPtCgmpvYe8Ag0KV/yFaybQ2iJpRQ+LuvTGEU5gWkIPiHv
 a5dxyuFuz1nk7rsI3iq/nMuDRGoCAmzx4DKRqn+0VbjdgsWSTNMtSrPz5UocAfiSUNxM5vPKMCa
 FjStlOlM/jOTgOIWgH254rmGXFBkt
X-Received: by 2002:a05:600c:230c:b0:3f7:f4bc:ebf3 with SMTP id
 12-20020a05600c230c00b003f7f4bcebf3mr1544750wmo.36.1686176609315; 
 Wed, 07 Jun 2023 15:23:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46AO52oYq6hkZwI7LskizRRuqd6gfq8mv/AQFd6xOXiRAiGoamovfGXQJy96q8ipeUPGiuUw==
X-Received: by 2002:a05:600c:230c:b0:3f7:f4bc:ebf3 with SMTP id
 12-20020a05600c230c00b003f7f4bcebf3mr1544739wmo.36.1686176608968; 
 Wed, 07 Jun 2023 15:23:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d10-20020a1c730a000000b003f42158288dsm3313271wmb.20.2023.06.07.15.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 15:23:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 23/30] fbdev/tdfxfb: Set i2c adapter parent to hardware
 device
In-Reply-To: <20230605144812.15241-24-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-24-tzimmermann@suse.de>
Date: Thu, 08 Jun 2023 00:23:27 +0200
Message-ID: <87bkhqewtc.fsf@minerva.mail-host-address-is-not-set>
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

> Use the 3dfx hardware device from the Linux device hierarchy as
> parent device of the i2c adapter. Aligns the driver with the rest
> of the codebase and prepares fbdev for making struct fb_info.dev
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

