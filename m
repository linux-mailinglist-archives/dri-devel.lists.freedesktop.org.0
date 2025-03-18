Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63359A6769A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF31810E4A1;
	Tue, 18 Mar 2025 14:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YRqP44IP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D12510E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742308738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LRYH37xoyHlq6oJce8ItPizlOdV9ccgYZa2dQprAdUk=;
 b=YRqP44IPlqx7U+sg160dmeeK56+czMMrZ9CqpVAUzGcPrJy8fpIYo0jJEU3+Vz5AwnSbts
 iXizLj33W1tsr4auyoLC9OoRNe+o9wj6clN2m/DanQoB7jYjTeSfdOrlftXtsWEWpMj/qC
 SyZN3gKrtAtw1OV9TfBZmw6cohrMwXM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-rVh9dbs1MUKsHFdbRTEiAg-1; Tue, 18 Mar 2025 10:38:56 -0400
X-MC-Unique: rVh9dbs1MUKsHFdbRTEiAg-1
X-Mimecast-MFC-AGG-ID: rVh9dbs1MUKsHFdbRTEiAg_1742308735
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf327e9a2so27348035e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 07:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742308735; x=1742913535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LRYH37xoyHlq6oJce8ItPizlOdV9ccgYZa2dQprAdUk=;
 b=Jj/baFhRzYj1lDGNvIk12rrSE7NxICIEqfTzHVCr75PKOEIvpicmXyEuRSLC/OGbSd
 k4ucsUyRBJUJOj5OvGiX6mzsqwlCw693AKVJhUBafTKJWSz2oTEgee5J+Kp8HBsfFssr
 9J6+KCa4O+Mvuq2u5VMcRItlHn9zJbW842PYKWK7241iH2asDBNDluMo5vxHDiQAxsHH
 X30QZSVBX8MiO7IyAjupPm3yOiParNzXX2h5cfZIQmS8qYIyEfJU/5Xdz4dIQLNHBAce
 glW3gszMgz0+3yhscY7k3Pgz1jOEtBA/Sp+NmG1BZ5LJ7NbocVyJ+oo32lx1p5xeQzkx
 aJxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTcA6ndrUOblQjZY2x8ErwLcwGmPBFFi78NmAoQrBnmHYRFw/p/OFE0zIvumQSEZg/OPNE8JfxZI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIU5dzUw4L1zz0uGsonkC762Or0jqZi/NMvHVMd2BD6Wl3kan/
 f4ws7uLqLHNsxAQG760jzgY9hc+oRHrxQKJqBU2P8yNETOynCn9Ohckgx3Poi+LYi9/jJJSpus4
 h4sgzmIaCx5nWhmVDKstshfi+A1th+bcj7g2ngafOXb+GgKGGuwqeYzTqFESqZ6fmmw==
X-Gm-Gg: ASbGncvI4b4HTVMtQF8aPaEMXMPJXncMbu7lmfy2FrjSjUo86RxnL1RqbFZm0NxkNby
 T6J5bVFJbW2AVGzCYUTDd2iFz448/v6M155ZIMzdEDY/xifMEo3pmX+JJEl3/8csGXf7GQ82c1S
 M+bbxzt+6fs4pxNOAOtgHU7UNGVEc3OxY87IIz7/rifh78ztjK1DyKN4MIDCK2UUmLcr653Zpf9
 4/JfYWuMMo/98iK19GGDbyqND0+HJelFu6kTjJ84iQFwJzd3XSIOu10CSZHhJgwq2A=
X-Received: by 2002:a05:600c:4f52:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-43d3b980b4cmr30205785e9.7.1742308734845; 
 Tue, 18 Mar 2025 07:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1iMHACl1KyRuRNx+szv99SCRvJrdMJk8I/4kV/y2vOtB84DBIuJPdosvzooPDS+Kj5o5gFA==
