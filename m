Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F14228171
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA8389F4F;
	Tue, 21 Jul 2020 13:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F916E265
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 13:58:46 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id y4so1640435oov.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vo094V+HBUifWU7U4XhsTmI5Q/HwzSO/w5Caxih/PU0=;
 b=jfboD7pFNUxJXu87aF5aykxZ8AMAh2y8DT45309zFbPgL4huvcUTAc+kTV/6Z67vPg
 nwUdBWpdXZFrqUtXSDUTO//j1OEGhlkW0GTg4gF8aMtYu9llSrsHzB+Od05TCadMDFPY
 Bj2sixTcgr8z1Tj1LDMiYaL4vye8eTAGAm2Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vo094V+HBUifWU7U4XhsTmI5Q/HwzSO/w5Caxih/PU0=;
 b=DFCvHZe7/7WzAsHUD1tnVU6afdqI3yv2OX9ehBEma2M/6BNTkUx5Ip8f/MrLO2ZPHZ
 ajGe4hiHVH24exSnoDIzqGuQnQk4RQS94qKo42XB2hYQ8rqNEwKvRlXJViUus7wxyY2N
 4eVEw3fyd4wJyApYwcMEtsQ7m2RCTjqy+7gKSV3uU++xFevCPWDGrtfRyUmrAmYfNSx6
 6xRqf/cELDxt/0gqxCQxrXG16EgbuZfNH/a0ynTyJhQ0xDAgjytwR2IGrXmbfYd8C0BJ
 cncbqZnGZKnL/KmdR8ONBpKSxRAYAROK8lf87bmeHVB8NV3bZGkRSGE16jYFx9E/yZlb
 YjrA==
X-Gm-Message-State: AOAM532t5zxxhYjZL0ou7MNpuxf4IgJZHTC0Pd3I2aVPwY4p4kiLlW6d
 U1+ww9IBr33R4Jwi/tefOlFhHzJ0yTqsnGdgqt9Y5w==
X-Google-Smtp-Source: ABdhPJxUZSHkGURI1vtueQK7/7oDjl1sFdiqKPIuk8eipLj9i5K9ICtluX1ir+6Hu0PvOrwrtwqjji8Ls9NXGxJ9Xos=
X-Received: by 2002:a4a:a685:: with SMTP id f5mr14031552oom.85.1595339925542; 
 Tue, 21 Jul 2020 06:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200714102009.4qxgdq5bkpwhhhio@smtp.gmail.com>
 <CAJeY4oF9k--dGOYaC9qAXiVbx6aX2a6isXpfOg+JV2s+UskKGA@mail.gmail.com>
 <20200714140904.GF3278063@phenom.ffwll.local>
 <20200714183513.6zah7wqlo2bpalum@smtp.gmail.com>
 <CAKMK7uFF=CuuTQQJ+MSZD-7+gDzcN-jKB3Uojgps+hY0jdz1bg@mail.gmail.com>
 <20200715124337.GA18441@realwakka>
 <20200715155715.73zaveklxrakib37@smtp.gmail.com>
 <CAKMK7uFLwyLgP3tAmw3s-PC0m_1CaNKR1aLvO3ES1PrTAdX-6A@mail.gmail.com>
 <20200721053300.GA2338@realwakka>
 <20200721064422.GZ3278063@phenom.ffwll.local>
 <20200721125947.2gc5du327fwukwrh@smtp.gmail.com>
In-Reply-To: <20200721125947.2gc5du327fwukwrh@smtp.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 21 Jul 2020 15:58:34 +0200
Message-ID: <CAKMK7uFb=DuO3NrVQstqgiJsDGE=O0PdcOL9hFgjwc+q-mQEeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
To: Melissa Wen <melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 2:59 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> Hi all,
>
> I traced the subtests' execution to figure out what happens (or not) in
> a clean run and a blocked run, and this led me to suspect the
> vkms_crtc_atomic_flush function. Examining the code and considering the
> DRM doc, it seemed to me that a drm_crtc_vblank_get call was missing a
> drm_crtc_vblank_put pair. So I checked it that way, and again, the
> problem of sequential execution + dpms/suspend failures disappeared.
>
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index ac85e17428f8..f60bf1495306 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -240,30 +240,31 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>                 spin_lock(&crtc->dev->event_lock);
>
>                 if (drm_crtc_vblank_get(crtc) != 0)
>                         drm_crtc_send_vblank_event(crtc, crtc->state->event);
>                 else
>                         drm_crtc_arm_vblank_event(crtc, crtc->state->event);
>
>                 spin_unlock(&crtc->dev->event_lock);
>
>                 crtc->state->event = NULL;
>         }
>
>         vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
>
>         spin_unlock_irq(&vkms_output->lock);
> +       drm_crtc_vblank_put(crtc);
>  }
>
> However, I'm not sure if it's just another duck-tape proposal or if it
> makes any sense. I'm still investigating better, but I think sharing
> with you may be more productive.

Wow nice find, really great debug work! And checking history, this bug
was there from the beginning. Now I have questions why this never
really blew up before ...

For the patch just a small fix needed, the put needs to be moved into
the if block. Otherwise we call _put() without calling _get(), and
that's also not good. Then just wrap it into a nice patch with the
commit message explaining the entire debug story (i.e. all the
evidence that lead you to this) and we should be good to go.

I'm still not really clear on why this breaks stuff when re-enabling
the crtc ...
-Daniel

> Melissa
>
> On 07/21, Daniel Vetter wrote:
> > On Tue, Jul 21, 2020 at 05:33:00AM +0000, Sidong Yang wrote:
> > > Hi, Daniel and Melissa
> > >
> > > I tested some code for this problem trying to find the code that make problem in igt test.
> > > kms_cursor_crc test in igt test has 3 steps (preparation, test, cleanup). I check each steps
> > > and I found that without cleanup step, the problem solved.
> > > In cleanup step, igt test code seems like this.
> > >
> > > drmModeSetCrtc(display->drm_fd, crtc_id, 0 /* fb_id */, 0,
> > >             0 /* x, y */, NULL /* connector */, 0, NULL /* mode */)
> > >
> > > I commented out this function call and there is no problem in executing tests repeatedly.
> > > I'm trying to find out what's happen in this call. but don't know until now
> > > I hope this information help to solve the problem.
> >
> > Ah yes that fits the evidence we have from Melissa pretty well: Not
> > turning off the CRTC means the next test wont have to turn it back on
> > again. And the vblank bug seems to be in the code which turns the crtc
> > back on. At least inserting a vblank wait in there is enough to paper over
> > all the issues, per Melissa's testing.
> >
> > So at least we're now fairly confident where the bug is, that's some solid
> > progress.
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
