Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7985EA56E7B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0310E0FF;
	Fri,  7 Mar 2025 17:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q8ugoLhm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E903C10E0CC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741366841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPWhTOGL/OL5xXDoAsCMu8NigGyDdoPgxZVs/gX5ugU=;
 b=Q8ugoLhm6u/dmM+JDlUvbvXpvbeBMvkDswIQsI0kGgIfzAKq8axYLkZbLJXBFeW3hq5Kt7
 3oumwnBNtcZxxkjkeOXEg6PwJAPwbCZlSVyEi6yMwuEf9PrIGQ78sYs5j59FzM87g/8I8j
 o7wCHjOSc3qz/1ZE9dFzPNMCSBldpA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-iLQLLlM6ML2r07bRhEkB5Q-1; Fri, 07 Mar 2025 12:00:40 -0500
X-MC-Unique: iLQLLlM6ML2r07bRhEkB5Q-1
X-Mimecast-MFC-AGG-ID: iLQLLlM6ML2r07bRhEkB5Q_1741366839
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-438e4e9a53fso13311645e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 09:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741366839; x=1741971639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gPWhTOGL/OL5xXDoAsCMu8NigGyDdoPgxZVs/gX5ugU=;
 b=bJGjii09lB0D9zdCr6V2EhgE0tQvWmmRmsKH/HM5ruiLuiNZK5P/XlXqT7B3nOMSUM
 lTfBrqSayDecyDW80gP0CvzNsn711MhuTix7MERWINiHr9oXVI+2EKClr34irpse2E0U
 /1Iqvu25sSV2cHmcF7xcWVMfSrFAMYQqjGqWhGLsqFPIWRD/GANqG6M8wlt/U34fT0Cp
 gXKCUVtqzYaFgjpoqY3y+g8Su4GMJ9KAnMnO0HY4vjmYrJs4XQw+tfoTIxHtbw8C8a6x
 7yRMCPYzfPmIHcSWbNVubh+T5DpnlI9TLyhiJcjKoJDYxjznv+OaDQtZDK4xnviiyLIa
 5u4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgDLac02a7b77a7hkQEM1hjFbVMOKJ3fCLpOJWiqmIY1KAvlbHhhRixLZSjaiZpE51FpnJq+/klzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy48VJlDM6wZc1j6D+QfOFOReqnmCDYg0BNghqUBgkthLHiDu4T
 Wwx2CH/sAb0jMoJrsrRYzVsAaI9BKC4FMHA+sk84gn/rdl+ofFrpQE8f6yPs1I3F6B0/aNJUHZq
 5OYWRL5iRPx1a2HhE77527xMiwATnL+RIqhRqB1VqJNy2vgp4YNb1k63m1+ugQFJJxw==
X-Gm-Gg: ASbGnctjlB70EuvS6LqGgUZxs8VT10wjFo1/+DQRUPGG2sflh+VGCRPIwDp/bPSzMPI
 kD/pZ1rSyiPej7szvlmU85XpKyR6nUXR7dWpiq2NX1hJcOtIfR5drG8dtWs8CJg8GrwCHvXfh8s
 yR0WE5xcnH0vyYcvSVE5WuhVSrpyxk7pGjpLBpYkd5KLEIsae/9QixnjtspsWCboBsNlgvLYJ4Q
 eeYB0mn4A5FvbBMxmMHSjD3CJFKul0Foaitz1pgFnnuVm66bxZTM3SE9urTEPPZmaU=
X-Received: by 2002:a05:6000:18ac:b0:390:f1b5:e619 with SMTP id
 ffacd0b85a97d-39132d5ae53mr3975204f8f.31.1741366838824; 
 Fri, 07 Mar 2025 09:00:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY5eDwsVHQHveIwkNjHB7M+K/SlVftGUUpEmHh4cBVlm7apGaW2vVNKLINTT/cvSaFhvjhTQ==
X-Received: by 2002:a05:6000:18ac:b0:390:f1b5:e619 with SMTP id
 ffacd0b85a97d-39132d5ae53mr3975123f8f.31.1741366838214; 
 Fri, 07 Mar 2025 09:00:38 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4352ed7sm86391215e9.26.2025.03.07.09.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 09:00:37 -0800 (PST)
