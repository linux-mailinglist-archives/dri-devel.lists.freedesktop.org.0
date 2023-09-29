Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005EC7B3CFB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 01:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A4710E0F7;
	Fri, 29 Sep 2023 23:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E2510E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 23:25:10 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9a645e54806so1931986366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 16:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696029908; x=1696634708;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kzsGHMcGTY+0MV8P20BeOAUMPFj5cfESJuSKK96D7o=;
 b=K7gFVFVphDjINirwYrTZM8yCIlFLsmBuyH7hZ/nh2wrz89h1XDC2bxX9vnMOXRXhz9
 k/AA4RZfO69SmNF2g3kyNs+mtD9BS5cqBVGRzRgsLg3SEqXfSQlfq/2/Fgl6hBJHh2KC
 P+6z3JbgECdMA7OXrOfl7muoiTL4DXIF3hDkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696029908; x=1696634708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kzsGHMcGTY+0MV8P20BeOAUMPFj5cfESJuSKK96D7o=;
 b=h6EPlPNZMSRIhPrnaQndNxkYNEiNdoGSHtkPYPanQsOJSB+a8ocnwknahq9FYW4yrg
 xH24bRupGejKrjQqiE4hYbdToz/btDL3r0tiWijOA7BWc+A3H584pAe8JObP+GQrfmtg
 w8BqkuBD8nSUQT0BMaTrAhuQt54OeD70irkZxVGq8RLLlLBfFj/R+4fRyOcegJ/xYJ07
 q8xzQfQt1nunfZKecYSuDLjj025WFwxs2l2T0rSzWG41yCwzOZZbDc+F0ne9Xf0O+Sed
 PDzasD0M409KiyW2MUEKsW/WIjCorP5xdtYUE6ON4ou24A9QDvT7LuXEY8p7Ze4mAtzd
 U91A==
X-Gm-Message-State: AOJu0YwKtKDnNpuaT7QFHb8wQA9GCXACP10Em7nn9Trjp04v8obdiKBI
 hWO8xt6C7uoiJW1C8bwua/R/Y9WicWEh/HzvFxufR1V2
X-Google-Smtp-Source: AGHT+IHQuzmRhQOA4HPWJhzYq0aBziZ3FVzKSePY/qvkjIXt02cYqu6rDlCoLDIAZhOoNDmPVRRn2w==
X-Received: by 2002:a17:906:8b:b0:99d:fd27:b38d with SMTP id
 11-20020a170906008b00b0099dfd27b38dmr6034058ejc.70.1696029908035; 
 Fri, 29 Sep 2023 16:25:08 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 o2-20020a1709062e8200b0099ce188be7fsm13008351eji.3.2023.09.29.16.25.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 16:25:07 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4063bfc6c03so28155e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 16:25:07 -0700 (PDT)
X-Received: by 2002:a05:600c:4688:b0:405:35bf:7362 with SMTP id
 p8-20020a05600c468800b0040535bf7362mr18952wmo.0.1696029907168; Fri, 29 Sep
 2023 16:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <CACJMzRE=1S-aD4o68WHan7yYQb3zoLTZiUsMJw2B3d91O4D0ng@mail.gmail.com>
 <20230929215041.GC28737@pendragon.ideasonboard.com>
In-Reply-To: <20230929215041.GC28737@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Sep 2023 16:24:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WrA+0VjoSOVFh394W=Utu7ArvDsAV_+BcpptDi4o_TBQ@mail.gmail.com>
Message-ID: <CAD=FV=WrA+0VjoSOVFh394W=Utu7ArvDsAV_+BcpptDi4o_TBQ@mail.gmail.com>
Subject: Re: ti-sn65dsi86 linux driver using dsi clock source for pll
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, Douglas Cooper <douglas.cooper1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On Fri, Sep 29, 2023 at 2:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> CC'ing the dri-devel mailing list and Douglas Anderson.
>
> On Fri, Sep 29, 2023 at 03:36:52PM -0400, Douglas Cooper wrote:
> > Hello,
> >
> > I've been trying to get the ti-sn65dsi86 to work with the dsi bus as th=
e clk
> > source (refclk grounded) and have concluded that the pll is not getting=
 locked.
> > Assuming the hardware is sound, have you ever seen this topology evalua=
ted
> > before? I'm questioning if that was a use case considered in the driver
> > development. I will continue to actively investigate this.
>
> I don't think I've tested this mode, sorry. Maybe other people on the
> list have some experience with this.

I wouldn't suggest using this mode unless you have no choice.

From my recollection we tried to use this mode on the very first
prototype board of sdm845-cheza. It turned out to be _very_ limiting
and it couldn't properly meet the timing requirements of the panel we
were using. I think someone hacked things up temporarily by
underdriving the panel at a much lower refresh rate and we eventually
got it working, but we quickly abandoned trying to use ti-sn65dsi86 in
this mode and threw away all of those old prototype boards.

Since then, I've _tried_ to keep the code in ti-sn65dsi86 supporting
this mode alive, but I'm not super confident in it.

One thing that sticks out in particular in my mind is a bit of code in
ti_sn65dsi86_resume(). You can see there that we don't call
ti_sn65dsi86_enable_comms() if there's no reference clock. I believe
that I added this code more out of guessing than anything else, since
I don't recall this being well documented in the manual and, when the
code was added, the early prototypes of cheza were long, long gone. I
believe (?) I guessed this by seeing that I couldn't do things like
AUX channel transfers without configuring the PLL and the PLL was
based on the reference clock. Ah, here ya go. I documented my thought
process in commit b137406d9679 ("drm/bridge: ti-sn65dsi86: If refclk,
DP AUX can happen w/out pre-enable"). Though looking at it now, it
seems odd that the code waiting for the PLL to lock doesn't happen
until ti_sn_link_training(). Hmmm...

If you have tested and see that things work differently than I
guessed, feel free to send up a patch!

One thing to note is that if, indeed, you need a reference clock
before you can do AUX transactions then it's going to be really hard
to make this work together with the generic "edp-panel". Specifically
you'd need to turn on the MIPI source clock _before_ you can read the
EDID of the panel, but without the EDID you won't really know what
MIPI clock you should use. :-/

-Doug
