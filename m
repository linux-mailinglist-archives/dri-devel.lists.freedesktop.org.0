Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B457C7EDDE1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5F210E259;
	Thu, 16 Nov 2023 09:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A9110E259
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700127950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zSzsA5SxyFLcplHAlbNRiGj1W1HdcMtXrU3K2DbJDWo=;
 b=BS8cDv13tlnncvqz42L16ScaQGgJDbw+Zd7bntQm3tK4iJrLOspjNcK6+ItXvGWGiqyUsA
 q3JmQTnlswQT37uy0uQUny4M+4Zs+ZQfJNBCXbqZXtsU9VKGlSx9L/pnrmytci0J4DcXCY
 0DWpp2AuMrJlzU9s0wKQOndCH2eOddQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-BMIl6nZ-PFaAjT48NN0alQ-1; Thu, 16 Nov 2023 04:45:48 -0500
X-MC-Unique: BMIl6nZ-PFaAjT48NN0alQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4083717431eso3584685e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 01:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700127947; x=1700732747;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zSzsA5SxyFLcplHAlbNRiGj1W1HdcMtXrU3K2DbJDWo=;
 b=iC3qAdD7zCeuttVx7T3AWRGb8p0fQi2NAueAbPNSg3aFd2PysGDUfVU8HlEfhoJI3o
 IwzIU6atc7hHxwWdN//mM/utMDINp1fQ6Yaa4NmW/OK3nZDyaM1gfTYwUGACYYFvoIGY
 xe2YQq/+Ibvdnie5vbie268zDbC3U+0a9YF1hq8NScC0b/0oRlU9jHiguW7OpJdrNjIG
 pqfwosaqDWDl/7H4n/E8fLDOze1iY3aFGg352B3zz7AebqDdkvS+iIyRLYGv3L2UXpPS
 LNbJ35ImU5ZQo6w0KFRRn0zsc4Xa5vIdAIwmbcuV2dsA+MsAUCwYCfDA6czVwNEm0JRE
 wZtg==
X-Gm-Message-State: AOJu0Yy4bKoEKyAfK3szezseZDgXjzw+n13Oy2GJNWxwxhXDIMxmgFU+
 HxOQjanWr150wddZsZKajaM3Pp0jOD0HxGeAsTp/uJzcD3vBxKcW2cPKWPJ56Yy6zE2/DMcgsVU
 zy3R5yQ4S6PbNf1c6Q7dDB4EqGTPh
X-Received: by 2002:a05:600c:46cf:b0:3f5:fff8:d4f3 with SMTP id
 q15-20020a05600c46cf00b003f5fff8d4f3mr13564633wmo.7.1700127947457; 
 Thu, 16 Nov 2023 01:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtLFlJthV6m1GTAAXrgTEAAU7vMTnuD+YdTz6edocexCaOzMz3U0re055aJeRbTrwW/zVrhw==
X-Received: by 2002:a05:600c:46cf:b0:3f5:fff8:d4f3 with SMTP id
 q15-20020a05600c46cf00b003f5fff8d4f3mr13564617wmo.7.1700127947117; 
 Thu, 16 Nov 2023 01:45:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 je14-20020a05600c1f8e00b00405bbfd5d16sm2915620wmb.7.2023.11.16.01.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 01:45:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 01/32] fbdev/acornfb: Fix name of fb_ops initializer macro
In-Reply-To: <20231115102954.7102-2-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-2-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 10:45:46 +0100
Message-ID: <87h6lm58vp.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix build by using the correct name for the initializer macro
> for struct fb_ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 9037afde8b9d ("fbdev/acornfb: Use fbdev I/O helpers")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: <stable@vger.kernel.org> # v6.6+
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

