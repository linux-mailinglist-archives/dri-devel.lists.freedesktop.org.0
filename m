Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D69179C6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F1110E7A1;
	Wed, 26 Jun 2024 07:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XrFVhHcn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6374F10E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:32:48 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3672ab915bdso24645f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719387167; x=1719991967; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9/0LrueOLT9PACfMvTHobpXZcLo+P6QTn/E1HNalgYg=;
 b=XrFVhHcn/ADMstEx19DrKtoEpxT9xw7THa3BlQSK67VgoknPAl8ZMN7ACd0Ne95H3y
 ffd3+Xj0GMvBgXjI5Ic7m4wngv9YyDOF4nrvh72r/dpq6JUidhYNUaiDBbPXwM8nNF5w
 cNdaJ3lwFU0cVmLTtjac0JKIoJL+XWQeQ44OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719387167; x=1719991967;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9/0LrueOLT9PACfMvTHobpXZcLo+P6QTn/E1HNalgYg=;
 b=gCcIChX3M0fbN7xDTGHRZwgPDvtv065Rwv7bcGtC9hTRstJlqlCUxkm9whqywLEyzq
 2+jl2kASZ22nyJlYZg24R4ZTCIw5qArk0YAhtu970V4iuyMjxL2M1LWoBzjy0lJn/PH9
 PEdL5dGdFc8RNYAMhC3oT1BOjTRyiFq8+wMSI//+UNnwjUh2vsG/oF6PVnYnhvgDDe07
 pyPCVy2h7QEyv2x4kUZUfQOh7P6DVs3OvOoCZH/0h2ueOJH+1Lgf0FkRP3nq9VbfJjXo
 3w/VEjaVSKVBBdIi9fsJFcO6y+XnVGi9GLGCFMN4odvNcUs32d6sN6acRKVUobKio1yv
 sBwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsjLgKTi5e95KTq3Y5yZ4ARlL8TrPyP/PhGjjVbaGKOrze5F1RHVIRbRou252U+p2gRv/luvJsZPKsD+TdNpe9HJj9ZAt/ROe07Sj2qw8/
X-Gm-Message-State: AOJu0YwPTXjb2QuGLJ4qlWuzn1Bqhie6ESLEipBSYIj43AKWzEGz6Qpm
 D9kCSsioEgKNKuHbQL3+/XRBXxmYWkxz1D/nSs15F1KrVXXjF8Dt78argLvd1zw=
X-Google-Smtp-Source: AGHT+IEjm27eE56RraAC2vbxAwlvJ+iVa1opSPFPO+Hding4xdknehogFzyefdqgrVC0LHVy91IRjg==
X-Received: by 2002:a05:6000:1fa9:b0:365:ca95:b6cd with SMTP id
 ffacd0b85a97d-366e2aa64ddmr7463827f8f.7.1719387166664; 
 Wed, 26 Jun 2024 00:32:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a2f6977sm15020476f8f.80.2024.06.26.00.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:32:46 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:32:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helen Koike <helen.koike@collabora.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: Time for drm-ci-next?
Message-ID: <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
 <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
 <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
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

On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> 
> 
> On 24/06/2024 02:34, Vignesh Raman wrote:
> > Hi,
> > 
> > On 15/03/24 22:50, Rob Clark wrote:
> > > On Fri, Mar 15, 2024 at 2:28 AM Jani Nikula
> > > <jani.nikula@linux.intel.com> wrote:
> > > > 
> > > > On Thu, 14 Mar 2024, Rob Clark <robdclark@gmail.com> wrote:
> > > > > When we first merged drm/ci I was unsure if it would need it's own
> > > > > -next branch.  But after using it for a couple releases, a few times
> > > > > I've found myself wanting to backmerge drm/ci changes without
> > > > > necessarily backmerging all of drm-misc-next.
> > > > > 
> > > > > So, maybe it makes some sense to have a drm-ci-next branch that
> > > > > driver-maintainers could back-merge as-needed?
> > > > 
> > > > That's a crossmerge instead of a backmerge, and I feel that could get
> > > > messy. What if folks crossmerge drm-ci-next but it gets rejected for
> > > > drm-next? Or the baselines are different, and the crossmerge pulls in
> > > > way more stuff than it should?
> > > 
> > > Yeah, it would defeat the point a bit of drm-ci-next was on too new of
> > > a baseline, the whole point is to be able to merge CI changes without
> > > pulling in unrelated changes.  So drm-ci-next would need to base on
> > > something older, like the previous kernel release tag.
> > > 
> > > > IMO the route should be drm-ci-next -> pull request to drm-next ->
> > > > backmerge drm-next to drivers and drm-misc-next.
> > > > 
> > > > I'm not opposed to having drm-ci-next at all, mainly indifferent, but I
> > > > question the merge flows. And then the question becomes, does my
> > > > suggested merge flow complicate your original goal?
> > > > 
> > > 
> > > I guess we could avoid merging drm-ci-next until it had been merged
> > > into drm-next?

Yes, either dedicated topic branch or only backmerging drm-next please,
that's how we're handling the flow for all other subtrees too.

> > > Basically, I often find myself needing to merge CI patches on top of
> > > msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > back before the merge and force-push.  Which isn't really how things
> > > should work.

This sounds more like you want an integration tree like drm-tip. Get msm
branches integrated there, done. Backmerges just for integration testing
are not a good idea indeed.

> > There are many CI patches merged recently to drm-misc-next.
> > With the GitLab 18.0 release, CI/CD pipeline configurations must
> > transition from using the deprecated CI_JOB_JWT to the new id_tokens
> > method, as the former will be removed.
> > 
> > Without the below commit kernel-build job pipelines fail in drm-ci,
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cc806b74466672a9bbd4e9a04265d44eb506b686
> > 
> > We need to cherry pick only this commit to fix this issue.
> > So it would be beneficial to have a drm-ci-next branch.
> > 
> > Regards,
> > Vignesh
> 
> 
> I don't mind using a drm-ci-next branch if it is created.

What exactly is the issue in backmerging drm-misc-next (well through
drm-next really)?

Also if there is an issue, generally we do ad-hoc topic branches.

I'm very very skeptical of boutique trees with tiny focus, we've had that
before drm-misc, it's a mess. Definitely no enthusiasm for getting back
to that kind of world.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
