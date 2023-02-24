Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EE6A1AE9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 12:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED89110E878;
	Fri, 24 Feb 2023 11:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE7610E873;
 Fri, 24 Feb 2023 11:01:06 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id j17so13932581ljq.11;
 Fri, 24 Feb 2023 03:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5AIXFULTyE2NYT6U8vMfNuliXg2sFhN0e4bazCu8yv8=;
 b=m80A7SSUDmTjppc/QxY0xh4gKh5c9j2fqJJ5VGuCBVl+dPqSYp6+8qyYBzRLXTpGbJ
 ZnXvWGDmeWssc3LH+rrERguT5Xy1TJRQHEiD6FWLTUnJ5swL9D9Ce8ChGJCptz7RFIXP
 LAWe+b3npfc7VdM71mMHpS1xsVZZWrPhRWeT+QIuOqau06TR6lGY5aDAniz+MpOSTXjJ
 vMhqW67aDcL51XU+wjOy8MMSvoItFbTjNKFnnG9QHF0LifjJnOvQbrJ6Zq/767LJIrp/
 Bk5/3RWz/365M7nCzWJV2kNcu39L/esSs3sMEULFl6xTAmPAAB12xUMmiUeVkczispx9
 qzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5AIXFULTyE2NYT6U8vMfNuliXg2sFhN0e4bazCu8yv8=;
 b=EP8OXu4XeZCvGcw+R98Q+WATW+I6EKqnQ4iB783+brqq1r7WWBj0L5EXTMzjhMAYcB
 4lDQc+UxkW72DRp6STCVoEu4By6sede6P8hrRFpQHH3qfgW9lAKZ581avhTM7vHUYjNj
 xOrDUroLHayJyCJNvw1sc2CKw+Ac2DR9JdeEFe/WTlZrQkhMEQhsiqM3lHmvu4JbK27l
 O7cJMm6Ffd03LBAu3lU7/zIzuJ3Mj7SM8sibhXx3LnRn7vxO3rDX3owN3l/5A3Kkv9IM
 ZIGOlrEfimgCBuY0GpLs8Panjbfdp/OfeXJDSKE5YMM+CWGDGd5EgeaMNM5Cr7cmOkjU
 4Rhg==
X-Gm-Message-State: AO0yUKVYiNdxaypqkNA4dEu0fb+6u1fLypMvtSDIdu8GuBtLNbATcwqg
 KVIldx9+uHFDkQhrI0YdPIk=
X-Google-Smtp-Source: AK7set+u6j5mMjeRrDy3BHmdbX5p1kc2CcLp2kMTojx4ZvP7aK8yrHuABT4+lDMV12C7Cj+kbsY5YQ==
X-Received: by 2002:a2e:be88:0:b0:293:4d02:98ed with SMTP id
 a8-20020a2ebe88000000b002934d0298edmr6858700ljr.27.1677236464508; 
 Fri, 24 Feb 2023 03:01:04 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u2-20020a2e9f02000000b0029474e94ac6sm720991ljk.12.2023.02.24.03.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:01:04 -0800 (PST)
Date: Fri, 24 Feb 2023 13:00:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
Message-ID: <20230224130053.3f8939e2@eldfell>
In-Reply-To: <582a9b92-d246-fce2-cf39-539d9a2db17f@linux.intel.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
 <20230222114900.1b6baf95@eldfell>
 <CAF6AEGs1_75gg+LCBj6=PH8Jn60PXiE+Kx_2636nP-+pajN8Hg@mail.gmail.com>
 <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
 <582a9b92-d246-fce2-cf39-539d9a2db17f@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I1D.bYM83gCFWxxa.Md9LXG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, "open list:SYNC FILE
 FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/I1D.bYM83gCFWxxa.Md9LXG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Feb 2023 10:50:51 +0000
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 24/02/2023 10:24, Pekka Paalanen wrote:
> > On Fri, 24 Feb 2023 09:41:46 +0000
> > Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> >  =20
> >> On 24/02/2023 09:26, Pekka Paalanen wrote: =20
> >>> On Thu, 23 Feb 2023 10:51:48 -0800
> >>> Rob Clark <robdclark@gmail.com> wrote:
> >>>     =20
> >>>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.com>=
 wrote: =20
> >>>>>
> >>>>> On Wed, 22 Feb 2023 07:37:26 -0800
> >>>>> Rob Clark <robdclark@gmail.com> wrote:
> >>>>>       =20
> >>>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.co=
m> wrote: =20
> >>>
> >>> ...
> >>>     =20
> >>>>>>> On another matter, if the application uses SET_DEADLINE with one
> >>>>>>> timestamp, and the compositor uses SET_DEADLINE on the same thing=
 with
