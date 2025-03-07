Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F6A56EF9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696CA10E34E;
	Fri,  7 Mar 2025 17:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f3jcWjmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA0F10E34E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 17:27:07 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3ce868498d3so6807485ab.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 09:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741368427; x=1741973227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1XyjKm8/G4qwRZIwh+kcu9h9ApmsUGYcb8OLKz6yU0=;
 b=f3jcWjmNiKevcKdnv23iJdXmDhuS+d9rZ9eghqFsqEtJ4SIOeZBWiwsXShJDo2WDqh
 LVLzHSKtA9p2c+6zgDgOlr9e1AalPU7rRBBq5LTtWaoS1fOdo2UGEOKaDIaexZ+2e7+a
 4U/iS+Ji87XQ2c++/EXgh/WlwQarg6Z5fwcxlzX/YnJi3TmGX1sBJflkrTRZDuMWiDcY
 cx6VHerh16X92MW6kXSNHpXjLes4ehB5B9B0qfed5FilQMx05nn4c2BVgMq5yS5CuxLC
 SIx7LhgcixZ5fCgZ2EC7nP2xxIyxbkzEugUSVTkmicVORCv/PCalDc0Zm+vwwgSTpQCH
 6lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741368427; x=1741973227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1XyjKm8/G4qwRZIwh+kcu9h9ApmsUGYcb8OLKz6yU0=;
 b=eSEAIF6k0kBMBp4n3Ua72vxy7GEbJ00ErrhfoySH1iciYZnFPKNgYVWzzY6OBXgdKv
 mF+k1RBXQBoCCfNjvzqe/7Tj0D2wUzOuzjMkCqpsnvGFLP5mtNtKqhVs07TFbR6bfLng
 vmR7v1QS5WbyH0wfE47HN5YKOz+5kiYUDPMHucfT1U5K8zApZka3WofWUlaQ38BPd/jI
 YkEBku92AqPZhH0gP98nXl6WB4G+EwddWQhHDjIeWJnFt4K7nwxujg5BYgIBRmIwvIYs
 1ZqPDnJoamCa4bcz1KjjxvWSzkpk48FyKdvpT99A77ptG/AV/EH+AxZgc1o8AJsSltg1
 3RCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY1U9az6J7y+3cMi/MFzre9KRh/wWk9DfF7PgBLfhxq8kDf17rm2Baiw+I60LuymwAHnO+YLenCJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh+BC0v80fkgwQpXL+d/YNJdRzwbpxG12jYigPkTxhw05zzwcX
 KUXFTAJWxEvz5PJYePnGqLt3vZgoI3SXdyh+2gYcGCdPRx4Q4srr2FQ+LGEuaS44zCzwE6TtUKT
 fu/zdX8DIZkzfoAoj4ULP64hORU0=
X-Gm-Gg: ASbGncvv7t4zrQhcm5Kq2a4UOOTBIXUWVeqUkYZRnZmP4ld5OwdXq1mEx1ZBll4LQmT
 nCsx/cYot1LMReYG7N10TwMRPVVzCiRq8Y0Iw+WUiDguMiuJuvReYSJ8ccRbX7C4JsUjArInfar
 L9wzBRG4Y0boTCUtJE4skFXuqUew==
X-Google-Smtp-Source: AGHT+IEhI4FjSWZ8G6gXeyRhyvl/cFrI/LoO5gTUP4ztlcPEW14nKCmmAC0DIxAoojLd2XndrTsTWBb78kwuAkqXiLU=
X-Received: by 2002:a05:6e02:180b:b0:3d2:af07:c8f with SMTP id
 e9e14a558f8ab-3d4418e19dcmr57894445ab.7.1741368426479; Fri, 07 Mar 2025
 09:27:06 -0800 (PST)
MIME-Version: 1.0
References: <CAF6AEGvDFLBC6BWUdC6L1czn044EuTerPWqLib5hhRVkZyEpig@mail.gmail.com>
 <Zouo16MCRRCNyYAs@phenom.ffwll.local>
 <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
 <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
 <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
 <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
 <CAF6AEGub4O86pRM6iM5xaDKVrR57D=OCm00ifFksG1LT9a4+og@mail.gmail.com>
 <qs72n3l6l63er3d5lrxoravqbjrjllscnyhs7crb6anabvaez4@4hathpqkwnnd>
 <67c8cf4c-f224-4c24-96b2-92aaa3224321@collabora.com>
 <CAF6AEGvDc7RfZ2Y4B2oBag=MaAuUTJxjMwvD0yieA6qb42QMVQ@mail.gmail.com>
 <20250307-just-calm-centipede-b617ab@houat>
