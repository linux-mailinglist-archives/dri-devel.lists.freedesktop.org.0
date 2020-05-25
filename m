Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D351E1E1315
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 18:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE39989A44;
	Mon, 25 May 2020 16:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AFB89A44
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 16:57:52 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id b18so14265233oti.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/2JOLzMuNPccyYUrPB6DNdL5C+c40yRMfkb0J6WCGPU=;
 b=acUctjHb+Nut4T2mQjsg7gGnyJhfJLGJW4pF4GJzp0UQOPE31EyUkYGoBOo/jj7zLs
 x6XXkN4NlBY0eCykE13h8nOmSrbkTNHerxHVDImvj9+CFhZpQRACvPw1WS6wrbPdi+Y+
 0BnlUuf3EXvQy6z96D92jjYtPOMocErQsyCuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/2JOLzMuNPccyYUrPB6DNdL5C+c40yRMfkb0J6WCGPU=;
 b=PjwewiIaaEQyVzr8iG6BphtF9GpJFl4QN9CRmsjdvH3pBzTt1huHVXlNAHB089FVuY
 BEjGz0cA3N9a5C91c8rDFjd5S8WY09P5TlGdqRMJKuMxlS3sioPv41QOryYH1SfFpXVk
 /dLfUCNT8eHpCSjORvGkBEvSkET+ZD10e5DN6Saxb2NsBU203RyyTdA7qj+cHZd2g90/
 Zr7+BKoOiyvw/iH4s8ORjyX1TQXkbjeTD+bgABDZzU2vQiuuFLnq6Oe+xhDsBQL/U/Ec
 CnIXvfb7KwoSmK3hLVsXVMazmDkww0qOxyTwE5ukmycQMISQqb49SWUr+T1A9pCb1bz9
 TIig==
X-Gm-Message-State: AOAM530+iW8ttIn2WnxDZFG/qIcu4vpJ1lMAETi6PB2SEerncxCOSk/n
 eZWCslrSI5NRsxKNvACieIQ+6MWp2iKFjV1WlaYtLg==
X-Google-Smtp-Source: ABdhPJxduQEW+aRPsMK/x0mkc5HpOV2DxAq5DKMKKPuJL52cIoEWWxTn/rfyoIPepvjz7VLjdd4YlSSBKYq417+ppdY=
X-Received: by 2002:a9d:600e:: with SMTP id h14mr22720027otj.281.1590425871704; 
 Mon, 25 May 2020 09:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200525143849.4964-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200525152119.GL206103@phenom.ffwll.local>
 <b3715721-4982-83d9-dd6f-2a87e3b02a40@i-love.sakura.ne.jp>
In-Reply-To: <b3715721-4982-83d9-dd6f-2a87e3b02a40@i-love.sakura.ne.jp>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 25 May 2020 18:57:40 +0200
Message-ID: <CAKMK7uEeBsfVk-2fZAd-7WkapiVY-iSWyfBA9o1BDa6H=o==iA@mail.gmail.com>
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

On Mon, May 25, 2020 at 5:34 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/05/26 0:21, Daniel Vetter wrote:
> > On Mon, May 25, 2020 at 11:38:49PM +0900, Tetsuo Handa wrote:
> >> Commit 3a0709928b172a41 ("drm/vkms: Add vblank events simulated by
> >> hrtimers") introduced ret_overrun variable. And that variable was an
> >> unused-but-set-variable until commit 09ef09b4ab95dc40 ("drm/vkms:
> >> WARN when hrtimer_forward_now fails") added WARN_ON(ret_overrun != 1).
> >>
> >> Now, syzbot is hitting this WARN_ON() using a simple reproducer that
> >> does open("/dev/dri/card1") followed by ioctl(DRM_IOCTL_WAIT_VBLANK),
> >> and a debug printk() patch says that syzbot is getting
> >>
> >>    output->vblank_hrtimer.base->get_time()=93531904774 (which is uptime)
> >>    output->period_ns=0
> >>    ret_overrun=216994
> >>
> >> . I can't understand what "verify the hrtimer_forward_now return" in
> >> that commit wants to say. hrtimer_forward_now() must return, and the
> >> return value of hrtimer_forward_now() is not a boolean. Why comparing
> >> with 1 ? Anyway, this failure is not something that worth crashing the
> >> system. Let's remove the ret_overrun variable and WARN_ON() test.
> >
> > Uh we're not crashing the system, it's a warning backtrace.
>
> syzbot uses panic_on_warn=1, and this bug is currently the 8th top crasher.
>
> >
> > And we've spent a few months hunting the races here, so just removing that
> > check isn't really a good idea. The correct thing to do is figure out why
> > we're hitting this. It could be that we're having a missing check
> > somewhere, or missing initialization, and that's what syzbot is hitting.
> > Removing this check here just papers over the bug.
>
> Here is a reproducer which syzbot is using.
>
> ----------
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <fcntl.h>
> #include <sys/ioctl.h>
> #include <drm/drm.h>
>
> int main(int argc, char *argv[])
> {
>         union drm_wait_vblank arg;
>         int fd = open("/dev/dri/card1", O_RDONLY);
>
>         arg.request.type = 0;
>         arg.request.sequence = 0xffff;
>         arg.request.signal = 0x21;
>         ioctl(fd, DRM_IOCTL_WAIT_VBLANK, &arg);
>         return 0;
> }
> ----------
>
> Debug printk() patch shows that hrtimer_forward_now() can return larger than 1.
> What is the reason you are expecting hrtimer_forward_now() to always return 1 ?

The timer simulates display refresh running at 60Hz. If we miss one,
the simulation is not accurate against hardware. Missing a few
thousands either means there's a bug somewhere, or the machine has
missed a few seconds of worth of timers (which is equally bad).
-Daniel

>
> >
> > If the vkms driver is loaded, and there's nothing else going on, then what
> > I expect to happen is that this virtual hw is entirely off. And in that
> > case, the vblank ioctl should be rejected outright. So there's definitely
> > something fishy going on to begin with.
> >
> > If otoh the virtual hw is somehow on (maybe fbcon gets loaded, no idea),
> > then the vblank wait shouldn't just blow up like this.
> > -Daniel
> >
> >>
> >> Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
> >> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> >> Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
> >> Fixes: 09ef09b4ab95dc40 ("drm/vkms: WARN when hrtimer_forward_now fails")
> >> ---
> >>  drivers/gpu/drm/vkms/vkms_crtc.c | 5 +----
> >>  1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> >> index ac85e17428f8..cc1811ce6092 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> >> @@ -13,12 +13,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> >>                                                vblank_hrtimer);
> >>      struct drm_crtc *crtc = &output->crtc;
> >>      struct vkms_crtc_state *state;
> >> -    u64 ret_overrun;
> >>      bool ret;
> >>
> >> -    ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
> >> -                                      output->period_ns);
> >> -    WARN_ON(ret_overrun != 1);
> >> +    hrtimer_forward_now(&output->vblank_hrtimer, output->period_ns);
> >>
> >>      spin_lock(&output->lock);
> >>      ret = drm_crtc_handle_vblank(crtc);
> >> --
> >> 2.18.2
> >>
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
