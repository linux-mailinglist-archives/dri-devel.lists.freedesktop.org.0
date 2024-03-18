Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1587E22C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 03:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB30D10E7BE;
	Mon, 18 Mar 2024 02:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="BEmjLTk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4021C10E7BE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 02:36:09 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60a0579a968so41562987b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 19:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1710729368; x=1711334168;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onywNPKbW4SZgpTt9qm8DWaaYeZm4QLeQe7ttJakLWY=;
 b=BEmjLTk2P40tRlrAc5TQh3ht92rYVKyBqGn/pNBIG7eulYdAZ5lEpMkjxwCz2ZjBhG
 VExBIpy8w/zuc/ggrAYr73zQF4xcwa5CtCamWQjyf49iQgkH+QgoB0VJs6wxFBJZAJ+A
 b/S61weMx2y9stXWw7Chi4ouw8HdJNsYeCzS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710729368; x=1711334168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onywNPKbW4SZgpTt9qm8DWaaYeZm4QLeQe7ttJakLWY=;
 b=s9VTGA0H7VcPmo7xP7kOU9Ee2P7DOf56ux2XEOYbGpWGM/+6m1Oy6UUryzmVwNtHt8
 /2UceXR3duuxuiNVaprhD5m7geVzKTcVIdw/VDNwzWIpRulyOFXZ2tdHx8Iov9PZqmv7
 HyJpacVeEStrbiN5MYwKdknKTFxhs3TEvxGlrLRRw143H446YM3417aAoGguOfZF7Hl1
 Tbdai7BJEjc9Hb1EnP/dsacFkb8sg904xJP2XCVzH48V3lGc8JuvofIEJ9GwuzQBvI0N
 bduBNAGZ110r3N3eluBqSMdjRF9aUi9Mm4KC04Y4I5Ulah1SYhMDnq0gJsqjpVmcHQWA
 UxQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjXgNrMwl2lNe2PVMEGKYaEgg1KGF1i9H4iW0trVXuc8xogO1AkX3Q7YdgOnL1U5EtEYAogjuh0iyPHEPY+js/y3VTO8U5/fzLiC3GbCYl
X-Gm-Message-State: AOJu0Yzk7qrSGocVlgQNBXeOYY7FNuIatHiqvKSxF34QFsGnL65Iau8n
 Iw3wIHqxm1yK6eDKQZIVlByKFJeW0Sso0wj5aqDVZ0u7eqQWDNqOj4mfL6jSjDLULvqMiXkGnYB
 C/rb9YVqR62nGQ1uCoaVXMECfu4gOyubXWBCr
X-Google-Smtp-Source: AGHT+IF8Ma8x3gNXeQfamz040zfqaKcyTg7HlRt8R3vClPLYzuMu0ectkxpFm+mVy3jO+dqSXQ9+jI2cike4if/mGQo=
X-Received: by 2002:a81:8410:0:b0:60a:7cc:24ab with SMTP id
 u16-20020a818410000000b0060a07cc24abmr9714623ywf.37.1710729368080; Sun, 17
 Mar 2024 19:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-2-tzimmermann@suse.de>
In-Reply-To: <20240312154834.26178-2-tzimmermann@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Sun, 17 Mar 2024 22:35:57 -0400
Message-ID: <CABQX2QPJJFrARdteFFZ8f33hvDx-HSyOQJQ7AMFK4C8C=BquTQ@mail.gmail.com>
Subject: Re: [PATCH 01/43] drm/fbdev-generic: Do not set physical framebuffer
 address
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Zack Rusin <zackr@vmware.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org
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

On Tue, Mar 12, 2024 at 11:48=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Framebuffer memory is allocated via vmalloc() from non-contiguous
> physical pages. The physical framebuffer start address is therefore
> meaningless. Do not set it.
>
> The value is not used within the kernel and only exported to userspace
> on dedicated ARM configs. No functional change is expected.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: a5b44c4adb16 ("drm/fbdev-generic: Always use shadow buffering")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: <stable@vger.kernel.org> # v6.4+
> ---
>  drivers/gpu/drm/drm_fbdev_generic.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fb=
dev_generic.c
> index d647d89764cb9..b4659cd6285ab 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -113,7 +113,6 @@ static int drm_fbdev_generic_helper_fb_probe(struct d=
rm_fb_helper *fb_helper,
>         /* screen */
>         info->flags |=3D FBINFO_VIRTFB | FBINFO_READS_FAST;
>         info->screen_buffer =3D screen_buffer;
> -       info->fix.smem_start =3D page_to_phys(vmalloc_to_page(info->scree=
n_buffer));
>         info->fix.smem_len =3D screen_size;
>
>         /* deferred I/O */
> --
> 2.44.0
>

Good idea. I think given that drm_leak_fbdev_smem is off by default we
could remove the setting of smem_start by all of the in-tree drm
drivers (they all have open source userspace that won't mess around
with fbdev fb) - it will be reset to 0 anyway. Actually, I wonder if
we still need drm_leak_fbdev_smem at all...

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
