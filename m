Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44062DB04A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 16:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05A26E3EB;
	Tue, 15 Dec 2020 15:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699CB6E3EB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:38 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id x13so14732364oic.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 07:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gIZO24TPPjWTsJsVecEgyMhh7DdXvaXL1GWXuFZpwE4=;
 b=EByOBO5TymkBkm/Bwejv5g5Uur+MOlBMnecxOBb8OiSqRevW/DhJ5geTRzFUKp1LfV
 XgFR8QDv7etEZ9CvdtwTzuCnsNcebUN2tVM7IVCrKcQt4tWGGpbcmGGdoJ7Ip56jtlbc
 ohs4wQK9+TanUBQ6S8v+a7jjmv6vDL5mz71KgrZT6lQFLS9QkvUcSkv5UCtxr/JZIrPO
 L/Y98CIrMabRzlUdLF+kRC1a4qFXEDhfP7DRwst4yEJQZkKOrkkBHfW4ym4ICpbF0LLw
 VyTFk22uYJuXZlvNNonuNqev+dw4+6/pbLJnc+isRsxlkORsaBByBupZpOVtGYUeIyHV
 PiDA==
X-Gm-Message-State: AOAM530r3Fh7Fu4zh9FsUTnv5gDxfp9gkAv0oYMLMTvdKZvOIpu/84Xd
 alw9cFvXfSLjdmEw4rAS+o3orxqrvAQE35IMkRs=
X-Google-Smtp-Source: ABdhPJxo5bSpyE8abkGY7WpMfJeGK+a181TSZyiJmBo9NazEbTJJ1d7roy/aDMEWefttB9RvuShC1QqvAoo5BGzS0Sk=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr21993784oib.54.1608046957754; 
 Tue, 15 Dec 2020 07:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-5-laurent.pinchart+renesas@ideasonboard.com>
 <d1113ad9-ff19-884d-90c4-0074c983f193@ideasonboard.com>
 <X9eSKM7KXms/4hoU@pendragon.ideasonboard.com>
In-Reply-To: <X9eSKM7KXms/4hoU@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Dec 2020 16:42:26 +0100
Message-ID: <CAMuHMdVZELrczzVJwt6SRLu4YDJYyR6kWK26aG9NZHWM8bPRAQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm: rcar-du: Use DRM-managed allocation for VSP
 planes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Dec 14, 2020 at 5:28 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Dec 14, 2020 at 04:20:17PM +0000, Kieran Bingham wrote:
> > On 04/12/2020 22:01, Laurent Pinchart wrote:
> > > devm_kcalloc() is the wrong API to allocate planes, as the lifetime of
> > > the planes is tied to the DRM device, not the device to driver
> > > binding. drmm_kcalloc() isn't a good option either, as it would result
> > > in the planes being freed before being unregistered during the managed
> > > cleanup of the DRM objects. Use a plain kcalloc(), and cleanup the
> > > planes and free the memory in the existing rcar_du_vsp_cleanup()
> > > handler.
> >
> > Managed memory always seems to hurt - which is a shame, because it
> > should be better throughout.
> >
> > It's like we need a way to arbitrarily specify the lifetimes of objects
> > correctly against another object... without being tied to a dev ...
>
> I've been saying for years that devm_kzalloc() is a major regression.
> We've traded a memory leak for a use-after-free. The function has its
> use cases, there are objects that need to match the lifetime of the
> binding between a device and its driver, but that's a small minority.

https://en.wikipedia.org/wiki/The_law_of_conservation_of_misery

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