X-Received: by 2002:a05:600c:4f52:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-43d3b980b4cmr30205425e9.7.1742308734270; 
 Tue, 18 Mar 2025 07:38:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d200facfcsm135643995e9.32.2025.03.18.07.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 07:38:53 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:38:53 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, 
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <20250318-sambar-of-sheer-typhoon-ce7f72@houat>
References: <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
 <CAA8EJpoe=Ei7fjZNd24OCVrapt5Y13ZFk8mheqPOy2FBF1a43Q@mail.gmail.com>
 <CAF6AEGub4O86pRM6iM5xaDKVrR57D=OCm00ifFksG1LT9a4+og@mail.gmail.com>
 <qs72n3l6l63er3d5lrxoravqbjrjllscnyhs7crb6anabvaez4@4hathpqkwnnd>
 <67c8cf4c-f224-4c24-96b2-92aaa3224321@collabora.com>
 <CAF6AEGvDc7RfZ2Y4B2oBag=MaAuUTJxjMwvD0yieA6qb42QMVQ@mail.gmail.com>
 <20250307-just-calm-centipede-b617ab@houat>
 <CAF6AEGsaqy0rXFMTV-6nrusqK1wpV2AkHP4=fwJJC_xd7kQROA@mail.gmail.com>
 <20250310-spicy-flawless-ermine-bfc74f@houat>
 <CAF6AEGvfjAxHGzANX8WhnfUma_aj=+tf_7KcePxUhG_8S38skQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2ipjljqusd6scel4"
Content-Disposition: inline
In-Reply-To: <CAF6AEGvfjAxHGzANX8WhnfUma_aj=+tf_7KcePxUhG_8S38skQ@mail.gmail.com>
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


--2ipjljqusd6scel4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Time for drm-ci-next?
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 07:44:58AM -0700, Rob Clark wrote:
> On Mon, Mar 10, 2025 at 4:07=E2=80=AFAM Maxime Ripard <mripard@redhat.com=
> wrote:
> >
> > On Fri, Mar 07, 2025 at 09:26:54AM -0800, Rob Clark wrote:
> > > On Fri, Mar 7, 2025 at 9:00=E2=80=AFAM Maxime Ripard <mripard@redhat.=
com> wrote:
> > > > On Fri, Mar 07, 2025 at 08:42:46AM -0800, Rob Clark wrote:
> > > > > On Tue, Sep 24, 2024 at 5:27=E2=80=AFAM Vignesh Raman
> > > > > > On 12/09/24 11:18, Dmitry Baryshkov wrote:
> > > > > > > On Mon, Sep 09, 2024 at 07:34:04AM GMT, Rob Clark wrote:
> > > > > > >> On Mon, Sep 9, 2024 at 2:54=E2=80=AFAM Dmitry Baryshkov
> > > > > > >> <dmitry.baryshkov@linaro.org> wrote:
> > > > > > >>>
> > > > > > >>> On Mon, 9 Sept 2024 at 10:50, Maxime Ripard <mripard@redhat=
=2Ecom> wrote:
> > > > > > >>>>
> > > > > > >>>> Hi,
> > > > > > >>>>
> > > > > > >>>> On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov w=
rote:
> > > > > > >>>>> On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.c=
om> wrote:
> > > > > > >>>>>>
> > > > > > >>>>>> On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <da=
niel.vetter@ffwll.ch> wrote:
> > > > > > >>>>>>>
> > > > > > >>>>>>> On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wro=
te:
> > > > > > >>>>>>>> On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <=
daniel.vetter@ffwll.ch> wrote:
> > > > > > >>>>>>>>>
> > > > > > >>>>>>>>> On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark w=
rote:
> > > > > > >>>>>>>>>> On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter=
 <daniel.vetter@ffwll.ch> wrote:
> > > > > > >>>>>>>>>>>
> > > > > > >>>>>>>>>>> On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark=
 wrote:
> > > > > > >>>>>>>>>>>> On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Ve=
tter <daniel@ffwll.ch> wrote:
> > > > > > >>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>> On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Cla=
rk wrote:
> > > > > > >>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel =
Vetter <daniel@ffwll.ch> wrote:
> > > > > > >>>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitr=
y Baryshkov wrote:
> > > > > > >>>>>>>>>>>>>>>> On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel=
 Vetter wrote:
