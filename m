Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35B68A6B3E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA1C10E9A7;
	Tue, 16 Apr 2024 12:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W+CTvZ5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7730010EBD8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713271127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/y2H6OrKrrJeh3GZF/seqRcZgk3Qwmi3QivWg+s/E3U=;
 b=W+CTvZ5koO+CSI2GW1xP4T1ORCC5p2bwu4bkYnav9eWBFTUtR8smvCMJSze/hTaDZOxROG
 9qG+m543SQqShC61gVOKEqsJ8effvZyZtRlF2PiBa9aFS/eZ79ryUvI38YyYG1ll1Ny5KZ
 xBih2VevPPuCB4YjVccCr8FpS9aKnlM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-nw5hJXa4Pa6NRtIpuyqmnw-1; Tue, 16 Apr 2024 08:38:46 -0400
X-MC-Unique: nw5hJXa4Pa6NRtIpuyqmnw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-418671bb02cso8468435e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713271125; x=1713875925;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/y2H6OrKrrJeh3GZF/seqRcZgk3Qwmi3QivWg+s/E3U=;
 b=OTSemBBiPosSgPpv0XwA7NXTCj1bSLjEekbf2oAninyHXu9yLoAHvU3+nytL5UVXq5
 9JLnIKbJFWaQJDWk6BF0GM8t2w1yI0AhBade/bQ29TZtAbosg0oO3DDyolZCgxhYICJL
 /V3vl3kiv/35UA4i+UG71oSt74UgBewC/ED6gBOciUpWqZqVnHr+XNA6G/9uT/Uy2O8P
 +7SWLMygboPlb+bDFDj+aQ/zGp0Qex6gRjYeT/eBJMFrDhUbDgA3nfbomizc9CmB/YY8
 86xZ4qWPLvjLo2kM9edC9RU6TVRgB9XyoPXJ3c+5DJ6ROTKvAEx/8GnuDkdXoKlOQKtz
 L1fA==
X-Gm-Message-State: AOJu0Yxr+0KEF9ysi3PXP51TtiGu7kXu118wwLx/CGxhIhG14CqYfdMl
 5Bm1r65kWmgV7HZq2GgIT4ZdbEexMAWhM5sGwktNf6l01E6K374KR4KI3PbFnywJhWNjK/oSEuR
 GPfB7pp218k2r+luCkxFNdDTqOZ6TW+3Ls3wcx8f0lcr4E9y3n5nfh5HlkUny6kd5eOQSIomKgQ
 ==
X-Received: by 2002:a05:600c:3491:b0:418:2343:1eb with SMTP id
 a17-20020a05600c349100b00418234301ebmr7581040wmq.5.1713271124716; 
 Tue, 16 Apr 2024 05:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3NJNYx3yvWD4RdKtpJ7ZV3zw6Q0wL44la1xd+fu5I1R4I/8zqLpuZ0pLsN0/bEMQiBuF1+A==
X-Received: by 2002:a05:600c:3491:b0:418:2343:1eb with SMTP id
 a17-20020a05600c349100b00418234301ebmr7581027wmq.5.1713271124466; 
 Tue, 16 Apr 2024 05:38:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b00416b163e52bsm23211273wmn.14.2024.04.16.05.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:38:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 36/43] drm/tiny/ili9486: Use fbdev-dma
In-Reply-To: <20240410130557.31572-37-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-37-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:38:42 +0200
Message-ID: <878r1d5vot.fsf@minerva.mail-host-address-is-not-set>
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
> damage handling, which is required by ili9486. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/ili9486.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

