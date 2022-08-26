Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD345A277B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 14:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2398010E8A4;
	Fri, 26 Aug 2022 12:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 162498 seconds by postgrey-1.36 at gabe;
 Fri, 26 Aug 2022 12:17:20 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B9E10E8AC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 12:17:20 +0000 (UTC)
Date: Fri, 26 Aug 2022 12:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661516237; x=1661775437;
 bh=OSthPTGbVvxnC/eApRpZRp+j9MIhB7nUPXuEUpLiRDo=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=OcmI4m5XEk+dptQPccKJPXTdeZYRT2jQUqO+ujyGCYGzowlAPr0qdS+9gMAS1bT7B
 8BUHJzeGHPKadNLyp1conmplPeAHTMCKQtow61fl/vhlMRZ/FMcOrBhH2el0f9q64z
 VLRxMRW/Ygh1Lp7h1F0iT9cvrFu16KDhsphLf9SfZ1SP81K1qm7oxfXoXpm5ZiAcr5
 Mxf+IJ6QwAdFVMjwZSmmy/MO0NlPEUhfIB+ok/DGmyG1FnqVRTmK2bik/ebn/b/4/j
 4kFVbbTF2KRwXLvWQB2KI2bSu7E7rvch93uhc6o+5+i4TkwEAGOgaHwTa4FgwrEYZU
 kK1LWdqwjGb5w==
To: Sebastian Wick <sebastian.wick@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <1mpWeZzQLcq5D99K0SJS_TB1xrG-YDLYDYcMwRpelbtZCA_PY3TSWwZKQnOBbtyiguz3bxbnDUq2PH5qbzz1Kt-xMoh4sLzzK2IbJQIRKTg=@emersion.fr>
In-Reply-To: <CA+hFU4zUi42eKGbJfeB3caKXnZ_xQ5dQ_bu83EFVLM-S9SqkwQ@mail.gmail.com>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <CA+hFU4zUi42eKGbJfeB3caKXnZ_xQ5dQ_bu83EFVLM-S9SqkwQ@mail.gmail.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, August 26th, 2022 at 11:49, Sebastian Wick <sebastian.wick@redha=
t.com> wrote:

> > > +/*
> > > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > > + *
> > > + * Allow the update to result in visible artifacts such as a black s=
creen.
> >=20
> > Maybe add:
> >=20
> > ...temporary or transient visible artifacts while the update is
> > being applied. Applying the update may also take significantly
> > more time than a page flip. The visual artifacts will not
> > appear after the update is completed.
> >=20
> > This flag must be set when the KMS update might cause visible
> > artifacts. Without this flag such KMS update will return EINVAL
> > error. What kind of updates may cause visible artifacts depends
> > on the driver and the hardware. Userspace that needs to know
> > beforehand if an update might cause visible artifacts can use
> > DRM_MODE_ATOMIC_TEST_ONLY without DRM_MODE_ATOMIC_ALLOW_MODESET
> > to see if it fails.
> >=20
> > Visual artifacts are guaranteed to not appear when this flag is
> > not set.
>=20
> That doesn't seem to be true, though. For example setting
> HDR_OUTPUT_METADATA for example does result in visual artifacts on my
> display no matter if the flag is specified or not because the
> artifacts are not the result of a mode set but of the display reacting
> to some AVI InfoFrame.

One would need to read the HDMI spec to see if there's anything in
there about artifacts on AVI InfoFrame change, then figure out whether
this is a bug in the physical screen itself or whether the kernel
driver should require ALLOW_MODESET when updating the HDR metadata.
