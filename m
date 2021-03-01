Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC8327C22
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 11:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E6A6E581;
	Mon,  1 Mar 2021 10:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD396E581
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 10:30:31 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id i21so15256295oii.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 02:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Rz2v/U2nVOok1bv0Vmx4Yapjfx0RV8rEkl36cbA/54=;
 b=dF02T1DaTyScVE6AugVvJfV1bE3EMrFW/HbL2sBmXLC0Lw4+314n7PuPNqEU7hJXfv
 rYPr21o26kNHW2aEpt9mBv2qXia0UIVKpFgkIxGguHy4XG6VmLnitMbTPjmA4XMfxGNZ
 XIuSUMc+afrGS/i0jmmRHyDjLe8WjWhiGaylE5WoC2i/xls6qd05UFXRV17xN0ns4BHV
 SN9J+Ho/0Zdor86VL0P9tTxER245Yns4e8jB8EGXtefgib6lxRxJXNWBfWn3LFJda1eD
 Pz+YgqGGvqp2amUBBEMZnP4UP63q4biZXttokOOJYwAT6b+mom+ziJUOzIDwhn5Hn+lV
 uaAg==
X-Gm-Message-State: AOAM530I4n1jdWebHeVMKNl0Z4gGVjarkDRRShwuO/EsahUFW7SbHTa1
 1DJlC7in7wUk5xAz3JbxQ3fCCcjQsNuylCeBmEqK1CUr
X-Google-Smtp-Source: ABdhPJxps7w7g2gNnNEepZQYsGT0MTyaHe2etwgYRDOpqOEje9uRa9Qlj9u/ysUYg1TXeKSDqi3xSFEtTeipfl3g3IQ=
X-Received: by 2002:a54:4007:: with SMTP id x7mr11367286oie.87.1614594630547; 
 Mon, 01 Mar 2021 02:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdVwjWwcWR45BTAjL5Lp66s5coc_Jp1EcBF1ad7MJpY0Og@mail.gmail.com>
In-Reply-To: <CAMuHMdVwjWwcWR45BTAjL5Lp66s5coc_Jp1EcBF1ad7MJpY0Og@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Mar 2021 11:30:18 +0100
Message-ID: <CAMuHMdV0fEsDWUok=MaxnTXxngMWa5PCEHHCUoBYrqurUEf=1Q@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Use drmm_encoder_alloc() to manage encoder
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 11:00 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Jan 13, 2021 at 6:02 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> > The encoder allocation was converted to a DRM managed resource at the
> > same time as the addition of a new helper drmm_encoder_alloc() which
> > simplifies the same process.
> >
> > Convert the custom drm managed resource allocation of the encoder
> > with the helper to simplify the implementation, and prevent hitting a
> > WARN_ON() due to the handling the drm_encoder_init() call directly
> > without registering a .destroy() function op.
> >
> > Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> As in "the WARNING from drm_encoder_init() is gone".

JFYI, the WARNING is now in v5.12-rc1, the fix isn't.

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
