Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261B797147B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B8810E1ED;
	Mon,  9 Sep 2024 09:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rgfa3YXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5028E10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:54:03 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6db4b602e38so24805307b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725875642; x=1726480442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1m2sX7BfiBqzLpeWlx6XO3ll4N3lihGDPxizq4a7NU4=;
 b=rgfa3YXJSak5pjF4XWZrFPofMuyPEZ6ykCiu/7GkMORdoR4g2kNW+X/voSRxVsJpOb
 n+7x8G37wXCoodkujVYFK01Ljz0nsb87kpVmP/o/YiVKedZe/0CnRvmNzjExEusDicR9
 3ubnDuXjkyKyUyWRU08vOEbN0T6xSzRO8rq5Ah+9XeZmQirjVFeieOKmwFeMWHf2Towb
 IXvC1N3Htrqv4u1mD4LKgBMWOvLTuiW1GDB6tRH5sLlU/1urFgsBoYsV4q5f8bdAizNX
 pVHMIoDeTiXEOkBIeIiDa/72aHFFCPQwfIWHB5qmZoBbjOr3c/wDWw5CYAzNL+sLlINg
 i7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725875642; x=1726480442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1m2sX7BfiBqzLpeWlx6XO3ll4N3lihGDPxizq4a7NU4=;
 b=Ebnt50UJJa0fE9uMfTbc9TBJLRB7sEbu8/J9+xsSUzpLZ3W35Jr0InDenKMLNdsOJR
 pni2RhYX8yCgJb3ZG8nEmzggux5Z3NViHLpYkE0wfTQR1eW/SNCRm8b5xNadzYlBe086
 SfTrdFj5UdyIjGLpI4Mbpt0nCXB02VD8OE16294E+rliup62j43xzCsgQiJuKmgyWvIH
 BHK+XMjhh277vx7v3JH18dTIpxtKFU2PYFGehMUr0xfwsVcX3tzPX74aVQkL5hcVYEzw
 JKvGWu/HMOf6b+nk2V9xVx9jI08Xb98QHwAalKXxE7Sb5IxGwPRTUeljCn9QL0wilSQa
 xKUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ6Q7ZsIDJ9MncY4y15oU+FDofGMkR7W9Q35nTr2Fdr2Y2Mz0jDJRui9GMfDw1G1asRrOhhQ8aL5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpyuKhX41LICdCdYyy8eP8rl5idYvgrwZvI37VdSOkI83UVbHE
 BiuoVOxQFZYfxHhWy4HRiOoB/GW4WAe3Jfx+es1nGcq0ECXi0IXsCnacYGkjjnTI7uF9LHfyAMV
 UoOEzvpd/Me08Xp8DHm2k/a3BZfeU54R11rfbOQ==
X-Google-Smtp-Source: AGHT+IFkI3e5aOCEYYfbUy47SA8s/v8iwBKPqI4JcCkceaqYD/eVOnyy4EITOdToiV8WH7Xi5LiGQIfvYhtzuSg/hWA=
X-Received: by 2002:a05:690c:60c5:b0:6d5:7b2f:60a0 with SMTP id
 00721157ae682-6db4516be72mr143023607b3.34.1725875642024; Mon, 09 Sep 2024
 02:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
 <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
 <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
 <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
 <ZofMlSIjFV9iGZNM@phenom.ffwll.local>
 <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
 <Zouo16MCRRCNyYAs@phenom.ffwll.local>
 <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
 <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
 <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
In-Reply-To: <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Sep 2024 12:53:50 +0300
Message-ID: <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Maxime Ripard <mripard@redhat.com>
Cc: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com> wrote:
>
> Hi,
>
> On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> > On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.vetter@f=
fwll.ch> wrote:
> > > >
> > > > On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > > > On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel.vett=
er@ffwll.ch> wrote:
> > > > > >
> > > > > > On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > > > > > On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <daniel.=
vetter@ffwll.ch> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > > > > > > > On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <d=
aniel@ffwll.ch> wrote:
> > > > > > > > > >
> > > > > > > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wro=
te:
> > > > > > > > > > > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vette=
r <daniel@ffwll.ch> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Ba=
ryshkov wrote:
> > > > > > > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Ve=
tter wrote:
> > > > > > > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen=
 Koike wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > > > > > > Basically, I often find myself needing to=
 merge CI patches on top of
> > > > > > > > > > > > > > > > > msm-next in order to run CI, and then aft=
er a clean CI run, reset HEAD
> > > > > > > > > > > > > > > > > back before the merge and force-push.  Wh=
ich isn't really how things
> > > > > > > > > > > > > > > > > should work.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > This sounds more like you want an integration t=
ree like drm-tip. Get msm
> > > > > > > > > > > > > > branches integrated there, done. Backmerges jus=
t for integration testing
> > > > > > > > > > > > > > are not a good idea indeed.
> > > > > > > > > > >
> > > > > > > > > > > But AFAIU this doesn't help for pre-merge testing, ie=
. prior to a
> > > > > > > > > > > patch landing in msm-next
> > > > > > > > > > >
> > > > > > > > > > > My idea was to have a drm-ci-next managed similar to =
drm-misc-next, if
> > > > > > > > > > > we have needed drm/ci patches we could push them to d=
rm-ci-next, and
> > > > > > > > > > > then merge that into the driver tree (along with a PR=
 from drm-ci-next
> > > > > > > > > > > to Dave).
> > > > > > > > > >
> > > > > > > > > > I guess I'm confused about what kind of pre-merge testi=
ng we're talking
> > > > > > > > > > about then ... Or maybe this just doesn't work too well=
 with the linux
