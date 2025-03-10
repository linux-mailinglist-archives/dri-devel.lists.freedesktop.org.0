Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912DA59239
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 12:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DF210E3F7;
	Mon, 10 Mar 2025 11:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Plio1SXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983C810E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 11:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741604843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AAVnjqkj/BXNESowWYeR6uALWt67Mu4HI3LgkzVG+CA=;
 b=Plio1SXhmD13ZKqrhKzgyzU9NAuXQAlM8IPWsrjJitSXmWx2Fjae/ysyHIf6E4IoicnQsV
 8inLUh75bnl7zwVTG5xiVoCP/YUOwONOcUwCo8IJQyOOLbqWgS3GbBE6ry1NBYT73uo58n
 uAkikLfN/jlplVmQ6R7InoSLgIOyI5o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-gizKJUWeOoOXRjczqDL2tw-1; Mon, 10 Mar 2025 07:07:22 -0400
X-MC-Unique: gizKJUWeOoOXRjczqDL2tw-1
X-Mimecast-MFC-AGG-ID: gizKJUWeOoOXRjczqDL2tw_1741604841
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf3168b87so4729165e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 04:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741604841; x=1742209641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAVnjqkj/BXNESowWYeR6uALWt67Mu4HI3LgkzVG+CA=;
 b=tMqRNVaMsN49Xm1dKOLuBaTLHibGuE/ouq3u7EBiJor3k3cABNpk7AEMLL1AY8UxXC
 G4n2TbHltBxxwX36PSvVfgT3qeOJI50t1gsw+vQwlSSKCYrZ1eqSZAgMv2YlyLiTtHDI
 aomxBwLoNFeCDEyNChX6HmEdyPbL4zWdu/rkpfsHkb/PVEV8dt2pCrnUxuj0FJ5bPo82
 CHM4K0bQeCn9yxd0rah3DHedz3dVViMk9/rgnotx/Fb7FMHzZ4+cVRYbKKC1pHnWQALK
 DSw8Y7cyAeZ1/Ohd6rWHu0zRvQwoVCDUxnUdBQIG/4qenp7P4DTfBQNCrlferIjPeyst
 CEvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgaT5TKj681gkL95yaHjA7oypLN+NkC/L3ePOgKD+mZw7erT+3wEVwiHLX6LWw/hXzwaLUhT6HV18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsZ4g+woLQmYlltpKWRvPCEJ0+KV6KGjPwk6H+l/4EID3WWOex
 TkAAiYMHN7PcZtk3NtXKgMns3DZq6yB6tUtqwySR5F3TKQ06sFvczu3MoOmwxbvhrOom9EWJccN
 ukmcE9NWZ9qo9/Bho2mWPpVxSSWsTwjRBQJIzb3gwpdHgcWbo0y4cxuyy9SqZeqjdlA==
X-Gm-Gg: ASbGncuey4cQgMzsbi4zn+I9Lj4zyolp9gyTR3W7FY63+f0BpOdtVvIpR5hvMO0tDnC
 5AzzopDIHh1kQ1qEDfoQ0Om7lvKrJ0N6VhOysvDOmww+7MzpANWsdCPU18K+FiQIKjD3t4Ywng8
 +6t4HUdqYFICs6b1EDFGH/tOvvjFeHgpea+qYGUtPGxN+QpbRlF0iWX1ILNFhnsacfnr5v0pzMB
 0H/cyw6qDKh+BXrRyCvcXDU5q7fJGGMQTT1X44mhamz2cyFgG8qQsURU3PHvzAgy/vdjPPmjyaX
 NVilYZYF/U0=
X-Received: by 2002:a5d:5f8f:0:b0:391:2e31:c7e8 with SMTP id
 ffacd0b85a97d-39132d66e3dmr7907673f8f.2.1741604840487; 
 Mon, 10 Mar 2025 04:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsShXvKIXyxYbWmeGcQ5DYABymYbkziebQsNDmviRlPBJDKPaOtpOLHo3K3vT1Jl7iDXwnpg==
X-Received: by 2002:a5d:5f8f:0:b0:391:2e31:c7e8 with SMTP id
 ffacd0b85a97d-39132d66e3dmr7907644f8f.2.1741604839891; 
 Mon, 10 Mar 2025 04:07:19 -0700 (PDT)
