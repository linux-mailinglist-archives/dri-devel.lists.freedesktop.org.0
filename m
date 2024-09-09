Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D133397103D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510E210E301;
	Mon,  9 Sep 2024 07:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cRas+fOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF61910E301
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 07:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725868221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VSXtRpBfyy9wglpr900HvWdh5T8qfc2v/VCudUMzwd4=;
 b=cRas+fOXa2vZEIhmJGQlIbhIu7xjbfNy0BJBCnutWPTsuL3lajfE0WICxdrA3oT7JG02P1
 jVWt4gY4p5FeH6rltxsCROjO45t7rezd1afvRFUWVKDKmgNpwVQzLA9kGnfmtcbA+UHi9Y
 h7/nV3xg3LSg3NsKJgghBYunciipK9Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-r7WYj-aKPW6Sv11ydKVDOQ-1; Mon, 09 Sep 2024 03:50:19 -0400
X-MC-Unique: r7WYj-aKPW6Sv11ydKVDOQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3771b6da3ceso2192245f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 00:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868218; x=1726473018;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VSXtRpBfyy9wglpr900HvWdh5T8qfc2v/VCudUMzwd4=;
 b=ETZgCduyxK/tyIPYA4T4oVeIcvjKdCAT3RTkuBa8Lo9j9l7v4lk1DjyfD2hTa81m38
 wXVWnN7T+XXELC4fK8xQAre+J826RBgf/193MR/QPNDW7nk7pUWVI+xagi3Qya81kRil
 2Z9TF7TQgI8xncEvfJN8k9mk+GbJ9ec2wFIynek7T60jJ8PBEs5nf0CaqDyjkZMzgJoo
 LOM5FUSPx9yy/B7tVoAOl+Uxb4XLs3g/EEdNXvbf/fVjkGuEu7jXzTPiCAbKwkXRj0h+
 jHwiOgB3Ub/p05baP/3ZlZMDzBI4/4aD7GlPi1CzhiitbsMns7q5tfkfqnJpd0eyEDbY
 E+nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM7hEj25hVfDU/H1zFp/WKs3Rk7UE4CtRGy/yGX01nIsoZfGgrd4/AywOy4UYQa4Q7n35l7woZMRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaEmppFDpSZAP8/S/CFpoBejFSdiM2TDGj+fvLvAaCgrTYl+pu
 PwUomPvgrwtNTSPxE1LOBvuSe1frR9ywaeKWzXyqAd8GxTDvHp24hWnES8Y4bWCFxXs6U9exPqQ
 rzNg5c7Zhv2u4k19pOhpnCpiVWIU3t7OldRHxk3iAw0T6ZFHSuSoW5jwQY9OoFzipDg==
X-Received: by 2002:a5d:4e07:0:b0:378:89d8:8220 with SMTP id
 ffacd0b85a97d-37894a538b2mr3896140f8f.43.1725868218505; 
 Mon, 09 Sep 2024 00:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWhkfEU43RveyrnShEy/6NBBcHLHMAJvJTB0z7lAwFGsSdjggi7XWCUgOPbYwway3B1I6Q6g==
X-Received: by 2002:a5d:4e07:0:b0:378:89d8:8220 with SMTP id
 ffacd0b85a97d-37894a538b2mr3896108f8f.43.1725868217812; 
 Mon, 09 Sep 2024 00:50:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d3687sm5291485f8f.71.2024.09.09.00.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:50:17 -0700 (PDT)
Date: Mon, 9 Sep 2024 09:50:17 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: Time for drm-ci-next?
Message-ID: <20240909-marvellous-ostrich-of-improvement-c7d2c8@houat>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ynzyyrzswkf6y3ek"
Content-Disposition: inline
In-Reply-To: <CAA8EJppyM_-5fBL6VFp+kxyg36LAbjxqUgA+ico9LBuJvaahxQ@mail.gmail.com>
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


--ynzyyrzswkf6y3ek
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 09, 2024 at 01:27:51AM GMT, Dmitry Baryshkov wrote:
> On Mon, 8 Jul 2024 at 21:38, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, Jul 8, 2024 at 1:52=E2=80=AFAM Daniel Vetter <daniel.vetter@ffw=
ll.ch> wrote:
> > >
> > > On Fri, Jul 05, 2024 at 12:31:36PM -0700, Rob Clark wrote:
> > > > On Fri, Jul 5, 2024 at 3:36=E2=80=AFAM Daniel Vetter <daniel.vetter=
@ffwll.ch> wrote:
> > > > >
> > > > > On Thu, Jul 04, 2024 at 08:40:26AM -0700, Rob Clark wrote:
> > > > > > On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <daniel.ve=
tter@ffwll.ch> wrote:
> > > > > > >
> > > > > > > On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > > > > > > > On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <dan=
iel@ffwll.ch> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > > > > > > > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter =
<daniel@ffwll.ch> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Bary=
shkov wrote:
> > > > > > > > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vett=
er wrote:
> > > > > > > > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen K=
oike wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > > > > > > > Basically, I often find myself needing to m=
erge CI patches on top of
> > > > > > > > > > > > > > > > msm-next in order to run CI, and then after=
 a clean CI run, reset HEAD
