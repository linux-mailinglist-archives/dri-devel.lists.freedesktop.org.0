Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF49286DC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6A910E19E;
	Fri,  5 Jul 2024 10:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LcOqIKU9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA41F10E19E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:36:09 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52e98c72d2bso89894e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720175768; x=1720780568; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JA26a8sdOG+yZgXXjW2qnirJek56MF6btsv6ppP6NTQ=;
 b=LcOqIKU9iK4Ks4G+eBwSuhHeDPXEGS4r2nqR+RQr0Z8LyRA3WdQaVL7mPvtt05KIIE
 M1MSNZuMKz1Bm1/41ZrTgP2+k+weQ4YpiCT85wVNGtjpxXLHxwu8m0ckgLSsOjOZkd65
 6U+L0KVgA4X0Y/EUKvP3YbLObCInHa8INDVro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720175768; x=1720780568;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JA26a8sdOG+yZgXXjW2qnirJek56MF6btsv6ppP6NTQ=;
 b=lQ8w9jY+qY7QUuSMuT0bC4u5zTOtzUACuw3+4vcyXv2NLULVfrKo5aCJ42n6zoJAzl
 scERuN8DqKveIREQHKyncOYF97xdLfW7nvUCG4kDAmUgsEt/UN6R/LiZsxxCRjPAyUEZ
 Toj4w00Dh2+NJjBjU4szV5Z9vv+L+MkLI+5wbnNWU9obBgktpT7AY0YZzk5KAC/y0hC8
 s0t+maJWI+cfdJerqOmJMBEvvgiAltYFvS0KktMYq5k7jSPec4o56o734g/9tfFPIpK8
 mFRYurWpdcCYNtZHUhHiKKvRtnvLaHO+KNF4pEV8QUFOA+Rw0Cr/Bc+8hzdkpPshOd7O
 uERQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhrbyEubbj3jTz2/Tic41Jp9ftAZzpIGhdxJhw2vfCmviHE0lO0TXestgYY9IGRbVatP6oOl5Eqj7AVbwvUGSb/ypPKRpbh0XDWHh9C1l4
X-Gm-Message-State: AOJu0Yw7W+laJ98gm6hWxvGgPfHT1QQ89AS1gW0hCUk644VvS7Sz10eg
 LIw3tv3CUOM3pWbegqymeIe19p5jRdhZCNvdtpzvliZHawd7GiJE1i1ICBIrFHc=
X-Google-Smtp-Source: AGHT+IFdRhioMJHrxK5cMcGCL3lR+441Ue7C6qrzigAqBrd2pN0HpFOlrlOoJkHxaJAv+xnv/lVuuw==
X-Received: by 2002:ac2:44d9:0:b0:52b:9e52:17f7 with SMTP id
 2adb3069b0e04-52ea077c2d8mr2312866e87.6.1720175767685; 
 Fri, 05 Jul 2024 03:36:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a25198dsm56523955e9.32.2024.07.05.03.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:36:07 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:36:05 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
References: <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
 <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
 <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
 <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
 <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> On Thu, Jul 4, 2024 at 7:08 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > On Fri, Jun 28, 2024 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > > On Wed, Jun 26, 2024 at 10:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > Hi,
> > > > > > > > > >
> > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > Basically, I often find myself needing to merge CI patches on top of
> > > > > > > > > > > msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > > > > > > > > > back before the merge and force-push.  Which isn't really how things
> > > > > > > > > > > should work.
> > > > > > > >
> > > > > > > > This sounds more like you want an integration tree like drm-tip. Get msm
> > > > > > > > branches integrated there, done. Backmerges just for integration testing
> > > > > > > > are not a good idea indeed.
> > > > >
> > > > > But AFAIU this doesn't help for pre-merge testing, ie. prior to a
> > > > > patch landing in msm-next
> > > > >
> > > > > My idea was to have a drm-ci-next managed similar to drm-misc-next, if
> > > > > we have needed drm/ci patches we could push them to drm-ci-next, and
> > > > > then merge that into the driver tree (along with a PR from drm-ci-next
> > > > > to Dave).
> > > >
> > > > I guess I'm confused about what kind of pre-merge testing we're talking
> > > > about then ... Or maybe this just doesn't work too well with the linux
> > > > kernel. The model is that you have some pile of trees, they're split up,
> > > > and testing of all the trees together is done in integration trees like
> > > > linux-next or drm-tip.
> > >
> > > pre-merge: for msm we've been collecting up patches from list into a
> > > fast-forward MR which triggers CI before merging to msm-next/msm-fixes
> > >
> > > Ideally drm-misc and other trees would do similar, we'd catch more
> > > regressions that way.  For example, in msm-next the nodebugfs build is
> > > currently broken, because we merged drm-misc-next at a time when
> > > komeda was broken:
> > >
> > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> > >
> > > If drm-misc was using pre-merge CI this would have been caught and the
> > > offending patch dropped.
> >
> > That sounds more like we should push on the drm-misc pre-merge CI boulder
> > to move it uphill, than add even more trees to make it even harder to get
> > there long term ...
> >
> > Short term it helps locally to have finer trees, but only short term and
> > only very locally.
> 
> The path to have fewer trees (ideally only one for all of drm) is to
> use gitlab MRs to land everything :-)
> 
> drm-ci-next is only a stop-gap.. but one that we need.  The
> ${branchname}-external-fixes trick covers _most_ cases where we need
> unrelated patches (ie. to fix random ToT breakage outside of drm or in
> core drm), but it doesn't help when the needed changes are yml
> (because gitlab processes all the yml before merging the
> -external-fixes branch).  This is where we need drm-ci-next, otherwise
> we are having to create a separate MR which cherry-picks drm/ci
> patches for doing the CI.  This is a rather broken process.

So what I don't get is ... if we CI drm-misc, how does that not help
improve the situation here? Step one would be post-merge (i.e. just enable
CI in the repo), then get MRs going.

> I could conceivably see a scenario where we are landing both drm/ci
> and drm/msm changes via the same tree.  But only if we were using
> gitlab MRs and CI for landing all changes in that tree.

Yeah that's kinda the world I'm hoping for.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
