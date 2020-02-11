Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCBC158DB6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 12:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674FD6EA36;
	Tue, 11 Feb 2020 11:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857A46EA36
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 11:46:23 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id o187so2865438vka.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 03:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fbQqBktojpxzSsrnUT1G0WpOM1ttI2j5Sk3Eo8WpTZ8=;
 b=byWe2sMvd67pRpO0fsnBy31qogQsHeN5bFLcISHi0a/NcQQ4xzrKW8/1gULmGEk+ub
 3AUVxX3k7g962wod17pUP1VpD6dpO3E1sK6gCKhmSpVA2qrwMvwag0CqL1LfOO/01L+S
 D7EBEEBKJ1Bd+NUla60k/05lI1L+CivvhU5g0Ud4D/5yzoTaunBdtXdzBJFgP1/W3mZD
 10bwUs8dg2PPgq6ZUwcGzHmo5EjVC1BA5SxrFeoXM+ZpuX6tZHJZsul9B5lfj2nDPGR6
 dWOCg/ykGHZdlzuajQGZmdNNgJzemA63An3Y28zEWI/BuXog+kj41eVmQHaL3B4GbLRw
 RyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fbQqBktojpxzSsrnUT1G0WpOM1ttI2j5Sk3Eo8WpTZ8=;
 b=WuzOKwnIBYq9U4lkoYui5oMw4/YQ2zbw7dm6frglnAL5IvW0DTG3gSZ1/DsDKWxQhw
 9MfG+GkCetu4Ln6worup4WkoVpr2sYgEiM6Ox6UU8/tLdy4y/Bkzxizj+yV1HQwjTe4G
 +ZbX4/KWfu84a2cD8xMdTydDhQdfZ6y4c8/SG4+TOhEtgbArUWPtPeqb6yw+nvuJWZRw
 5heV+asxrmaKj8F1qCwco+WiJerTdWXBUdEBDC1+6hEG+CyaJw0Pm//BkMxeomqy8lkK
 787j1C5zsrDhvS4Nd2jsoQXFwIXdwMp/Zct4BJAnA5f+JJe94YJLs/MSvLx9tuBQ+t9Y
 XyVQ==
X-Gm-Message-State: APjAAAXzFFoNTCEK4E43Sr07b1O7DU24nUP6shc6UKR+2sMlk+/a6eNR
 G767m+GoBvfh1edYwgE155pStRRsCnvVxAqcc3VuagD+
X-Google-Smtp-Source: APXvYqzA5qSr/zg2Z5ym5D0fB8JgNCtVfhmQpzc0QWHkoyv4GMDTq/oO7t4rk6LCHPdiMcCJr2P0+MZ3l4Bu8TQCsDg=
X-Received: by 2002:a1f:c982:: with SMTP id z124mr4427685vkf.6.1581421582582; 
 Tue, 11 Feb 2020 03:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20200205174839.374658-1-emil.l.velikov@gmail.com>
 <20200207132942.GY43062@phenom.ffwll.local>
 <CACvgo52NO5uOnG5p360nWKiu6Bigs9bgP9x3XKMQ3vfT-APfmQ@mail.gmail.com>
 <20200211100648.5d876d43@eldfell.localdomain>
In-Reply-To: <20200211100648.5d876d43@eldfell.localdomain>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 11 Feb 2020 11:46:26 +0000
Message-ID: <CACvgo5182iKZJV3ZSCA+BMfG9_NM+K3CtuJ=UQFBYR+ui24vRw@mail.gmail.com>
Subject: Re: [RFC] drm: rework SET_MASTER and DROP_MASTER perm handling
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Feb 2020 at 08:06, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 10 Feb 2020 19:01:06 +0000
> Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > Thanks for having a look Daniel.
> >
> > On Fri, 7 Feb 2020 at 13:29, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Feb 05, 2020 at 05:48:39PM +0000, Emil Velikov wrote:
> > > > From: Emil Velikov <emil.velikov@collabora.com>
> > > >
> > > > This commit reworks the permission handling of the two ioctls. In
> > > > particular it enforced the CAP_SYS_ADMIN check only, if:
> > > >  - we're issuing the ioctl from process other than the one which opened
> > > > the node, and
> > > >  - we are, or were master in the past
> > > >
> > > > This allows for any application which cannot rely on systemd-logind
> > > > being present (for whichever reason), to drop it's master capabilities
> > > > (and regain them at later point) w/o being ran as root.
> > > >
> > > > See the comment above drm_master_check_perm() for more details.
> > > >
> > > > Cc: Adam Jackson <ajax@redhat.com>
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > > ---
> > > > This effectively supersedes an earlier patch [1] incorporating ajax's
> > > > feedback (from IRC ages ago).
> > > >
> > > > [1] https://patchwork.freedesktop.org/patch/268977/
> > > > ---
> > > >  drivers/gpu/drm/drm_auth.c  | 59 +++++++++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/drm_ioctl.c |  4 +--
> > > >  include/drm/drm_file.h      | 11 +++++++
> > > >  3 files changed, 72 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > > index cc9acd986c68..01d9e35c0106 100644
> > > > --- a/drivers/gpu/drm/drm_auth.c
> > > > +++ b/drivers/gpu/drm/drm_auth.c
>
> > > > +static int
> > > > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> > > > +{
> > > > +     if (file_priv->pid != task_pid(current) && file_priv->was_master)
> > >
> > > Isn't this a typo? Why should we only allow this if the opener is someone
> > > else ... that looks like the logind approach? Or is my bolean logic parser
> > > broken again.
> > >
> > Thanks for spotting it. Indeed that should be:
> >
> > if (file_priv->pid == task_pid(current) && file_priv->was_master)
> >     return 0;
>
> Hi,
>
> I'm mostly just curious, why is comparing pids safe here? Maybe the
> 'pid' member is not what userspace calls PID?
>
PID here is the kernel struct pid. For userspace ones we have the
distinct task_xid_nr, task_xid_vnr and task_xid_nr_ns.
See the documentation [1] for details.

> What if a malicious process receives a DRM fd from something similar to
> logind, then the logind equivalent process dies,
In the logind case, systemd ensures to bring it back up ASAP. For
others - shrug?

> and the malicious
> process starts forking new processes attempting to hit the same pid the
> logind equivalent had, succeeds in that, and passes the DRM fd to that
> fork. Is the fork then effectively in control of DRM master?
>
Valid point, although I believe we're covered.

First and foremost, the pid we store is refcounted [1]. So in order
for this to happen we need have both a) a pretty fundamental refcount
bug for the pid to gets destroyed and b) we need to allocate another
one at the exact same address.

Individually - pretty unlikely, combined - beyond paranoid IMHO.

Additionally, today there are other ways to cause issues. In particular:
 - logind dies
 - the application already has an fd (from logind)
 - the fd is master capable
 - application is free to do as it wishes ... apart from dropping
master (oh noo) and setting it back up again

Or a simple application which loops over open() + drmIsMaster() + close().
There are others, although I'd be going pretty much off-topic.

Thanks
Emil

[1] https://elixir.bootlin.com/linux/v5.5/source/include/linux/sched.h#L1307
[2] https://elixir.bootlin.com/linux/v5.5/source/drivers/gpu/drm/drm_file.c#L127
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
