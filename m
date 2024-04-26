Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1778D8B322F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 10:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B72A10ED2B;
	Fri, 26 Apr 2024 08:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Z4jJsDAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209E10ED2B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:20:59 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7d6c4c97875so80840439f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714119658; x=1714724458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOO+Oxe5RqdUN11iHoDt4ydzdK+8AI7NsGcbenw3d/A=;
 b=Z4jJsDAeCmWb+VqB3PfdDBXpWSJfmuVUT/XdzyVjoZ/6eymjwfdV1+JxyxE1o4IlnC
 MIqkGpBH3Pv9iRnySfB/e/PiEMpWCQM56Nqg1IeyKKAM05bb5r5cdBLWCZtHNgcskYH8
 qt6+RPoWIZg3VuFYYxqcUSP5PtOuWh0aY/UpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714119658; x=1714724458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOO+Oxe5RqdUN11iHoDt4ydzdK+8AI7NsGcbenw3d/A=;
 b=SnjR+5sNETqErH4c+3u6D/4K0VJi1HG9Ohqix08bFUQlEThqt2jGsBWKcXIuaMQIRC
 A5/HWIWq0OO7eiafyxe0nCxB+j+VSoXuc8GRZY2F2kk4sDosuZk0e+9dQ8jib0UIKIeq
 SnRIKa8V99/iwb+coGlI+Xr1wmfnDKh6xmIkgo7GXMVEvbHqjB1EHGtTTT2xjEVz+ewS
 Hjhf86DxMHkAN1DgQD0pMnh5Hl0w9pEtItouZHK8Lo0RMHX5ibGEFShf2bqOAez8M14S
 KFSuOzIRDZRBRyB0S/7c1138mJ77hJggxFI4/2RtYCAN4GsJLQIvsJd8OcOWVXVduD1A
 rhsg==
X-Gm-Message-State: AOJu0Yy5fA0vUqkUtBNJ5YboVWCiEK2r0qr2DbWSZzQTMpnyRNUop0nB
 9BhUUXZN/b16EvzAMP321zNCTgccrHAVj3eMFEk4OorG2Vc+TTuBWD8MC1GRDrDVRsNKuHIWJh7
 8F/mJIP5ngrFXXKIt8YC3HYSvDg+UqWt4gzaK
X-Google-Smtp-Source: AGHT+IGpFrMmIiUOGeU8GqDVHvij5e/EHFi3eql6VH19ZiFzL8S3bxOTPVDJXE8//vqh4sKVAKaAYPJDw3yidMK+gL8=
X-Received: by 2002:a05:6602:f11:b0:7de:9c6b:79de with SMTP id
 hl17-20020a0566020f1100b007de9c6b79demr2387497iob.14.1714119658470; Fri, 26
 Apr 2024 01:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240425192748.1761522-1-zack.rusin@broadcom.com>
In-Reply-To: <20240425192748.1761522-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Fri, 26 Apr 2024 11:20:47 +0300
Message-ID: <CAKLwHdVZSRtnCe_=pTw0kUaTEvCRKqypcq-u2f50o=xRQCrASA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix invalid reads in fence signaled events
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
 maaz.mombasawala@broadcom.com, zdi-disclosures@trendmicro.com, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

LGTM!

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

On Thu, Apr 25, 2024 at 10:27=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Correctly set the length of the drm_event to the size of the structure
> that's actually used.
>
> The length of the drm_event was set to the parent structure instead of
> to the drm_vmw_event_fence which is supposed to be read. drm_read
> uses the length parameter to copy the event to the user space thus
> resuling in oob reads.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: 8b7de6aa8468 ("vmwgfx: Rework fence event action")
> Reported-by: zdi-disclosures@trendmicro.com # ZDI-CAN-23566
> Cc: David Airlie <airlied@gmail.com>
> CC: Daniel Vetter <daniel@ffwll.ch>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v3.4+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_fence.c
> index 2a0cda324703..5efc6a766f64 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -991,7 +991,7 @@ static int vmw_event_fence_action_create(struct drm_f=
ile *file_priv,
>         }
>
>         event->event.base.type =3D DRM_VMW_EVENT_FENCE_SIGNALED;
> -       event->event.base.length =3D sizeof(*event);
> +       event->event.base.length =3D sizeof(event->event);
>         event->event.user_data =3D user_data;
>
>         ret =3D drm_event_reserve_init(dev, file_priv, &event->base, &eve=
nt->event.base);
> --
> 2.40.1
>