In-Reply-To: <20250307-just-calm-centipede-b617ab@houat>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Mar 2025 09:26:54 -0800
X-Gm-Features: AQ5f1JoSNiHe3CWi8qaqeRw5rMLbYdKx6MK5S-TIPqBncozh_bsUmmbgHFDSVk4
Message-ID: <CAF6AEGsaqy0rXFMTV-6nrusqK1wpV2AkHP4=fwJJC_xd7kQROA@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Maxime Ripard <mripard@redhat.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Koike <helen.koike@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, 
 Rob Clark <robdclark@chromium.org>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
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

On Fri, Mar 7, 2025 at 9:00=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> On Fri, Mar 07, 2025 at 08:42:46AM -0800, Rob Clark wrote:
> > On Tue, Sep 24, 2024 at 5:27=E2=80=AFAM Vignesh Raman
> > <vignesh.raman@collabora.com> wrote:
> > >
> > > Hi,
> > >
> > > On 12/09/24 11:18, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> > > >> On Mon, Sep 9, 2024 at 2:54=E2=80=AFAM Dmitry Baryshkov
> > > >> <dmitry.baryshkov@linaro.org> wrote:
> > > >>>
> > > >>> On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com> =
wrote:
> > > >>>>
> > > >>>> Hi,
> > > >>>>
> > > >>>> On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> > > >>>>> On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wr=
ote:
> > > >>>>>>
> > > >>>>>> On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.v=
etter@ffwll.ch> wrote:
> > > >>>>>>>
> > > >>>>>>> On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > >>>>>>>> On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel=
.vetter@ffwll.ch> wrote:
> > > >>>>>>>>>
> > > >>>>>>>>> On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > >>>>>>>>>> On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <dani=
el.vetter@ffwll.ch> wrote:
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote=
:
> > > >>>>>>>>>>>> On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <=
daniel@ffwll.ch> wrote:
> > > >>>>>>>>>>>>>
> > > >>>>>>>>>>>>> On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wro=
te:
> > > >>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter=
 <daniel@ffwll.ch> wrote:
> > > >>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Bary=
shkov wrote:
> > > >>>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vette=
r wrote:
> > > >>>>>>>>>>>>>>>>> On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koi=
ke wrote:
> > > >>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>> On 24/06/2024 02:34, Vignesh Raman wrote:
> > > >>>>>>>>>>>>>>>>>>> Hi,
> > > >>>>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>>>> On 15/03/24 22:50, Rob Clark wrote:
> > > >>>>>>>>>>>>>>>>>>>> Basically, I often find myself needing to merge =
CI patches on top of
> > > >>>>>>>>>>>>>>>>>>>> msm-next in order to run CI, and then after a cl=
ean CI run, reset HEAD
> > > >>>>>>>>>>>>>>>>>>>> back before the merge and force-push.  Which isn=
't really how things
> > > >>>>>>>>>>>>>>>>>>>> should work.
> > > >>>>>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>>>>> This sounds more like you want an integration tree =
like drm-tip. Get msm
> > > >>>>>>>>>>>>>>>>> branches integrated there, done. Backmerges just fo=
r integration testing
> > > >>>>>>>>>>>>>>>>> are not a good idea indeed.
> > > >>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>> But AFAIU this doesn't help for pre-merge testing, ie.=
 prior to a
> > > >>>>>>>>>>>>>> patch landing in msm-next
> > > >>>>>>>>>>>>>>
> > > >>>>>>>>>>>>>> My idea was to have a drm-ci-next managed similar to d=
rm-misc-next, if
> > > >>>>>>>>>>>>>> we have needed drm/ci patches we could push them to dr=
m-ci-next, and
> > > >>>>>>>>>>>>>> then merge that into the driver tree (along with a PR =
from drm-ci-next
> > > >>>>>>>>>>>>>> to Dave).
> > > >>>>>>>>>>>>>
> > > >>>>>>>>>>>>> I guess I'm confused about what kind of pre-merge testi=
ng we're talking
> > > >>>>>>>>>>>>> about then ... Or maybe this just doesn't work too well=
 with the linux
> > > >>>>>>>>>>>>> kernel. The model is that you have some pile of trees, =
they're split up,
> > > >>>>>>>>>>>>> and testing of all the trees together is done in integr=
ation trees like
> > > >>>>>>>>>>>>> linux-next or drm-tip.
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> pre-merge: for msm we've been collecting up patches from=
 list into a
