Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC06F1B01
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A021810E408;
	Fri, 28 Apr 2023 14:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1B10E415
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682693764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=PR+cNzYx05GLiVHv68GfTw2m25Is60Y+J8g0c0kQC1DHKxcI1t+4bnDQFhLcE/FW0N7POL
 JFFWJuXkeMzeOMbNqt9t8kJcTWsGe+AWLZyhE3R7ExvMJkky0hlP4AU8571fjcod8oVxHO
 cGwPzafaVkFgHGwUJHbvm5D0ZNd4d8I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-rXI7XasYPLuuqsB6p9ru7Q-1; Fri, 28 Apr 2023 10:56:02 -0400
X-MC-Unique: rXI7XasYPLuuqsB6p9ru7Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f18c2b2110so36302495e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 07:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682693761; x=1685285761;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=fLCm/chgTJYk94QPRWtaqF5hGhBv2cR3o8g/jKoamNj04mseObdDiK5hJWkkEDudGp
 c6HsaQrMiOMZtVpPGsttv4fHFXXlJzUPioEpDNZljar2EzGMKfRQ8+IY/628UtaqfPhd
 nQ8MSyzOA8M8jKIRdmLhPH2mchLd1968euBzcKJq+4C7sQw2AupBWWZUUvPgHRlQAq5h
 42y11asYczSt+NDQI+GbwyjF2j2OtPpLie5wy0QhKAgm9midrRUQKRQYp9qgmnZB1Js4
 bmRpmyF2m6F/WiHm3A90dReqgWhF51ZEeWuizaTOgaUjOJOlbsAa5F1gABvRIgon1alN
 bNQw==
X-Gm-Message-State: AC+VfDw71kJWdVXuEwoslg+Df8MOCf8+dL2MK5Jy5tfE6irgI1+idQvn
 qZYYf+hQw8UUYXaAEnrSOEEfPnm2JoIhH6ZFVYBkQE6jnRgHDG7beHieWr+FVt+kR2xfr9sWP1P
 54506ocTYQwVAmyHArWxSE26aKEWg
X-Received: by 2002:a7b:ca47:0:b0:3f3:1cb7:b2a3 with SMTP id
 m7-20020a7bca47000000b003f31cb7b2a3mr3523005wml.9.1682693761369; 
 Fri, 28 Apr 2023 07:56:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5D+So0l9OZcxXmKXissbZmCPVMCQGhKc30GIsDvrtfMVInauLc5DBWL85aCOW4eRSOWx5icQ==
X-Received: by 2002:a7b:ca47:0:b0:3f3:1cb7:b2a3 with SMTP id
 m7-20020a7bca47000000b003f31cb7b2a3mr3522987wml.9.1682693761048; 
 Fri, 28 Apr 2023 07:56:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c1d0900b003f17eded97bsm28566672wms.19.2023.04.28.07.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 07:56:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 09/19] fbdev/ps3fb: Use struct fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-10-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-10-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 16:55:59 +0200
Message-ID: <87ttx0f43k.fsf@minerva.mail-host-address-is-not-set>
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

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

