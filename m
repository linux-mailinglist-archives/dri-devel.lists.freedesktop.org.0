Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0059383EC83
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 10:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF69910EBD0;
	Sat, 27 Jan 2024 09:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530D010EBD0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 09:57:29 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-362a29076fbso2958335ab.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 01:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706349388; x=1706954188;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gALc3iFTz0zaU6GiwjaH5CXFj7sL0Sl/fQeT+WtwOLs=;
 b=fAnIPk0tK+NuqXlakiUehvoGT6WsW7szeCWZqecnIUiHrir+04x1WA+dX5p9mW/zz9
 HaSFHJOTdeKBm94XoLnWLc2N2O1nxA7NjVTUfScUbzNpMWwAY1n6brk/hINiiZEmZoGv
 W76a1Znci07pHf/5s4Vd+KAoJ3jMN63kVrdL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706349388; x=1706954188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gALc3iFTz0zaU6GiwjaH5CXFj7sL0Sl/fQeT+WtwOLs=;
 b=JFoxJ39zHtgg4bO9y6TOu0Xk5Hdo21D5LvSy9jnpeQAWl9HLJPVS0zrJiXIQpNvdA4
 I4DV47XurgpjvUXddj1rZiw5X+HhsTi8twRxlT1yDoC7EoyMwmcy2qbbN7ugCXQ7wq07
 UEjEKp1dey1q9AN7x7kd9QAW4tYFTV5IjGRUffzaArBwj6olXDI0hg5PiQrX/K/9iM7J
 6HG2l2RzYsyW/2aSlkWX5iP1mTYFUgcGTjuDiEdSEkmjdbY4Nz4oY9BWXgHCAQCpVkMf
 NRxwv5Gl/tqnpXEjvI9PwZZ+nAe4L7kOtTMWN5rr7LfZ5dyT1kP8vALnGQWBMn59jM0t
 nOLw==
X-Gm-Message-State: AOJu0YzzeFC5CXN4y3WSo5UIuprE1pSKbkgFV5c+L3sswwyIDhOX/ubM
 R1XFMrKt6TM19w/PPLCaUuBhmehvvDGINaSEetuWLUfkITS7ElCc7WCy9MpmrPC7yEIQYXWvogm
 FCQ0RIGTB4qWjIMAnvoDW1O2tz3ELfFJ6RaJ3fcAFaE0PsK2b5w==
X-Google-Smtp-Source: AGHT+IHbc2akVZAWdd8uY23TsD67K0/Ci1UiRhdeUK37XtFLfwjInBi5Im/KjkUx3UPvjKwEzAoXNl2yuoCQoKBDmQM=
X-Received: by 2002:a05:6e02:1e0b:b0:35f:bea3:bd00 with SMTP id
 g11-20020a056e021e0b00b0035fbea3bd00mr2533508ila.14.1706349388466; Sat, 27
 Jan 2024 01:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20240126200804.732454-1-zack.rusin@broadcom.com>
 <20240126200804.732454-6-zack.rusin@broadcom.com>
In-Reply-To: <20240126200804.732454-6-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Sat, 27 Jan 2024 11:56:17 +0200
Message-ID: <CAKLwHdW=fYgkU5kq=v7DBuMyxVwXZF7oTuA3D1VBZ=w3OHPpfQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/vmwgfx: Fix the lifetime of the bo cursor memory
To: Zack Rusin <zack.rusin@broadcom.com>
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
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 10:08=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> The cleanup can be dispatched while the atomic update is still active,
> which means that the memory acquired in the atomic update needs to
> not be invalidated by the cleanup. The buffer objects in vmw_plane_state
> instead of using the builtin map_and_cache were trying to handle
> the lifetime of the mapped memory themselves, leading to crashes.
>
> Use the map_and_cache instead of trying to manage the lifetime of the
> buffer objects held by the vmw_plane_state.
>
> Fixes kernel oops'es in IGT's kms_cursor_legacy forked-bo.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: bb6780aa5a1d ("drm/vmwgfx: Diff cursors when using cmds")
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index e2bfaf4522a6..cd4925346ed4 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -185,13 +185,12 @@ static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
>   */
>  static u32 *vmw_du_cursor_plane_acquire_image(struct vmw_plane_state *vp=
s)
>  {
> -       bool is_iomem;
>         if (vps->surf) {
>                 if (vps->surf_mapped)
>                         return vmw_bo_map_and_cache(vps->surf->res.guest_=
memory_bo);
>                 return vps->surf->snooper.image;
>         } else if (vps->bo)
> -               return ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem);
> +               return vmw_bo_map_and_cache(vps->bo);
>         return NULL;
>  }
>
> @@ -653,22 +652,12 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *pl=
ane,
>  {
>         struct vmw_cursor_plane *vcp =3D vmw_plane_to_vcp(plane);
>         struct vmw_plane_state *vps =3D vmw_plane_state_to_vps(old_state)=
;
> -       bool is_iomem;
>
>         if (vps->surf_mapped) {
>                 vmw_bo_unmap(vps->surf->res.guest_memory_bo);
>                 vps->surf_mapped =3D false;
>         }
>
> -       if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem)) {
> -               const int ret =3D ttm_bo_reserve(&vps->bo->tbo, true, fal=
se, NULL);
> -
> -               if (likely(ret =3D=3D 0)) {
> -                       ttm_bo_kunmap(&vps->bo->map);
> -                       ttm_bo_unreserve(&vps->bo->tbo);
> -               }
> -       }
> -
>         vmw_du_cursor_plane_unmap_cm(vps);
>         vmw_du_put_cursor_mob(vcp, vps);
>
> --
> 2.40.1
>

LGTM!

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
