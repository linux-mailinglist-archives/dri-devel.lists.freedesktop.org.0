Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9631BA5DC4F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B886710E774;
	Wed, 12 Mar 2025 12:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rak7JrD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7C410E774
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 12:07:14 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-6003d977ab7so3556112eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 05:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741781231; x=1742386031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nLRr+bNHiMzLvRNCeX2JJ11dD6Zw5jl68ogjYvLiLs=;
 b=Rak7JrD3WA6mLnFy9IQHoWVoh8yWY4ou8n0gEn0SNkGJjZyPvel3N5mnqUpy1d7PGb
 dsOIHXN+JbEwXMWwUy7LE0yyWNYQOLJ8CdXqgNVo6jWkwx7v78DDh4ii3Zm5g+h4SBKz
 F3fk4Q1yEz3flP6RfIUhwaDL3Bnifo/V4OhyGbeC2NPsRvOq6em6q8Wa+hps0n1jGTuy
 E+c5NoqrJF2K8q1wqoKMEb0gvbSn2U1YCEf/hjz4fiqAZZWbtp+spU3UYT9xjR8GWtF5
 dfUlOAIdYz1rDZ6j4IO0oskhLQRb/LhshQ2j1s3vQmWKsP42HoC5EXCdtC/Enrc9LE6D
 +csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741781231; x=1742386031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nLRr+bNHiMzLvRNCeX2JJ11dD6Zw5jl68ogjYvLiLs=;
 b=pmvLqeQ11b8P+SaEOCBFbiEKpwnR6ZtmViAysFVj0JCYKqXd3QD0AZ20PbgRNcaMHu
 8/OqrY/TgTBPMjW3uZW3iVDfMCBctKOl0kgy2luprV2auRAB30N06VlYT8RcyX64G5hC
 z7c3HdHwYd+Q1IK8FsG/91+Cc+DobBFaRaJvn02H43Aqo9BQWIuyxSxmgxDw99RMEq9q
 m6PyFSCZAJRr/ICLYL4IXA/XPZWU7zY7PRBTJymUoBLPXN/OdpVRj6FVdz85IZHE4T0d
 dpLXrSygkmUvaABY/WSKk5bGe8CZhucd3USq0cwltVWphArOzGzev+/tytHSJjEZLUAs
 imIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW27RVW5i41UzVCzl/UD1IRv1/cOFl2iBRaVGjJR/8dVCzW8QhAnIBRS5t5QWF8PtSJcg2ESQetqe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyshsuXD7kGSEApioUO7t2QPGRbKlMuUtMJTuxSUjsg0etsTpVf
 GnLH1WBEWKPz+RC9s+ZDUeZ94BAru5fpx9iJxq5USSW7MCt3d2Iu0cIWinRaZny90f4xn/UXYoH
 SbEHfJJRvw5CVwTCL9FS91D6SKbY=
X-Gm-Gg: ASbGnctWgcHCt/AgR/Qlf0cEL+8TUgy5aPj/I+zKYexinO/Afi0c40Oyt0JYT+yZwgz
 hKXS6JJnCx8rl5hZhG3tJYnpbdZ81CIRxGIaN3U5128PjGvCH0xM75qK332I57Qt0BA7VfX3Nef
 OBk15DuH+4g4oATbMITMJq3i2ni+GMp9+jbPw=
X-Google-Smtp-Source: AGHT+IGiGf2cXZTpeoUlfqOSWCKpd2NnnUUljWBCp6YCgN7s2df9qvPgqD59YXecrDh0aiZc+JgeBO1BrzAIMvSja7o=
X-Received: by 2002:a05:6820:1b06:b0:601:bf1b:c63f with SMTP id
 006d021491bc7-601bf1bc73bmr4744938eaf.1.1741781230830; Wed, 12 Mar 2025
 05:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250303145604.62962-1-tzimmermann@suse.de>
 <20250303145604.62962-3-tzimmermann@suse.de>
In-Reply-To: <20250303145604.62962-3-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 12 Mar 2025 13:07:00 +0100
X-Gm-Features: AQ5f1JpsBwQ0hUR2Hk5mTfZVyMfltLB3u27YraOwleJ-WJM_YzhcWGBJJaqk73c
Message-ID: <CAMeQTsZzPOTpTO=CDdTDpehfJAVKnz_h_j-Lyb9KXNQZr=+hyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/udl: Switch poll helpers to managed cleanup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, simona@ffwll.ch, jfalempe@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 sean@poorly.run, dri-devel@lists.freedesktop.org
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

On Mon, Mar 3, 2025 at 4:00=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Call drmm_kms_helper_poll_init() to set up managed cleanup for
> connector polling.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/udl/udl_drv.c     | 1 -
>  drivers/gpu/drm/udl/udl_main.c    | 2 --
>  drivers/gpu/drm/udl/udl_modeset.c | 1 +
>  3 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.=
c
> index 7e7d704be0c0..29f34b4a732d 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -128,7 +128,6 @@ static void udl_usb_disconnect(struct usb_interface *=
interface)
>         struct drm_device *dev =3D usb_get_intfdata(interface);
>
>         drm_dev_unplug(dev);
> -       drm_kms_helper_poll_fini(dev);
>         udl_drop_usb(dev);
>  }
>
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_mai=
n.c
> index 3ebe2ce55dfd..a76b8f57917e 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -336,8 +336,6 @@ int udl_init(struct udl_device *udl)
>         if (ret)
>                 goto err;
>
> -       drm_kms_helper_poll_init(dev);
> -
>         return 0;
>
>  err:
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_=
modeset.c
> index bbb04f98886a..3b65e93ea0ae 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -535,6 +535,7 @@ int udl_modeset_init(struct drm_device *dev)
>                 return ret;
>
>         drm_mode_config_reset(dev);
> +       drmm_kms_helper_poll_init(dev);
>
>         return 0;
>  }
> --
> 2.48.1
>
