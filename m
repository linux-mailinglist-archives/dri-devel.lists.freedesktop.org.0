Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A75A83FEF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 12:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C12B10E909;
	Thu, 10 Apr 2025 10:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="sCFGp+Rb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch
 [79.135.106.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEB310E8EF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744279506; x=1744538706;
 bh=a0PmIjVpn6+ZZyoruGcrXoaq5tqC4043l7RM9cXe9ks=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=sCFGp+RblTIv67YZrlWnipHmSJW8a1NR9rLPEtntwIxm2eBsGu7d1vRb9OQL6vTjl
 gaYvc+vqBy6meY2h5Cdgd07vWGDw0h5c8VWp/cMNREsslpFm3qg9Igx2CvJ7bUQpcI
 TIuc++GbUFYCr8FxtiIyRRcRQKfhfat0SV4DQ3y1XjrwPRsxE0DYIOQacszEYvweGf
 9ZPgdrbCJ49lzuJ9L96cNin3kT66T6MwxUHm/IM+BFt7kUbh00OzmZ/00bJPbXxMSi
 wBmginFhQoqbtvIyaAPYeOqKJaC9eAMFwyydQQg87pKQnkRgU7dCKaepjL7XHv9b9I
 42HGLf1NwF/lw==
Date: Thu, 10 Apr 2025 10:05:01 +0000
To: Daniel Stone <daniel@fooishbar.org>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 06/43] drm/colorop: Add 1D Curve subtype
Message-ID: <MR7_zVZrR_3bSN7m-enTemf85SJ72q5U9wrgkd5iA8hXjFGsP2bIVafb98M_FR0Uydk9EsCS4vmgGGe2a5d1MRhTTckzy39OeSAX1bvau9Q=@emersion.fr>
In-Reply-To: <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
 <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 2a2f913221d15e191e1c96cc340e2f5fb5f7aafd
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

On Tuesday, April 8th, 2025 at 18:40, Daniel Stone <daniel@fooishbar.org> w=
rote:

> > > 5. For a given colorop property, is it an invariant that the colorop
> > > will only appear in one color pipeline at a time? (I believe so, but
> > > this probably needs documenting and/or igt.)
> >=20
> > I don't really understand why that would matter to user-space.
>=20
> Plane A: COLOR_PIPELINE@123 =3D { 1D_CURVE@456 }
> Plane B: COLOR_PIPELINE@789 =3D { 1D_CURVE@456 }
>=20
> If userspace wasn't defensive about this, it would program the curve
> for 456 twice, and unless they were the same you'd get undesirable
> results.
>=20
> The existing implementation is fine here, I think it just needs better
> igt to codify the expectations we all have.

Oh right, the same pipeline can definitely not be used on two different
planes, because KMS properties are set on the colorop objects by
user-space to configure the pipeline.

> > > Either way, I suspect that clorop->plane is the wrong thing to do, an=
d
> > > that it maybe wants to be a list of planes in the drm_colorop_state?
> >=20
> > I don't think so, for a given plane, there can only be a single pipelin=
e
> > active at a time.
>=20
> Yeah, again that was just not having grasped that the colorop not
> being derived from the plane was actually about allowing for it to be
> attached to a single CRTC instead, rather than potentially multiple
> planes. I have no concerns around this.
>=20
> As it stands, I've gone through the implementation pretty thoroughly,
> as well as our use of it in Weston. I'm happy with how it looks for
> pre-blend, and I'm even happier that the implementation is written to
> apply easily to apply to post-blend CRTC pipelines.

Sweet!
