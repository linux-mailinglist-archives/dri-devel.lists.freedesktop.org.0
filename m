Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD37EE174
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F2D10E5D6;
	Thu, 16 Nov 2023 13:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8461910E5D6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700140945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F7+iNGSwtyGLrsX7CmnTv6eFqLzHKXVfMpm2hsnu83o=;
 b=fdcBPcM4+ISfyggLLG9nHtw6OHm0Fq4qGpcUcR/w7C+j2YZM1RopvUU7z4Vi5RYuQjNAtp
 0xBqAEGLhjIE6Ve0j+CWuCOa+879oJRaSViEzyFgzYcwiiovEjb+Hu7oIpeqcf7QG7fcHB
 CxscpvYNoTy0NFXdi8MmDYSF9QA2PyQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-SwsTw6_3NsuzZphXCu8N7Q-1; Thu, 16 Nov 2023 08:22:22 -0500
X-MC-Unique: SwsTw6_3NsuzZphXCu8N7Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32d9cd6eb0bso437709f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 05:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700140941; x=1700745741;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F7+iNGSwtyGLrsX7CmnTv6eFqLzHKXVfMpm2hsnu83o=;
 b=sEFVgK+MQ50JichMva+OaaUygzmzLVHgsYTdAXixTI6LpOj0JtsZkXFi4ZPqdJFcN4
 RSgNtZbNpae/hQA/ONaxb3dfEpiJTsN9fWVDIBUhFm7ijYTh8BJLMdpAa1I7p3EpTi/d
 qcW1h33wq2lLTOG7b05gkgZTzSEYSJ/8ZWLF+zTD7YvaWLuYFzXV9HAkQoibMQ9cEKHF
 boeCeSyNPv4C1G0/jJ6bL8qq9wlNTwopifmzvY69wpfAFpbim+6ZkB9vQlpC001b+aOn
 swkQeGXuEyzLfsob2Q4xvvmYJzczkh1hS2Guhg2Y3OSoXXSPRj7Wrb6qQmIc2om9Q1d7
 FoXg==
X-Gm-Message-State: AOJu0YyWGGf2sFYQFwgrdhtt6TxqNibF8wBdX6PvggJvhaH3fJKvwl7j
 3OPf2y3KGSgMTGkgaK6qNorkC037MnX8p5DyI4JaeaYh0uNwKMsonzOkqyHLTvU8t9Gn7l+ixH8
 TMrxjSMhXjHEvswMStONOojrdejr1
X-Received: by 2002:a5d:5741:0:b0:32f:7db1:22f0 with SMTP id
 q1-20020a5d5741000000b0032f7db122f0mr10520036wrw.20.1700140941531; 
 Thu, 16 Nov 2023 05:22:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFuK+UpxCjYuUwCxoI9MkGHUTPUyNvLFpUtkuAQkHfNvTxAFlBt0TzLY1alrl726JtxtyLtA==
X-Received: by 2002:a5d:5741:0:b0:32f:7db1:22f0 with SMTP id
 q1-20020a5d5741000000b0032f7db122f0mr10520027wrw.20.1700140941220; 
 Thu, 16 Nov 2023 05:22:21 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q4-20020a056000136400b003233b554e6esm13556933wrz.85.2023.11.16.05.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 05:22:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christian Zigotzky
 <chzigotzky@xenosoft.de>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I
 Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Laurent Vivier <lvivier@redhat.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v2] drm/virtio: Add suppport for non-native buffer formats
In-Reply-To: <47a81d2e0e47b1715718779b6978a8b595cc7c5d.1700140609.git.geert@linux-m68k.org>
References: <47a81d2e0e47b1715718779b6978a8b595cc7c5d.1700140609.git.geert@linux-m68k.org>
Date: Thu, 16 Nov 2023 14:22:20 +0100
Message-ID: <87ttpl25pv.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> When using virtgpu on a big-endian machine, e.g. powerpc QEMU:
>
>     virtio-pci 0000:00:02.0: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-2)
>
> or m68k/virt:
>
>     virtio-mmio virtio-mmio.125: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-2)
>
> and the graphical display fails to come up.
>
> Before, the call to drm_mode_addfb() caused a translation from a fourcc
> format (XR24) to a bpp/depth pair (32/24) to a potentially different fourcc
> format (BX24 on big-endian), due to the quirk processing in
> drm_driver_legacy_fb_format().  After, the original fourcc format (XR24)
> is passed unmodified.
>
> However, the virtgpu DRM driver supports only a single format for its
> main plane: DRM_FORMAT_HOST_XRGB8888, which is XR24 on little-endian,
> and BX24 on big-endian.  I.e. on big-endian, virtgpu does not support
> XR24, which is the default DRM format, and must be supported by all
> drivers.  Before, this was reported, but didn't lead to a failure:
>
>     virtio-mmio virtio-mmio.125: [drm] bpp/depth value of 32/24 not supported
>     virtio-mmio virtio-mmio.125: [drm] No compatible format found
>
> As the core virtgpu driver and device support both XR24 and BX24 on both
> little-endian and big-endian just fine, fix this extending the list of
> supported formats for main plane and cursor plane to XR24/BX24 resp.
> AR24/BA24.
>
> Fixes: 6ae2ff23aa43a0c4 ("drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Closes: https://lore.kernel.org/r/c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de
> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Fix truncated one-line summary.
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

