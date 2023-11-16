Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6407EE166
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2A210E5EE;
	Thu, 16 Nov 2023 13:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B9710E5EC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700140740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r2ioSvsdVC24BNs/tJ+ckjjBuQcpkPVhbaN7mfLUSmk=;
 b=gEFhBfNcCbMgIupKMmqeXxjaSPUFpcLPDVixjVMLqjV0z3sIehZ/K+KGSb65me9m+lmEyI
 Kr4RhuZia2JFhZbUgSQ6ILaahlrCQTXBl9E6gR1suQMKXtWUf5n4jl4/r8DOtFd4z0W7tH
 TMRG0UnEXLkp/wNIdVleTZEJfykAbS0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-tVMGbZCeMwSYFTfk7nfy9A-1; Thu, 16 Nov 2023 08:18:58 -0500
X-MC-Unique: tVMGbZCeMwSYFTfk7nfy9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4084001846eso4487105e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 05:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700140738; x=1700745538;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2ioSvsdVC24BNs/tJ+ckjjBuQcpkPVhbaN7mfLUSmk=;
 b=e6KsL0HbgLBZCJEKeGaweeY4JbaE2IAaNk/yMQ1Ihe9UgJE+3lJDEQfp9zFKMwSIJF
 DVQpiIuO2B0GIyiLWu691D0hbTRov2IenR18u65L5lVXmEiUs1GwY64s4nQ6QWYPxVRP
 qtDDDRfSrHQVnOWFU3PeBhjHAZbuQCAe5C1PW8pIE1+0mvDq+9nLHxuROfsNdHjRx3Sr
 m6WnMduaWJYXN7yJQj1rSqG1txuvzEkPUSMHl8uJwXL0aJcSZ5hySHdeJz61Xs5Op3tL
 iICq3ei6Rhrx8GoiOzmlZOhiHZt+a4J3mzkLMqX8oVEMvaNByYx4oIlz+8UNPM/qILBV
 MQRA==
X-Gm-Message-State: AOJu0Yyn6HN09W/NU/M4Gq1fwjBPDrT+vNV97Y6z0sfcyKvodLNt2HCW
 dALEPdqLJXGSJ3SxuaWqkJya7M2LE3O+LGX0IORO3J+nvRbEk766tvwyLypapmZcDRp11OMyyI6
 UQC/toJXzpqkzPH5MvqjaMCYQj5ge
X-Received: by 2002:a05:6000:186b:b0:32d:9b3d:4f69 with SMTP id
 d11-20020a056000186b00b0032d9b3d4f69mr15354761wri.64.1700140737930; 
 Thu, 16 Nov 2023 05:18:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZePSLm6805MffvvwhDpaaQKx0BMg13ekmNTxyFySFKHK0WR1spvD11gT9iZCxRQtve/mI9g==
X-Received: by 2002:a05:6000:186b:b0:32d:9b3d:4f69 with SMTP id
 d11-20020a056000186b00b0032d9b3d4f69mr15354743wri.64.1700140737613; 
 Thu, 16 Nov 2023 05:18:57 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g26-20020adfa49a000000b0030647449730sm13748332wrb.74.2023.11.16.05.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 05:18:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christian Zigotzky
 <chzigotzky@xenosoft.de>, David Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I
 Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Laurent Vivier <lvivier@redhat.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH] drm/virtio: Add suppport for non-native
In-Reply-To: <282a31154172a78165912c832a09f6502515d139.1700140178.git.geert@linux-m68k.org>
References: <282a31154172a78165912c832a09f6502515d139.1700140178.git.geert@linux-m68k.org>
Date: Thu, 16 Nov 2023 14:18:56 +0100
Message-ID: <87wmuh25vj.fsf@minerva.mail-host-address-is-not-set>
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

Hello Geert,

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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