Date: Fri, 7 Mar 2025 18:00:37 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, 
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <20250307-just-calm-centipede-b617ab@houat>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ldtqdqot6fhhuydv"
Content-Disposition: inline
In-Reply-To: <CAF6AEGvDc7RfZ2Y4B2oBag=MaAuUTJxjMwvD0yieA6qb42QMVQ@mail.gmail.com>
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


--ldtqdqot6fhhuydv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Time for drm-ci-next?
MIME-Version: 1.0

On Fri, Mar 07, 2025 at 08:42:46AM -0800, Rob Clark wrote:
> On Tue, Sep 24, 2024 at 5:27=E2=80=AFAM Vignesh Raman
> <vignesh.raman@collabora.com> wrote:
> >
> > Hi,
> >
> > On 12/09/24 11:18, Dmitry Baryshkov wrote:
> > > On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> > >> On Mon, Sep 9, 2024 at 2:54=E2=80=AFAM Dmitry Baryshkov
> > >> <dmitry.baryshkov@linaro.org> wrote:
> > >>>
> > >>> On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat.com> wr=
ote:
> > >>>>
> > >>>> Hi,
> > >>>>
> > >>>> On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> > >>>>> On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wrot=
e:
> > >>>>>>
> > >>>>>> On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.vet=
ter@ffwll.ch> wrote:
> > >>>>>>>
> > >>>>>>> On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > >>>>>>>> On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel.v=
etter@ffwll.ch> wrote:
> > >>>>>>>>>
> > >>>>>>>>> On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > >>>>>>>>>> On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <daniel=
=2Evetter@ffwll.ch> wrote:
> > >>>>>>>>>>>
> > >>>>>>>>>>> On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > >>>>>>>>>>>> On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <da=
niel@ffwll.ch> wrote:
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > >>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter <=
daniel@ffwll.ch> wrote:
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Barysh=
kov wrote:
> > >>>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter =
wrote:
> > >>>>>>>>>>>>>>>>> On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike=
 wrote:
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>> On 24/06/2024 02:34, Vignesh Raman wrote:
> > >>>>>>>>>>>>>>>>>>> Hi,
> > >>>>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>>>> On 15/03/24 22:50, Rob Clark wrote:
> > >>>>>>>>>>>>>>>>>>>> Basically, I often find myself needing to merge CI=
 patches on top of
> > >>>>>>>>>>>>>>>>>>>> msm-next in order to run CI, and then after a clea=
n CI run, reset HEAD
> > >>>>>>>>>>>>>>>>>>>> back before the merge and force-push.  Which isn't=
 really how things
> > >>>>>>>>>>>>>>>>>>>> should work.
> > >>>>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>>>> This sounds more like you want an integration tree li=
ke drm-tip. Get msm
> > >>>>>>>>>>>>>>>>> branches integrated there, done. Backmerges just for =
integration testing
> > >>>>>>>>>>>>>>>>> are not a good idea indeed.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> But AFAIU this doesn't help for pre-merge testing, ie. p=
rior to a
> > >>>>>>>>>>>>>> patch landing in msm-next
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> My idea was to have a drm-ci-next managed similar to drm=
-misc-next, if
> > >>>>>>>>>>>>>> we have needed drm/ci patches we could push them to drm-=
ci-next, and
> > >>>>>>>>>>>>>> then merge that into the driver tree (along with a PR fr=
om drm-ci-next
> > >>>>>>>>>>>>>> to Dave).
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> I guess I'm confused about what kind of pre-merge testing=
 we're talking
