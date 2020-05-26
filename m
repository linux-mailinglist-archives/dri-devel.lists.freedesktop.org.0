Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90651E20B2
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 13:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFCA6E0A5;
	Tue, 26 May 2020 11:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39BD6E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 11:11:40 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 63so15921855oto.8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 04:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=394Bf9X0WsU7A//fmBDxQFFiRJv2ha61N4iIBFrJO/0=;
 b=c9pkWViLO33xidO0cqc158y5vqWnE5R6VY+0QE60qB2QXcuUYBn5BR/UHrONYYM6Gi
 /BGcD538X566UTT9o/9HCCsWKhERUNIVoA3h0LddKKUiWCVtoYIImU+F9YPlMJjwMGks
 w1HNv3rcQjhOyCZUkPf88BehwJ0kHERAvSKfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=394Bf9X0WsU7A//fmBDxQFFiRJv2ha61N4iIBFrJO/0=;
 b=G8b5Hqeji9kr2yZXaFMRSVo5o1ogs3YTm+WKa4xnldycNOpBilOshtN9d5ql/hktNV
 722uFot2Ch3euLQyIGckHpv7B4OZnmrGYnHgu8mO6wy/KT+ao+YAbyg2jOLh9+S4XILT
 1crvwWJkUnt2RRHWFjkH1/VFORQQAa55Q95gJijzy8DiBa1RLOPCcDsOGS0Eq9jZIxrR
 KdcL1Ve7sv1CKkGRZZVU24xE2AJRtlvx2R8kidJ+pwx8+ENRqJ3UnMs8J9DRhugjUE5U
 qKg3iotp89ysgnpphOlOiHN0l+MWKoneUx5Umq+hq3jPemVKy4y2eXNvHou0Hj7qjfNy
 2qsQ==
X-Gm-Message-State: AOAM530JeO5mmou5SFHB7Ucz7u7rb/UJWcPFpIwJKo5xXkrL6kJWSMPa
 LtqqvQKaQuvW+HW9sV9WuMj+db1auLjk0yrkhCpjEw==
X-Google-Smtp-Source: ABdhPJx6juiKqCYAnegUSL5lgjjrlIikoHz+uLpLNd+JrDTpouaYH8r6UY/XCx2QN+k5uMD/t0sBoO/cWIUlwFwM1Do=
X-Received: by 2002:a9d:600e:: with SMTP id h14mr442412otj.281.1590491499870; 
 Tue, 26 May 2020 04:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200525143849.4964-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200525152119.GL206103@phenom.ffwll.local>
 <b3715721-4982-83d9-dd6f-2a87e3b02a40@i-love.sakura.ne.jp>
 <CAKMK7uE9p_qDFL9XAqfHQPitTB+-+ZVAmCor-tbvheYjx4e-ZA@mail.gmail.com>
 <579a707b-8bfd-66d1-a1c5-f7883e82969e@i-love.sakura.ne.jp>
 <eeec9373-207c-67f4-8355-edcf5643b800@i-love.sakura.ne.jp>
In-Reply-To: <eeec9373-207c-67f4-8355-edcf5643b800@i-love.sakura.ne.jp>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 26 May 2020 13:11:28 +0200
Message-ID: <CAKMK7uFZGMuyAehjezQSaUaddn-fmqqiFR6WNX5r4Lir7TfCig@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Don't warn hrtimer_forward_now failure.
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 6:39 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/05/26 13:18, Tetsuo Handa wrote:
> > due to mode->crtc_clock <= 0. Thus, somehow initializing mode->crtc_clock > 0 might be able
> > to solve this problem.
>
> Well, I came to think that vkms_enable_vblank() should return an error to the caller
> when drm_calc_timestamping_constants() failed...

If my memory is right we shouldn't even get there. crtc->mode being
all zeros sounds like the simulated output isn't on (no surprise,
syzbot doesn't enable it and fbcon is probably on card0), so something
higher up should reject this. I'll see whether I can figure out what
vkms isn't doing right (or whether there's a higher level bug in
drm_vblank.c code), yesterday my machine died and already evening
anyway.

Thanks for digging into this a bit more meanwhile.

Cheers, Daniel

>
> static int vkms_enable_vblank(struct drm_crtc *crtc)
> {
>         struct drm_device *dev = crtc->dev;
>         unsigned int pipe = drm_crtc_index(crtc);
>         struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>         struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>
>         drm_calc_timestamping_constants(crtc, &crtc->mode);
>
>         hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>         out->vblank_hrtimer.function = &vkms_vblank_simulate;
>         out->period_ns = ktime_set(0, vblank->framedur_ns);
>         hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
>
>         return 0;
> }



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
