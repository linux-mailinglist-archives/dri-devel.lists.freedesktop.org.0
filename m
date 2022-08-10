Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF7258EAE5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 13:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064C6AFDF1;
	Wed, 10 Aug 2022 11:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9987AED7C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 11:06:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a7so27075984ejp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Y5464zsQNDUFC1/AI6NklDW3Tl9Ys1KhvFu4noHI+OI=;
 b=KkxLp9Fn5d4+6NgDba3Fwa2RCACaKlYXTuM1CTsnOMtBqBoLear/R7yW6Dj6Jqi31H
 CRfG0hVKw/LIugkNF7RGhEzZ+M38Dne5mFv8mHG2aT2QSTCsgv/C/MCI96MgBVRoiOX8
 jtI+ZibZ7BdfVBzDPeMRjHKkwmzBxnuu8N6UOVUjQXuBr9UI73NQrMaalhiX2HezH+hC
 vF1KIZRa5sHqYnycnspVe8zFsoud/gfm0Ik1k8rSemSg+wTgVZhheN6+sleDcK/UIDwd
 rOFm2gYxrmtfgpy+0Ipr8KbX1xwNY9d1qWziwNsgzi9sQ+49zAIUK6FEnDOqO1agifaB
 zbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Y5464zsQNDUFC1/AI6NklDW3Tl9Ys1KhvFu4noHI+OI=;
 b=GwknLwYIZchS50HQKxXo4GoCL25AyC00RW6XRAhF/PHIV6X8U1lZk0CUDvjIKZetTz
 x3wtDDKpCAEIU2SLrJ5TKQTDIhqF5uzVEp1nM0tQ//wcYQE2oFnTWcCvvg30ljkUM8da
 AQNOs+kI0BFYlr0/vEWsoMlRYVjORgBXcgV72vr4Ioy2e2gNig+cMdDD90SCfb+J6ndC
 UOZIwfhiCbnbw2aMpnQ0g7tvfqbsAGsm6hNpFRxiZg87vxuxDC8r2WjNNUF+AmLi4vAe
 9mvJo8pIQUv9zWNHGH0ZwSPHFkeyJzZtI1PNDu3zz9wplrIY/pHly2d6aBDVZwBqZzT8
 NMPA==
X-Gm-Message-State: ACgBeo3DeqZp48Yc/mDZgbH+El48NGUTidHLl61QeHJsNAzHqnF581uv
 wInO51LOVoVu7t+uud5YE7OhrgR/EptamT7l4oG0Jg==
X-Google-Smtp-Source: AA6agR5okppn5qCP1OahvKFzURL2K+7Nl3hTcQJkvpjQwcRMmzLa1zonn2VDoWZupz+6SKDFpYB/sJ9zY3qlshY1zfE=
X-Received: by 2002:a17:906:4795:b0:733:1d3:3d33 with SMTP id
 cw21-20020a170906479500b0073301d33d33mr2876216ejc.200.1660129580991; Wed, 10
 Aug 2022 04:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-24-maxime@cerno.tech>
 <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
 <c82f57ba-0b60-10a0-d254-da91a32a923d@gmail.com>
In-Reply-To: <c82f57ba-0b60-10a0-d254-da91a32a923d@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 10 Aug 2022 12:06:05 +0100
Message-ID: <CAPY8ntCNPk5XxvPyyvWgVsmj7SjhjdcFkN=2M4dknB20UiwXkw@mail.gmail.com>
Subject: Re: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
To: Florian Fainelli <f.fainelli@gmail.com>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Florian

On Tue, 9 Aug 2022 at 20:02, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 8/4/22 16:11, Florian Fainelli wrote:
> > On 6/13/22 07:47, Maxime Ripard wrote:
> >> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >> The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
> >> attached to the HDMI block, handled in Linux through runtime_pm.
> >>
> >> That power domain is shared with the VEC block, so even if we put our
> >> runtime_pm reference in the HDMI driver it would keep being on. If the
> >> VEC is disabled though, the power domain would be disabled and we would
> >> lose any initialization done in our bind implementation.
> >>
> >> That initialization involves calling the reset function and initializing
> >> the CEC registers.
> >>
> >> Let's move the initialization to our runtime_resume implementation so
> >> that we initialize everything properly if we ever need to.
> >>
> >> Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable to
> >> runtime_pm")
> >> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > After seeing the same warning as Stefan reported in the link below, but
> > on the Raspberry Pi 4B:
> >
> > https://www.spinics.net/lists/dri-devel/msg354170.html
> >
> > a separate bisection effort led me to this commit, before is fine, after
> > produces 4 warnings during boot, see attached log.
> >
> > Is there a fix that we can try that would also cover the Raspberry Pi
> > 4B? Is it possible that this series precipitates the problem:
> >
> > https://www.spinics.net/lists/arm-kernel/msg984638.html
>
> Maxime, Dave, anything you would want me to try? Still seeing these
> warnings with net-next-6.0-11220-g15205c2829ca

Strange as we don't see this warning on the vendor kernel which is
doing exactly the same. We are largely still on 5.15 as LTS though, so
5.19 hasn't had much bashing in that regard.

Your callstack implies it's only sequencing.
vc4_hdmi_bind is manually calling vc4_hdmi_runtime_resume (and hence
initialising registers) before the call to pm_runtime_set_active and
pm_runtime_enable, hence the pm accounting check in vc4_hdmi_write
fails.

pm_runtime always seems like black magic to me :-/
Do we need to manually power up here, or can we call pm_runtime_enable
without touching the state, and then resume in the normal manner?
ie something simple like
pm_runtime_enable(dev);
pm_runtime_resume_and_get(dev);
The resume_and_get will call vc4_hdmi_runtime_resume and hence
initialise the block, but it will have sorted the pm accounting first.

Otherwise we mess with the order to be:
pm_runtime_get_noresume(dev);
pm_runtime_set_active(dev);
ret = vc4_hdmi_runtime_resume(dev);
if (ret)
   goto err_put_ddc; //This error handling needs to be checked
pm_runtime_enable(dev);

I have no feel for which is the "correct" approach in terms of
pm_runtime, so will defer to others in that regard.

  Dave

> Would be nice to see those fixes before 6.0 final, thanks!
> --
> Florian