> > > > > > >>>>>>>>>>>>>>>>> On Mon, Jun 24, 2024 at 10:25:25AM -0300, Hel=
en Koike wrote:
> > > > > > >>>>>>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>>>>>> On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > >>>>>>>>>>>>>>>>>>> Hi,
> > > > > > >>>>>>>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>>>>>>> On 15/03/24 22:50, Rob Clark wrote:
> > > > > > >>>>>>>>>>>>>>>>>>>> Basically, I often find myself needing to =
merge CI patches on top of
> > > > > > >>>>>>>>>>>>>>>>>>>> msm-next in order to run CI, and then afte=
r a clean CI run, reset HEAD
> > > > > > >>>>>>>>>>>>>>>>>>>> back before the merge and force-push.  Whi=
ch isn't really how things
> > > > > > >>>>>>>>>>>>>>>>>>>> should work.
> > > > > > >>>>>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>>>>> This sounds more like you want an integration=
 tree like drm-tip. Get msm
> > > > > > >>>>>>>>>>>>>>>>> branches integrated there, done. Backmerges j=
ust for integration testing
> > > > > > >>>>>>>>>>>>>>>>> are not a good idea indeed.
> > > > > > >>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>> But AFAIU this doesn't help for pre-merge testin=
g, ie. prior to a
> > > > > > >>>>>>>>>>>>>> patch landing in msm-next
> > > > > > >>>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>>> My idea was to have a drm-ci-next managed simila=
r to drm-misc-next, if
> > > > > > >>>>>>>>>>>>>> we have needed drm/ci patches we could push them=
 to drm-ci-next, and
> > > > > > >>>>>>>>>>>>>> then merge that into the driver tree (along with=
 a PR from drm-ci-next
> > > > > > >>>>>>>>>>>>>> to Dave).
> > > > > > >>>>>>>>>>>>>
> > > > > > >>>>>>>>>>>>> I guess I'm confused about what kind of pre-merge=
 testing we're talking
> > > > > > >>>>>>>>>>>>> about then ... Or maybe this just doesn't work to=
o well with the linux
> > > > > > >>>>>>>>>>>>> kernel. The model is that you have some pile of t=
rees, they're split up,
> > > > > > >>>>>>>>>>>>> and testing of all the trees together is done in =
integration trees like
> > > > > > >>>>>>>>>>>>> linux-next or drm-tip.
> > > > > > >>>>>>>>>>>>
> > > > > > >>>>>>>>>>>> pre-merge: for msm we've been collecting up patche=
s from list into a
> > > > > > >>>>>>>>>>>> fast-forward MR which triggers CI before merging t=
o msm-next/msm-fixes
> > > > > > >>>>>>>>>>>>
> > > > > > >>>>>>>>>>>> Ideally drm-misc and other trees would do similar,=
 we'd catch more
> > > > > > >>>>>>>>>>>> regressions that way.  For example, in msm-next th=
e nodebugfs build is
> > > > > > >>>>>>>>>>>> currently broken, because we merged drm-misc-next =
at a time when
> > > > > > >>>>>>>>>>>> komeda was broken:
> > > > > > >>>>>>>>>>>>
> > > > > > >>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/jobs/6057=
5681#L9520
> > > > > > >>>>>>>>>>>>
> > > > > > >>>>>>>>>>>> If drm-misc was using pre-merge CI this would have=
 been caught and the
> > > > > > >>>>>>>>>>>> offending patch dropped.
> > > > > > >>>>>>>>>>>
> > > > > > >>>>>>>>>>> That sounds more like we should push on the drm-mis=
c pre-merge CI boulder
> > > > > > >>>>>>>>>>> to move it uphill, than add even more trees to make=
 it even harder to get
