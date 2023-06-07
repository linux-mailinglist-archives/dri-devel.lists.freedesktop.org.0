Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2D57258FB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A425E10E48F;
	Wed,  7 Jun 2023 08:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EE410E481
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jAHIJ4eh7v+dqxg6uWyXvuAZ3noGOIESAVR0yVwLrLw=;
 b=XMZxZ/362dCgSuO+TFP++nHBWQaP856Oqe48NHQYX0jlU3a1ZtZ4TE0A2uowDoRo1pDxy2
 QMhLYHQFObDOY5UYPlrpeGyreRyRFzgSylGZ39yIRFlRaKIV93e8Z0QadwBBBCxv7EJZ49
 OLE1RBIxiHYKaSi8QE+xymYVyXme8g4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-uuQQxznxNECr34MN9AueIQ-1; Wed, 07 Jun 2023 04:59:31 -0400
X-MC-Unique: uuQQxznxNECr34MN9AueIQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f6fa88a86bso40318305e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 01:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128370; x=1688720370;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jAHIJ4eh7v+dqxg6uWyXvuAZ3noGOIESAVR0yVwLrLw=;
 b=dPEIkWrhTJKH4xMUr6bwIx/yEJFfVLr5qs7cGb6YJOG5q6ju0TaxVyq9MnpjeNNUW6
 lUxw4ZNAplX+a+N1OLhtLE/R+LnnjoQ0yosivQvm5CzA8dqkaCr3B1JE9PbBMd6Loj+d
 hGTbtRq1arQtCcF70TW9pYcj1DtDcVu59IeAIGLAU0oSjp+67YGs4X0I971J95a7CIOX
 7b0B/xdA0gL8nS4XeHwkViQ7Ldm9aeSP8PjOasqfZyepd5niFTp5Q1wzLfoEaHgbbNdm
 1lRf9YzJq7Sd70UaSTYKnq3WnhzY41sgPxu+CMb1RGP8eQRIFqsD22zoVtrRxHQ4xQjv
 V5EQ==
X-Gm-Message-State: AC+VfDxT2PX9LUYGhlCJxmQEjxKnXDtvJUmWuszL05RAM1k64jCTVOKw
 Yju4gMtdz/97WmgfvghgcgMd0VV9Ix3NImnUS8l29VBOzu/73yELM5/rnydyWRXIWuRtQR9lWr9
 a5Kbnnm47h2B+DAd4ahSvbOjlvqgJ
X-Received: by 2002:a1c:4b0d:0:b0:3f7:5e07:ea54 with SMTP id
 y13-20020a1c4b0d000000b003f75e07ea54mr4233931wma.13.1686128370565; 
 Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Qn3iTdYPwZ2PEqyICfVMTtkj5C/L8grzoRqC+iaiUjGk+XghGobRkAfICwnQ/2eAeuKuydg==
X-Received: by 2002:a1c:4b0d:0:b0:3f7:5e07:ea54 with SMTP id
 y13-20020a1c4b0d000000b003f75e07ea54mr4233912wma.13.1686128370260; 
 Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b003f1978bbcd6sm6448319wmo.3.2023.06.07.01.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 01:59:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 10/30] fbdev/ep93xx-fb: Output messages with fb_info()
 and fb_err()
In-Reply-To: <20230605144812.15241-11-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-11-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 10:59:29 +0200
Message-ID: <87legvfy1a.fsf@minerva.mail-host-address-is-not-set>
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

> Fix cases were output helpers are called with struct fb_info.dev.
> Use fb_info() and fb_err() instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

