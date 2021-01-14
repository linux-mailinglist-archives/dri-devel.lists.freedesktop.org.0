Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8952F5E37
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 11:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31BA6E188;
	Thu, 14 Jan 2021 10:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9686E188
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 10:01:02 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id v5so3081250qtv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 02:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fg4c8daHi9IS1OBRtJJqGNfCiSJcKpk93Xq2lJmqBFc=;
 b=ihAvoaRSRbOB4m0X9Ts263+hJhBoG4trmsDxtEhzILVgu2MRdrbDdDzUkYLRH/+C94
 8WVx34Pn7Vm6GDppWPQzC8bK77T637iUH5JlMhS4kZNaNoWRgHnzTSKeOtLFlX2JCEZG
 WaLP1uRGbaLFBBFkd9Re+Os2pxmvosePXkQpk9lPKWRhdjC9enKmsTrrujBgsobysz3T
 IFyKRYFTAoOQfAtOvEj+xNWQZRrUiCNSB4wb8aclapLH8nihH2iVfF4W/Jovjdvny2HA
 HC6Y+HoHilXpmzV77bZgSkXjTrYGuyHokHWx0GKB5x0n+SQ3+BW6Tw5tF542iyjOMgZV
 3q5A==
X-Gm-Message-State: AOAM531L6f3xwM5E8ewWJd+Bd6m64W+VmBtWaE5WAUpWov/ksMxGL8M0
 eXahVll0Mstyr7uoQd4sOpvZSAhiYoEtn1AUG6C8qSCYcCQ=
X-Google-Smtp-Source: ABdhPJyR+AhR8sp9G7uVthpCJHpa/v8WxRXJWIRdWVpG1dj+0MuATWJAQ6QiGZVFvalcqmcfeXygNUukuKB0ZZGDYdE=
X-Received: by 2002:ac8:6f07:: with SMTP id g7mr6273597qtv.308.1610618461819; 
 Thu, 14 Jan 2021 02:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Jan 2021 11:00:50 +0100
Message-ID: <CAMuHMdVwjWwcWR45BTAjL5Lp66s5coc_Jp1EcBF1ad7MJpY0Og@mail.gmail.com>
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

On Wed, Jan 13, 2021 at 6:02 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> The encoder allocation was converted to a DRM managed resource at the
> same time as the addition of a new helper drmm_encoder_alloc() which
> simplifies the same process.
>
> Convert the custom drm managed resource allocation of the encoder
> with the helper to simplify the implementation, and prevent hitting a
> WARN_ON() due to the handling the drm_encoder_init() call directly
> without registering a .destroy() function op.
>
> Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
As in "the WARNING from drm_encoder_init() is gone".

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
