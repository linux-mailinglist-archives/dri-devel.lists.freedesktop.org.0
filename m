Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9150F4214F4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 19:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035946E1D7;
	Mon,  4 Oct 2021 17:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8E6EA7D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 17:13:59 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id y14so6502656vsm.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 10:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qDIVmR/qFuDDiFyWNf3y3niN15+lX6TIgv0kekHzpE8=;
 b=km0ux1fzkBPrgXmD0dk5k1Z2q20lUPySFVSoXs9vOMD8Q/PJSxVKq/RzuzOfrad6QE
 A3+sH5KgVwOhq70Fp7yk8CSGF48xoQbxwkr+8eHNXObFnQxxBT4bcL+vzzXeKAEEHWlp
 DOLbbWxV82YQRPQM0h8pyywOoGAOaMkIJb3YHbKPNxWD+4eqfLadK63fp3kboiX7ZNdQ
 5b2LpbFW/3XpGZOwk4sdfMOLZ0DCg6k8x+Ywmgu/6O5QRMR0fglMmBgVtTOwLzWFGkCX
 Q9e1plVlNv52ZRafb0jTXflSoNCchLwhSVHDdevTIcrqakY8hm0zcrVB8KbSLO0aiQQG
 Lg0g==
X-Gm-Message-State: AOAM531H+BbiRL2RJHIcl4bipNCCdga0weE1YaaOwtOS5x7ZZMDnQYBu
 spDMobBaY2MOd8QHBrYG6us1FoXtOGCYDB0vJMM=
X-Google-Smtp-Source: ABdhPJyfd/P5arwYcERnUkJxEhSvSRTgfpXDmvSyUgqTuMJgZeXYqwzGlSFUN1nE+bCjMj2ewLylD/0E6wTHQevyZgk=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr13878232vss.35.1633367638697; 
 Mon, 04 Oct 2021 10:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <20210914132020.v5.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
 <CAMuHMdWy+aASNevg8nc9LTvR9QNrGYZQnB3sYYLDRfEU1w_idg@mail.gmail.com>
 <CAD=FV=W07iZigvNaxv1WodhQZVm8hD-1NxTuBuapJYifi6ROng@mail.gmail.com>
In-Reply-To: <CAD=FV=W07iZigvNaxv1WodhQZVm8hD-1NxTuBuapJYifi6ROng@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Oct 2021 19:13:47 +0200
Message-ID: <CAMuHMdVK9p3J762+TQM9ogS5YE2QdJ5fiXKOQo7mXy8TwzCeew@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] drm/edid: Break out reading block 0 of the EDID
To: Doug Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Linus W <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Mon, Oct 4, 2021 at 6:26 PM Doug Anderson <dianders@chromium.org> wrote:
> On Mon, Oct 4, 2021 at 8:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > -       if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
> > > +       edid = (u8 *)drm_do_get_edid_base_block(get_edid_block, data,
> > > +                                               &connector->edid_corrupt,
> > > +                                               &connector->null_edid_counter);
> > > +       if (IS_ERR_OR_NULL(edid)) {
> > > +               if (IS_ERR(edid))
> >
> > So edid is an error code, not a valid pointer...
> >
> > > +                       connector_bad_edid(connector, edid, 1);
> >
> > ... while connector_bad_edid() expects edid to be a valid pointer,
> > causing a crash:
> >
> > Unable to handle kernel NULL pointer dereference at virtual address
>
> Sigh. Thanks for the report and analysis. I guess I don't have any
> displays reporting invalid EDIDs to test with. Hopefully this will
> help:

It doesn't happen all the time.  Looks like my EDID is only invalid after
a reset needed to resolve an s2ram crash in the adv7511 driver...

> https://lore.kernel.org/r/20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid/

Thanks for the quick fix!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