Received: from localhost ([193.32.126.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0193bfsm14739797f8f.55.2025.03.10.04.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 04:07:18 -0700 (PDT)
Date: Mon, 10 Mar 2025 12:07:01 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, 
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <20250310-spicy-flawless-ermine-bfc74f@houat>
References: <CAF6AEGvGZp=WhGxmqVjqPnR3G33GTng+L0kwABCRxAKb0nHc9g@mail.gmail.com>
 <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
 <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
 <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
 <CAF6AEGub4O86pRM6iM5xaDKVrR57D=OCm00ifFksG1LT9a4+og@mail.gmail.com>
 <qs72n3l6l63er3d5lrxoravqbjrjllscnyhs7crb6anabvaez4@4hathpqkwnnd>
 <67c8cf4c-f224-4c24-96b2-92aaa3224321@collabora.com>
 <CAF6AEGvDc7RfZ2Y4B2oBag=MaAuUTJxjMwvD0yieA6qb42QMVQ@mail.gmail.com>
 <20250307-just-calm-centipede-b617ab@houat>
 <CAF6AEGsaqy0rXFMTV-6nrusqK1wpV2AkHP4=fwJJC_xd7kQROA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nrmmupeqny24fy3v"
Content-Disposition: inline
In-Reply-To: <CAF6AEGsaqy0rXFMTV-6nrusqK1wpV2AkHP4=fwJJC_xd7kQROA@mail.gmail.com>
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


--nrmmupeqny24fy3v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Time for drm-ci-next?
MIME-Version: 1.0

On Fri, Mar 07, 2025 at 09:26:54AM -0800, Rob Clark wrote:
> On Fri, Mar 7, 2025 at 9:00=E2=80=AFAM Maxime Ripard <mripard@redhat.com>=
 wrote:
> > On Fri, Mar 07, 2025 at 08:42:46AM -0800, Rob Clark wrote:
> > > On Tue, Sep 24, 2024 at 5:27=E2=80=AFAM Vignesh Raman
> > > > On 12/09/24 11:18, Dmitry Baryshkov wrote:
> > > > > On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> > > > >> On Mon, Sep 9, 2024 at 2:54=E2=80=AFAM Dmitry Baryshkov
> > > > >> <dmitry.baryshkov@linaro.org> wrote:
> > > > >>>
> > > > >>> On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com=
> wrote:
> > > > >>>>
> > > > >>>> Hi,
> > > > >>>>
> > > > >>>> On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> > > > >>>>> On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> =
wrote:
> > > > >>>>>>
> > > > >>>>>> On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel=
=2Evetter@ffwll.ch> wrote:
> > > > >>>>>>>
> > > > >>>>>>> On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > > >>>>>>>> On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <dani=
el.vetter@ffwll.ch> wrote:
> > > > >>>>>>>>>
> > > > >>>>>>>>> On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > > >>>>>>>>>> On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <da=
niel.vetter@ffwll.ch> wrote:
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wro=
te:
> > > > >>>>>>>>>>>> On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter=
 <daniel@ffwll.ch> wrote:
> > > > >>>>>>>>>>>>>
> > > > >>>>>>>>>>>>> On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark w=
rote:
> > > > >>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vett=
er <daniel@ffwll.ch> wrote:
> > > > >>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Ba=
ryshkov wrote:
> > > > >>>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vet=
ter wrote:
> > > > >>>>>>>>>>>>>>>>> On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen K=
oike wrote:
> > > > >>>>>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>>>>> On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > >>>>>>>>>>>>>>>>>>> Hi,
> > > > >>>>>>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>>>>>> On 15/03/24 22:50, Rob Clark wrote:
> > > > >>>>>>>>>>>>>>>>>>>> Basically, I often find myself needing to merg=
e CI patches on top of
> > > > >>>>>>>>>>>>>>>>>>>> msm-next in order to run CI, and then after a =
clean CI run, reset HEAD
> > > > >>>>>>>>>>>>>>>>>>>> back before the merge and force-push.  Which i=
sn't really how things
> > > > >>>>>>>>>>>>>>>>>>>> should work.
> > > > >>>>>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>>>>> This sounds more like you want an integration tre=
e like drm-tip. Get msm
> > > > >>>>>>>>>>>>>>>>> branches integrated there, done. Backmerges just =
for integration testing
> > > > >>>>>>>>>>>>>>>>> are not a good idea indeed.
> > > > >>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>> But AFAIU this doesn't help for pre-merge testing, i=
e. prior to a
> > > > >>>>>>>>>>>>>> patch landing in msm-next
> > > > >>>>>>>>>>>>>>
> > > > >>>>>>>>>>>>>> My idea was to have a drm-ci-next managed similar to=
 drm-misc-next, if
> > > > >>>>>>>>>>>>>> we have needed drm/ci patches we could push them to =
drm-ci-next, and
> > > > >>>>>>>>>>>>>> then merge that into the driver tree (along with a P=
R from drm-ci-next
> > > > >>>>>>>>>>>>>> to Dave).
> > > > >>>>>>>>>>>>>
> > > > >>>>>>>>>>>>> I guess I'm confused about what kind of pre-merge tes=
ting we're talking
> > > > >>>>>>>>>>>>> about then ... Or maybe this just doesn't work too we=
ll with the linux
> > > > >>>>>>>>>>>>> kernel. The model is that you have some pile of trees=
, they're split up,
> > > > >>>>>>>>>>>>> and testing of all the trees together is done in inte=
gration trees like
> > > > >>>>>>>>>>>>> linux-next or drm-tip.
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> pre-merge: for msm we've been collecting up patches fr=
om list into a
> > > > >>>>>>>>>>>> fast-forward MR which triggers CI before merging to ms=
m-next/msm-fixes
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> Ideally drm-misc and other trees would do similar, we'=
d catch more
> > > > >>>>>>>>>>>> regressions that way.  For example, in msm-next the no=
debugfs build is
> > > > >>>>>>>>>>>> currently broken, because we merged drm-misc-next at a=
 time when
> > > > >>>>>>>>>>>> komeda was broken:
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681=
#L9520
> > > > >>>>>>>>>>>>
> > > > >>>>>>>>>>>> If drm-misc was using pre-merge CI this would have bee=
n caught and the
> > > > >>>>>>>>>>>> offending patch dropped.
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> That sounds more like we should push on the drm-misc pr=
e-merge CI boulder
> > > > >>>>>>>>>>> to move it uphill, than add even more trees to make it =
even harder to get
> > > > >>>>>>>>>>> there long term ...
> > > > >>>>>>>>>>>
> > > > >>>>>>>>>>> Short term it helps locally to have finer trees, but on=
ly short term and
> > > > >>>>>>>>>>> only very locally.
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> The path to have fewer trees (ideally only one for all o=
f drm) is to
> > > > >>>>>>>>>> use gitlab MRs to land everything :-)
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> drm-ci-next is only a stop-gap.. but one that we need.  =
The
> > > > >>>>>>>>>> ${branchname}-external-fixes trick covers _most_ cases w=
here we need
> > > > >>>>>>>>>> unrelated patches (ie. to fix random ToT breakage outsid=
e of drm or in
> > > > >>>>>>>>>> core drm), but it doesn't help when the needed changes a=
re yml
> > > > >>>>>>>>>> (because gitlab processes all the yml before merging the
> > > > >>>>>>>>>> -external-fixes branch).  This is where we need drm-ci-n=
ext, otherwise
> > > > >>>>>>>>>> we are having to create a separate MR which cherry-picks=
 drm/ci
> > > > >>>>>>>>>> patches for doing the CI.  This is a rather broken proce=
ss.
> > > > >>>>>>>>>
> > > > >>>>>>>>> So what I don't get is ... if we CI drm-misc, how does th=
at not help
> > > > >>>>>>>>> improve the situation here? Step one would be post-merge =
(i.e. just enable
> > > > >>>>>>>>> CI in the repo), then get MRs going.
> > > > >>>>>>>>
> > > > >>>>>>>> I guess post-merge is better than nothing.. but pre-merge =
is better.
> > > > >>>>>>>>
> > > > >>>>>>>> post-merge can work if you have a "sheriff" system where s=
omeone
> > > > >>>>>>>> (perhaps on a rotation) is actively monitoring results and=
 "revert and
> > > > >>>>>>>> ask questions later" when something breaks.  Pre-merge ens=
ures the
> > > > >>>>>>>> interested party is involved in the process ;-)
> > > > >>>>>>>
> > > > >>>>>>> So ... make that happen? And it doesn't have to be for all =
of drm-misc,
> > > > >>>>>>> mesa after all switched over to MR also on a bit a driver/a=
rea basis. So
> > > > >>>>>>> agreeing among all drm-ci folks to use gitlab MR in drm-mis=
c for pre-merge
> > > > >>>>>>> testing shouldn't be that hard to make happen. And unlike a=
 separate