> >>>>>>> another timestamp, what should happen? =20
> >>>>>>
> >>>>>> The expectation is that many deadline hints can be set on a fence.
> >>>>>> The fence signaller should track the soonest deadline. =20
> >>>>>
> >>>>> You need to document that as UAPI, since it is observable to usersp=
ace.
> >>>>> It would be bad if drivers or subsystems would differ in behaviour.
> >>>>>       =20
> >>>>
> >>>> It is in the end a hint.  It is about giving the driver more
> >>>> information so that it can make better choices.  But the driver is
> >>>> even free to ignore it.  So maybe "expectation" is too strong of a
> >>>> word.  Rather, any other behavior doesn't really make sense.  But it
> >>>> could end up being dictated by how the hw and/or fw works. =20
> >>>
> >>> It will stop being a hint once it has been implemented and used in the
> >>> wild long enough. The kernel userspace regression rules make sure of
> >>> that. =20
> >>
> >> Yeah, tricky and maybe a gray area in this case. I think we eluded
> >> elsewhere in the thread that renaming the thing might be an option.
> >>
> >> So maybe instead of deadline, which is a very strong word, use somethi=
ng
> >> along the lines of "present time hint", or "signalled time hint"? Maybe
> >> reads clumsy. Just throwing some ideas for a start. =20
> >=20
> > You can try, but I fear that if it ever changes behaviour and
> > someone notices that, it's labelled as a kernel regression. I don't
> > think documentation has ever been the authoritative definition of UABI
> > in Linux, it just guides drivers and userspace towards a common
> > understanding and common usage patterns.
> >=20
> > So even if the UABI contract is not documented (ugh), you need to be
> > prepared to set the UABI contract through kernel implementation. =20
>=20
> To be the devil's advocate it probably wouldn't be an ABI regression but=
=20
> just an regression. Same way as what nice(2) priorities mean hasn't=20
> always been the same over the years, I don't think there is a strict=20
> contract.
>=20
> Having said that, it may be different with latency sensitive stuff such=20
> as UIs though since it is very observable and can be very painful to user=
s.
>=20
> > If you do not document the UABI contract, then different drivers are
> > likely to implement it differently, leading to differing behaviour.
> > Also userspace will invent wild ways to abuse the UABI if there is no
> > documentation guiding it on proper use. If userspace or end users
> > observe different behaviour, that's bad even if it's not a regression.
> >=20
> > I don't like the situation either, but it is what it is. UABI stability
> > trumps everything regardless of whether it was documented or not.
> >=20
> > I bet userspace is going to use this as a "make it faster, make it
> > hotter" button. I would not be surprised if someone wrote a LD_PRELOAD
> > library that stamps any and all fences with an expired deadline to
> > just squeeze out a little more through some weird side-effect.
> >=20
> > Well, that's hopefully overboard in scaring, but in the end, I would
> > like to see UABI documented so I can have a feeling of what it is for
> > and how it was intended to be used. That's all. =20
>=20
> We share the same concern. If you read elsewhere in these threads you=20
> will notice I have been calling this an "arms race". If the ability to=20
> make yourself go faster does not required additional privilege I also=20
> worry everyone will do it at which point it becomes pointless. So yes, I=
=20
> do share this concern about exposing any of this as an unprivileged uapi.
>=20
> Is it possible to limit access to only compositors in some sane way?=20
> Sounds tricky when dma-fence should be disconnected from DRM..

Maybe it's not that bad in this particular case, because we are talking
only about boosting GPU clocks which benefits everyone (except
battery life) and it does not penalize other programs like e.g.
job priorities do.

Drivers are not going to use the deadline for scheduling priorities,
right? I don't recall seeing any mention of that.

...right?


Thanks,
pq

--Sig_/I1D.bYM83gCFWxxa.Md9LXG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP4mOUACgkQI1/ltBGq
qqc1rQ/9EUIHxQur2LFhPc8dW9al2BKzk9iETv5iymwqPnsiPVwBensxVlYR6H5+
hKLDJfOE4ka7Lh6t6oazo6vrt+vzRFQjPXdyteTpezf1fqruYrHLyuSU5hJ/TFj+
WBBRCJhTJ6AfytE+kDgxJFveJgTB2wX0TcjrvY16B/qLeHojQs5ZxWhFaKOOgUGI
oPFZZM4JGm+/UrNeGloSYL32gXzRv01DTinmoH9Pg6DXOrSQuXJ5MmX5GTjpe2hQ
+Kaqh6dkCCxHpIoj/A6mnsGVCP3Y/SB3VNE2iTYq2Fn7zssfFu1MbI6ib9rCKRMK
tS2qQl8PMIUJYkSV+ke65DP0jgQhjPM6t+O6LYqYyx3Fm9/KkbaQExO743WZzhuo
ZgiIbrfTGJ2NGSGH7hofqRdVTsPF6No905se5M8ohpSnzd675LRuzj3RnzzpvwJG
2S/1CyBNsqD1dWDrph9S38YhFUGRvFgw0yqWUr1uqT9sT5JslsD6eFxuUtLfBn7N
jnXqhGeg5gscKYND/uXPPC0IdBqG5kROTL2Md/ushUhVYu8TdW2eXlZE3MFltDg/
xEz+yv0TQq3JwM9rEPtGMQOTfNQECUnrVMpDmv9iFo8KaSp379Yo9VTQNgP3Df3c
bjl6l7PxtpsKqYb6aAnMpNiWj8/w+JXq9QEM5Hoa3lFdkYCQgZM=
=1ihL
-----END PGP SIGNATURE-----

--Sig_/I1D.bYM83gCFWxxa.Md9LXG--
