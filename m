Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3EBB7EDE5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC8610E444;
	Wed, 17 Sep 2025 09:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SCaklSd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652D310E444
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758101255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYsWl90aa2IFCJSMLifqsmjQanJGgpfYBqQYufjAHKw=;
 b=SCaklSd2xnoiE8PKLJ4rbcmZasOzjIoTr4l+eh8qpsYClKDmB2zglcN8SxWMoKzKesy131
 Gigsbu5Sifx35u1e7GWYGzYdRuGnBIeiWeZSxMOJuDJntmymSXbGJslQSSSEvMe9gRaind
 FBGe9VnywuN7kuDc/bitK9P5g/baLbY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-EAV_CxdcM_OjmAxX-KDKzw-1; Wed, 17 Sep 2025 05:27:34 -0400
X-MC-Unique: EAV_CxdcM_OjmAxX-KDKzw-1
X-Mimecast-MFC-AGG-ID: EAV_CxdcM_OjmAxX-KDKzw_1758101253
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45df609b181so53381715e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 02:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758101253; x=1758706053;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FYsWl90aa2IFCJSMLifqsmjQanJGgpfYBqQYufjAHKw=;
 b=upOIMReUuKisJrctr9vJSznH6mgOXFLhuFnYmjSrs4k3gmRYiGagKAARLIHAuD0w5e
 avT4oRZsocPuMpMqp0icl9Q774uqMgmdzFqjto+u9jvwIcOYJjVcg6OuC2dYsokT0kT0
 knqxG2K6EtmTiEGpC5bZu5DPYyXKvMnEFTvZAS8AH/DQTjAOVKOqwC2+4W5sTg7U8oip
 D76yAeEXclknMMar/RWvYgI34z8YPE52RZFOy9TDEG6OzXiaV1xdQqq5oh0XS6Lpwwcv
 PxgdnFRBcdLxlacqHdQaRQaf2YoUjjilJdJUG3MeG15L1MeWWLeaMldyx4GSsQm3sJ3T
 gQpg==
X-Gm-Message-State: AOJu0Yzu1lsr2tvO+Zi1x7mZiEvnjLl6WUImo0LBdyOM/rXmm1utb4lQ
 KZWC2OXKuGLss8XZ5G3DQLxpT+t3OzCWKtGKig1sMRkjbH8ki2eyUUZTOWlPPtoK+q5kSaDe6t9
 7BsO2Fiv5LcX7nFc7gEl4qriuuezI1Wfha9htCCgPF9Adx7ALiu5cXRGiJKn4hnVjuOfbvg==
X-Gm-Gg: ASbGncsTlbZBrnDAMO/bTEDjY0VqZryby4SPBzTYNqmgYTyD6PxhDG4Ceuh7/Tzykw0
 G5OpkXr1xn3CE0FvEWtCtoBZh3S4/ktGwzXZC1GPsgPVF2sBsGdYvpIwNRh/LHQ+dHt6tbbMau3
 YindHC+0YfF/GW7nyQnKlGqmH3d/ZV7GNlrhQ940EasnAuVIKdduVEIydk8tLt6g+Ld1t9k/H4m
 p+t9Gyn+Bg1RbBGbGZRSu3iB6h2j7uAk8uUyDtbP3gjEM1XEV/wfOO6bSxp2o3KpX5FSrc/2g5l
 9Pi1HXd/0Ji/I50/VhedSKucoFWSzX8ppzP8Of9tsJNXuqbP7y5PxUrkTjeI0nQu0NfYLcou76+
 Ci7i++UUTuXM8+I9EXab0gQ==
X-Received: by 2002:a05:600c:354b:b0:45b:9906:e1cd with SMTP id
 5b1f17b1804b1-46202de09fbmr13144215e9.13.1758101252692; 
 Wed, 17 Sep 2025 02:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG02+Djk7I2WYZdxGpqffFjigQcwROtQsx5Gti/Wx1hmpHUcyHWzmZ3z2sX1v+uNmbXW/h9fw==
X-Received: by 2002:a05:600c:354b:b0:45b:9906:e1cd with SMTP id
 5b1f17b1804b1-46202de09fbmr13143915e9.13.1758101252208; 
 Wed, 17 Sep 2025 02:27:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46137a252fasm28873285e9.7.2025.09.17.02.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 02:27:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH 3/5] drm/solomon: Simplify mode_valid() using DRM helper
In-Reply-To: <20250912-improve-ssd130x-v1-3-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
 <20250912-improve-ssd130x-v1-3-bc9389ed299e@gmail.com>
Date: Wed, 17 Sep 2025 11:27:30 +0200
Message-ID: <87wm5xo2d9.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O3yogOcY56UDmH00cbQewVv2HD1LzHwJox41O-n7wAA_1758101253
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

Iker Pedrosa <ikerpedrosam@gmail.com> writes:

> The ssd130x_crtc_mode_valid() function contains a manual implementation
> to validate the display mode against the panel's single fixed resolution.
>
> This pattern is common for simple displays, and the DRM core already
> provides the drm_crtc_helper_mode_valid_fixed() helper for this exact
> use case.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---

Indeed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