> > > > >>>>>>> branch it's not some kind of detour with a good chance to g=
et stuck in a
> > > > >>>>>>> local optimum.
> > > > >>>>>>
> > > > >>>>>> Tree vs branch doesn't really have much in the way of distin=
ction,
> > > > >>>>>> modulo gitlab permissions.  In that it doesn't do much good =
if drm/ci
> > > > >>>>>> patches are landing on a different branch.
> > > > >>>>>>
> > > > >>>>>> I guess what you are suggesting is that we have a single tre=
e/branch
> > > > >>>>>> that drm/ci + drm/msm + (plus whoever else wants to get in o=
n the
> > > > >>>>>> drm/ci, so probably at least vkms) lands patches into via gi=
tlab MRs?
> > > > >>>>>
> > > > >>>>> This again brings a separate CI-enabled tree. I think it has =
been
> > > > >>>>> suggested to start with enabling DRM CI for drm-misc branches=
=2E Then we
> > > > >>>>> can possibly start landing MRs with CI testing (probably star=
ting with
> > > > >>>>> vkms).
> > > > >>>>
> > > > >>>> It's something we've discussed with Sima for a while, but enab=
ling CI on
> > > > >>>> drm-misc at some point will make sense so we could just as wel=
l start
> > > > >>>> now.
> > > > >>>>
> > > > >>>> The biggest unknown at the moment to start doing so is how we =
could keep
> > > > >>>> drm-tip and the rerere repo with MR.
> > > > >>>
> > > > >>> Let's do a slow start and begin with post-merge testing. At lea=
st this
> > > > >>> gives us an idea of how stable it is (and what does it take to =
keep it
> > > > >>> green). Maybe we can perform post-merge testing for both drm-mi=
sc and
> > > > >>> drm-tip.
> > > > >>
> > > > >> The one thing is that currently the runtime for igt is quite long
> > > > >> (~1hr) because you can't really parallelize kms tests.  So maybe
> > > > >> nightly scheduled runs would be a better idea.
> > > > >
> > > > > SGTM. So, the question would be, who can set it up?
> > > > >
> > > >
> > > > We will test the nightly pipelines in a forked repo and then will
> > > > set it up for drm-misc and drm-tip.
> > > >
> > >
> > > Revisiting this old thread...
> > >
> > > It's becoming increasingly clear that landing drm/ci changes via drm-=
misc
> > > (where gitlab CI is not used) isn't working out.
> >
> > Why?
>=20
> Some of it has been breakage in drm/ci, which would have been noticed
> if drm/ci went thru CI.
>=20
> And some of it is that expectation changes in other drivers when we
> backmerge drm-next/drm-misc-next aren't cared for.  So we end up not
> enforcing a green-pipeline, and just ignoring failed jobs on other
> drivers.  I guess we could just make expectation updates for other
> drivers as part of drm/msm MRs, but that feels a bit strange.

