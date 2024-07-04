Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A829277CA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 16:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED2C10E119;
	Thu,  4 Jul 2024 14:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fAW1c/lz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CA210E119
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 14:08:37 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec89b67bfcso815791fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720102115; x=1720706915; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d/dna1YwI2tOyppAmfIqHK4moMS5CFAupEDYo+VdVGo=;
 b=fAW1c/lzOfCUvDz2IfYS05rXrVAW9OmIxCPeCODtOoaEb5ufkKBKpukR9fo3LDUbAv
 Spa1auBwfM7dUnuL6xpTrOy8oNWEd9s3l/yVtNaR8J8Qk5VzWEkPPfoJF8EL0Mt9qZ6U
 jy8QGoSmrCDqo6P0jdUeZF7Dh+zW/Nzpbtdok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720102115; x=1720706915;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d/dna1YwI2tOyppAmfIqHK4moMS5CFAupEDYo+VdVGo=;
 b=iclSU9nNsQFIiIJfeiVEVcz17JndaXTFc64giTpug0NRS/DcUGDNKFYFlF4akFAOZ8
 R00FWocCREEP0nXajlh+4V/Vdvq35Pf0Q/R+oBSJr2l5XJC1+pYWfCA5xzJS3gtOQszw
 bbDcScHljaW04A7uGy2RHCqBka1OECVHIZlxJc9iyN/Pk5cOYQUh8cyKXxTUy7MWUKrQ
 DlD+fuv2fFNhTiqThi2iYkR5PsyLlelDFhsHZRzZD8FNKUB3dOsBxmekrGoOqkpIzxcB
 nuLYf60J0pYpvMW1rXkqkakNxw8gRgX/QgJCZzxn4IdpwoiMlb5lT25MXBaKsCa8cD9h
 bmzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbfvJYaGquUq2pbsOVOsjs6wmD8qiNhuU1B1XRvsKaE7UkxCOXPVkkd+YWEZis5BVKO6PVGDP7a0pZJrUd17Hyw+Ht4tWQiqpsE2Cf65LB
X-Gm-Message-State: AOJu0Yw/hGFjGfSBgVYpU2gkJyGYaqOulm1qMNJmDfW6jz1/CgJ4os+u
 rtLYG+7fd9QLDHRiB2L6Xw2vnSiVmh3lstNWTNz+vyOtssr/Sk9wHFPsjYmrdEk=
X-Google-Smtp-Source: AGHT+IEM2j7D0Cw/dID0PJyhcGNk6Tp9HxN/GJp3wK7Mq0BY2aMgy5Ouwz5Rz4LALIn2aN2SJuAENw==
X-Received: by 2002:a05:651c:10d2:b0:2ee:8915:b532 with SMTP id
 38308e7fff4ca-2ee8ee2a672mr11596431fa.3.1720102115338; 
 Thu, 04 Jul 2024 07:08:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2ca6dbsm26401275e9.38.2024.07.04.07.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 07:08:34 -0700 (PDT)
Date: Thu, 4 Jul 2024 16:08:32 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
References: <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
 <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
 <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
 <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
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

On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> On Fri, Jun 28, 2024 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > On Wed, Jun 26, 2024 at 10:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > > > > >
> > > > > > >
> > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > Basically, I often find myself needing to merge CI patches on top of
> > > > > > > > > msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > > > > > > > back before the merge and force-push.  Which isn't really how things
> > > > > > > > > should work.
> > > > > >
> > > > > > This sounds more like you want an integration tree like drm-tip. Get msm
> > > > > > branches integrated there, done. Backmerges just for integration testing
> > > > > > are not a good idea indeed.
> > >
> > > But AFAIU this doesn't help for pre-merge testing, ie. prior to a
> > > patch landing in msm-next
> > >
> > > My idea was to have a drm-ci-next managed similar to drm-misc-next, if
> > > we have needed drm/ci patches we could push them to drm-ci-next, and
> > > then merge that into the driver tree (along with a PR from drm-ci-next
> > > to Dave).
> >
> > I guess I'm confused about what kind of pre-merge testing we're talking
> > about then ... Or maybe this just doesn't work too well with the linux
> > kernel. The model is that you have some pile of trees, they're split up,
> > and testing of all the trees together is done in integration trees like
> > linux-next or drm-tip.
> 
> pre-merge: for msm we've been collecting up patches from list into a
> fast-forward MR which triggers CI before merging to msm-next/msm-fixes
> 
> Ideally drm-misc and other trees would do similar, we'd catch more
> regressions that way.  For example, in msm-next the nodebugfs build is
> currently broken, because we merged drm-misc-next at a time when
> komeda was broken:
> 
> https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> 
> If drm-misc was using pre-merge CI this would have been caught and the
> offending patch dropped.

That sounds more like we should push on the drm-misc pre-merge CI boulder
to move it uphill, than add even more trees to make it even harder to get
there long term ...

Short term it helps locally to have finer trees, but only short term and
only very locally.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