> > >>>>>>>>>>>>> about then ... Or maybe this just doesn't work too well w=
ith the linux
> > >>>>>>>>>>>>> kernel. The model is that you have some pile of trees, th=
ey're split up,
> > >>>>>>>>>>>>> and testing of all the trees together is done in integrat=
ion trees like
> > >>>>>>>>>>>>> linux-next or drm-tip.
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> pre-merge: for msm we've been collecting up patches from l=
ist into a
> > >>>>>>>>>>>> fast-forward MR which triggers CI before merging to msm-ne=
xt/msm-fixes
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> Ideally drm-misc and other trees would do similar, we'd ca=
tch more
> > >>>>>>>>>>>> regressions that way.  For example, in msm-next the nodebu=
gfs build is
> > >>>>>>>>>>>> currently broken, because we merged drm-misc-next at a tim=
e when
> > >>>>>>>>>>>> komeda was broken:
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L95=
20
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> If drm-misc was using pre-merge CI this would have been ca=
ught and the
> > >>>>>>>>>>>> offending patch dropped.
> > >>>>>>>>>>>
> > >>>>>>>>>>> That sounds more like we should push on the drm-misc pre-me=
rge CI boulder
> > >>>>>>>>>>> to move it uphill, than add even more trees to make it even=
 harder to get
> > >>>>>>>>>>> there long term ...
> > >>>>>>>>>>>
> > >>>>>>>>>>> Short term it helps locally to have finer trees, but only s=
hort term and
> > >>>>>>>>>>> only very locally.
> > >>>>>>>>>>
> > >>>>>>>>>> The path to have fewer trees (ideally only one for all of dr=
m) is to
> > >>>>>>>>>> use gitlab MRs to land everything :-)
> > >>>>>>>>>>
> > >>>>>>>>>> drm-ci-next is only a stop-gap.. but one that we need.  The
> > >>>>>>>>>> ${branchname}-external-fixes trick covers _most_ cases where=
 we need
> > >>>>>>>>>> unrelated patches (ie. to fix random ToT breakage outside of=
 drm or in
> > >>>>>>>>>> core drm), but it doesn't help when the needed changes are y=
ml
> > >>>>>>>>>> (because gitlab processes all the yml before merging the
> > >>>>>>>>>> -external-fixes branch).  This is where we need drm-ci-next,=
 otherwise
> > >>>>>>>>>> we are having to create a separate MR which cherry-picks drm=
/ci
> > >>>>>>>>>> patches for doing the CI.  This is a rather broken process.
> > >>>>>>>>>
> > >>>>>>>>> So what I don't get is ... if we CI drm-misc, how does that n=
ot help
> > >>>>>>>>> improve the situation here? Step one would be post-merge (i.e=
=2E just enable
> > >>>>>>>>> CI in the repo), then get MRs going.
> > >>>>>>>>
> > >>>>>>>> I guess post-merge is better than nothing.. but pre-merge is b=
etter.
> > >>>>>>>>
> > >>>>>>>> post-merge can work if you have a "sheriff" system where someo=
ne
> > >>>>>>>> (perhaps on a rotation) is actively monitoring results and "re=
vert and
> > >>>>>>>> ask questions later" when something breaks.  Pre-merge ensures=
 the
> > >>>>>>>> interested party is involved in the process ;-)
> > >>>>>>>
> > >>>>>>> So ... make that happen? And it doesn't have to be for all of d=
rm-misc,
> > >>>>>>> mesa after all switched over to MR also on a bit a driver/area =
basis. So
> > >>>>>>> agreeing among all drm-ci folks to use gitlab MR in drm-misc fo=
r pre-merge
> > >>>>>>> testing shouldn't be that hard to make happen. And unlike a sep=
arate
> > >>>>>>> branch it's not some kind of detour with a good chance to get s=
tuck in a
> > >>>>>>> local optimum.
> > >>>>>>
> > >>>>>> Tree vs branch doesn't really have much in the way of distinctio=
n,
> > >>>>>> modulo gitlab permissions.  In that it doesn't do much good if d=
rm/ci
> > >>>>>> patches are landing on a different branch.
> > >>>>>>
> > >>>>>> I guess what you are suggesting is that we have a single tree/br=
anch
> > >>>>>> that drm/ci + drm/msm + (plus whoever else wants to get in on the
> > >>>>>> drm/ci, so probably at least vkms) lands patches into via gitlab=
 MRs?
