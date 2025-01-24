Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5128A1C8B5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EBC10E387;
	Sun, 26 Jan 2025 14:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTE/TrYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D076B10E1AA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 21:12:39 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso45382455ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 13:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737753159; x=1738357959; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nGzkSXXrA7jYqSv+MBWBhKjKjIZTADsGXE7oxPj/cDg=;
 b=MTE/TrYHDi0QEuL98bdbXVL6rv8pWPZSGqWkFuHwXtERoCFksB1TzQonqemZRRkkK3
 aiMISmpxc8svuwl2IIxtXF5fRfvcjl+PmhQLQTvcXMIuyvl2bXIn+hVpz7Zhq/COgYHe
 01/RWQWpm2YL6DKccHya6NC1JD/5UGstgMuFT80kSN8juYmKRAkJvk78Ho0/p/mXRiIU
 WX/yhMSkEZJR2T+aRcvX7p8LYqVF2ZzOEGi7RD1HlplijxexWH0qWrB0YZelI4icbl11
 EocS40h4/0tSK+YKHOySlVGzIIS9l5Cn30hs6IocDSJCkriXT3Vm8YlgRPHXF3ZF9XDx
 1vJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737753159; x=1738357959;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nGzkSXXrA7jYqSv+MBWBhKjKjIZTADsGXE7oxPj/cDg=;
 b=cQfklNuiy311KtNWnwVjmQAj5S16JGrg2ZCRH8+rtiiZoMN9d5M7e1n2uVD/JXh8Dr
 gSKK5tvLC05cdCOh1pbJTU6EeexOVRYC0BAx2f0CrBpUFRigft9qacIZJHoeEO4fVNzS
 a64fjuB2eGri1lWe2aAEAQiFCc9lBnZIdPFDGVjPAKm+GEif/vC1MkRr1njOKvL8EBBg
 37LpurY+wmvqdDRJmfb2mBCGYWlQ00bU1vdOkKGz0+E18yiDsJUWyfiWR4Ivsh8k/MIH
 CFeOoLusQRUhhA7vaQtMvMz/n4tksFoVZ4xr5vuPfGJdy+awHU3ByGsJW3yH9CCPVSHr
 UdiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqRn8LYhA0WHLKEUW/eMy0ZTZOx+RFdQaxe2d+jfoWG2+5d3Rzs8ZRZczlMDYr9onTFzq0b0Xh3HE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS1tok1Ez46cXxXeetwaQbuDBbrpIXUomrOuDsOEqqgRnTKmZs
 Wwv3Pqs3WF3KhYJexRycmK0oHp0acAJIo2FGW3wsRpfhKcjdaHFv
X-Gm-Gg: ASbGncsJiDKRtCvPGzV2OA+sV+xpLk7Xc3WSP4qAf0cTOXGBIUhlKYFURxLG5B2LG42
 J9oemYj8vVuO1mJE5RV6yjn+iE0JztKbdml/dkaBXLYTpvlUlDWaXyUamqoKJeg60zUn6PioTou
 85DT9Pb34uZeP2tpTfQOJ98fJTrD4kjvPrCB9e+qyIx8+x31h5XD7AZx21/Iahlgx6a2iLGpbQu
 2beejzj0AbwwCLLPy4TpE1BL4uxxRtiUczZMH0LGY41zauKl8R9MhIpC06MZcswUF19Drjk4JhX
 o0+C7SLcWp05gCfn8y4HruNEOhSFjYMFmYLldoNN7meVT7EZ4k4=
X-Google-Smtp-Source: AGHT+IGQunDQe7Ga5HOHK7oamtTMzDBL11HRtkIJFu1joG/eqDIl8j9Lzcy6B1FtF7LxRuD9eZKMmQ==
X-Received: by 2002:a05:6a20:a11d:b0:1d9:aa1:23e3 with SMTP id
 adf61e73a8af0-1eb215901d5mr59465264637.32.1737753157707; 
 Fri, 24 Jan 2025 13:12:37 -0800 (PST)
Received: from ?IPv6:2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb?
 ([2804:1b3:a801:16c4:2e00:3d86:8f34:c7fb])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac495d5531bsm2099472a12.47.2025.01.24.13.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:12:37 -0800 (PST)
