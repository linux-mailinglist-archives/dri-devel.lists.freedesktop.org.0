Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD276293862
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 11:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7C96EC47;
	Tue, 20 Oct 2020 09:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF946EC32
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 09:43:57 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id l4so1171717ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 02:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjmJglt2xwcPAOj6s6wIPs7tJTEQI0XIzMDh8rDIULM=;
 b=bQtfWoHLewSQ1EtuzRz77TnPdjc1fHtHrdPNKLsEf5oIO8P18UWsWsF3+XqQHIN/Av
 HbjBnlmkMNl6Koi5PL803CrdU77o3CHX/UZGgU1qauDQ23Vu7DgahxYCsdL/ruFuStdE
 npdKyx7vsvprMq8BMmBWLUNDSPXVSpbWuh2be5Pq5cfaCNvkiLyclCeejyu/+aJneRGj
 +OvIR2FiDEEcZJRqGEdZkYziEckjuXX3IeV7T6rzx5f2mpE/37owrV1yrEpxOgfJAc0t
 84D3MBAwQ64a3Ocq887l3H90MnOgqW21vDzqPNEyQcOm5p5+/nXjCCxEnXTiPv82PpD/
 whgw==
X-Gm-Message-State: AOAM532XE9CIlqpxOAkvYYPwqIbew1CzpC8IxciShSwggP23jgpSalhe
 y044eTjcFQUCSLZy7V6st3rarexzT8xwg1+9T+I=
X-Google-Smtp-Source: ABdhPJx527/uggMsMuYrmv6PN6DgycfjmJpdtNouoy3MQrTD53VKY+Wk2w8JJf3MxTZjNXIfyBikVutFASoATcWsGX8=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1061097oti.107.1603187036996; 
 Tue, 20 Oct 2020 02:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2020 11:43:46 +0200
Message-ID: <CAMuHMdUyWJW2_wzdPaGhUbfhjr-_wm+bF+Ry1CymodnrLc_GJg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lvds-codec: Use dev_err_probe for error
 handling
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jonas Karlman <jonas@kwiboo.se>, Chris Paterson <Chris.Paterson2@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 11:37 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> dev_err_probe function simplifies error handling. So use the same in probe
> function wherever possible.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
