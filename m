Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7915937A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9F86EE92;
	Tue, 11 Feb 2020 15:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6846EE92
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:43:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a9so4132133wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 07:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ucHjBtgs1s9Q0WEiNmZAbRMp59PSrjGO7jttVjhmfF8=;
 b=WTY/uf2KRyKyxIX0qrnVfIBNUOoEsP++52l2EUJirBgHiFCxnlntcQdVZc2p7nB62/
 jvRAS2f3LAgz2FzUPZbcQWrCpqQJEAuqK9XHog/mK3vFMyz74gYfz2RL/B+gftJRcFSm
 H4JID/9gIv+RrCOlRaacY2SLI9n2PP4K3qPko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ucHjBtgs1s9Q0WEiNmZAbRMp59PSrjGO7jttVjhmfF8=;
 b=WmymGhpMts5zs2aEy/jpBw8X2wYTj8SdwvsMb3jAgMXA+3nx3aeNMtYHwNi/NGZzQ+
 2rFGsrTwu5h11pCqdLuOwP6LASzv4T3Q4MO0bvGzND4LdTEPGwStX4PQ+rAEiVqlIGYT
 IoVyOKdNeLfi1vFJetmNozZXl2jOykcxxXvU7XWpdlt6i4/dr6pzepHHUpyqZ/BfVf8r
 guZVg+p+o4vpbp9vuFY7YtMz+kAGiRcpZZ0BE3mSRtHkbht2PqqR6W5iAHHY/WyP2L4U
 +RL4Ng2q+63u6FlOpiKjJdQz7NveTc/+jtI6cjhBRdEKh2x5sOfoiJ9lg9v9UTqhhst1
 lsXg==
X-Gm-Message-State: APjAAAVq1u9bQpH89TlDvX180HBV7zW0eTxWWLwqEocvucUU0my5MUOb
 s+M7laqit0TG9Dx69vEcUc2shw==
X-Google-Smtp-Source: APXvYqxGtKPS+4SynbkJD8s/s5GUcLaxCYSqF3EfgQSymToV1BtE/0pD1YvW89S8mzzlEHg2dqfpWg==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr6347383wmd.127.1581435837802; 
 Tue, 11 Feb 2020 07:43:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm5755441wrb.33.2020.02.11.07.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 07:43:57 -0800 (PST)
Date: Tue, 11 Feb 2020 16:43:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [RFC] drm: rework SET_MASTER and DROP_MASTER perm handling
Message-ID: <20200211154355.GI2363188@phenom.ffwll.local>
References: <20200205174839.374658-1-emil.l.velikov@gmail.com>
 <20200207132942.GY43062@phenom.ffwll.local>
 <CACvgo52NO5uOnG5p360nWKiu6Bigs9bgP9x3XKMQ3vfT-APfmQ@mail.gmail.com>
 <20200211100648.5d876d43@eldfell.localdomain>
 <CACvgo5182iKZJV3ZSCA+BMfG9_NM+K3CtuJ=UQFBYR+ui24vRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo5182iKZJV3ZSCA+BMfG9_NM+K3CtuJ=UQFBYR+ui24vRw@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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

On Tue, Feb 11, 2020 at 11:46:26AM +0000, Emil Velikov wrote:
> On Tue, 11 Feb 2020 at 08:06, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Mon, 10 Feb 2020 19:01:06 +0000
> > Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > > Thanks for having a look Daniel.
> > >
> > > On Fri, 7 Feb 2020 at 13:29, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Feb 05, 2020 at 05:48:39PM +0000, Emil Velikov wrote:
> > > > > From: Emil Velikov <emil.velikov@collabora.com>
> > > > >
> > > > > This commit reworks the permission handling of the two ioctls. In
> > > > > particular it enforced the CAP_SYS_ADMIN check only, if:
> > > > >  - we're issuing the ioctl from process other than the one which opened
> > > > > the node, and
> > > > >  - we are, or were master in the past
> > > > >
> > > > > This allows for any application which cannot rely on systemd-logind
> > > > > being present (for whichever reason), to drop it's master capabilities
> > > > > (and regain them at later point) w/o being ran as root.
> > > > >
> > > > > See the comment above drm_master_check_perm() for more details.
> > > > >
> > > > > Cc: Adam Jackson <ajax@redhat.com>
> > > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > > > ---
> > > > > This effectively supersedes an earlier patch [1] incorporating ajax's
> > > > > feedback (from IRC ages ago).
> > > > >
> > > > > [1] https://patchwork.freedesktop.org/patch/268977/
> > > > > ---
> > > > >  drivers/gpu/drm/drm_auth.c  | 59 +++++++++++++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/drm_ioctl.c |  4 +--
> > > > >  include/drm/drm_file.h      | 11 +++++++
> > > > >  3 files changed, 72 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > > > index cc9acd986c68..01d9e35c0106 100644
> > > > > --- a/drivers/gpu/drm/drm_auth.c
> > > > > +++ b/drivers/gpu/drm/drm_auth.c
> >
> > > > > +static int
> > > > > +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> > > > > +{
> > > > > +     if (file_priv->pid != task_pid(current) && file_priv->was_master)
> > > >
> > > > Isn't this a typo? Why should we only allow this if the opener is someone
> > > > else ... that looks like the logind approach? Or is my bolean logic parser
> > > > broken again.
> > > >
> > > Thanks for spotting it. Indeed that should be:
> > >
> > > if (file_priv->pid == task_pid(current) && file_priv->was_master)
> > >     return 0;
> >
> > Hi,
> >
> > I'm mostly just curious, why is comparing pids safe here? Maybe the
> > 'pid' member is not what userspace calls PID?
> >
> PID here is the kernel struct pid. For userspace ones we have the
> distinct task_xid_nr, task_xid_vnr and task_xid_nr_ns.
> See the documentation [1] for details.
> 
> > What if a malicious process receives a DRM fd from something similar to
> > logind, then the logind equivalent process dies,
> In the logind case, systemd ensures to bring it back up ASAP. For
> others - shrug?
> 
> > and the malicious
> > process starts forking new processes attempting to hit the same pid the
> > logind equivalent had, succeeds in that, and passes the DRM fd to that
> > fork. Is the fork then effectively in control of DRM master?
> >
> Valid point, although I believe we're covered.

Yeah, the kernel-internal pid structure maps to the shiny new pidfd stuff,
not to traditional unix pid numbers with all their problems around races
and reuse when there's not a parent/child relationship.
-Daniel

> 
> First and foremost, the pid we store is refcounted [1]. So in order
> for this to happen we need have both a) a pretty fundamental refcount
> bug for the pid to gets destroyed and b) we need to allocate another
> one at the exact same address.
> 
> Individually - pretty unlikely, combined - beyond paranoid IMHO.
> 
> Additionally, today there are other ways to cause issues. In particular:
>  - logind dies
>  - the application already has an fd (from logind)
>  - the fd is master capable
>  - application is free to do as it wishes ... apart from dropping
> master (oh noo) and setting it back up again
> 
> Or a simple application which loops over open() + drmIsMaster() + close().
> There are others, although I'd be going pretty much off-topic.
> 
> Thanks
> Emil
> 
> [1] https://elixir.bootlin.com/linux/v5.5/source/include/linux/sched.h#L1307
> [2] https://elixir.bootlin.com/linux/v5.5/source/drivers/gpu/drm/drm_file.c#L127

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
