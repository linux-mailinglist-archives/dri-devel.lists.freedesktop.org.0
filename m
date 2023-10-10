Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01CB7BF9DE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 13:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEA510E163;
	Tue, 10 Oct 2023 11:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EDC10E163
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 11:37:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-405e48d8e72so9689775e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1696937820; x=1697542620; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z2egB0rZ6YC6bcCuUgN70KNph8HJM7sZBmKz+gJR3Zw=;
 b=IxFiZc8EAxloDId1TVyFMV3WWFk9iZahTUU/87lVlEMTei8WJXoiEY/9HQxC061JJN
 c6qlUyWUbjxEOY8JQ9fF5Zn/fhX9AYL+toQ6Vuo8GWlGpdwO15D87fwEZVxirBg9qkIn
 kGNrQw95DPKmejvabptaIFnJmCvY8sxJrvt2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696937820; x=1697542620;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2egB0rZ6YC6bcCuUgN70KNph8HJM7sZBmKz+gJR3Zw=;
 b=W0FhzEtJjZ19IlKIqNkWp0MS8rJDzqld3Fep3uaYZMr9JmyJWF1Pn/4+4XqvxH8E+S
 nhsxOi9+Ioq/w/8+RYiqH4BzBWiklz9Euj5AvpZwFUTvzzbBfanzHeMN/6m4j2dtFv77
 xOJzXQSN/T+WXSSKgVhOr8v1IsfrgCsumeD1U9BR2sl/5rWzPIMVxHAw7N8MtEBQE0Ny
 Bu+sEOYv7I54MK3ow78rBu4v96oZUw4lJHJoNY5U6XgoIgaAsDxtBOhq/vZC2a3qOx9k
 sVczMCHn1TB5cI7w05x0XwOiy4+R9NWzGIsIazVYZZBqmo0ur+2Tu9vqTglI0t4/mWZC
 UDUQ==
X-Gm-Message-State: AOJu0Yxo+19A4LNve4ByaB1VFMVPsPU6ZANV8uW+SYEyGUeZjnya5OM2
 KiHuNbFvS2EBc/fXTCPOJVHj6SqPdOgEBXpZ97Y=
X-Google-Smtp-Source: AGHT+IFqOCgI8a4F9T4/jUpSB1KqC2NL4gabiwfefNh5YrSPfRr7+QrE5Rvp92axRYevFkAys5OOFg==
X-Received: by 2002:a05:600c:3b9a:b0:3fe:21a6:a18 with SMTP id
 n26-20020a05600c3b9a00b003fe21a60a18mr16092399wms.3.1696937820417; 
 Tue, 10 Oct 2023 04:37:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 15-20020a05600c028f00b004065d67c3c9sm13998184wmk.8.2023.10.10.04.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 04:36:59 -0700 (PDT)
Date: Tue, 10 Oct 2023 13:36:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Message-ID: <ZSU3Wc4OfO_Xr6Qo@phenom.ffwll.local>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local> <ZR6M-6q_yRc-j_fG@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZR6M-6q_yRc-j_fG@intel.com>
X-Operating-System: Linux phenom 6.5.0-1-amd64 
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
Cc: Ray Strode <rstrode@redhat.com>, Ray Strode <halfline@gmail.com>,
 daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 01:16:27PM +0300, Ville Syrjälä wrote:
> On Thu, Oct 05, 2023 at 11:57:41AM +0200, Daniel Vetter wrote:
> > On Tue, Sep 26, 2023 at 01:05:49PM -0400, Ray Strode wrote:
> > > From: Ray Strode <rstrode@redhat.com>
> > > 
> > > A drm atomic commit can be quite slow on some hardware. It can lead
> > > to a lengthy queue of commands that need to get processed and waited
> > > on before control can go back to user space.
> > > 
> > > If user space is a real-time thread, that delay can have severe
> > > consequences, leading to the process getting killed for exceeding
> > > rlimits.
> > > 
> > > This commit addresses the problem by always running the slow part of
> > > a commit on a workqueue, separated from the task initiating the
> > > commit.
> > > 
> > > This change makes the nonblocking and blocking paths work in the same way,
> > > and as a result allows the task to sleep and not use up its
> > > RLIMIT_RTTIME allocation.
> > > 
> > > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2861
> > > Signed-off-by: Ray Strode <rstrode@redhat.com>
> > 
> > So imo the trouble with this is that we suddenly start to make
> > realtime/cpu usage guarantees in the atomic ioctl. That's a _huge_ uapi
> > change, because even limited to the case of !ALLOW_MODESET we do best
> > effort guarantees at best. And some drivers (again amd's dc) spend a ton
> > of cpu time recomputing state even for pure plane changes without any crtc
> > changes like dpms on/off (at least I remember some bug reports about
> > that). And that state recomputation has to happen synchronously, because
> > it always influences the ioctl errno return value.
> > 
> > My take is that you're papering over a performance problem here of the
> > "the driver is too slow/wastes too much cpu time". We should fix the
> > driver, if that's possible.
> > 
> > Another option would be if userspace drops realtime priorities for these
> > known-slow operations. And right now _all_ kms operations are potentially
> > cpu and real-time wasters, the entire uapi is best effort.
> > 
> > We can also try to change the atomic uapi to give some hard real-time
> > guarantees so that running compositors as SCHED_RT is possible, but that
> > - means a very serious stream of bugs to fix all over
> > - therefore needs some very wide buy-in from drivers that they're willing
> >   to make this guarantee
> > - probably needs some really carefully carved out limitations, because
> >   there's imo flat-out no way we'll make all atomic ioctl hard time limit
> >   bound
> > 
> > Also, as König has pointed out, you can roll this duct-tape out in
> > userspace by making the commit non-blocking and immediately waiting for
> > the fences.
> > 
> > One thing I didn't see mention is that there's a very subtle uapi
> > difference between non-blocking and blocking:
> > - non-blocking is not allowed to get ahead of the previous commit, and
> >   will return EBUSY in that case. See the comment in
> >   drm_atomic_helper_commit()
> > - blocking otoh will just block until any previous pending commit has
> >   finished
> > 
> > Not taking that into account in your patch here breaks uapi because
> > userspace will suddenly get EBUSY when they don't expect that.
> 
> The -EBUSY logic already checks whether the current commit is
> non-blocking vs. blocking commit, so I don't see how there would
> be any change in behaviour from simply stuffing the commit_tail
> onto a workqueue, especially as the locks will be still held across
> the flush.

Hm right, I forgot the patch context when I was chasing the EBUSY logic, I
thought it just pushed a nonblocking commit in somehow.

> In my earlier series [1] where I move the flush to happen after dropping
> the locks there is a far more subtle issue because currently even
> non-blocking commits can actually block due to the mutex. Changing
> that might break something, so I preserved that behaviour explicitly.
> Full explanation in the first patch there.
> 
> [1] https://patchwork.freedesktop.org/series/108668/

Yeah there's a can of tricky details here for sure ...
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
