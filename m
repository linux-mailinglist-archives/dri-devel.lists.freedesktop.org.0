Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA2999343
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 21:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82A610E9C6;
	Thu, 10 Oct 2024 19:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="XFT5LgZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D00910E9C6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 19:59:08 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e2918664a3fso66210276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1728590347; x=1729195147;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/bc0MweznE39rPLaY3R7gQJcW93HabLZwOwmEd7zFU=;
 b=XFT5LgZGYQl8Ay+9er30Dzwu8yxFjvHlwcDkylwUEoMmO6Vru77CcevDjxD1/dC/rB
 4koXkjgp+J8Qeg0Q6vo/BBBrZTQBz7T/3yxUSQUqiPUmqF2YkyAP/BenJMBf8PHRvl5N
 g1fGQ6UTa7KdCAf3bGCEhj+fbsT4uRAf8M0yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728590347; x=1729195147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/bc0MweznE39rPLaY3R7gQJcW93HabLZwOwmEd7zFU=;
 b=mWTfaxuwNY6TwZL489T1baKZJhqA3zsxU7iIQG606BFHpiGd+O31TLyREYkZZRcDcE
 wdfB0MDIJdQTCrIJhPjKko0IQS9FwK0FukUsQl+tmlRLcVN6x8iZT4dM84oXm2fffxbN
 fa538O+B02umoIb+ylVNGrwlSzziroa8bwIiJpHWsNLvaTvV65YJ3fsXHpflSFTQmvy/
 Yz/sxyblEMk4KQN5b1ZrLhLtlYUJsA/6pdB0sIVO7Ma/2Ms8SOe8ae2+Ue/foRoXkspk
 J6OZjRRKKDwBAr5+H57Wh9bWAhWa9juXNiwqOHqeSRmghdiDvtH+DxGFe0OB499HUQ9H
 C+DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqGsV4HBAMEl0rWHGj2o6J+JnylaxLcdlOwf47aYKbDR40sUYFL97cL1UFKSZ6zgFh1EvwG6eDwDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUFGxFMHfKORAUjSwtRpXVDiijtn4t3gKBCsYVz1W9aU4uhHkF
 6Dc2HZGmDIyhrN3FR78lBUO3qG6AeO0TJvqn1h8CdD8lCAixmY+0ZH6abwQWIz0UvtX76YG1iCO
 V3xvKWjJc8+03VWfmqIAbEwQgRNXJFs4vp/JWOGoqBzwupcg=
X-Google-Smtp-Source: AGHT+IHKdWo0J63T55tb5EKx4BupQmJDilI5bVOOroBGaVlaETEhyAGnkCjAUbgUWNG8Bn6WSbZNfqyk9zmB7YHCnLg=
X-Received: by 2002:a05:6902:2403:b0:e29:552:42a7 with SMTP id
 3f1490d57ef6-e2918379976mr312653276.13.1728590347036; Thu, 10 Oct 2024
 12:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241004205053.1068629-1-arnd@kernel.org>
In-Reply-To: <20241004205053.1068629-1-arnd@kernel.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 10 Oct 2024 15:58:56 -0400
Message-ID: <CABQX2QP49-KFTbtDkmR0qt_qFRAmCQ+4O7x3WON5P22S6Of1FQ@mail.gmail.com>
Subject: Re: [PATCH] vmwgfx: allow building with CONFIG_HAS_IOPORT disabled
To: Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Martin Krastev <martin.krastev@broadcom.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 4, 2024 at 4:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The older version of the vmwgfx driver requires port I/O in order to work=
:
>
> In file included from arch/arm64/include/asm/io.h:298,
>                  from drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:28:
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h: In function 'vmw_read':
> include/asm-generic/io.h:626:15: error: call to '_outl' declared with att=
ribute error: outl() requires CONFIG_HAS_IOPORT
>   626 | #define _outl _outl
> include/asm-generic/io.h:663:14: note: in expansion of macro '_outl'
>   663 | #define outl _outl
>       |              ^~~~~
> drivers/gpu/drm/vmwgfx/vmwgfx_drv.h:692:17: note: in expansion of macro '=
outl'
>   692 |                 outl(offset, dev_priv->io_start + SVGA_INDEX_PORT=
);
>       |                 ^~~~
>
> Change the version check to hardcode the v3 version and remove the PCI
> ID for v2 in configurations that only support v3.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 5 ++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 2825dd3149ed..dfb4b2ba23c6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -262,7 +262,9 @@ static const struct drm_ioctl_desc vmw_ioctls[] =3D {
>  };
>
>  static const struct pci_device_id vmw_pci_id_list[] =3D {
> +#ifdef CONFIG_HAS_IOPORT
>         { PCI_DEVICE(PCI_VENDOR_ID_VMWARE, VMWGFX_PCI_ID_SVGA2) },
> +#endif
>         { PCI_DEVICE(PCI_VENDOR_ID_VMWARE, VMWGFX_PCI_ID_SVGA3) },
>         { }
>  };
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 3f4719b3c268..a2fda4d43b4e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -655,8 +655,11 @@ static inline struct vmw_fpriv *vmw_fpriv(struct drm=
_file *file_priv)
>  /*
>   * SVGA v3 has mmio register access and lacks fifo cmds
>   */
> -static inline bool vmw_is_svga_v3(const struct vmw_private *dev)
> +static __always_inline bool vmw_is_svga_v3(const struct vmw_private *dev=
)
>  {
> +       if (!IS_ENABLED(CONFIG_HAS_IOPORT))
> +               return true;
> +
>         return dev->pci_id =3D=3D VMWGFX_PCI_ID_SVGA3;
>  }
>
> --
> 2.39.2
>

Thanks! Looks good. Would you like me to push this through drm-misc-fixes?

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