> > > > > > >>>>>>>>>>> there long term ...
> > > > > > >>>>>>>>>>>
> > > > > > >>>>>>>>>>> Short term it helps locally to have finer trees, bu=
t only short term and
> > > > > > >>>>>>>>>>> only very locally.
> > > > > > >>>>>>>>>>
> > > > > > >>>>>>>>>> The path to have fewer trees (ideally only one for a=
ll of drm) is to
> > > > > > >>>>>>>>>> use gitlab MRs to land everything :-)
> > > > > > >>>>>>>>>>
> > > > > > >>>>>>>>>> drm-ci-next is only a stop-gap.. but one that we nee=
d.  The
> > > > > > >>>>>>>>>> ${branchname}-external-fixes trick covers _most_ cas=
es where we need
> > > > > > >>>>>>>>>> unrelated patches (ie. to fix random ToT breakage ou=
tside of drm or in
> > > > > > >>>>>>>>>> core drm), but it doesn't help when the needed chang=
es are yml
> > > > > > >>>>>>>>>> (because gitlab processes all the yml before merging=
 the
> > > > > > >>>>>>>>>> -external-fixes branch).  This is where we need drm-=
ci-next, otherwise
> > > > > > >>>>>>>>>> we are having to create a separate MR which cherry-p=
icks drm/ci
> > > > > > >>>>>>>>>> patches for doing the CI.  This is a rather broken p=
rocess.
> > > > > > >>>>>>>>>
> > > > > > >>>>>>>>> So what I don't get is ... if we CI drm-misc, how doe=
s that not help
> > > > > > >>>>>>>>> improve the situation here? Step one would be post-me=
rge (i.e. just enable
> > > > > > >>>>>>>>> CI in the repo), then get MRs going.
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> I guess post-merge is better than nothing.. but pre-me=
rge is better.
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> post-merge can work if you have a "sheriff" system whe=
re someone
> > > > > > >>>>>>>> (perhaps on a rotation) is actively monitoring results=
 and "revert and
> > > > > > >>>>>>>> ask questions later" when something breaks.  Pre-merge=
 ensures the
> > > > > > >>>>>>>> interested party is involved in the process ;-)
> > > > > > >>>>>>>
> > > > > > >>>>>>> So ... make that happen? And it doesn't have to be for =
all of drm-misc,
> > > > > > >>>>>>> mesa after all switched over to MR also on a bit a driv=
er/area basis. So
> > > > > > >>>>>>> agreeing among all drm-ci folks to use gitlab MR in drm=
-misc for pre-merge
> > > > > > >>>>>>> testing shouldn't be that hard to make happen. And unli=
ke a separate
> > > > > > >>>>>>> branch it's not some kind of detour with a good chance =
to get stuck in a
> > > > > > >>>>>>> local optimum.
> > > > > > >>>>>>
> > > > > > >>>>>> Tree vs branch doesn't really have much in the way of di=
stinction,
> > > > > > >>>>>> modulo gitlab permissions.  In that it doesn't do much g=
ood if drm/ci
> > > > > > >>>>>> patches are landing on a different branch.
> > > > > > >>>>>>
> > > > > > >>>>>> I guess what you are suggesting is that we have a single=
 tree/branch
> > > > > > >>>>>> that drm/ci + drm/msm + (plus whoever else wants to get =
in on the
> > > > > > >>>>>> drm/ci, so probably at least vkms) lands patches into vi=
a gitlab MRs?
> > > > > > >>>>>
> > > > > > >>>>> This again brings a separate CI-enabled tree. I think it =
has been
> > > > > > >>>>> suggested to start with enabling DRM CI for drm-misc bran=
ches. Then we
> > > > > > >>>>> can possibly start landing MRs with CI testing (probably =
starting with
> > > > > > >>>>> vkms).
> > > > > > >>>>
> > > > > > >>>> It's something we've discussed with Sima for a while, but =
enabling CI on
> > > > > > >>>> drm-misc at some point will make sense so we could just as=
 well start
> > > > > > >>>> now.
> > > > > > >>>>
> > > > > > >>>> The biggest unknown at the moment to start doing so is how=
 we could keep
