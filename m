Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB28AA0868
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 12:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D343C10E287;
	Tue, 29 Apr 2025 10:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EGmvJyvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC7710E287
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745922203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ou46RQiw27MHB6L9lNRbXAsrEhOAHGqjTdf1Xhm4BSg=;
 b=EGmvJyvZ2tTVZjKXFR3VfitiV+whaJ5eSBNQJn76g72fZg6sNsAUEWY4LAIs87pPeYKQ9t
 mb+IfZ9elxlnrr15HZnhbMftPYQahXR2RZ6ZpJNkkqj5sP66fnfvY6pn8QPK3m1S13AJp0
 VdiXLkd9FyQwcvrfPctlZ6LRKpHdMIc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-vUwt4t7WNhGSTMKslXbELQ-1; Tue, 29 Apr 2025 06:23:22 -0400
X-MC-Unique: vUwt4t7WNhGSTMKslXbELQ-1
X-Mimecast-MFC-AGG-ID: vUwt4t7WNhGSTMKslXbELQ_1745922201
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-39c2da64df9so2585771f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 03:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745922201; x=1746527001;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ou46RQiw27MHB6L9lNRbXAsrEhOAHGqjTdf1Xhm4BSg=;
 b=D27t2VRiGXV7AEGDeNx+K+Oulxl/JRuFaBVoQd2m0t2HgI3lt4fWhVSI2Xa7mMtHce
 VegoVLMiWo2FoSllOinv1RpBa2bspsskJT0pHLOn4aJiB+DexOToHiYrI93UTbpdZd8e
 G5+0dzdqoYv5zEdBJvCgQaQWGMezgcPs7U2cCAbGNVrPs+1CSgThsUXLjj6Ql6fpYr7Q
 mm3mZx9HV/2zbZsxccOLAYDHhy7rd7CiY/7+mcnrHuQZxg+bBcsTxewloHeU1Xi5vnXZ
 UkPHj9sBQk18c3JLv0N6bbs70WTE0E29xaGY4jgyKZl5dUYtBsOyZrpOa6SAsNOSX5ur
 18vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQJLHRKvdV1DQ45jXGUzSnRolpU9txbG2zcj28G29GylRdOLOKcYcs7wsdseE1eaOy9cP80+6Yrw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKFti79wlsbguYgRI+0jFo87ACFnuQassMLyXkNlqv6IaddnMz
 R2PEebD/dif8Ac8bC2nOEurElGS/Xjya/RpUq/8VrBG2BeSdGYNnNtZxICOuBwfxCTOo4yAm3Ip
 FxTM0HxnRnO5WC7CvQiys6FQitzRqpTOGz0Dmk8DvBy1SqNFzi+SH/JlXZDKTba6K7A==
X-Gm-Gg: ASbGnctZ1IFVgsoLjNSrQ6unkP73n8USG2Ez4LEwlisAh7+npuGh/kh9BrEtn5EypAb
 cJSTG/RChKI2zok2O6yZby5WkNimVGlRQbng/SMkuXyK6JOIhTT7qrhZX71aoZb8ofwiiNKeFUu
 EfA+Ory4nFJuGuaGvsaGcapJ+PaZc7DIg2AT5oxdpG9jWzLIeLm9unm+OvuDBz/JWg1gCdn6oZs
 jxuBNyvww9DAdysn0Vu3/9I/1u0zUG+JKOu3M/0yllZhVOlki9eILzEH3KBLjbwLjqsDWOWUAyV
 p1UnxdSgs0NVfmgKA4oCtJb8ZgOI+MDaMRZ1YU0zFnp6hi+WkZV0TI1AjevQ85qJLeY/ow==
X-Received: by 2002:a5d:598c:0:b0:391:2c67:798f with SMTP id
 ffacd0b85a97d-3a07ab8176emr9560328f8f.41.1745922200990; 
 Tue, 29 Apr 2025 03:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTs5WgstZJckNJqUcEC4QQ/SCLXl1Ezn5Q82Us7fxkFAFEkizJrjHsAT0GnIPHkqaJtOYMjw==
X-Received: by 2002:a5d:598c:0:b0:391:2c67:798f with SMTP id
 ffacd0b85a97d-3a07ab8176emr9560294f8f.41.1745922200601; 
 Tue, 29 Apr 2025 03:23:20 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5e345sm13720628f8f.94.2025.04.29.03.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:23:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Lechner <david@lechnology.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Alex Lanzano
 <lanzano.alex@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION
In-Reply-To: <20250428150752.3970145-1-arnd@kernel.org>
References: <20250428150752.3970145-1-arnd@kernel.org>
Date: Tue, 29 Apr 2025 12:23:17 +0200
Message-ID: <87v7qnz2p6.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2vGKGcBhS8Si0BRs_Ob8VN04iVwLvB4OFzHLW36TIIM_1745922201
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


Hello Arnd,

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added driver calls drm_client_setup(), but that is not
> always built in:
>
> x86_64-linux-ld: vmlinux.o: in function `st7571_probe':
> st7571-i2c.c:(.text+0x7b7119): undefined reference to `drm_client_setup'
>
> Select the appropriate Kconfig symbol.
>
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

