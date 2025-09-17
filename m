Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A333B7DC58
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C1910E449;
	Wed, 17 Sep 2025 09:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gWRBPPX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D0210E449
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758101336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZfNBT1YL7G1FS+Kqx8GTAsO2yANcfaWLONHMG4XFa5U=;
 b=gWRBPPX6B4v+snyfEJvyGmHenE3BC7yA7d4BGC/NYVDgKytt61cqa1uFVpbf6lKatTkeCa
 z8A4aAcAey2UfkhR7HoaAEPA1s9zTflmN8a4U8/rpRG1mpitjmMCQdKyVBLO8ky1LyapXS
 Orzjpx18rq4X+k4xUiSfEnKNNHiPJEo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-uW88y9mQMK-DRKBMAq6LNw-1; Wed, 17 Sep 2025 05:28:55 -0400
X-MC-Unique: uW88y9mQMK-DRKBMAq6LNw-1
X-Mimecast-MFC-AGG-ID: uW88y9mQMK-DRKBMAq6LNw_1758101334
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45f2f15003aso19941855e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 02:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758101334; x=1758706134;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZfNBT1YL7G1FS+Kqx8GTAsO2yANcfaWLONHMG4XFa5U=;
 b=FGwxm/78CQGV2NKzZio95uwHVwt2FGMOHBAo4x67P1KM102SWjbc7qYEVYY/xSuAzI
 EROHesebVrUZpElOOqWHn4CgmhE9XUrz82j0fdqjn3SzZozG+j/mgM8/dJ9+3ugaqvA8
 VnFIWLqDs52SgMzslKnCCCc+6rQ8iW9AUXhGSkCr+0tGiihqjxnGhmrpASCtgL/4W/1Y
 I4raDTaGcAeHRfwqk/4a2Soiqg6t7fwKsGzIAZFFWDFSfb8OPAqyglZmyBrAjiMS6WS3
 jqFavKos0sbxFS30glx1gaMZzQ7wBqEnCV2ic12P+/CaCEaKCqq4Yb1/4B2XD0YNIFJo
 iAUQ==
X-Gm-Message-State: AOJu0Yzef8OG+u6ZeMEYGzjCNI5E3NQi3RQogGiWnDAq3aBs1hcaiQmL
 FCXYhYZxt8twlVr/lNe9KXe6e86WW0pNWQTqevFUWMmDR9TlrAQYxCTDPz41gkD0xVd5YlOBj+b
 dlaskpfOkKz4cJ7don0EgQqW4zPzkFsLhepFgvvVBxRSxlRGW7Rizz5IOGP6biIl42i3OKg==
X-Gm-Gg: ASbGncufnmk1cn/te07tP89M4meY0POZiuDRYzK3jmnyDnxypWHnuzjCNBjXEqs6ZVn
 G86ZJE6tm1lcCfD/7EkM/OHst/xs8jceYv2DSOwxc6lIJq2Ie8XRm8xSBfItICJsbdRPHC+qHO9
 66TO4ojGrJpe0kNFyAopaEUXwpmlN/GeIpduXuExbELNWiHCVu/xddi0zr+KzvS8JdNkd41Ueqr
 xJziDJ2/4g8Gp4ft4IxIOo5jeL9Ix3eQbktQ+UbRx3cGHnsS7clCYG0XXVEgynQaTvSiPW+o+aS
 qUUqXxFyH63sRSQCbO0geXLcNfLSoHzImWgD6jfb1XkCenoDD/gjLrAMMfUWtojbvRJQ1lpC84D
 r9tHSdSD0k/PX4rq+ku3EJA==
X-Received: by 2002:a05:600c:198f:b0:45b:9961:9c09 with SMTP id
 5b1f17b1804b1-46205adf769mr16887145e9.17.1758101333919; 
 Wed, 17 Sep 2025 02:28:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0eaULepLCUdlOVeRpbHOEaxvQhL1o8Xsg4Ar5MV+xqCbGANNxhCkzWolo8lT4zCuGLfFnhg==
X-Received: by 2002:a05:600c:198f:b0:45b:9961:9c09 with SMTP id
 5b1f17b1804b1-46205adf769mr16886915e9.17.1758101333504; 
 Wed, 17 Sep 2025 02:28:53 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32674bf8sm33799315e9.11.2025.09.17.02.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 02:28:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH 4/5] drm/solomon: Simplify get_modes() using DRM helper
In-Reply-To: <20250912-improve-ssd130x-v1-4-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
 <20250912-improve-ssd130x-v1-4-bc9389ed299e@gmail.com>
Date: Wed, 17 Sep 2025 11:28:51 +0200
Message-ID: <87tt11o2b0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k1e4FzQ9uMYQXt9rq7tcc3iBUYwxzFfJkm-qfhdkqfY_1758101334
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

> The ssd130x_connector_get_modes function contains a manual implementation
> to manage modes.
>
> This pattern is common for simple displays, and the DRM core already
> provides the drm_connector_helper_get_modes_fixed() helper for this exact
> use case.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