> > > >>>>>>>>>>>> fast-forward MR which triggers CI before merging to msm-=
next/msm-fixes
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> Ideally drm-misc and other trees would do similar, we'd =
catch more
> > > >>>>>>>>>>>> regressions that way.  For example, in msm-next the node=
bugfs build is
> > > >>>>>>>>>>>> currently broken, because we merged drm-misc-next at a t=
ime when
> > > >>>>>>>>>>>> komeda was broken:
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L=
9520
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>>> If drm-misc was using pre-merge CI this would have been =
caught and the
> > > >>>>>>>>>>>> offending patch dropped.
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> That sounds more like we should push on the drm-misc pre-=
merge CI boulder
> > > >>>>>>>>>>> to move it uphill, than add even more trees to make it ev=
en harder to get
> > > >>>>>>>>>>> there long term ...
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> Short term it helps locally to have finer trees, but only=
 short term and
> > > >>>>>>>>>>> only very locally.
> > > >>>>>>>>>>
> > > >>>>>>>>>> The path to have fewer trees (ideally only one for all of =
drm) is to
> > > >>>>>>>>>> use gitlab MRs to land everything :-)
> > > >>>>>>>>>>
> > > >>>>>>>>>> drm-ci-next is only a stop-gap.. but one that we need.  Th=
e
> > > >>>>>>>>>> ${branchname}-external-fixes trick covers _most_ cases whe=
re we need
> > > >>>>>>>>>> unrelated patches (ie. to fix random ToT breakage outside =
of drm or in
> > > >>>>>>>>>> core drm), but it doesn't help when the needed changes are=
 yml
> > > >>>>>>>>>> (because gitlab processes all the yml before merging the
> > > >>>>>>>>>> -external-fixes branch).  This is where we need drm-ci-nex=
t, otherwise
> > > >>>>>>>>>> we are having to create a separate MR which cherry-picks d=
rm/ci
> > > >>>>>>>>>> patches for doing the CI.  This is a rather broken process=
.
> > > >>>>>>>>>
> > > >>>>>>>>> So what I don't get is ... if we CI drm-misc, how does that=
 not help
> > > >>>>>>>>> improve the situation here? Step one would be post-merge (i=
.e. just enable
> > > >>>>>>>>> CI in the repo), then get MRs going.
> > > >>>>>>>>
> > > >>>>>>>> I guess post-merge is better than nothing.. but pre-merge is=
 better.
> > > >>>>>>>>
> > > >>>>>>>> post-merge can work if you have a "sheriff" system where som=
eone
> > > >>>>>>>> (perhaps on a rotation) is actively monitoring results and "=
revert and
> > > >>>>>>>> ask questions later" when something breaks.  Pre-merge ensur=
es the
> > > >>>>>>>> interested party is involved in the process ;-)
> > > >>>>>>>
> > > >>>>>>> So ... make that happen? And it doesn't have to be for all of=
 drm-misc,
> > > >>>>>>> mesa after all switched over to MR also on a bit a driver/are=
a basis. So
> > > >>>>>>> agreeing among all drm-ci folks to use gitlab MR in drm-misc =
for pre-merge
> > > >>>>>>> testing shouldn't be that hard to make happen. And unlike a s=
eparate
> > > >>>>>>> branch it's not some kind of detour with a good chance to get=
 stuck in a
> > > >>>>>>> local optimum.
> > > >>>>>>
> > > >>>>>> Tree vs branch doesn't really have much in the way of distinct=
ion,
> > > >>>>>> modulo gitlab permissions.  In that it doesn't do much good if=
 drm/ci
> > > >>>>>> patches are landing on a different branch.
> > > >>>>>>
> > > >>>>>> I guess what you are suggesting is that we have a single tree/=
branch
> > > >>>>>> that drm/ci + drm/msm + (plus whoever else wants to get in on =
the
> > > >>>>>> drm/ci, so probably at least vkms) lands patches into via gitl=
ab MRs?
> > > >>>>>
> > > >>>>> This again brings a separate CI-enabled tree. I think it has be=
en
> > > >>>>> suggested to start with enabling DRM CI for drm-misc branches. =
Then we
> > > >>>>> can possibly start landing MRs with CI testing (probably starti=
ng with
> > > >>>>> vkms).
> > > >>>>
> > > >>>> It's something we've discussed with Sima for a while, but enabli=
ng CI on
> > > >>>> drm-misc at some point will make sense so we could just as well =
start
> > > >>>> now.
> > > >>>>
> > > >>>> The biggest unknown at the moment to start doing so is how we co=
uld keep
> > > >>>> drm-tip and the rerere repo with MR.
> > > >>>
> > > >>> Let's do a slow start and begin with post-merge testing. At least=
 this
