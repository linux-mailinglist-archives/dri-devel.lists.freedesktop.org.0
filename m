Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762FE677E00
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 15:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500D110E49E;
	Mon, 23 Jan 2023 14:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237010E49E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:28:23 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so173629317b3.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 06:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iZK0Fpr9f2TEACSrFPa83bSO8lfj9h12PaXO2n6BQdo=;
 b=OuB6fsV0vvRRzKGdqXWD65VFjGh4raKWN+iurm7RgOtJFI1rmw9GiFZX1HtbrSRmjQ
 +48Tg9sZb7VYR8XJbt5ZZuAFZ0WZjvr52BbXfIHgQB31OW/r4o/tweWQ/RwAWKpLN7Qv
 87rxdl7hXqGx+QOosY0yxbLYQanSjFKk684xTZQcHuMTFXloX2MQHb+Mg5cn82vWVf/F
 7W+LPo7CarpQol6W6gnJMrhqyh8u0tKZZX5VLMS25hWQAnPbLAUobMrfoAksgQctwGaQ
 QBHYaM9vCnYPf1qqkAODBL8bOm0tAu07eIafU1OViqmlLepYs0LyrcjYpfKmwAHtOMd/
 ICyw==
X-Gm-Message-State: AFqh2kpCjfDEecV4wHslpNAk4hyBZEyAoWwuKbv6Mrw3KR/no/cIk/X1
 U/qYCLSXKhhfXENySoN1W9ifaak0dirtpw==
X-Google-Smtp-Source: AMrXdXvZYBavvS30Opv+1BPNMs7eZJsyItYoi7S2W4LHZNgt+LSVH5cSx1QAE4h7lNgrEAUGsVAZMw==
X-Received: by 2002:a0d:e20a:0:b0:4f1:e1cd:6bbb with SMTP id
 l10-20020a0de20a000000b004f1e1cd6bbbmr15999517ywe.31.1674484102593; 
 Mon, 23 Jan 2023 06:28:22 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 d12-20020a05620a240c00b006fcc3858044sm32761465qkn.86.2023.01.23.06.28.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 06:28:22 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id p141so12243133ybg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 06:28:22 -0800 (PST)
X-Received: by 2002:a25:d505:0:b0:7bf:d201:60cb with SMTP id
 r5-20020a25d505000000b007bfd20160cbmr2004334ybe.365.1674484101740; Mon, 23
 Jan 2023 06:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230123104742.227460-5-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20230123104742.227460-5-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2023 15:28:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkenq=2PH-mjodFzAtEa5ss_Lx11B26x6tE2Da3DbmKg@mail.gmail.com>
Message-ID: <CAMuHMdVkenq=2PH-mjodFzAtEa5ss_Lx11B26x6tE2Da3DbmKg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm: rcar-du: lvds: Fix stop sequence
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
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Mon, Jan 23, 2023 at 11:48 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> According to hardware manual, LVDCR0 register must be cleared bit by bit
> when disabling LVDS.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: simplified the code a bit]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch!

> @@ -544,6 +549,27 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>                                      struct drm_bridge_state *old_bridge_state)
>  {
>         struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +       u32 lvdcr0;
> +
> +       lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
> +
> +       lvdcr0 &= ~LVDCR0_LVRES;
> +       rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +
> +       if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> +               lvdcr0 &= ~LVDCR0_LVEN;
> +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +       }
> +
> +       if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
> +               lvdcr0 &= ~LVDCR0_PWD;
> +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +       }
> +
> +       if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
> +               lvdcr0 &= ~LVDCR0_PLLON;
> +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +       }

Please add a comment explaining why there are multiple register writes,
to avoid an over-zealous janitor "optimizing" the code later.

>
>         rcar_lvds_write(lvds, LVDCR0, 0);
>         rcar_lvds_write(lvds, LVDCR1, 0);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