> > > > > > > > > > > > > > > > back before the merge and force-push.  Whic=
h isn't really how things
> > > > > > > > > > > > > > > > should work.
> > > > > > > > > > > > >
> > > > > > > > > > > > > This sounds more like you want an integration tre=
e like drm-tip. Get msm
> > > > > > > > > > > > > branches integrated there, done. Backmerges just =
for integration testing
> > > > > > > > > > > > > are not a good idea indeed.
> > > > > > > > > >
> > > > > > > > > > But AFAIU this doesn't help for pre-merge testing, ie. =
prior to a
> > > > > > > > > > patch landing in msm-next
> > > > > > > > > >
> > > > > > > > > > My idea was to have a drm-ci-next managed similar to dr=
m-misc-next, if
> > > > > > > > > > we have needed drm/ci patches we could push them to drm=
-ci-next, and
> > > > > > > > > > then merge that into the driver tree (along with a PR f=
rom drm-ci-next
> > > > > > > > > > to Dave).
> > > > > > > > >
> > > > > > > > > I guess I'm confused about what kind of pre-merge testing=
 we're talking
> > > > > > > > > about then ... Or maybe this just doesn't work too well w=
ith the linux
> > > > > > > > > kernel. The model is that you have some pile of trees, th=
ey're split up,
> > > > > > > > > and testing of all the trees together is done in integrat=
ion trees like
> > > > > > > > > linux-next or drm-tip.
> > > > > > > >
> > > > > > > > pre-merge: for msm we've been collecting up patches from li=
st into a
> > > > > > > > fast-forward MR which triggers CI before merging to msm-nex=
t/msm-fixes
> > > > > > > >
> > > > > > > > Ideally drm-misc and other trees would do similar, we'd cat=
ch more
> > > > > > > > regressions that way.  For example, in msm-next the nodebug=
fs build is
> > > > > > > > currently broken, because we merged drm-misc-next at a time=
 when
> > > > > > > > komeda was broken:
> > > > > > > >
> > > > > > > > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> > > > > > > >
> > > > > > > > If drm-misc was using pre-merge CI this would have been cau=
ght and the
> > > > > > > > offending patch dropped.
> > > > > > >
> > > > > > > That sounds more like we should push on the drm-misc pre-merg=
e CI boulder
> > > > > > > to move it uphill, than add even more trees to make it even h=
arder to get
> > > > > > > there long term ...
> > > > > > >
> > > > > > > Short term it helps locally to have finer trees, but only sho=
rt term and
> > > > > > > only very locally.
> > > > > >
> > > > > > The path to have fewer trees (ideally only one for all of drm) =
is to
> > > > > > use gitlab MRs to land everything :-)
> > > > > >
> > > > > > drm-ci-next is only a stop-gap.. but one that we need.  The
> > > > > > ${branchname}-external-fixes trick covers _most_ cases where we=
 need
> > > > > > unrelated patches (ie. to fix random ToT breakage outside of dr=
m or in
> > > > > > core drm), but it doesn't help when the needed changes are yml
> > > > > > (because gitlab processes all the yml before merging the
> > > > > > -external-fixes branch).  This is where we need drm-ci-next, ot=
herwise
> > > > > > we are having to create a separate MR which cherry-picks drm/ci
> > > > > > patches for doing the CI.  This is a rather broken process.
> > > > >
> > > > > So what I don't get is ... if we CI drm-misc, how does that not h=
elp
> > > > > improve the situation here? Step one would be post-merge (i.e. ju=
st enable
> > > > > CI in the repo), then get MRs going.
> > > >
> > > > I guess post-merge is better than nothing.. but pre-merge is better.
> > > >
> > > > post-merge can work if you have a "sheriff" system where someone
> > > > (perhaps on a rotation) is actively monitoring results and "revert =
and
> > > > ask questions later" when something breaks.  Pre-merge ensures the
> > > > interested party is involved in the process ;-)
> > >
> > > So ... make that happen? And it doesn't have to be for all of drm-mis=
c,
> > > mesa after all switched over to MR also on a bit a driver/area basis.=
 So
> > > agreeing among all drm-ci folks to use gitlab MR in drm-misc for pre-=
merge
> > > testing shouldn't be that hard to make happen. And unlike a separate
> > > branch it's not some kind of detour with a good chance to get stuck i=
n a
> > > local optimum.
> >
> > Tree vs branch doesn't really have much in the way of distinction,
> > modulo gitlab permissions.  In that it doesn't do much good if drm/ci
> > patches are landing on a different branch.
> >
> > I guess what you are suggesting is that we have a single tree/branch
> > that drm/ci + drm/msm + (plus whoever else wants to get in on the
> > drm/ci, so probably at least vkms) lands patches into via gitlab MRs?
>=20
> This again brings a separate CI-enabled tree. I think it has been
> suggested to start with enabling DRM CI for drm-misc branches. Then we
> can possibly start landing MRs with CI testing (probably starting with
> vkms).

It's something we've discussed with Sima for a while, but enabling CI on
drm-misc at some point will make sense so we could just as well start
now.

The biggest unknown at the moment to start doing so is how we could keep
drm-tip and the rerere repo with MR.

Maxime

--ynzyyrzswkf6y3ek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZt6ouAAKCRAnX84Zoj2+
dkICAX9Qyah54tY6zrFAYQyDle3KC57x+1BTiEOrM51pQCN712o1LmoHYDMuC2YJ
bxWbIWYBfRIlfmhhynahrSkQ/YA3RwGIpy7HYiRBaV1BvyGXBvAxItTGALFoE1kE
DLDum2RqSQ==
=s/6J
-----END PGP SIGNATURE-----

--ynzyyrzswkf6y3ek--

