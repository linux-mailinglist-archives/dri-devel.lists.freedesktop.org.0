Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DBE6EF796
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4455610E117;
	Wed, 26 Apr 2023 15:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4294810E117
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 15:15:37 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-b992ed878ebso23922311276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 08:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682522135; x=1685114135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CEbIcZJtfd2cyasYqmk3KyrhQ3V2aqqNCk4M1P2Bd3w=;
 b=XWcmplLNVtX7FCVTTw2nBnRWIvllKk6XJpFdUq+pdo7lYpyuGqyrlqNePDc95BcN5L
 7HPx8LKHIdaZHb3BRlKA1AB7nmsC3CnjeVL6aAi/T7udanfGgaL70CTJuIHOgdd5DzlX
 d2gOopAoWQwFhyExAXJmoYrddaeja1E0JTsiWqdhTkBQ4B/s62n1KQ6goJo4OSuhcZV6
 n91TZ2cObD+ITxkPzzjJnwI8ATk9vcKtrMR393mSlBA4Jov0XIz762y8kCZ8JVJSKEyM
 c+7zOWHOr9B9ALP2OtpiC08pYoY5JExBtG3jIfMSByn8YfSWZv4ZQ0PcrU8a+8o1twtB
 cGdA==
X-Gm-Message-State: AC+VfDzE9B10qB/5xIdGlADdXv+6uMVEWH9ddRe7RqGgLN48iETpffz0
 ISifWpVVphnmDVurUtML0e8K+jGY8AYmdQ==
X-Google-Smtp-Source: ACHHUZ7oztdCv+8/+nkLI3y/lAuY2mBOQYrlI/l/+Kt+BrfOaHcCQrRWmdAm1xA8InsiAMgcfYNOcQ==
X-Received: by 2002:a81:52cd:0:b0:54f:93ec:e504 with SMTP id
 g196-20020a8152cd000000b0054f93ece504mr1916751ywb.6.1682522135556; 
 Wed, 26 Apr 2023 08:15:35 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 i143-20020a0ddf95000000b0054c02f97d8dsm4249099ywe.91.2023.04.26.08.15.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 08:15:34 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-b95c3b869dcso25949747276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 08:15:34 -0700 (PDT)
X-Received: by 2002:a81:19cf:0:b0:54f:6aa3:f167 with SMTP id
 198-20020a8119cf000000b0054f6aa3f167mr1846583ywz.12.1682522134174; Wed, 26
 Apr 2023 08:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-7-tzimmermann@suse.de>
In-Reply-To: <20230425142846.730-7-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Apr 2023 17:15:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDRB8kyLb39rku2FJ3uKid__O=jmBXJ_85cct1zFkaYA@mail.gmail.com>
Message-ID: <CAMuHMdWDRB8kyLb39rku2FJ3uKid__O=jmBXJ_85cct1zFkaYA@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Apr 25, 2023 at 4:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Implement DRM fbdev helpers for reading and writing framebuffer
> memory with the respective fbdev functions. Removes duplicate
> code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c

> @@ -816,21 +727,10 @@ static ssize_t drm_fb_helper_read_screen_buffer(str=
uct fb_info *info, char __use
>  ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
>                                size_t count, loff_t *ppos)
>  {
> -       return __drm_fb_helper_read(info, buf, count, ppos, drm_fb_helper=
_read_screen_buffer);
> +       return fb_sys_read(info, buf, count, ppos);
>  }
>  EXPORT_SYMBOL(drm_fb_helper_sys_read);

I guess drm_fb_helper_sys_read() can just be removed?

> @@ -849,7 +749,7 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info,=
 const char __user *buf,
>         ssize_t ret;
>         struct drm_rect damage_area;
>
> -       ret =3D __drm_fb_helper_write(info, buf, count, ppos, drm_fb_help=
er_write_screen_buffer);
> +       ret =3D fb_sys_write(info, buf, count, ppos);
>         if (ret <=3D 0)
>                 return ret;
>

drm_fb_helper_sys_write() cannot be removed yet, because it does damage
handling below.  If the fb_ops.fb_sync() callback would be enhanced to pass
a region, drm_fb_helper could implement .fb_sync() instead of .fb_write().

Likewise for the "cfb" (which is a misnomer) variants below.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
