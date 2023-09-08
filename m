Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B797987CE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 15:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D7F10E8B1;
	Fri,  8 Sep 2023 13:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49A10E8B1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 13:28:07 +0000 (UTC)
Date: Fri, 08 Sep 2023 13:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1694179684; x=1694438884;
 bh=/txPwaYkK2YjKdxlbCrglUlQojafQuRShWTm3ayHhXo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=OhsMVqPc9yxfDSZJQlEgOIHtuHU8KtzmVnKpH7uiZm8onnGwUFKrdLdTaIwRcRW8c
 VYTKQs+LQiul1pzMo2LNrfP7FRdVQcaTZn6+W6y+CaVQT2Zi07H5V9+hCwTWpigCVs
 JrNFvFWXhbh0ZIt3nctfHz615Ox8c/oJDKzzrSSs4Nn9NsEeDxSw7iJK6xGaH8pMWn
 HXhOofwJNngS207DyZhuEbuO+1gU4vc9KZ4YjqX7d12DxxZlguMKwG3c3OZhyAdKgs
 94OmoGQs7eFJP7zvf4SBFUBfZ+iE/QHghAJTdCEL2lq1yBnSmOr4NXoe+Sr9mnB1nT
 hDV1pMlirUKyA==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Message-ID: <R7P5IkLnpCf820mSd40NyAYKF0tVRC0cFa4FuO2kvxJ7QKEe0_cMHy7bo1AkILPcbD38vV3NNb9_ACrkH5Wl4R1sq44dxZ1lnivkJ9grs0o=@emersion.fr>
In-Reply-To: <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
 <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 Maxime Ripard <mripard@kernel.org>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, September 8th, 2023 at 22:22, Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:

> Am 08.09.23 um 12:58 schrieb Maxime Ripard:
>=20
> > Hi,
> >=20
> > On Fri, Sep 08, 2023 at 11:21:51AM +0200, Thomas Zimmermann wrote:
> >=20
> > > Am 25.08.23 um 16:04 schrieb Jocelyn Falempe:
> > > [...]
> > >=20
> > > > + *
> > > > + * But there are two exceptions only for dumb buffers:
> > > > + * * To support XRGB8888 if it's not supported by the hardware.
> > >=20
> > > > + * * Any driver is free to modify its internal representation of t=
he format,
> > > > + * as long as it doesn't alter the visible content in any way, and=
 doesn't
> > > > + * modify the user-provided buffer. An example would be to drop th=
e
> > > > + * padding component from a format to save some memory bandwidth.
> > >=20
> > > I have strong objections to this point, especially as you're apparent=
ly
> > > trying to sneak this in after our discussion.
> >=20
> > I think it's an unfair characterization. This was discussed on
> > #dri-devel, and went through several rounds over the mailing lists, wit=
h
> > you in Cc for each. How is that sneaking something in?
>=20
>=20
> A few months ago, we had a flamewar'ish IRC discussion on format
> conversion within the kernel. The general sentiment was that the kernel
> drivers should use what ever is provided by userspace without further
> processing. The short argument was 'userspace knows better'. The only
> exception is for supporting XRGB8888 on hardware that would otherwise
> not support it. After some consideration, I agree with all that. (Back
> then I didn't.)

(FWIW, as a userspace dev, the above makes perfect sense to me.)