> > > > > > > > > > kernel. The model is that you have some pile of trees, =
they're split up,
> > > > > > > > > > and testing of all the trees together is done in integr=
ation trees like
> > > > > > > > > > linux-next or drm-tip.
> > > > > > > > >
> > > > > > > > > pre-merge: for msm we've been collecting up patches from =
list into a
> > > > > > > > > fast-forward MR which triggers CI before merging to msm-n=
ext/msm-fixes
> > > > > > > > >
> > > > > > > > > Ideally drm-misc and other trees would do similar, we'd c=
atch more
> > > > > > > > > regressions that way.  For example, in msm-next the nodeb=
ugfs build is
> > > > > > > > > currently broken, because we merged drm-misc-next at a ti=
me when
> > > > > > > > > komeda was broken:
> > > > > > > > >
> > > > > > > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9=
520
> > > > > > > > >
> > > > > > > > > If drm-misc was using pre-merge CI this would have been c=
aught and the
> > > > > > > > > offending patch dropped.
> > > > > > > >
> > > > > > > > That sounds more like we should push on the drm-misc pre-me=
rge CI boulder
> > > > > > > > to move it uphill, than add even more trees to make it even=
 harder to get
> > > > > > > > there long term ...
> > > > > > > >
> > > > > > > > Short term it helps locally to have finer trees, but only s=
hort term and
> > > > > > > > only very locally.
> > > > > > >
> > > > > > > The path to have fewer trees (ideally only one for all of drm=
) is to
> > > > > > > use gitlab MRs to land everything :-)
> > > > > > >
> > > > > > > drm-ci-next is only a stop-gap.. but one that we need.  The
> > > > > > > ${branchname}-external-fixes trick covers _most_ cases where =
we need
> > > > > > > unrelated patches (ie. to fix random ToT breakage outside of =
drm or in
> > > > > > > core drm), but it doesn't help when the needed changes are ym=
l
> > > > > > > (because gitlab processes all the yml before merging the
> > > > > > > -external-fixes branch).  This is where we need drm-ci-next, =
otherwise
> > > > > > > we are having to create a separate MR which cherry-picks drm/=
ci
> > > > > > > patches for doing the CI.  This is a rather broken process.
> > > > > >
> > > > > > So what I don't get is ... if we CI drm-misc, how does that not=
 help
> > > > > > improve the situation here? Step one would be post-merge (i.e. =
just enable
> > > > > > CI in the repo), then get MRs going.
> > > > >
> > > > > I guess post-merge is better than nothing.. but pre-merge is bett=
er.
> > > > >
> > > > > post-merge can work if you have a "sheriff" system where someone
> > > > > (perhaps on a rotation) is actively monitoring results and "rever=
t and
> > > > > ask questions later" when something breaks.  Pre-merge ensures th=
e
> > > > > interested party is involved in the process ;-)
> > > >
> > > > So ... make that happen? And it doesn't have to be for all of drm-m=
isc,
> > > > mesa after all switched over to MR also on a bit a driver/area basi=
s. So
> > > > agreeing among all drm-ci folks to use gitlab MR in drm-misc for pr=
e-merge
> > > > testing shouldn't be that hard to make happen. And unlike a separat=
e
> > > > branch it's not some kind of detour with a good chance to get stuck=
 in a
> > > > local optimum.
> > >
> > > Tree vs branch doesn't really have much in the way of distinction,
> > > modulo gitlab permissions.  In that it doesn't do much good if drm/ci
> > > patches are landing on a different branch.
> > >
> > > I guess what you are suggesting is that we have a single tree/branch
> > > that drm/ci + drm/msm + (plus whoever else wants to get in on the
> > > drm/ci, so probably at least vkms) lands patches into via gitlab MRs?
> >
> > This again brings a separate CI-enabled tree. I think it has been
> > suggested to start with enabling DRM CI for drm-misc branches. Then we
> > can possibly start landing MRs with CI testing (probably starting with
> > vkms).
>
> It's something we've discussed with Sima for a while, but enabling CI on
> drm-misc at some point will make sense so we could just as well start
> now.
>
> The biggest unknown at the moment to start doing so is how we could keep
> drm-tip and the rerere repo with MR.

Let's do a slow start and begin with post-merge testing. At least this
gives us an idea of how stable it is (and what does it take to keep it
green). Maybe we can perform post-merge testing for both drm-misc and
drm-tip.


--=20
With best wishes
Dmitry
