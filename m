Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977322806E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5D46E1BC;
	Tue, 21 Jul 2020 12:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C92C6E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 12:59:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f2so21082179wrp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BaY+bOJZPzcrjL03hDvO676LLEy7U4Oxk/5k+DjWQmQ=;
 b=gtsQDREJvZ02RLrtJIooZ9Nk+w2uKvLIsPvI65bckkx9PIZYKSTBQOcikMe9vM9SEJ
 3y5B5fBGJcXO4R0tLdAlTgcm6kLfn16ICl1qcMEmTcVsbUxUlL05FEQHUzGgXdW/6gDU
 2Uv4HJQAwbkQkqsR0ad8btUacjtZ3nWFNETh9U7zkqtMka3wpwEBGAXYdbWOuTC2QlXW
 zjqYZfFjB9nA5cYyp89OHqabKP89XuqbPoUKUVpJB8Ysax/RFkEpPv1wxG4YY/xe9huP
 O2kB4zxGljyyVhO4QbNGGvXnQ36/d+I6TohSQWfcMiv9WjpwG42aY0W7kPpWTgaUgKVq
 La2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BaY+bOJZPzcrjL03hDvO676LLEy7U4Oxk/5k+DjWQmQ=;
 b=Fsc+ackgrWBOXfyTXkB4BD/fo9W2/zwPjoelor0mHGHV4SnmxzLIlaASYxZXXqMu1S
 plRpOSEjqpvRK+d7ljnvau2Ji1xGQlEyQSzEWAqW0F1D4IHcjI+vr52y+5euhw6zbmw/
 T5lADg5439QvLT8tc8ceTyDEuNRQX8kQBsbA9SD9hv3IZaVUxPTbsgzCeaUZdqmB8rgn
 W4fJIHrbl3BF1rrlKj6mW2KZniIXsp2U3muKoyGuJqFWtEhRfOIXSWcCDfj8/+f87gVB
 JywpNfd17tQVkMHYUe4gTdZk1rBbxV5hEzqP2Du5PsdmrF0WRmwPmpuu/f5D903UiwkM
 f+Cw==
X-Gm-Message-State: AOAM530xeN3DDQsC0gjBcDcNOUnZG5Oyen4EC/I3M5TleE8l5CrW7PLO
 NWc4aN6ABOUuV4zPRXQEQso=
X-Google-Smtp-Source: ABdhPJwmxHBLT52cSoniH/zdLDc3boXEeiBPiiAyp/9AwMv9yVllNHcMarnV/QEBWSutgRN/V4LrLA==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr28629204wrs.105.1595336395042; 
 Tue, 21 Jul 2020 05:59:55 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id d132sm3314604wmd.35.2020.07.21.05.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:59:54 -0700 (PDT)
Date: Tue, 21 Jul 2020 09:59:47 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
Message-ID: <20200721125947.2gc5du327fwukwrh@smtp.gmail.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721064422.GZ3278063@phenom.ffwll.local>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I traced the subtests' execution to figure out what happens (or not) in
a clean run and a blocked run, and this led me to suspect the
vkms_crtc_atomic_flush function. Examining the code and considering the
DRM doc, it seemed to me that a drm_crtc_vblank_get call was missing a
drm_crtc_vblank_put pair. So I checked it that way, and again, the
problem of sequential execution + dpms/suspend failures disappeared.

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..f60bf1495306 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -240,30 +240,31 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
                spin_lock(&crtc->dev->event_lock);

                if (drm_crtc_vblank_get(crtc) != 0)
                        drm_crtc_send_vblank_event(crtc, crtc->state->event);
                else
                        drm_crtc_arm_vblank_event(crtc, crtc->state->event);

                spin_unlock(&crtc->dev->event_lock);

                crtc->state->event = NULL;
        }

        vkms_output->composer_state = to_vkms_crtc_state(crtc->state);

        spin_unlock_irq(&vkms_output->lock);
+       drm_crtc_vblank_put(crtc);
 }

However, I'm not sure if it's just another duck-tape proposal or if it
makes any sense. I'm still investigating better, but I think sharing
with you may be more productive.

Melissa

On 07/21, Daniel Vetter wrote:
> On Tue, Jul 21, 2020 at 05:33:00AM +0000, Sidong Yang wrote:
> > Hi, Daniel and Melissa
> > 
> > I tested some code for this problem trying to find the code that make problem in igt test.
> > kms_cursor_crc test in igt test has 3 steps (preparation, test, cleanup). I check each steps
> > and I found that without cleanup step, the problem solved.
> > In cleanup step, igt test code seems like this.
> > 
> > drmModeSetCrtc(display->drm_fd, crtc_id, 0 /* fb_id */, 0, 
> > 		0 /* x, y */, NULL /* connector */, 0, NULL /* mode */)
> > 
> > I commented out this function call and there is no problem in executing tests repeatedly.
> > I'm trying to find out what's happen in this call. but don't know until now
> > I hope this information help to solve the problem.
> 
> Ah yes that fits the evidence we have from Melissa pretty well: Not
> turning off the CRTC means the next test wont have to turn it back on
> again. And the vblank bug seems to be in the code which turns the crtc
> back on. At least inserting a vblank wait in there is enough to paper over
> all the issues, per Melissa's testing.
> 
> So at least we're now fairly confident where the bug is, that's some solid
> progress.
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
