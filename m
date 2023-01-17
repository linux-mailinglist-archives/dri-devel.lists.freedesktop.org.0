Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E87A66E303
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1142610E57B;
	Tue, 17 Jan 2023 16:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B900310E57B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:04:43 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 cc13-20020a05683061cd00b00684b8cf2f4dso9879589otb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrhkpCVAn3MrYp+d13kVpSMEw4mJviAxLngnFSOJHso=;
 b=2pz3rG2kcw8Yajg2J7m1mChflkboLj/LIgJ++J93VndgB1393rD2Iv4CWOm4Pfura2
 ONEtscbgm2NHKeQLKNMtPOjbawDwQ1MbujRGOmXASozkcOUbqm+zGb24fuUO+1bYFPJa
 1CPaxRT/pI2WGWcnvRfCrNlH5MDXaJfK56EJW/tHrn7MCMn8dJscpZsamuoik6bmLTP5
 RnybEKQNrD8y70G+ZrSRAX0oWMp/KaoYHV0b9MQ1tfmuTKF9gasDC6pe4FzZ4eoJtcKl
 5MQr9rt3f5fjeb3VGNmXRIyaBv5GqcNpf3apoJH/FgrSo0M/6d4ypTLmE6Fgzcfp7HQA
 nfnQ==
X-Gm-Message-State: AFqh2krIQdxWjNpNHblx4NWdpe5zu0pQlIRcr5OXTkef0h7TJg2NElSV
 KNY4a1u8c3vYznShHCZpQt3dYH721z51ww==
X-Google-Smtp-Source: AMrXdXv5TUgFaQ1TLhLhq0u5AsmdzD9JcZn+eY5Qhn6p+cnVyIje03DWfpHxnv7cjt6rgsgpeCym3w==
X-Received: by 2002:a9d:7b47:0:b0:684:a65c:66f with SMTP id
 f7-20020a9d7b47000000b00684a65c066fmr11748904oto.37.1673971482305; 
 Tue, 17 Jan 2023 08:04:42 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05620a290400b007069fde14a6sm1235192qkp.25.2023.01.17.08.04.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:04:41 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id e202so11232149ybh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:04:41 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr324695ybo.543.1673971480927; Tue, 17 Jan
 2023 08:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 17:04:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuUV38tVsZ5qoJEq5OF-0RZ6gnCAFvyt=FHTXUy_PybQ@mail.gmail.com>
Message-ID: <CAMuHMdUuUV38tVsZ5qoJEq5OF-0RZ6gnCAFvyt=FHTXUy_PybQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: rcar-du: lvds: Add reset control
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

On Tue, Jan 17, 2023 at 2:54 PM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Reset LVDS using the reset control as CPG reset/release is required in
> H/W manual sequence.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: Rewrite the patch description]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c

> @@ -844,6 +853,12 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 return ret;
>
> +       lvds->rstc = devm_reset_control_get(&pdev->dev, NULL);

devm_reset_control_get_exclusive()

> +       if (IS_ERR(lvds->rstc)) {
> +               dev_err(&pdev->dev, "failed to get cpg reset\n");
> +               return PTR_ERR(lvds->rstc);

return dev_err_probe(...);

> +       }
> +
>         drm_bridge_add(&lvds->bridge);
>
>         return 0;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
