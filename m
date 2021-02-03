Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495D30E5B2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 23:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F796EC05;
	Wed,  3 Feb 2021 22:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B0A6EC05;
 Wed,  3 Feb 2021 22:08:36 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p15so1059358wrq.8;
 Wed, 03 Feb 2021 14:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZJlDPDMrWIWcvU77LN9zrfIUHEDl26zI6D0g0M5VBNs=;
 b=KKOWlEja+/AN4ZDOQfMlGTaDqB/3f4EgGuQYgDHFonB391/crY8+r3unb4wW/tD3TT
 oHEnUmRHPmgfjU3GCIo7iH9fF/EGfw9ZHRGdTKmMsm8eFDvI5ynmtSVUs+mXqfW+EjRb
 AOzJC43ibtL00Gu7F1cyuRuUkh/tH/SNRjql146pFtizqpeIv5nPTa4PPj1SjaOZibyu
 t7VFDmkMEJ2GUOxm2PcgsHnlWCPHMjLxuhb3C28/VYbWXMOz8NTeRGILcfO6yc1oUOSC
 wv3pgZ+AXppO+vtMEztRDR2ZUdTSFtwujf2krr6GjgnflNR5jTE82rsMmBAXWJD0umND
 qZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZJlDPDMrWIWcvU77LN9zrfIUHEDl26zI6D0g0M5VBNs=;
 b=QFRh5Q3C6Pk/+3b/gokbff6B0FihUnKDZlQmEJP4og6yjznErt0ZG4bvmZn4VNmOkj
 EcKdwa/Qcap5Ic9smZhVUlXy/A2/rXemxZzl7Ga9/7Xja/1ZdlraGYM7xbrSJkIHSnQD
 cJi67ZF0aU2pjVKD//xSJptpfvANA3802PNVMo9hVFtlrlbaq3zTtLM7tiiwc6FmOqPy
 M9rp5lYXihqAI2xlItVBZETqL7pE3iF67Kyoqb/FDMGed4Xx5q7oCVvzreh8mMvLx0eC
 Oc3NsHD3X9th4x+2Gw48FYMN2TpliHfoLRht6pLXRngR9JSCMrS3TCB+2b9vK5e19pQS
 JPXw==
X-Gm-Message-State: AOAM533xACZ11krIMfud6DZOgoCBt3Tn2HaA0GzYQxSIt6cBuU7pagcf
 634jJzIg9i6QdaFWtEAMggXhFZzxWGoxNj4hpnQ=
X-Google-Smtp-Source: ABdhPJzPuTDC2UxOsfIOLS/x+mXyaWz64C5FDMl4EEVGmPuEJH3/QBYrpUjTZy1XmvRfFdOQ3sgCQ9/RIPzy4POu7w0=
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr5884454wrq.132.1612390115324; 
 Wed, 03 Feb 2021 14:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20210125234901.2730699-1-swboyd@chromium.org>
 <YBlz8Go2DseRWuOa@phenom.ffwll.local>
 <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com>
 <YBp2h2cVXrF6lBno@phenom.ffwll.local>
 <CAF6AEGvTrfYYTfReGbAm9zcBNhjZvX0tko4kZUeQcyNZv4cM6w@mail.gmail.com>
 <161238950899.76967.16385691346035591773@swboyd.mtv.corp.google.com>
In-Reply-To: <161238950899.76967.16385691346035591773@swboyd.mtv.corp.google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Feb 2021 14:11:09 -0800
Message-ID: <CAF6AEGtFpjpYoY_iu8F2z-RMJ=0+tBYo-akKJ1JbgKagBuQWtA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 1:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2021-02-03 09:29:09)
> > On Wed, Feb 3, 2021 at 2:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Feb 02, 2021 at 08:51:25AM -0800, Rob Clark wrote:
> > > > On Tue, Feb 2, 2021 at 7:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> > > > > > This is because lockdep thinks all the locks taken in lock_crtcs() are
> > > > > > the same lock, when they actually aren't. That's because we call
> > > > > > mutex_init() in msm_kms_init() and that assigns on static key for every
> > > > > > lock initialized in this loop. Let's allocate a dynamic number of
> > > > > > lock_class_keys and assign them to each lock so that lockdep can figure
> > > > > > out an AA deadlock isn't possible here.
> > > > > >
> > > > > > Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> > > > > > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > > > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > > >
> > > > > This smells like throwing more bad after initial bad code ...
> > > > >
> > > > > First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> > >
> > > Some technical on the patch itself: I think you want
> > > mutex_lock_nested(crtc->lock, drm_crtc_index(crtc)), not your own locking
> > > classes hand-rolled. It's defacto the same, but much more obviously
> > > correct since self-documenting.
> >
> > hmm, yeah, that is a bit cleaner.. but this patch is already on
> > msm-next, maybe I'll add a patch on top to change it
>
> How many CRTCs are there? The subclass number tops out at 8, per
> MAX_LOCKDEP_SUBCLASSES so if we have more than that many bits possible
> then it will fail.

conveniently MAX_CRTCS is 8.. realistically I don't *think* you'd ever
see more than 2 or 3

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
