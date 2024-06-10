Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2768E901B4A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 08:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D5210E2DD;
	Mon, 10 Jun 2024 06:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YvMmvK0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8087F10E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 06:33:23 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-80b8a6ef2fbso366180241.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718001202; x=1718606002; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WoxL7sxR5fVE2wpf25zkRX1keP/l47DLSwfYmo+1E88=;
 b=YvMmvK0K9xScucXYbfzt1JdCC27S5Oe2lfcREUQ9ueTk9MZsXoTpGnRJk9vR8EjidX
 VFb1rht+jVzUB7qT32pp0gwILA2L612dkeCiV8VtzwdmwfRjQjOTLWXwTt8HtGJ/hQ8+
 GJF67ZczjDoJ2+37ayriZao/jYrsderHtzV2Z/whEmdRiEONOJtmkLlI8mX0ms7XvrYN
 szQWDFeUOVS75K4xO6LZVYu7Pi1MtOvLeTI1A9377j/9dR+G11xwViaJefwb0rDH13WC
 lp7Sf887qMSVZCRS1OvY73fRJz5El4SHZeD2dxi3DNNJR8N+vYeM8CInecYJrDUKeir4
 Qfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718001202; x=1718606002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WoxL7sxR5fVE2wpf25zkRX1keP/l47DLSwfYmo+1E88=;
 b=exHZnSsiyUvL62WCaIHWvPXAbAku6JBO5UiMC+f3YT87UOEzFf9CSq/RuzN4OPTMqm
 lIWhSMn8+qptuM+aFhlZKPi5fxE8jcPxXHXFT3vLdSinyixqBQn+SATob/PltbUdzjob
 e6rf/vVftegZ3viBYONrjAgs0bo1v2yi4QBRwsMDnoQUrdT5mW6gMR3HEdfgqSzikt0P
 fIM3B61AYveG+ZXr3KeA5oIRCxRv3w/nS2ip75ry8ZD6vYOvvo58LTwmCq3uB5SmzyOx
 h4jLSOTXAzXVJi1TPU5JSORQL7YgluXeWDFiiQ4zNwfBmKeBKP13W+p6j1Q+OEDaO9xe
 fyPQ==
X-Gm-Message-State: AOJu0Yyb3zv41LAB8Zc/cloXjkVoOBjk/PuXUImdj0/VYgevhEeBf9lm
 /W2vPEy0TPango1m39pmFSGWuNbES+59z3zta1/TluLJZO+UAWSNvyOKgGAGnvczM9upzln9LHQ
 A2l+gctZOyc+ihqeopAKgn2g3oIk=
X-Google-Smtp-Source: AGHT+IE6WwuGJf/J6Plpzhz9jA+n7W7A3UHb9PzPwtd8XmJu4EiIUfbwUKnVPUxp+1oRqDCPDYvJIUTzr/73LsCncVM=
X-Received: by 2002:a05:6122:c9:b0:4e4:ea87:ec72 with SMTP id
 71dfb90a1353d-4eb562bbb38mr6632138e0c.11.1718001202243; Sun, 09 Jun 2024
 23:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240530100154.317683-1-jani.nikula@intel.com>
In-Reply-To: <20240530100154.317683-1-jani.nikula@intel.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Jun 2024 15:32:45 +0900
Message-ID: <CAAQKjZPWT7=JircaiksP3Wg_1oKRr1xDkznQ1RSoe4jmn12fUw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/exynos/vidi: fix memory leak in .get_modes()
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, 
 kyungmin.park@samsung.com, stable@vger.kernel.org
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

Hi Jani Nikula,

The patch(1/4) has been applied to the -fixes branch, and the other
three patches(2/4 ~ 4/4) have been applied to the -next branch.

Thanks,
Inki Dae

2024=EB=85=84 5=EC=9B=94 30=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 7:02, J=
ani Nikula <jani.nikula@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The duplicated EDID is never freed. Fix it.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/e=
xynos/exynos_drm_vidi.c
> index fab135308b70..11a720fef32b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -309,6 +309,7 @@ static int vidi_get_modes(struct drm_connector *conne=
ctor)
>         struct vidi_context *ctx =3D ctx_from_connector(connector);
>         struct edid *edid;
>         int edid_len;
> +       int count;
>
>         /*
>          * the edid data comes from user side and it would be set
> @@ -328,7 +329,11 @@ static int vidi_get_modes(struct drm_connector *conn=
ector)
>
>         drm_connector_update_edid_property(connector, edid);
>
> -       return drm_add_edid_modes(connector, edid);
> +       count =3D drm_add_edid_modes(connector, edid);
> +
> +       kfree(edid);
> +
> +       return count;
>  }
>
>  static const struct drm_connector_helper_funcs vidi_connector_helper_fun=
cs =3D {
> --
> 2.39.2
>
>
