Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8541458E9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 16:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298F26F591;
	Wed, 22 Jan 2020 15:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653A46F591
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 15:39:52 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id z8so7085124ioh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LPYMn23CRSFn9FsOGZ7gK4asj7UBREvKz/DGAe11fPc=;
 b=RyiQn2S8ruDG+XtGvObpDYV9vu9w0E58M95EKgXIYYDw3yggczNST3pomddcxI3e5N
 qFev6c2QX1/BRcbgzyHZ4+CYA4/WCAtFwDzML2WXoePqPCSirJR6ICxgtGFzM6tpa3z2
 MaPM2+Hzr1Yljed371ODQ34ocLwuqCclh5QLS/7jzne8GqwhDaR4A6PEz4hNy0IxnX/H
 p4IdYxCjjhOuHvvJSbsCQb4NtXgbEaH1foiNPL4C2ALZav8OE15gIXonWiS5rjlTaY6K
 aiBEN1wpp+rFDbxS9XrZauwj66o/8OBeb8Ap5ID/7QA6HhharRcCljgJwK2jV9QI+UVc
 rXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LPYMn23CRSFn9FsOGZ7gK4asj7UBREvKz/DGAe11fPc=;
 b=sCsd02Eg3daiyyPttO/0FgzvjEzlnRRABbA9bDwhBuSDKpcdMEsWF9kGFf3z+pHJUC
 sWSnhhvgV/DvpT+XKn5dqNEUCdsv0jEyvN7w4w5AW+SPnbSSlPtw/QwJwe44nxg1Qf/G
 +Tc4rWhghw3E3wLs91/o8Bas4C9cB4D3uuZJ8IIACK9RrSxKYq52MnCHKjp5MoTe/OoH
 m4OnMrf6LBBnt5tTjQIuYq2ONvZgrucl/zzf5q80sOX5mnyfelCdfx3EtlBqHTssLD56
 0LDNoP52rMdSDMSBlYCeoX5BgbURUCD3XWTKshCvkZ+V/n1HZOT5DmCdani+r5EFhF0L
 GSng==
X-Gm-Message-State: APjAAAWXEX0R56ISKZb5p1iPsNy8t1dmOMvHQHTtMOBDrnX2eoIs7TM8
 m7IEhmnClW+vXvEEqgPGTufxeSooh4jS02j5jK19dQ==
X-Google-Smtp-Source: APXvYqxAxS2CI9/d/sldMCQqGwDAJn9VbNJWNWBDGVEUCaxn0o75SVMwDB5QnEMReXW5IEMAMcbDpmf7Ymppok/EA4o=
X-Received: by 2002:a02:4e46:: with SMTP id r67mr7641640jaa.118.1579707591669; 
 Wed, 22 Jan 2020 07:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20200114172155.215463-1-sean@poorly.run>
 <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
 <20200120135621.34346e38@gandalf.local.home>
 <20200122080650.GM43062@phenom.ffwll.local>
In-Reply-To: <20200122080650.GM43062@phenom.ffwll.local>
From: Sean Paul <sean@poorly.run>
Date: Wed, 22 Jan 2020 10:39:15 -0500
Message-ID: <CAMavQKKByEeG=i95nccVQDLNUjKFO+rkcGMSv0hG_SyyZvv6Pw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 3:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jan 20, 2020 at 01:56:21PM -0500, Steven Rostedt wrote:
> > On Thu, 16 Jan 2020 07:27:22 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Tue, Jan 14, 2020 at 12:21:43PM -0500, Sean Paul wrote:
> > > > From: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > > > of DRM logs for a specified set of debug categories. The user writes a
> > > > bitmask of debug categories to the "trace_mask" node and can read log
> > > > messages from the "trace" node.
> > > >
> > > > These nodes currently exist in debugfs under the dri directory. I
> > > > intended on exposing all of this through tracefs originally, but the
> > > > tracefs entry points are not exposed, so there's no way to create
> > > > tracefs files from drivers at the moment. I think it would be a
> > > > worthwhile endeavour, but one requiring more time and conversation to
> > > > ensure the drm traces fit somewhere sensible.
> > >
> > > Hm, since the idea is to ship this in production environments debugfs is
> > > out. sysfs is also kinda the wrong thing, so maybe trying to get this
> > > stuffed into tracefs is actually the way to go?
> > >
> >
> > Why not use normal tracepoints and the tracing infrastructure? You can
> > add your own instance as rasdaemon does, which isn't affected by other
> > tracing. There's code now to even create these instances and enable and
> > disable events from within the kernel.
> >
> >   https://lore.kernel.org/lkml/1574276919-11119-1-git-send-email-divya.indi@oracle.com/
>
> Hm, without looking at the details this indeed seems like the thing we
> want ... Sean?

Ohh indeed, I think we could make this work. Thanks for the pointer, Steven!

The only item that needs sorting is: how does userspace select which
debug events are traced. I think we could solve both with another
module parameter to sit beside drm.debug with the same semantics (call
it drm.trace)?


Sean

> -Daniel
>
> >
> > As this is tracefs, you can mount it without even compiling in debugfs.
> >
> > -- Steve
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
