Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275689BDE25
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 06:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3A410E629;
	Wed,  6 Nov 2024 05:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="niRMnD/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CB710E116
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 05:04:23 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; s=key1;
 t=1730869461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HU2FgKEr1fhOjtgslxIdAEo3xX+OzWXmdwVSvh7wQrk=;
 b=niRMnD/A6eZ6rUQyFxKiXIPVFga8PQ7mvS3yX8P5oK41TiTdgDrvGy4n0N1KsWMaSRJATC
 iwyanom3nmNGGh1mO+zWBJsgjpRjnAPP8FNXK0qz6OUUfG2PwgwrD4yV/qZMEDywSYZBcp
 nxh1kMB42C81RMbnr9bYgAeLb07pKwU0wxs3ZX5TgksGmkdRAhMAIpHMn1Lk27ZNnyfpiU
 zSMDSKrcyy2Z1whmplJqjZYmxpA8MeIxAdJXAeIBgcYsphIyX+8Cu5oin9XDJUT54cFDkW
 1+kRnbuLpTC9bWqSK1EpxX4IB4Gj2VqkUz8k4srRjDBJixI6wgDmeihe64W9XA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Nov 2024 21:04:14 -0800
Message-Id: <D5EU0I3P38QA.NOC91EEFYWMG@kode54.net>
Cc: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 <kernel-dev@igalia.com>, "Simon Ser" <contact@emersion.fr>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, <joshua@froggi.es>,
 <ville.syrjala@linux.intel.com>, "Daniel Stone" <daniel@fooishbar.org>,
 "Xaver Hugl" <xaver.hugl@gmail.com>, "Harry Wentland"
 <harry.wentland@amd.com>, "Simona Vetter" <simona@ffwll.ch>, "Alex Deucher"
 <alexander.deucher@amd.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, "Leo Li" <sunpeng.li@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "David Airlie"
 <airlied@gmail.com>, "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, "Xinhui
 Pan" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH RESEND v9 1/2] drm/atomic: Let drivers decide which
 planes to async flip
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Christopher Snowhill" <chris@kode54.net>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
References: <20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com>
 <20241101-tonyk-async_flip-v9-1-681814efbfbe@igalia.com>
 <D5CC3U00B7CG.IGKCIES8PC2J@kode54.net>
 <00a99b3e-3fad-42fb-8dc8-4f45d158c4c1@igalia.com>
 <D5E5ZXW1K0A7.1VT1XCR1HIEST@kode54.net>
 <CAA8EJpoEEo5tB00Yqoi7V2U=pRud1W44W3V8bJnr3N468EhQOw@mail.gmail.com>
In-Reply-To: <CAA8EJpoEEo5tB00Yqoi7V2U=pRud1W44W3V8bJnr3N468EhQOw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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

On Tue Nov 5, 2024 at 2:51 AM PST, Dmitry Baryshkov wrote:
> On Tue, 5 Nov 2024 at 10:15, Christopher Snowhill <chris@kode54.net> wrot=
e:
> >
> > On Mon Nov 4, 2024 at 12:52 PM PST, Andr=C3=A9 Almeida wrote:
> > > Hi Christopher,
> > >
> > > Em 03/11/2024 03:36, Christopher Snowhill escreveu:
> > > > On Fri Nov 1, 2024 at 11:23 AM PDT, Andr=C3=A9 Almeida wrote:
> > > >> Currently, DRM atomic uAPI allows only primary planes to be flippe=
d
> > > >> asynchronously. However, each driver might be able to perform asyn=
c
> > > >> flips in other different plane types. To enable drivers to set the=
ir own
> > > >> restrictions on which type of plane they can or cannot flip, use t=
he
> > > >> existing atomic_async_check() from struct drm_plane_helper_funcs t=
o
> > > >> enhance this flexibility, thus allowing different plane types to b=
e able
> > > >> to do async flips as well.
> > > >>
> > > >> In order to prevent regressions and such, we keep the current poli=
cy: we
> > > >> skip the driver check for the primary plane, because it is always
> > > >> allowed to do async flips on it.
> > > >>
> > > >> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > > >
> > > > Should I do a R-b too?
> > >
> > > If you can review the code, it's always really appreciated.
> >
> > I mean, I did review your changes, they looked good to me. I just didn'=
t
> > know the protocol for reporting review in addition to testing.
>
> Please respond with the R-B tag. Also ideally the Tested-by should
> contain the reference to a platform which was used to test it.
>
> >
> > >
> > > > The changes looked sound enough for me to feel
> > > > like testing it as well. Tested Borderlands Game of the Year Enhanc=
ed on
> > > > my RX 7700 XT at maximum settings at 1080p165, and the tearing supp=
ort in
> > > > labwc allowed it to reach over 700fps. No problems from the hardwar=
e
> > > > cursor.
> > >
> > > Thanks for testing and reporting!
> > >
> > > >
> > > > Tested-by: Christopher Snowhill <chris@kode54.net>
> > > >
> >

Reviewed-by: Christopher Snowhill <chris@kode54.net>
Tested-by: Christopher Snowhill <chris@kode54.net> on Radeon RX 7700 XT
using labwc-git

(I must admit, the documents do not make it clear what format the
Testing-by tag should take, or how to append which hardware it was
tested on, etc.)

