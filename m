Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC575216E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F2B10E684;
	Thu, 13 Jul 2023 12:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F072B10E684
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 12:44:32 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-57a6df91b1eso5731937b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 05:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689252271; x=1691844271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hz+Lx2AHPiC1tEoYOibbkH4KESx0nTtUs5AmfKyrn3g=;
 b=czeBwxRObkq6sbV5hqos0F/Ozg4CGutva47p+AnySNaNz0QTW0KudlbAYlI4nYXlpk
 8oaRSLQg7cZUCImfKB4Wfi1l9lTNWqjEvhhS5uF/5NjYNzVSDANzgfF/veyZWq1s+unJ
 5Ol1yLmCrLL0IPxBR5KLkYyMA/r0RQgEhclpn9dUoR/RnSBwPCcIuHwkv/b8AAFbA6y5
 0fKLmFO+cJzG8W2ccKjovmZXuLaH8TKy7rZcx/rQMFoiy6eqKQ/lXq66nbmbqrMgo7RA
 ORUPRWVFcgW+vVgxvqwPbNMdd9eOT19U80geDLhquAtjL+RlElJKOoI8sGfBVjFEagbz
 CEBA==
X-Gm-Message-State: ABy/qLb849PLwsT5ue2blMAJezHVRC93rqiEyQdc4+2O2Z2tWnU9qhHD
 dvBffSAYeI8IgsLGUVMDUYjM8+sqsJh+/Nbc
X-Google-Smtp-Source: APBJJlEqgDhfW2cg1r84iXofEKAa40tD1w4iVKx71hNj11b854dTKdBO0/7c6AgALCzP2hLCDeLhkg==
X-Received: by 2002:a0d:d4c6:0:b0:580:bd0d:809f with SMTP id
 w189-20020a0dd4c6000000b00580bd0d809fmr1777750ywd.18.1689252271515; 
 Thu, 13 Jul 2023 05:44:31 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 y64-20020a817d43000000b0056cd44f9f23sm1723434ywc.63.2023.07.13.05.44.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 05:44:30 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-577412111f0so5867277b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 05:44:30 -0700 (PDT)
X-Received: by 2002:a0d:cb41:0:b0:56f:fffc:56ff with SMTP id
 n62-20020a0dcb41000000b0056ffffc56ffmr1622296ywd.42.1689252270339; Thu, 13
 Jul 2023 05:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-5-javierm@redhat.com>
In-Reply-To: <20230609170941.1150941-5-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2023 14:44:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXhi52KfpCmnum+9t74UWP+AOLE95xQU6VV6Nz=VHk1Q@mail.gmail.com>
Message-ID: <CAMuHMdVXhi52KfpCmnum+9t74UWP+AOLE95xQU6VV6Nz=VHk1Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/ssd130x: Don't allocate buffers on each plane
 update
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jun 9, 2023 at 7:09=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The resolutions for these panels are fixed and defined in the Device Tree=
,
> so there's no point to allocate the buffers on each plane update and that
> can just be done once.
>
> Let's do the allocation and free on the encoder enable and disable helper=
s
> since that's where others initialization and teardown operations are done=
.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>
> (no changes since v1)

Thanks for your patch, which is now commit 49d7d581ceaf4cf8
("drm/ssd130x: Don't allocate buffers on each plane update") in
drm-misc/for-linux-next.

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -701,14 +709,22 @@ static void ssd130x_encoder_helper_atomic_enable(st=
ruct drm_encoder *encoder,
>                 return;
>
>         ret =3D ssd130x_init(ssd130x);
> -       if (ret) {
> -               ssd130x_power_off(ssd130x);
> -               return;
> -       }
> +       if (ret)
> +               goto power_off;
> +
> +       ret =3D ssd130x_buf_alloc(ssd130x);

This appears to be too late, causing a NULL pointer dereference:

[   59.302761] [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
[   59.304231] [<c0304200>]
ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
[   59.305716] [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c

Bailing out from ssd130x_update_rect() when data_array is still NULL
fixes that.

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
