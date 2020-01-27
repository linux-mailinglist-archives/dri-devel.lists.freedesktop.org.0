Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D003214A05B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08D86EA69;
	Mon, 27 Jan 2020 08:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6026EA66
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 08:59:00 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g1so5913294wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kzzB2PhGTHEVjkPmVvYdZOwW5VQvg0MeP+ADsEN8OaY=;
 b=hw4UvnyYSIaD30y6JJwPGbcibnVp10YBe5KS8hAmaL1yD+J39LMzdUSlBWSyG6PGgC
 WEumb9Mvni2YdNMY+2FQqj/Ozv2TrypspNPsz5gzmTFSxBFqQ3RFwH3NSLadiuhQ9mzU
 HPVvIvkAqK21BxrxirxGKpURml/tq01Kh2Whc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kzzB2PhGTHEVjkPmVvYdZOwW5VQvg0MeP+ADsEN8OaY=;
 b=S94mhg+aRiqtrcOCq0rvl65PsYJP23xK/NoPymISSh3OdjLh2tQSXuv5h27blGY+M9
 VD0O0XSlZrslXV1zrMWC8hBqEm8wUFN4JHCEewLB2cCs3N2XRctRdPLmLjgXrS7PbdNp
 9vASX8VlJSe4YR8LvPVjHP4lbRXk8ta9ZMJaQ8V3TeowkLnbaOxfiHqYnugFxfzNI+tX
 NidhaZ5nDkOSP7QMYewVNbpmaaK6k0yu9EKbE7rLbN3D6Kr4ryOVNYtdqWEjczV13QCS
 sJwftqEOq4FHiE8vo1hmOBrPEjWwSWAxU72zLxP3vYGVod8JVo51v53Fd2v33bSdWf4i
 7YHg==
X-Gm-Message-State: APjAAAXymMDN0w1hZZY92brzJ1gdVKSIxsF1LF1C/9m+XAtix2LPgazE
 uLrgsHttWp4C2tSNF/J18pXJHw==
X-Google-Smtp-Source: APXvYqywk8J+Ef6W1i0fYToXbYmTALWuoJBHc5N7WAb3LauXHSjhxgBNb5SexeyFYC87QwSbxSMmFw==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr13484899wmg.16.1580115539053; 
 Mon, 27 Jan 2020 00:58:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d10sm20088454wrw.64.2020.01.27.00.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 00:58:58 -0800 (PST)
Date: Mon, 27 Jan 2020 09:58:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible
 via debugfs
Message-ID: <20200127085855.GS43062@phenom.ffwll.local>
References: <20200114172155.215463-1-sean@poorly.run>
 <20200116062722.GA8400@dvetter-linux.ger.corp.intel.com>
 <20200120135621.34346e38@gandalf.local.home>
 <20200122080650.GM43062@phenom.ffwll.local>
 <CAMavQKKByEeG=i95nccVQDLNUjKFO+rkcGMSv0hG_SyyZvv6Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMavQKKByEeG=i95nccVQDLNUjKFO+rkcGMSv0hG_SyyZvv6Pw@mail.gmail.com>
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
Cc: linux-doc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 10:39:15AM -0500, Sean Paul wrote:
> On Wed, Jan 22, 2020 at 3:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jan 20, 2020 at 01:56:21PM -0500, Steven Rostedt wrote:
> > > On Thu, 16 Jan 2020 07:27:22 +0100
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > > On Tue, Jan 14, 2020 at 12:21:43PM -0500, Sean Paul wrote:
> > > > > From: Sean Paul <seanpaul@chromium.org>
> > > > >
> > > > > This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> > > > > of DRM logs for a specified set of debug categories. The user writes a
> > > > > bitmask of debug categories to the "trace_mask" node and can read log
> > > > > messages from the "trace" node.
> > > > >
> > > > > These nodes currently exist in debugfs under the dri directory. I
> > > > > intended on exposing all of this through tracefs originally, but the
> > > > > tracefs entry points are not exposed, so there's no way to create
> > > > > tracefs files from drivers at the moment. I think it would be a
> > > > > worthwhile endeavour, but one requiring more time and conversation to
> > > > > ensure the drm traces fit somewhere sensible.
> > > >
> > > > Hm, since the idea is to ship this in production environments debugfs is
> > > > out. sysfs is also kinda the wrong thing, so maybe trying to get this
> > > > stuffed into tracefs is actually the way to go?
> > > >
> > >
> > > Why not use normal tracepoints and the tracing infrastructure? You can
> > > add your own instance as rasdaemon does, which isn't affected by other
> > > tracing. There's code now to even create these instances and enable and
> > > disable events from within the kernel.
> > >
> > >   https://lore.kernel.org/lkml/1574276919-11119-1-git-send-email-divya.indi@oracle.com/
> >
> > Hm, without looking at the details this indeed seems like the thing we
> > want ... Sean?
> 
> Ohh indeed, I think we could make this work. Thanks for the pointer, Steven!
> 
> The only item that needs sorting is: how does userspace select which
> debug events are traced. I think we could solve both with another
> module parameter to sit beside drm.debug with the same semantics (call
> it drm.trace)?

Yeah if there's no official way (in tracefs) for this drm.trace sounds reasonable.
-Daniel

> 

> 
> Sean
> 
> > -Daniel
> >
> > >
> > > As this is tracefs, you can mount it without even compiling in debugfs.
> > >
> > > -- Steve
> >
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
