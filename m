Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E8E2D0B8C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2973B89286;
	Mon,  7 Dec 2020 08:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FED89286
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:15:23 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id s75so11461543oih.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 00:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9KE6NyFNEZU3d8Y2IOOJNHxklbUFPSawLkFJ0IvFZs=;
 b=Hr31YK+Ynr1dkVjJOnXxL1zX6hqRnOH3RQ8r2jAy1ytrkM5wp1ZJJh7PcmKgE/G5i5
 4tU2FSmHdjYvgbZ73hPkeRHSQTkGYyieBHR/xCGsS0jqG65i+8Z6yrijZBM2joLFuVF0
 198I3+YQC0HQAVLWwrBNZXy0gqo8giapkQumqeZoEsXmHL4AFiGE3pjMMpMydB9YqMcr
 Rotx8wXsmjOvZR858V8CnXeoUuy89p0KjkJIneK18mYnyOFzXzno6Nrb2xjSYCG89CEb
 x/h7Htxwf2vBsj+Os4HMZx5hcdXS0qDV5ymZxUWUpSrL2zRZ1IOh0r86vLl4ZXWzZjxX
 kaAg==
X-Gm-Message-State: AOAM532HU1SZTIUoQXgFvqnPkIPokNEA//osSOsvQOLg8ZCqZ3KZBRr3
 ealFfruMJn66pqDkqgoSAclpu5GDK95e4Yjpcuc=
X-Google-Smtp-Source: ABdhPJyHqGB/MfqU2tuwSgI2DjUPWlVmiDjm9GeNsV0cy3iUwtbQKTAfmYrBjlKDl3fpjoRaygIR1/316iZg18+RjbE=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr10026212oib.54.1607328922988; 
 Mon, 07 Dec 2020 00:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201204220139.15272-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Dec 2020 09:15:11 +0100
Message-ID: <CAMuHMdXrEpnQNT=QZRrgQ-jzBvRumUHgqfBrgCHcELpxg7VnQA@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm: rcar-du: Fix crash when using LVDS1 clock for
 CRTC
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Dec 4, 2020 at 11:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> On D3 and E3 platforms, the LVDS encoder includes a PLL that can
> generate a clock for the corresponding CRTC, used even when the CRTC
> output to a non-LVDS port. This mechanism is supported by the driver,
> but the implementation is broken in dual-link LVDS mode. In that case,
> the LVDS1 drm_encoder is skipped, which causes a crash when trying to
> access its bridge later on.
>
> Fix this by storing bridge pointers internally instead of retrieving
> them from the encoder.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

I think this warrants a Fixes tag, to assist the stable team in backporting
this fix.

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
