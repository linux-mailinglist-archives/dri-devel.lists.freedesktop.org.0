Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB6791217
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8457110E2B3;
	Mon,  4 Sep 2023 07:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B4F10E2B3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:28:02 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-59205f26e47so10282447b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 00:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693812481; x=1694417281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sk7cz1JPGvo6NDX2t2vcHO0NvdY/bHCgp/ObJ6ZQiVg=;
 b=CzY6zWV6097OuPFRnp+zb1koBc6obJsqClJQeZSvNNdmRXN2qjN7dA3c4mcOkAyI6N
 Eyw9kw7ekxmg9hjLWViNnOkX1DzmHUSHn3CYPrahUuTrNgd8EaacFWmLnjYWNDUKzRBb
 Bna8WndRZk2JlnwI4BbzLd5u7s6nqjA5XOmXGdu4vk53XYtkReNypxcRCK/fw8IaBbUy
 1AqjgACLe76nov4z1hx8T2bSyzSL2AdtGZc3Iq6YENn1bfU1GTIeNPTONdRl5y4rmgxj
 oquEr7Nw0L2y4PD0Ao4cM5FEMyu5/vJv7TKeXDBSp4ichVEohehwF9uYyx5j0wN7zlO6
 At/g==
X-Gm-Message-State: AOJu0YzvQsNVIHHa+n9E8rr4cdF7KgEsS9My1DbjMbuS/tn9qUpgkbkk
 kC+zTbMMX1cUvMFXSU6/EkgJHzvgJ+2sVQ==
X-Google-Smtp-Source: AGHT+IFTD5UoTCzqo7BCLJXV+C3r0q1nJ3z0p+oe94YP+yryYqrPSfQnLEVz/L4RMaFHB7Hi3X+oMg==
X-Received: by 2002:a81:5212:0:b0:589:8b55:f7f7 with SMTP id
 g18-20020a815212000000b005898b55f7f7mr10150888ywb.39.1693812480981; 
 Mon, 04 Sep 2023 00:28:00 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 b123-20020a0df281000000b00592236855cesm2486000ywf.61.2023.09.04.00.28.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 00:28:00 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-59205f26e47so10282187b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 00:28:00 -0700 (PDT)
X-Received: by 2002:a25:26cd:0:b0:d7a:feb4:90f0 with SMTP id
 m196-20020a2526cd000000b00d7afeb490f0mr10360870ybm.32.1693812479852; Mon, 04
 Sep 2023 00:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid>
In-Reply-To: <20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Sep 2023 09:27:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOB7d-KE3F7aeZvVimNuy_U30uk=PND7=tWmPzCd7_eg@mail.gmail.com>
Message-ID: <CAMuHMdWOB7d-KE3F7aeZvVimNuy_U30uk=PND7=tWmPzCd7_eg@mail.gmail.com>
Subject: Re: [RFT PATCH 15/15] drm/renesas/shmobile: Call
 drm_helper_force_disable_all() at shutdown/remove time
To: Douglas Anderson <dianders@chromium.org>
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
Cc: paul@crapouillou.net, tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

On Sat, Sep 2, 2023 at 1:42=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown(), or in this case the
> non-atomic equivalent drm_helper_force_disable_all(), at system
> shutdown time and at driver remove time. This is important because
> drm_helper_force_disable_all() will cause panels to get disabled
> cleanly which may be important for their power sequencing. Future
> changes will remove any custom powering off in individual panel
> drivers so the DRM drivers need to start getting this right.
>
> The fact that we should call drm_atomic_helper_shutdown(), or in this
> case the non-atomic equivalent drm_helper_force_disable_all(), in the
> case of OS shutdown/restart comes straight out of the kernel doc
> "driver instance overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -179,12 +180,20 @@ static int shmob_drm_remove(struct platform_device =
*pdev)
>
>         drm_dev_unregister(ddev);
>         drm_kms_helper_poll_fini(ddev);
> +       drm_helper_force_disable_all(ddev);

After "[PATCH v3 36/41] drm: renesas: shmobile: Atomic conversion part
1"[1], this function will already call drm_atomic_helper_shutdown()...

>         free_irq(sdev->irq, ddev);
>         drm_dev_put(ddev);
>
>         return 0;
>  }
>
> +static void shmob_drm_shutdown(struct platform_device *pdev)
> +{
> +       struct shmob_drm_device *sdev =3D platform_get_drvdata(pdev);
> +
> +       drm_helper_force_disable_all(sdev->ddev);

... and this should be replaced by a call to drm_atomic_helper_shutdown().

[1] https://lore.kernel.org/dri-devel/fd7a6702490bd431f314d6591551bb39e77e3=
304.1692178020.git.geert+renesas@glider.be

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