Yeah, ok, I can see how that can happen and how it can be frustrating :)

> Related question, should we just smash expectation updates into the
> merge commit?  Or keep it a separate commit?  In the latter case, I
> think the expectation update commit should not need a r-b on list,
> since it is just updating expectations to the reality of changes
> merged elsewhere without a CI run.

My gut feeling is that we should review that change still, because
people will mess the expectations up just to get that green light. But
both suck, really, so I'm not really sure.

> > Also, tbf, drm-misc doesn't use gitlab CI because nobody solved the
> > drm-tip issue. And because the mail I sent 6 months ago about didn't get
> > any feedback.
>=20
> If gitlab MRs were used to land changes in drm-misc, this would solve
> the problem.  I'd be happy to start landing drm/msm changes through
> that path.
>=20
> But I don't think there is any good way to mix/match gitlab MRs with
> other processes (dim, or raw git) in the same tree.  We need to be
> able to enforce a green CI run to land changes.

So, I agree, and it's been the intent to make drm-misc this since even
before we moved to Gitlab.

But there's different things to consider:

- We frequently enough merge patches affecting other subsystems that
  will need to be notified, and will need to review our work. Just
  saying that a random maintainer that gets 2 MR each year from us
  should watch our Gitlab frequently doesn't work. So, how do we solve
  that? Do we take it to the ML, and once we get their AB, we merge it
  through a MR?