Message-ID: <bd37528d1c704951cb86a751a5c81e4c76962f51.camel@gmail.com>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev, 
 linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kunit-dev@googlegroups.com, 	nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, 	Julia.Lawall@inria.fr, kernel@collabora.com,
 torvalds@linuxfoundation.org, 	gregkh@linuxfoundation.org,
 daniels@collabora.com, shreeya.patel@collabora.com, 	denys.f@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, 	melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com, 	broonie@kernel.org,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org, 
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, jarkko@kernel.org
Date: Fri, 24 Jan 2025 18:12:24 -0300
In-Reply-To: <f1c73327073c98ade56dfeabf629e2f9cd7d1663.camel@collabora.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
 <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
 <20250124081250.GA24731@pendragon.ideasonboard.com>
 <20250124135203.040d0852@foz.lan>
 <20250124130021.GA6853@pendragon.ideasonboard.com>
 <f1c73327073c98ade56dfeabf629e2f9cd7d1663.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

On Fri, 2025-01-24 at 10:45 -0500, Nicolas Dufresne wrote:
> Le vendredi 24 janvier 2025 =C3=A0 15:00 +0200, Laurent Pinchart a =C3=A9=
crit=C2=A0:
> > On Fri, Jan 24, 2025 at 01:52:03PM +0100, Mauro Carvalho Chehab wrote:
> > > Em Fri, 24 Jan 2025 10:12:50 +0200 Laurent Pinchart escreveu:
> > >=20
> > > > > It's been a few years since I first thought on finding a good way=
 of helping
> > > > > kernel developers testing their patches, while making use of the =
free runner
> > > > > minutes Gitlab offers. It can greatly simplify the testing for pe=
ople who are
> > > > > new to kernel development, or students trying to understand it be=
tter.
> > > > >=20
> > > > > And this patchset allows that to happen :)
> > > > >=20
> > > > > Actually, I spoke to Helen last year, and to enable it to run on =
the free
> > > > > Gitlab-CI runners, there is a small extra patch which is needed:
> > > > >=20
> > > > > https://lore.kernel.org/all/20240327013055.139494-2-leobras@redha=
t.com/ =20
> > >=20
> > > Sounds interesting!
> > >=20
> > > > Gitlab as an open-source software project (the community edition) i=
s one
> > > > thing, but can we please avoid advertising specific proprietary ser=
vices
> > > > in the kernel documentation ?
> > >=20
> > > Every time Gitlab is mentioned, the brand of the company that
> > > developed it and has been providing proprietary services is also
> > > advertised. If you're not happy with that, you should move to use
> > > a git forge developed by some open source community.
> >=20
> > I'm fine mentioning the gitlab community edition, I'm not fine
> > advertising gitlab.com SaaS in the kernel source tree.

Hello Laurent,

I see your point, and I see no issue on removing the two last lines of CI_T=
AGS
documentation.

I just added this information on documentation because the default runner u=
sed
for the Free Tier of Gitlab does not work for this CI, as it needs more
resources to run. This information can be added on some other place, but at=
 the
time I thought it would be ok to let it be there.=C2=A0
This other runner I mentioned in the patch is also available on the Free Ti=
er
(free as in beer).

I would like to make it clear that I have no connection/affiliation to Gitl=
ab,
other than a free account in their system, which I use for some CI. I have =
no
interest on advertising anything from them.

My only objective is to make it easier to hobbyists/beginners to use those
available free minutes to test some change before sending the patch, if the=
y
think that's valuable.

>=20
> I've just looked attentively, the intention is just to explain you may ne=
ed to
> set gitlab variable in your project fork in order to select correctly siz=
ed
> sized runners in your own instance.

That's correct

>  Its is not strictly about commercial gitlab.com instance.=C2=A0

Exactly, the change is about being able to choose the runner you want.

> The default only works with the original project used
> instance (which is not gitlab.com as far as I know), but the comment refe=
r to
> companies that will choose gitlab.com internally to reduce their IT cost.

Correct.
Companies can benefit on that, but my focus was on hobbyist (or begginers) =
who
may want to test their patches on free CI before sending them to the ML.

>=20
> Its quite a stretch to call this "advertisement", that makes it looks ver=
y
> dramatic. I personally believe its quite ahead of most other gitlab CI to=
 take
> into consideration running these pipelines on foreign (to the project)
> instances.
>=20
> Nicolas

Thank you!
Leo

>=20
> >=20
> > > The way I see, the best would be if the CI integration could work
> > > with more than one type of forge and being able to use any
> > > free Git??b-CI runners that would be available for developers to
> > > use, as this would allow testing more subsystems with CI, thus
> > > increasing code quality.
> >=20
>=20

