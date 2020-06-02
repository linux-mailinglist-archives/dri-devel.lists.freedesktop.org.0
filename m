Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556541EBA48
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 13:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC6789C07;
	Tue,  2 Jun 2020 11:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6068991A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 11:23:01 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id 59so1104307uam.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G+DNdm4OSXj+ZbBSFAclEqfXcnxIti3qQTr4JFZ9dtc=;
 b=lnD6MIXyEj5uecvyfaXox7g810NP8Ibk2/joJWKyDDRPfm3DDKj1mmwutnK8eZAgvv
 izrSuehMkKmZ17ShLYiUxI/c/NX6yCBTsze7Z6QLSjRTt77h/QAbHMrE8K1mbss3kRVF
 XmQ/NdlpU2PJp+Xw3FPgxtZpn/NS1ZkmHk4k3WXL1J9RVAQkDlL1ZnV6LJEVTO6QaCsO
 Dx5an036CMyZqV7xlEA5DhUb6Kd3D1jTSeVCb0nHpz8opyYh2XNR/brlP6n/C8qZ6Fkj
 gPANDbfdblL2Czrxg9LQqdBCOdazHgbshh+xLjD4brVfLTPVXc8ckcxDiB67VPlS/c6R
 XtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G+DNdm4OSXj+ZbBSFAclEqfXcnxIti3qQTr4JFZ9dtc=;
 b=WALAQJd+RVK7uiRD08SaddgXtHplKv976LdmwkYlWUT5JfrIUckxRHebbJwnoIkLC4
 1uMVhL9MCbYhUH9NJDexzofUGUjxUXZedOVPmc57S4+DW08/AdfTAPQla3R6w7/ZkNng
 WWf8ZwffcC2zXC4FvuYRQWS8+s+LnMf5MhOBYACcKbP4P3ykeCN2GpoGXGy3HAgKrOXU
 7PvFdfJTe54qiYuAgyiIXOLfp/mU81Hr32OZF2S6yyT2jFJ0VGmC5ZdTYphfQ6rwcGaB
 2hA8qvp5f5svdBzPcQ+/p9aozGzMC7uz3hcS3BBx9HtA6u9x1lF/XjNUp9Uv3msigZ3J
 6kqw==
X-Gm-Message-State: AOAM531kbqMfNCOJ58jhpPNbuPVxSMFTCXUuC6sWz/C1yN0T1TjTppqk
 JbKpr2BzGxDfyaBXAY/vArjyKytQ+yxRDBiSTtU=
X-Google-Smtp-Source: ABdhPJzgunA1N5yaYNWOEvkLV8aY3KUQWScXsEgM4P7MMV+4QxZfoN3c4emUPiX+0ovH8mnEnlAJ16bm8arKmmGWxBk=
X-Received: by 2002:ab0:6012:: with SMTP id j18mr1209769ual.69.1591096980386; 
 Tue, 02 Jun 2020 04:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
 <20200511115524.22602-2-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20200511115524.22602-2-Rodrigo.Siqueira@amd.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 12:19:42 +0100
Message-ID: <CACvgo53qkPb+3xVcUQJosnq0fSzG9kBEet2tCeLNXkkAQLSrUA@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] drm/vkms: Decouple crc operations from composer
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Helen Koike <helen.koike@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On Mon, 11 May 2020 at 12:55, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> wrote:

> -static uint32_t _vkms_get_crc(struct vkms_composer *primary_composer,
> -                             struct vkms_composer *cursor_composer)
> +static int compose_planes(void **vaddr_out,
> +                         struct vkms_composer *primary_composer,
> +                         struct vkms_composer *cursor_composer)
>  {
>         struct drm_framebuffer *fb = &primary_composer->fb;
>         struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
>         struct vkms_gem_object *vkms_obj = drm_gem_to_vkms_gem(gem_obj);
> -       void *vaddr_out = kzalloc(vkms_obj->gem.size, GFP_KERNEL);
> -       u32 crc = 0;
>
> -       if (!vaddr_out) {
> -               DRM_ERROR("Failed to allocate memory for output frame.");
> -               return 0;
> +       if (!*vaddr_out) {
> +               *vaddr_out = kzalloc(vkms_obj->gem.size, GFP_KERNEL);
It would be clearer if you keep the to alloc (or not for wb) in the
caller. As-is it's very subtle and error prone.

> +               if (!*vaddr_out) {
> +                       DRM_ERROR("Cannot allocate memory for output frame.");
> +                       return -ENOMEM;
> +               }
>         }
>
> -       if (WARN_ON(!vkms_obj->vaddr)) {
> -               kfree(vaddr_out);
> -               return crc;
> -       }
> +       if (WARN_ON(!vkms_obj->vaddr))
> +               return -EINVAL;
>
> -       memcpy(vaddr_out, vkms_obj->vaddr, vkms_obj->gem.size);
> +       memcpy(*vaddr_out, vkms_obj->vaddr, vkms_obj->gem.size);
>
>         if (cursor_composer)
> -               compose_cursor(cursor_composer, primary_composer, vaddr_out);
> +               compose_cursor(cursor_composer, primary_composer, *vaddr_out);
>
> -       crc = compute_crc(vaddr_out, primary_composer);
> -
> -       kfree(vaddr_out);
> -
> -       return crc;
> +       return 0;
>  }
>
>  /**
> @@ -157,9 +153,11 @@ void vkms_composer_worker(struct work_struct *work)
>         struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>         struct vkms_composer *primary_composer = NULL;
>         struct vkms_composer *cursor_composer = NULL;
> +       void *vaddr_out = NULL;
>         u32 crc32 = 0;
>         u64 frame_start, frame_end;
>         bool crc_pending;
> +       int ret;
>
>         spin_lock_irq(&out->composer_lock);
>         frame_start = crtc_state->frame_start;
> @@ -183,14 +181,25 @@ void vkms_composer_worker(struct work_struct *work)
>         if (crtc_state->num_active_planes == 2)
>                 cursor_composer = crtc_state->active_planes[1]->composer;
>
> -       if (primary_composer)
> -               crc32 = _vkms_get_crc(primary_composer, cursor_composer);
> +       if (!primary_composer)
> +               return;
> +
This early return changes the functionality. Namely the
drm_crtc_add_crc_entry(.... 0) is now missing. I don't recall much
about the crc to judge if that's a genuine bugfix, or newly introduced
bug.

In the former case, it should be a separate patch.

> +       ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
> +       if (ret) {
> +               if (ret == -EINVAL)
> +                       kfree(vaddr_out);
> +               return;
> +       }
> +
> +       crc32 = compute_crc(vaddr_out, primary_composer);
>
>         /*
>          * The worker can fall behind the vblank hrtimer, make sure we catch up.
>          */
>         while (frame_start <= frame_end)
>                 drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
> +
> +       kfree(vaddr_out);
Nit: move the free() just after compute_crc() - it's not needed for
the drm_crtc_add_crc_entry().

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