> > > > > > >>>> drm-tip and the rerere repo with MR.
> > > > > > >>>
> > > > > > >>> Let's do a slow start and begin with post-merge testing. At=
 least this
> > > > > > >>> gives us an idea of how stable it is (and what does it take=
 to keep it
> > > > > > >>> green). Maybe we can perform post-merge testing for both dr=
m-misc and
> > > > > > >>> drm-tip.
> > > > > > >>
> > > > > > >> The one thing is that currently the runtime for igt is quite=
 long
> > > > > > >> (~1hr) because you can't really parallelize kms tests.  So m=
aybe
> > > > > > >> nightly scheduled runs would be a better idea.
> > > > > > >
> > > > > > > SGTM. So, the question would be, who can set it up?
> > > > > > >
> > > > > >
> > > > > > We will test the nightly pipelines in a forked repo and then wi=
ll
> > > > > > set it up for drm-misc and drm-tip.
> > > > > >
> > > > >
> > > > > Revisiting this old thread...
> > > > >
> > > > > It's becoming increasingly clear that landing drm/ci changes via =
drm-misc
> > > > > (where gitlab CI is not used) isn't working out.
> > > >
> > > > Why?
> > >
> > > Some of it has been breakage in drm/ci, which would have been noticed
> > > if drm/ci went thru CI.
> > >
> > > And some of it is that expectation changes in other drivers when we
> > > backmerge drm-next/drm-misc-next aren't cared for.  So we end up not
> > > enforcing a green-pipeline, and just ignoring failed jobs on other
> > > drivers.  I guess we could just make expectation updates for other
> > > drivers as part of drm/msm MRs, but that feels a bit strange.
> >
> > Yeah, ok, I can see how that can happen and how it can be frustrating :)
> >
> > > Related question, should we just smash expectation updates into the
> > > merge commit?  Or keep it a separate commit?  In the latter case, I
> > > think the expectation update commit should not need a r-b on list,
> > > since it is just updating expectations to the reality of changes
> > > merged elsewhere without a CI run.
> >
> > My gut feeling is that we should review that change still, because
> > people will mess the expectations up just to get that green light. But
> > both suck, really, so I'm not really sure.
>=20
> Either way I'd want to notify maintainers of the respective drivers.
> If we need to add a new expected fail, due to a backmerge, the change
> that caused the failure has already been merged.  The expectations
> update is just to reflect reality, so not really much to review.

Still, the failure might be legitimate (ie, a regression was indeed
merged) or illegitimate (ie, the driver is correct and the test isn't,
or the test never worked).

The latter makes sense for an expectations list. However, in the former
case, we should definitely not update the expectations list.

> And I should mention, at this point I'm not proposing opening up MRs
> to _everyone_, just to driver maintainers of whichever drivers want
> to participate.

ACK

