Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DC260E4E8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395B210E56E;
	Wed, 26 Oct 2022 15:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAFC10E573
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:36:21 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id f27so11771026eje.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zdp2ORX7WoL3+/L2v2AZBOSfN5mm7SO9qaZf5T9g988=;
 b=ZL7ULLibpv3kb+fTEC/HD6x1VsSdtBqfXjzW1U/C9cLItf8gtkJMNTylam+gYlZySo
 ozJ3Q4RVRoAjDnhva6InEDjapR6zlDYwwn6xTLU9u8CxZNOi2HDalFUhThk7jOjngjqd
 fyA3tGE3GnzBdF8goC+GMacNeuqhNJv2NwCwLO6TiCQpwJhMqGL3FSz8A2JpNzcqKEvC
 1Y6XSZVs3c4ceBwi63LjZieDRp39WfMRAXARSU0dFpfbiaScI7HUeu3SVaW1uMWRO5UZ
 dyJB4CPrkrwqW/O2AGMYnAOxLWdhLApMFPb8p349QsSj4yhYkNxE4mI1gFyCUsNf7Ndm
 yUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zdp2ORX7WoL3+/L2v2AZBOSfN5mm7SO9qaZf5T9g988=;
 b=WGSy3hvatAI6UtzFOABEzn7VHIerQAGKj/DqkNYchEeSdHILcRpFp7waVySnjWIlBi
 Hxp0p4Y6nr7z06Csg6mIVWkIG6k7KLCyQ/BkhwKcRE9V39P02Ms8B0tavmNqkxMYXiWt
 fWVIrP9bRr88taJ+q5Js3bclXBFx4LaX7IVel6UnHRNeyaLtBqF8VuWy7bUArkEuIGhu
 5m/b3XKd2ZFTge5clUidwVV+f3N2boBCmcgieNxsfiFfQR0Rs719nFROIfYJ1m4h20zY
 K/svP2CmYLQGQI0pecLelWS27QKPODVsrxXaeyAQ4YMXuRx/DRyWOXzVMDoNPg/qhjKk
 WFZA==
X-Gm-Message-State: ACrzQf1q7QwpRup51HfP2R8USAJ1/SxFiZpUP+Eo72vcFfzgKFACA930
 wDe269mD0OiAAnFiTFZ0ED7tGWukpSvS6MVaqOlshw==
X-Google-Smtp-Source: AMsMyM7TPvEd60+h0t9kjHq7KzB06CNBHLWAx73bGFnzp+46lHrBkvGIe264MDar29BQGZOBLk/rI+/W6JDtwAdmHfs=
X-Received: by 2002:a17:907:94c7:b0:78e:1c4f:51f9 with SMTP id
 dn7-20020a17090794c700b0078e1c4f51f9mr39632426ejc.200.1666798580075; Wed, 26
 Oct 2022 08:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
 <20220815-rpi-fix-4k-60-v4-4-a1b40526df3e@cerno.tech>
 <CAPY8ntAkzWOy0fk4ojtKW9k7asH1zOYygoU8B_=yJjm7Ni7isw@mail.gmail.com>
In-Reply-To: <CAPY8ntAkzWOy0fk4ojtKW9k7asH1zOYygoU8B_=yJjm7Ni7isw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 26 Oct 2022 16:36:04 +0100
Message-ID: <CAPY8ntB1bgHVFMAYP62oGXPUwL4YkGMkxWJaoHLeNW=G1rj+Hw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
To: maxime@cerno.tech
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Emma Anholt <emma@anholt.net>, Stephen Boyd <sboyd@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Oct 2022 at 16:27, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Thu, 20 Oct 2022 at 10:14, <maxime@cerno.tech> wrote:
> >
> > In order to support higher HDMI frequencies, users have to set the
> > hdmi_enable_4kp60 parameter in their config.txt file.
> >
> > We were detecting this so far by calling clk_round_rate() on the core
> > clock with the frequency we're supposed to run at when one of those
> > modes is enabled. Whether or not the parameter was enabled could then be
> > inferred by the returned rate since the maximum clock rate reported by
> > the firmware was one of the side effect of setting that parameter.
> >
> > However, the recent clock rework we did changed what clk_round_rate()
> > was returning to always return the minimum allowed, and thus this test
> > wasn't reliable anymore.
> >
> > Let's use the new clk_get_max_rate() function to reliably determine the
> > maximum rate allowed on that clock and fix the 4k@60Hz output.
> >
> > Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum rate allowed")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 64f9feabf43e..87961d4de5aa 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -46,6 +46,7 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/rational.h>
> >  #include <linux/reset.h>
> > +#include <soc/bcm2835/raspberrypi-clocks.h>
> >  #include <sound/dmaengine_pcm.h>
> >  #include <sound/hdmi-codec.h>
> >  #include <sound/pcm_drm_eld.h>
> > @@ -3429,7 +3430,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
> >
> >         if (variant->max_pixel_clock == 600000000) {
> >                 struct vc4_dev *vc4 = to_vc4_dev(drm);
> > -               long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
> > +               unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);

Actually minor nit:
rpi_firmware_clk_get_max_rate returns an unsigned int.
AFAICT we don't need the range of unsigned long in any subsequent
code, so I think it could just be unsigned int here.

clk_round_rate returned a long, and therefore previously it did have to be that.

  Dave

> >                 if (max_rate < 550000000)
> >                         vc4_hdmi->disable_4kp60 = true;
> >
> > --
> > b4 0.10.1
