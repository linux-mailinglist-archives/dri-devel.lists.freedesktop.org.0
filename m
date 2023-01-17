Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C7866E322
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C0310E582;
	Tue, 17 Jan 2023 16:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A5F10E594
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:11:22 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-4c131bede4bso428997777b3.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p3UAyVMyM/yDHTatNEnR18gPOWu6z3DIA5bneSXBq48=;
 b=sfNI3rlc3mRk4iO6yPTilXnw/MviJmlfMICRPSDsNmRpHKilNczSj66gK/AxC/lq2U
 l0cccxliUOlDiKyzfLtuIBYtFyqDsBuVL5MDtaXhZ/E7uo2vSmE+ewUdE7O/v+xQid39
 AVWZzgKvWXYu0CXeBDSJkTYYZL3lJY3V7nL+GCfPXQXK3sQDO1EUOsA+RbT/3FnQs9Rf
 Qcs226jMB3X6qw928I5Kojgp4OwVNiddDWB6A+xNWrYJD04+dS+73t59rA/oWYtxht7/
 0HdEcvfx9Y4hFsp+t6UQ0S765X068lXfVj24Lsyzb6C+Dcwy/Rwerm6ca9VcxWZUbuym
 dHVA==
X-Gm-Message-State: AFqh2kpQmqpG2YPwf7RC3Der3MfyX9Ah9a7iRV6FBDe+Gw4sN1r2kGBr
 jBDhzhjr2JPzj0IzcwsZXkAMAIhhvSJ2ZA==
X-Google-Smtp-Source: AMrXdXuRUss278Uix/TuMqyOnyBJ1mMefHbyT20bZGZ527duMzxfJSvdyOBhQnc9QibN7g1mC5JlIw==
X-Received: by 2002:a05:7500:c42:b0:ef:e73c:a26c with SMTP id
 fz2-20020a0575000c4200b000efe73ca26cmr1447488gab.62.1673971881606; 
 Tue, 17 Jan 2023 08:11:21 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 q44-20020a05620a2a6c00b006fc9fe67e34sm6299639qkp.81.2023.01.17.08.11.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:11:21 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id t15so34639734ybq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:11:21 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr398785ybg.202.1673971881009; Tue, 17
 Jan 2023 08:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-5-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20230117135154.387208-5-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 17:11:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+Zh3cDm4h8m7xYOee+6O7RLTdUSmR+gnL_ugGzsmTiQ@mail.gmail.com>
Message-ID: <CAMuHMdU+Zh3cDm4h8m7xYOee+6O7RLTdUSmR+gnL_ugGzsmTiQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm: rcar-du: Add quirk for H3 ES1 pclk WA
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Tue, Jan 17, 2023 at 2:54 PM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> rcar_du_crtc.c does a soc_device_match() in
> rcar_du_crtc_set_display_timing() to find out if the SoC is H3 ES1, and
> if so, apply a WA.
>
> We will need another H3 ES1 check in the following patch, so rather than
> adding more soc_device_match() calls, let's add a rcar_du_device_info
> entry for the ES1, and a quirk flag,
> RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY, for the WA.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c

> @@ -681,7 +724,13 @@ static int rcar_du_probe(struct platform_device *pdev)
>                 return PTR_ERR(rcdu);
>
>         rcdu->dev = &pdev->dev;
> -       rcdu->info = of_device_get_match_data(rcdu->dev);

No need to remove this line...

> +
> +       soc_attr = soc_device_match(rcar_du_soc_table);
> +       if (soc_attr)
> +               rcdu->info = soc_attr->data;
> +
> +       if (!rcdu->info)
> +               rcdu->info = of_device_get_match_data(rcdu->dev);

... and no need to add these two lines.
The idiom is to set rcdu->info based on of_device_get_match_data()
first, and override based on of_device_get_match_data() when needed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