- The kernel kind of mandates of maintainers / committers to put their
  Signed-off-by, how do we automate that in Gitlab?

- Similarly, Linus *really* likes signed PRs, how do we make one
  switching to Gitlab?

- Do we require people to still use dim, or do we just drop dim?

- Do we have enough runners to begin with?

- And the final one that really stinks: how do we make sure we send the
  right branches to linux-next?

So far, nobody really decided or solved those things. And we would have
to solve this (except for dim) for the tree you're suggesting, because
most of it really is about dealing with the impedance mismatch with the
rest of the kernel.

We talked about it some time ago with Dave, and we concluded that the
best course of action was to create a few actions for DRM to run when we
send PR (like a build test and kunit run), and then expand and figure
things out as we use it more and more.

And that would mean doing a transition phase.

> > > On the drm/msm side, we pretty regularly end up needing a 2nd dummy MR
> > > with additional drm/ci, etc patches on top for running our CI
> > > pipelines, which is really _not_ the way this is supposed to work.
> > >
> > > So I think we want a single tree to merge drm/ci, drm/msm, and change=
s for
> > > any other driver that wants to participate in the CI process.  We cou=
ld
> > > call it drm-gitlab or drm-ci or whatever.  The rules would be:
> > >
> > > * _Only_ land changes via MR with passing CI pipeline.  We should con=
figure
> > >   the gitlab tree to disallow MRs without a green pipeline.
> > >
> > > * All drm/ci changes go thru this tree.
> > >
> > > * When we need to backmerge drm-next/files or drm-misc-next/fixes, th=
at
> > >   goes via an MR into this shared tree, just like any other change.
> > >
> > >   If there are expectation updates (tests start to fail or pass, we m=
ake
> > >   the fails/flakes/skips changes on the same MR, no questions asked.
> > >   (But would be polite to tag the associated driver maintainer on the
> > >   MR for visibility.)
> > >
> > > * Once we've done this, we could conceivable use similar file-path ru=
les
> > >   like mesa does to only run applicable jobs.  Ie. if the MR only tou=
ches
> > >   drm/msm there is no need to run i915 CI jobs.  So we could optimize
> > >   the CI runner utilization this way.
> > >
> > > * Only ff-merges.  At least to start with it would be only driver
> > >   maintainers submitting MRs with patches collected up from list, so
> > >   it would be few enough people that this shouldn't be a problem to
> > >   coordinate.
> > >
> > > * I'd be open to the idea of allowing drm core and cross-driver chang=
es
> > >   thru this tree.  These are especially the sorts of things that we'd
> > >   like to see have a clean CI pipeline.  But not sure how this would
> > >   conflict with drm-misc.  One possible future is that it replaces
> > >   drm-misc eventually.
> >
> > And we get back to the drm-tip discussion here. If you want to do any
> > meaningful cross-driver or core changes, you need to have an integration
> > tree like drm-tip. And if we solve that, afaict, we solve the only
> > obstacle to using gitlab ci in drm-misc so we might just take drm/msm
> > in instead.
>=20
> I definitely agree about the usefulness of an integration tree.  And
> an integration tree is where CI is especially valuable.  So I'm open
> to ideas to have gitlab CI integrated in this tree.  But I don't see a
> good alternative to requiring a green CI pipeline for merging changes
> into this tree, which means using gitlab MRs.  Maybe I'm not thinking
> creatively enough here, but landing changes without a green CI run
> just means discovering unrelated breakages when the next batch of
> changes comes in via an MR.

To a large extent, that pain is here because msm is an early adopter.
It's up to you to decide whether the trade-off is worthy, but forcing it
down to everybody without address what prevents everybody else from
switching doesn't really work.

It worked for you, with a smaller set of constraints, but we just can't
get rid of them.

Maxime

--nrmmupeqny24fy3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ87H1QAKCRDj7w1vZxhR
xQl5AP0erCutzGcVfA3n74KGP6fj/8R0pWNxxMyy3fVSixT1HwEA9xc/fYg1keFl
LhM7xqTsiUE4ur7I7IGFzTHQX3hc4gU=
=oTX6
-----END PGP SIGNATURE-----

--nrmmupeqny24fy3v--

