Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26262760B13
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF1910E399;
	Tue, 25 Jul 2023 07:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9607F10E399
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:02:36 +0000 (UTC)
Date: Tue, 25 Jul 2023 07:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1690268554; x=1690527754;
 bh=wDy2s35D0p2BYX5LDcVStPxYTQbKkfPe7M8mZSirl80=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=C/QrTcc6LF7MUrxxEU4w7LuUmfGcP6biTF5cnnbZRRV7yOdC9Hb32Nzep8K18ax47
 3IbjBcExeyvR6MlSUPHftJxhFw240B8cxkupHTvD2G5fMsPFIwNm60wfuByX4lmJ2q
 H6Eqy/mo9oeiYsEA0wkmtGCDUvqeR3RWw64QufcSS+JLcFQeS3m5W8rnCWbA2OM/uP
 ZZ2yqgTTKz8J/I+NP/X44QomuBhP9Wsm+LkZDuvWZYdxY4wfRf3qQgrh/QWbxmHUwV
 L7QWHYP910cHxbNBrY8RuxioFjTEywHmf9oPyhZ1s5bG59YQyS33Zbejjk42GLqX+L
 yXlmDbN1HtJPw==
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Non-robust apps and resets (was Re: [PATCH v5 1/1] drm/doc:
 Document DRM device reset expectations)
Message-ID: <4ImkvYT8BoTiT_R4YqwMS2k20KRuGBvPF05lQX9R_zDtLKNRP646_V2VnGid__mG_h1cI8cL-uco3aXd9cpFnaBlfbwCaQOVwRYCthEhuQI=@emersion.fr>
In-Reply-To: <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?utf-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, July 25th, 2023 at 04:55, Andr=C3=A9 Almeida <andrealmeid@igali=
a.com> wrote:

> It's not clear what we should do about non-robust OpenGL apps after GPU
> resets, so I'll try to summarize the topic, show some options and my
> proposal to move forward on that.
>=20
> Em 27/06/2023 10:23, Andr=C3=A9 Almeida escreveu:
>=20
> > +Robustness
> > +----------
> > +
> > +The only way to try to keep an application working after a reset is if=
 it
> > +complies with the robustness aspects of the graphical API that it is u=
sing.
> > +
> > +Graphical APIs provide ways to applications to deal with device resets=
. However,
> > +there is no guarantee that the app will use such features correctly, a=
nd the
> > +UMD can implement policies to close the app if it is a repeating offen=
der,
> > +likely in a broken loop. This is done to ensure that it does not keep =
blocking
> > +the user interface from being correctly displayed. This should be done=
 even if
> > +the app is correct but happens to trigger some bug in the hardware/dri=
ver.
> > +
>=20
> Depending on the OpenGL version, there are different robustness API
> available:
>=20
> - OpenGL ABR extension [0]
> - OpenGL KHR extension [1]
> - OpenGL ES extension [2]
>=20
> Apps written in OpenGL should use whatever version is available for them
> to make the app robust for GPU resets. That usually means calling
> GetGraphicsResetStatusARB(), checking the status, and if it encounter
> something different from NO_ERROR, that means that a reset has happened,
> the context is considered lost and should be recreated. If an app follow
> this, it will likely succeed recovering a reset.
>=20
> What should non-robustness apps do then? They certainly will not be
> notified if a reset happens, and thus can't recover if their context is
> lost. OpenGL specification does not explicitly define what should be
> done in such situations[3], and I believe that usually when the spec
> mandates to close the app, it would explicitly note it.
>=20
> However, in reality there are different types of device resets, causing
> different results. A reset can be precise enough to damage only the
> guilty context, and keep others alive.
>=20
> Given that, I believe drivers have the following options:
>=20
> a) Kill all non-robust apps after a reset. This may lead to lose work
> from innocent applications.
>=20
> b) Ignore all non-robust apps OpenGL calls. That means that applications
> would still be alive, but the user interface would be freeze. The user
> would need to close it manually anyway, but in some corner cases, the
> app could autosave some work or the user might be able to interact with
> it using some alternative method (command line?).
>=20
> c) Kill just the affected non-robust applications. To do that, the
> driver need to be 100% sure on the impact of its resets.

We've discussed this a while back on #dri-devel IIRC. I think the best
experience would be for the Wayland compositor to gray out apps which
lost their GL context, and display an information dialog to explain
what happened to the user and a button to kill the app. I'm not exactly
sure how that would translate to a kernel or Mesa uAPI, and if there's
appetite to do a lot of work to get "the best GPU reset UX" (IOW: maybe
it's not worth all of the trouble).
