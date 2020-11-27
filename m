Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE0E2C616C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 10:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616976EB67;
	Fri, 27 Nov 2020 09:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5A96EB67
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 09:16:00 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t143so5134132oif.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 01:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bL4nt/v+u8bthLLcwo5vWoSSDUj230GtxR+dbDyinE=;
 b=FQ4NmTy4zC0X0/bzpOZM0mrYGRZeidRirQ0Hed0b1XJ3rWH+KzS1OIAR4WJxJgHZpQ
 44Z6s7hEDEKLB6O59DSARDszyZmlExomYvJlDIlSe79UTPj5uT2t5o5Hr+ke1IKMfOhS
 Wm5GGwNmfYYWzEO+UBEAvkXu6kkzKxE/m9O7f0KOUUV3hW4opzfHz1OyfjrCNfQ7Fuda
 PquSY8t8yqHvZIzLEPkrUSav98m3NjSzzTr1povMp7i0I9G7PeE4y2E4A+WvvU8TFpGu
 naRTJeZhHINo+B+7p9uql15Aex1LO9rSLlOBZq9t2T3hLbDujc3Vq03vyLMfzWW15ksA
 dg+A==
X-Gm-Message-State: AOAM530rNoFohGPYK0IOjaXnax90mpOCjw8+/Pl9cuEXX4V4jY+HSsWg
 AoEt1my++OcMrY+RoVpWFeHOOLlTw3LmBAr/ZJQ=
X-Google-Smtp-Source: ABdhPJwwc735j9DU3CQVssDzFK9RFomMYj2kdWdhsc0uJGwQtM3XHiZQkdCwKodyr/1M4ebapYD/57MTPsklQvOavoQ=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr4721709oic.54.1606468560125; 
 Fri, 27 Nov 2020 01:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20201127031752.10371-1-rdunlap@infradead.org>
In-Reply-To: <20201127031752.10371-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Nov 2020 10:15:49 +0100
Message-ID: <CAMuHMdWup4D9A-giF9xDEhva8PPH4Yhg2NHYx3+0q_=Uoi+iRA@mail.gmail.com>
Subject: Re: [PATCH v2] fbdev: aty: SPARC64 requires FB_ATY_CT
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 4:18 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> It looks like SPARC64 requires FB_ATY_CT to build without errors,
> so have FB_ATY select FB_ATY_CT if both SPARC64 and PCI are enabled
> instead of using "default y if SPARC64 && PCI", which is not strong
> enough to prevent build errors.
>
> As it currently is, FB_ATY_CT can be disabled, resulting in build
> errors:
>
> ERROR: modpost: "aty_postdividers" [drivers/video/fbdev/aty/atyfb.ko] undefined!
> ERROR: modpost: "aty_ld_pll_ct" [drivers/video/fbdev/aty/atyfb.ko] undefined!
>
> Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

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