> > > >>> gives us an idea of how stable it is (and what does it take to ke=
ep it
> > > >>> green). Maybe we can perform post-merge testing for both drm-misc=
 and
> > > >>> drm-tip.
> > > >>
> > > >> The one thing is that currently the runtime for igt is quite long
> > > >> (~1hr) because you can't really parallelize kms tests.  So maybe
> > > >> nightly scheduled runs would be a better idea.
> > > >
> > > > SGTM. So, the question would be, who can set it up?
> > > >
> > >
> > > We will test the nightly pipelines in a forked repo and then will
> > > set it up for drm-misc and drm-tip.
> > >
> >
> > Revisiting this old thread...
> >
> > It's becoming increasingly clear that landing drm/ci changes via drm-mi=
sc
> > (where gitlab CI is not used) isn't working out.
>
> Why?

Some of it has been breakage in drm/ci, which would have been noticed
if drm/ci went thru CI.

And some of it is that expectation changes in other drivers when we
backmerge drm-next/drm-misc-next aren't cared for.  So we end up not
enforcing a green-pipeline, and just ignoring failed jobs on other
drivers.  I guess we could just make expectation updates for other
drivers as part of drm/msm MRs, but that feels a bit strange.

Related question, should we just smash expectation updates into the
merge commit?  Or keep it a separate commit?  In the latter case, I
think the expectation update commit should not need a r-b on list,
since it is just updating expectations to the reality of changes
merged elsewhere without a CI run.

> Also, tbf, drm-misc doesn't use gitlab CI because nobody solved the
> drm-tip issue. And because the mail I sent 6 months ago about didn't get
> any feedback.

If gitlab MRs were used to land changes in drm-misc, this would solve
the problem.  I'd be happy to start landing drm/msm changes through
that path.

But I don't think there is any good way to mix/match gitlab MRs with
other processes (dim, or raw git) in the same tree.  We need to be
able to enforce a green CI run to land changes.

> > On the drm/msm side, we pretty regularly end up needing a 2nd dummy MR
> > with additional drm/ci, etc patches on top for running our CI
> > pipelines, which is really _not_ the way this is supposed to work.
> >
> > So I think we want a single tree to merge drm/ci, drm/msm, and changes =
for
> > any other driver that wants to participate in the CI process.  We could
> > call it drm-gitlab or drm-ci or whatever.  The rules would be:
> >
> > * _Only_ land changes via MR with passing CI pipeline.  We should confi=
gure
> >   the gitlab tree to disallow MRs without a green pipeline.
> >
> > * All drm/ci changes go thru this tree.
> >
> > * When we need to backmerge drm-next/files or drm-misc-next/fixes, that
> >   goes via an MR into this shared tree, just like any other change.
> >
> >   If there are expectation updates (tests start to fail or pass, we mak=
e
> >   the fails/flakes/skips changes on the same MR, no questions asked.
> >   (But would be polite to tag the associated driver maintainer on the
> >   MR for visibility.)
> >
> > * Once we've done this, we could conceivable use similar file-path rule=
s
> >   like mesa does to only run applicable jobs.  Ie. if the MR only touch=
es
> >   drm/msm there is no need to run i915 CI jobs.  So we could optimize
> >   the CI runner utilization this way.
> >
> > * Only ff-merges.  At least to start with it would be only driver
> >   maintainers submitting MRs with patches collected up from list, so
> >   it would be few enough people that this shouldn't be a problem to
> >   coordinate.
> >
> > * I'd be open to the idea of allowing drm core and cross-driver changes
> >   thru this tree.  These are especially the sorts of things that we'd
> >   like to see have a clean CI pipeline.  But not sure how this would
> >   conflict with drm-misc.  One possible future is that it replaces
> >   drm-misc eventually.
>
> And we get back to the drm-tip discussion here. If you want to do any
> meaningful cross-driver or core changes, you need to have an integration
> tree like drm-tip. And if we solve that, afaict, we solve the only
> obstacle to using gitlab ci in drm-misc so we might just take drm/msm
> in instead.

I definitely agree about the usefulness of an integration tree.  And
an integration tree is where CI is especially valuable.  So I'm open
to ideas to have gitlab CI integrated in this tree.  But I don't see a
good alternative to requiring a green CI pipeline for merging changes
into this tree, which means using gitlab MRs.  Maybe I'm not thinking
creatively enough here, but landing changes without a green CI run
just means discovering unrelated breakages when the next batch of
changes comes in via an MR.

BR,
-R