> > > > Also, tbf, drm-misc doesn't use gitlab CI because nobody solved the
> > > > drm-tip issue. And because the mail I sent 6 months ago about didn'=
t get
> > > > any feedback.
> > >
> > > If gitlab MRs were used to land changes in drm-misc, this would solve
> > > the problem.  I'd be happy to start landing drm/msm changes through
> > > that path.
> > >
> > > But I don't think there is any good way to mix/match gitlab MRs with
> > > other processes (dim, or raw git) in the same tree.  We need to be
> > > able to enforce a green CI run to land changes.
> >
> > So, I agree, and it's been the intent to make drm-misc this since even
> > before we moved to Gitlab.
> >
> > But there's different things to consider:
> >
> > - We frequently enough merge patches affecting other subsystems that
> >   will need to be notified, and will need to review our work. Just
> >   saying that a random maintainer that gets 2 MR each year from us
> >   should watch our Gitlab frequently doesn't work. So, how do we solve
> >   that? Do we take it to the ML, and once we get their AB, we merge it
> >   through a MR?
> >
> > - The kernel kind of mandates of maintainers / committers to put their
> >   Signed-off-by, how do we automate that in Gitlab?
> >
> > - Similarly, Linus *really* likes signed PRs, how do we make one
> >   switching to Gitlab?
> >
> > - Do we require people to still use dim, or do we just drop dim?
> >
> > - Do we have enough runners to begin with?
> >
> > - And the final one that really stinks: how do we make sure we send the
> >   right branches to linux-next?
> >
> > So far, nobody really decided or solved those things. And we would have
> > to solve this (except for dim) for the tree you're suggesting, because
> > most of it really is about dealing with the impedance mismatch with the
> > rest of the kernel.
>=20
> What we've been doing with drm/msm (since v5.18) is pretty transparent
> to patch submitters and PR consumers:
>=20
> 1) Patches sent to list and reviewed on list
>=20
> 2) Driver maintainers (Dmitry, Abhinav, and myself) take turns
>    collecting up reviewed patches from list into an MR
>=20
> 3) The gitlab tree is set to only allow ff merges, which sidesteps
>    the signoff/etc issues.  It would be nice if gitlab (or margebot?
>    Or something?) could apply the s-o-b's, etc.  We'd need that if
>    we wanted to open things up for submitters to send MRs directly.
>=20
> 4) Gitlab CI runs on the MR..  so in addition to ad-hoc local testing,
>    we have on-device igt runs, a variety of build tests, etc.  (I'd
>    like to get to having deqp runs with a known good mesa, but we
>    aren't there yet.)
>=20
>    This part is still a bit messy because we frequently have to pull
>    in drm/ci fixes, etc.  Which is what I'd like to fix by having a
>    drm-gitlab tree which is used for drm/ci and drm/msm patches (and
>    open for other drivers to join in).
>=20
>    We do have an ${target_branch}-external fixes mechanism which we
>    can use for required fixes that would land via some other tree,
>    in case (for ex) one of the CI boards doesn't boot properly without
>    some fix in another subsystem.  But this has the limitation that
>    it can't deal with yaml changes, since the branch is merged in the
>    build job, after gitlab has already slurped in all the .yml
>=20
> 5) PRs sent to Dave and Sima are tagged and sent as normal.  It isn't
>    automated (yet), but the PR notes are collected up from however
>    many MRs were merged.  (Typically one or two for display side
>    changes from Dmitry/Abhinav and maybe one or two for GEM/GPU/etc
>    from myself.)
>=20
> You can sum all that up as just inserting an MR step into the process.
> Ie. rather than push directly to msm-next, I push to msm-next-robclark.
> Which then gets merged thru gitlab after a CI run.
>=20
> It might be possible to implement a similar thing with dim, ie. the
> drm-misc maintainers push to drm-misc-next-staging which gets merged
> into drm-misc-next after an MR pipeline?

Yeah, it looks like a great intermediate step for drm-misc indeed.

> > We talked about it some time ago with Dave, and we concluded that the
> > best course of action was to create a few actions for DRM to run when we
> > send PR (like a build test and kunit run), and then expand and figure
> > things out as we use it more and more.
>=20
> Build test and kunit can accomplish _some_ things.. but kunit in
> particular can only test the hw you have.

That's not entirely true. We have plenty of mocked tests already. It
won't test (all) the drivers, but it can already test a significant
bunch of the framework. And you can cross-compile for arch specific
tests.

> But gitlab CI can leverage the CI farm we already have in place for
> mesa, and run on-device CI across a range of DUTs. I don't see how you
> can replicate that any other way.
>=20
> (Not to mention the side benefits of having a record of test runs and
> artifacts.)

I wasn't saying it was enough or the end goal, I was saying it was the
first step we agreed upon :)

Maxime

--2ipjljqusd6scel4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9mFfAAKCRAnX84Zoj2+
dl9cAYCGB0p7GqqoyyD8rEap1zkFubgroEHWCvOLBuMk3XaGwgqpvYCxTgtpU9/a
Jl2YwrEBgJ+vK/qj9WzgZJtyOwQPngtHR0KQC2Wnbc8Vhfzxsetnw8+SqXtWY8AQ
xDr4QcAi2Q==
=Ctd2
-----END PGP SIGNATURE-----

--2ipjljqusd6scel4--

