Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ECF7EDED0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AA510E5BA;
	Thu, 16 Nov 2023 10:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CD110E5BA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700131655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5yEL/wD+StFyQC4s/cL+meHosD/qpqp38NWuT149SCc=;
 b=aXce3ZxWzeZDkZNuV6lzlEYvqWD/HD7xqXABgk6dA3bvf76nTTuRccmJXYXLpjc+/+KBfW
 un71dN5vyiRI6xB2RsUMYXop74+KsNfjciIeY19cWT58hyV8UhgHdOtjVK2dC04WLdEVAp
 Qaivkkfb8pOWD3mBzH3ur/upFixZyts=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-flsrQ48bOTatuZ8UJbNx_A-1; Thu, 16 Nov 2023 05:47:33 -0500
X-MC-Unique: flsrQ48bOTatuZ8UJbNx_A-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32db43129c6so335580f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700131634; x=1700736434;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5yEL/wD+StFyQC4s/cL+meHosD/qpqp38NWuT149SCc=;
 b=s2XCC4FA93vJC1LwRFkRiNEaDafv+RNF8/68E9mJWN2762NSppOTijKmdztpPAbSyC
 +NreamPrZXR/ViIC9p8/AJ6LgGc4wM31HwXpYyxEQAbeWhTw1Wt8vvwrzxh8bGmbukWv
 RLUU9DrLyg59c5LPwDtSgYyd6PfZaBxBWue8vcLLiTbsJz8g0YTak4dbOne7tK+QFbxB
 bump9JeRrBr/EyLe0x4BV0itaLG9x8oyAFiQSIydItcDx5xJ2/+/lnQNOPOB4JxnDhQb
 j5qtGzs4EXzygMH115+jcgh/zD6V+A7KTg06lHD9Dx+tBQ16KeE7yhs6ROJNJ8z8pKee
 kM5A==
X-Gm-Message-State: AOJu0YycrTC7MRP6p7mSvbMdZiTmOhB6QEiHXXxQWTcW3WPfKQ6nOTMN
 dQLorzIgRw6Y+DhAcoQ7qz+MG52Hwu9vrKjrhAXHa3tSGwwwoL0MH6Pv3mct2IeZeY6OTMjVuNp
 xHjdcNUcoE8ifyGMV0FPB3G83ZAgQ
X-Received: by 2002:adf:e7cf:0:b0:31a:ed75:75df with SMTP id
 e15-20020adfe7cf000000b0031aed7575dfmr1513879wrn.15.1700131633891; 
 Thu, 16 Nov 2023 02:47:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8kXOyrbe6taaoWMuPRfW9sBNT0Ia7lg9iWuHQ6Z1tP0kTNiN7tYGMJGRRPFJbBjvV3DMVbA==
X-Received: by 2002:adf:e7cf:0:b0:31a:ed75:75df with SMTP id
 e15-20020adfe7cf000000b0031aed7575dfmr1513872wrn.15.1700131633719; 
 Thu, 16 Nov 2023 02:47:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j12-20020adfea4c000000b0031f82743e25sm13128518wrn.67.2023.11.16.02.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:47:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 16/32] fbdev/au1200fb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-17-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-17-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:47:12 +0100
Message-ID: <87a5re3rgv.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The au1200fb driver operates on DMA-able system memory. Mark the
> framebuffer accordingly. Helpers operating on the framebuffer memory
> will test for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

