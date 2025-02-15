Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA591A36ED9
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 15:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7968810E086;
	Sat, 15 Feb 2025 14:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="lhgelI9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC3410E086;
 Sat, 15 Feb 2025 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1739630421; x=1739889621;
 bh=NQ9/7r73hOxVp/ZD120Jn5La0MPtPWunQ/mAmKJx/uM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=lhgelI9bruPA2rYFf0VfTeg3DqGlVbtOKAkzDJf3TJhim3z85uN1LoBsgGAKI3Wc4
 BbpdHBY6IVcjHfl6kRko8CQfEVU2t04VDpE9bSro/NRJhNLKrGVkLqjY8eR555s7Cn
 /u7IJdIuRB8Wx7hE8q4D6SAtdv7i6Bk7+sb/aMxpoGG/sVpfsjJxK+bpgsNNvE3pSJ
 +qJkZ2unzU+RSlRxF45atlAvQ2hq/3qjXPgn0qhO/n5Bx3QZRaIC6QTSmRnJ05EhS6
 xjKF1wIuztNWJ6ZcXOLYflAn3I/dWytQodu5IWmISxJpiAp95hVlOKriNVoDY9eVfh
 0KRWmGfRPOQeA==
Date: Sat, 15 Feb 2025 14:40:17 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Subject: Re: [V7 08/45] Documentation/gpu: document drm_colorop
Message-ID: <TFAFx0Fj4cqaba_HYCGoFyvpZVhmaa2KEHRsejqoqEr64CBhJRzpaBs4ZuQWQIJDSQovx0NwwYKhb0GrbhyBWxNGxJbmxckHlyCDtJBbSYs=@emersion.fr>
In-Reply-To: <5eb5fecd-caa8-4e40-8fe9-23599dc59bbf@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-9-alex.hung@amd.com>
 <eDrRzjuU_q4z4Jvq-DYxUnw2a-VUts65NbWMZbhrvqYoKbcW_jUawJ_ZirFIFQzrtMG4asLn6f9WP24o-k4DnP_oYf5R94PYoMIejFqdTZM=@emersion.fr>
 <5eb5fecd-caa8-4e40-8fe9-23599dc59bbf@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 9c7d09ea2ba0156794c6677e10ed088451e6293d
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, February 10th, 2025 at 23:03, Harry Wentland <harry.wentland@amd=
.com> wrote:

> > > + * DOC: overview
> > > + *
> > > + * A colorop represents a single color operation. Colorops are chain=
ed
> > > + * via the NEXT property and make up color pipelines. Color pipeline=
s
> > > + * are advertised and selected via the COLOR_PIPELINE &drm_plane
> > > + * property.
> > > + *
> > > + * A colorop will be of a certain type, advertised by the read-only =
TYPE
> > > + * property. Each type of colorop will advertise a different set of
> > > + * properties and is programmed in a different manner. Types can be
> > > + * enumerated 1D curves, 1D LUTs, 3D LUTs, matrices, etc. See the
> > > + * &drm_colorop_type documentation for information on each type.
> >=20
> > It's not super nice to refer to internal kernel docs here, because AFAI=
U
> > this section is mostly written towards user-space developers. User-spac=
e
> > developers have no idea how internal kernel structs work.
> >=20
> > It would be nicer to have a list of colorop types here, without referri=
ng
> > to kernel internals. For instance, we have a list of
>=20
> I'm not sure I follow. This is linking to the drm_colorop_type
> (from drm_mode.h) enum documentation in drm-uapi.html.
>=20
> Duplicating it here would mean that sooner or later the two
> docs will get out of sync.

Oh, I thought this was an internal kernel enum. I guess the only missing
thing is the string exposed to user-space for each enum entry then?

In any case, sounds good to me.

> I agree with the rest and we'll reflect that in v8.

Sweet!