> > >>>>>
> > >>>>> This again brings a separate CI-enabled tree. I think it has been
> > >>>>> suggested to start with enabling DRM CI for drm-misc branches. Th=
en we
> > >>>>> can possibly start landing MRs with CI testing (probably starting=
 with
> > >>>>> vkms).
> > >>>>
> > >>>> It's something we've discussed with Sima for a while, but enabling=
 CI on
> > >>>> drm-misc at some point will make sense so we could just as well st=
art
> > >>>> now.
> > >>>>
> > >>>> The biggest unknown at the moment to start doing so is how we coul=
d keep
> > >>>> drm-tip and the rerere repo with MR.
> > >>>
> > >>> Let's do a slow start and begin with post-merge testing. At least t=
his
> > >>> gives us an idea of how stable it is (and what does it take to keep=
 it
> > >>> green). Maybe we can perform post-merge testing for both drm-misc a=
nd
> > >>> drm-tip.
> > >>
> > >> The one thing is that currently the runtime for igt is quite long
> > >> (~1hr) because you can't really parallelize kms tests.  So maybe
> > >> nightly scheduled runs would be a better idea.
> > >
> > > SGTM. So, the question would be, who can set it up?
> > >
> >
> > We will test the nightly pipelines in a forked repo and then will
> > set it up for drm-misc and drm-tip.
> >
>=20
> Revisiting this old thread...
>=20
> It's becoming increasingly clear that landing drm/ci changes via drm-misc
> (where gitlab CI is not used) isn't working out.

Why?

Also, tbf, drm-misc doesn't use gitlab CI because nobody solved the
drm-tip issue. And because the mail I sent 6 months ago about didn't get
any feedback.

> On the drm/msm side, we pretty regularly end up needing a 2nd dummy MR
> with additional drm/ci, etc patches on top for running our CI
> pipelines, which is really _not_ the way this is supposed to work.
>=20
> So I think we want a single tree to merge drm/ci, drm/msm, and changes for
> any other driver that wants to participate in the CI process.  We could
> call it drm-gitlab or drm-ci or whatever.  The rules would be:
>=20
> * _Only_ land changes via MR with passing CI pipeline.  We should configu=
re
>   the gitlab tree to disallow MRs without a green pipeline.
>=20
> * All drm/ci changes go thru this tree.
>=20
> * When we need to backmerge drm-next/files or drm-misc-next/fixes, that
>   goes via an MR into this shared tree, just like any other change.
>=20
>   If there are expectation updates (tests start to fail or pass, we make
>   the fails/flakes/skips changes on the same MR, no questions asked.
>   (But would be polite to tag the associated driver maintainer on the
>   MR for visibility.)
>=20
> * Once we've done this, we could conceivable use similar file-path rules
>   like mesa does to only run applicable jobs.  Ie. if the MR only touches
>   drm/msm there is no need to run i915 CI jobs.  So we could optimize
>   the CI runner utilization this way.
>=20
> * Only ff-merges.  At least to start with it would be only driver
>   maintainers submitting MRs with patches collected up from list, so
>   it would be few enough people that this shouldn't be a problem to
>   coordinate.
>=20
> * I'd be open to the idea of allowing drm core and cross-driver changes
>   thru this tree.  These are especially the sorts of things that we'd
>   like to see have a clean CI pipeline.  But not sure how this would
>   conflict with drm-misc.  One possible future is that it replaces
>   drm-misc eventually.

And we get back to the drm-tip discussion here. If you want to do any
meaningful cross-driver or core changes, you need to have an integration
tree like drm-tip. And if we solve that, afaict, we solve the only
obstacle to using gitlab ci in drm-misc so we might just take drm/msm
in instead.

Maxime

--ldtqdqot6fhhuydv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ8smNAAKCRDj7w1vZxhR
xZKnAQCS8A6xeyVTps4/kbj77X0xJ8NE2vQa5zaObCUyC+fziwD9F4Lfek1zKwlE
chx5Wz5UbcJMkt67zOMhPmYdiFXVDQ0=
=CcI9
-----END PGP SIGNATURE-----

--ldtqdqot6fhhuydv--

