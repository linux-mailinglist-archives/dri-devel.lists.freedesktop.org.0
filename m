Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F79929E82
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 10:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92B910E2D9;
	Mon,  8 Jul 2024 08:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WMTbCRls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E8F10E2D9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 08:52:43 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52ea5185ba7so343599e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 01:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720428762; x=1721033562; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lFE86WZSp3JEzrRPlKfWS/fFW4ZMBFxHZg4sDLK8TCA=;
 b=WMTbCRlsw4gXz+5y3ymN/2UcB2Sc7bPkP0VLMuLXBilDJoQaNJJkU3DIAhzjlr+3IA
 +VSVuvz9cviSDKK2teG1/V17d8FZL5ciSt/A2lqNhqM5BKkT8K5XL9SzmCOYtl/Q5fgC
 tK9ANKAsJEKvkt/hYWEhlNz8axxDDNZSy/4Cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720428762; x=1721033562;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lFE86WZSp3JEzrRPlKfWS/fFW4ZMBFxHZg4sDLK8TCA=;
 b=Y6TZBaThFW+4uHL0e5Xd6Fk53NgtafD7n1J1REd1sfLOs1FgNT8GRXdfOmZol4fS5Z
 +BSLOrO/WPLpOiqXamotHAD4JJcV219o/kugnP8k03hFE/ULieVV7zFeHiUNsK04Qf18
 1cPz7ZFpMiAXXiR5u/a/47IPnTUqvb0FcCt3m1YO0+2rqw9kQdc3sOAhlZa5++gm6xxw
 s3JkAoNdZ612BX71bqwzvvueYemk+1GEiBwqd9sYc7AU63G2Wyz+InyuM71N6MDKoQ3T
 PvW86XpxffBOpYQTSD4L6itgMQ7z+v/4q9F4b6St53/xLg0CXyOkG/Ow94EiIDxdCWQp
 FTPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0mdmIT8nn1Q8k57C0o0ctE9/doOENereCWvfthnkUqQaizCC9uRZvCMM4wy0tmOzlF4szSM0cqGMFUqt/sOiZxgMGxJ55ZdFaYjbO2j9t
X-Gm-Message-State: AOJu0YzACkrzf33nQxwrj29xH+J7o56pZVAB4oAI8nZjf2c7HmrQ5A3t
 +GQ/XxRGE/6DSlJqlOpJCz20EjRxibUM6khJt35PvOdUA389wg4C3G6JDDIhdW4=
X-Google-Smtp-Source: AGHT+IHbMM/eoLoU7QnXWDaQ4cqieXM1e/6mMypL5AfoOk9SPk1MkXshcYh/oZ3kVphJ7k/ylftDNA==
X-Received: by 2002:ac2:4209:0:b0:52c:def2:d8af with SMTP id
 2adb3069b0e04-52ea07350aemr6151426e87.4.1720428761592; 
 Mon, 08 Jul 2024 01:52:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42664e46c45sm51683065e9.18.2024.07.08.01.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 01:52:41 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:52:39 +0200
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
Message-ID: <Zouo16MCRRCNyYAs@phenom.ffwll.local>
References: <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
 <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
 <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
 <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
 <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
 <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
 <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> On Fri, Jul 5, 2024 at 3:36 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > On Thu, Jul 4, 2024 at 7:08 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > > > On Fri, Jun 28, 2024 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > > > > On Wed, Jun 26, 2024 at 10:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >
> > > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > > Basically, I often find myself needing to merge CI patches on top of
> > > > > > > > > > > > > msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > > > > > > > > > > > back before the merge and force-push.  Which isn't really how things
> > > > > > > > > > > > > should work.
> > > > > > > > > >
> > > > > > > > > > This sounds more like you want an integration tree like drm-tip. Get msm
> > > > > > > > > > branches integrated there, done. Backmerges just for integration testing
> > > > > > > > > > are not a good idea indeed.
> > > > > > >
> > > > > > > But AFAIU this doesn't help for pre-merge testing, ie. prior to a
> > > > > > > patch landing in msm-next
> > > > > > >
> > > > > > > My idea was to have a drm-ci-next managed similar to drm-misc-next, if
> > > > > > > we have needed drm/ci patches we could push them to drm-ci-next, and
> > > > > > > then merge that into the driver tree (along with a PR from drm-ci-next
> > > > > > > to Dave).
> > > > > >
> > > > > > I guess I'm confused about what kind of pre-merge testing we're talking
> > > > > > about then ... Or maybe this just doesn't work too well with the linux
> > > > > > kernel. The model is that you have some pile of trees, they're split up,
> > > > > > and testing of all the trees together is done in integration trees like
> > > > > > linux-next or drm-tip.
> > > > >
> > > > > pre-merge: for msm we've been collecting up patches from list into a
> > > > > fast-forward MR which triggers CI before merging to msm-next/msm-fixes
> > > > >
> > > > > Ideally drm-misc and other trees would do similar, we'd catch more
> > > > > regressions that way.  For example, in msm-next the nodebugfs build is
> > > > > currently broken, because we merged drm-misc-next at a time when
> > > > > komeda was broken:
> > > > >
> > > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> > > > >
> > > > > If drm-misc was using pre-merge CI this would have been caught and the
> > > > > offending patch dropped.
> > > >
> > > > That sounds more like we should push on the drm-misc pre-merge CI boulder
> > > > to move it uphill, than add even more trees to make it even harder to get
> > > > there long term ...
> > > >
> > > > Short term it helps locally to have finer trees, but only short term and
> > > > only very locally.
> > >
> > > The path to have fewer trees (ideally only one for all of drm) is to
> > > use gitlab MRs to land everything :-)
> > >
> > > drm-ci-next is only a stop-gap.. but one that we need.  The
> > > ${branchname}-external-fixes trick covers _most_ cases where we need
> > > unrelated patches (ie. to fix random ToT breakage outside of drm or in
> > > core drm), but it doesn't help when the needed changes are yml
> > > (because gitlab processes all the yml before merging the
> > > -external-fixes branch).  This is where we need drm-ci-next, otherwise
> > > we are having to create a separate MR which cherry-picks drm/ci
> > > patches for doing the CI.  This is a rather broken process.
> >
> > So what I don't get is ... if we CI drm-misc, how does that not help
> > improve the situation here? Step one would be post-merge (i.e. just enable
> > CI in the repo), then get MRs going.
> 
> I guess post-merge is better than nothing.. but pre-merge is better.
> 
> post-merge can work if you have a "sheriff" system where someone
> (perhaps on a rotation) is actively monitoring results and "revert and
> ask questions later" when something breaks.  Pre-merge ensures the
> interested party is involved in the process ;-)

So ... make that happen? And it doesn't have to be for all of drm-misc,
mesa after all switched over to MR also on a bit a driver/area basis. So
agreeing among all drm-ci folks to use gitlab MR in drm-misc for pre-merge
testing shouldn't be that hard to make happen. And unlike a separate
branch it's not some kind of detour with a good chance to get stuck in a
local optimum.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
