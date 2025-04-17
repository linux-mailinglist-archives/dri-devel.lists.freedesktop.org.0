Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3820A9210B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7917F10EB42;
	Thu, 17 Apr 2025 15:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="foF/2ACz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CA510EB39;
 Thu, 17 Apr 2025 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744902799; x=1745161999;
 bh=95A1EkO5NZJx8v2Lc4tIQHimXU5R5mNp0IlOnrqdUm0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=foF/2ACzPINTgBPjufT1uG0ShysVoGeRDzyxQxjEe079nE8ILr2Atyf6SWAgSiwjn
 k+oyqm3OnTLPTBEmQFDv+gselNjqFfz0hxq6+juNJYekhKYhliqGcJBr4Kfmb9gfIy
 X8FYlEKEJPaWZryWkCnqBcFsSlDNs0prtNVMIsJQFUftIJlvV4bjQ/Q933L0j3Azu3
 3UfCFbsQB+d+ZXi8PEphI0gpaeczFuE2rbw17TBCMzvLY1DkbusHY+JwNgdIZgzUzS
 5G5Z651ZtKqXzQhlzxkY5yrV38U0pB6wmDoOVUbuFd9e7v+0XKsQMnGxW9FR/5vNeK
 iVAXJ6cJ2wF0w==
Date: Thu, 17 Apr 2025 15:13:13 +0000
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Stone <daniel@fooishbar.org>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 06/43] drm/colorop: Add 1D Curve subtype
Message-ID: <xviNq9d7_VImoc9g_g0BFeCItNGmtZtb3MCp5Ypk78lAoMgttG2RG3luB-Yhl51JdFEfHDd1E20OwZQ1GpTS-TsPTE6HCuBbeZN6Ye7kmhU=@emersion.fr>
In-Reply-To: <8e373d60-6dc1-4b48-af99-e0a0d3a324cc@intel.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
 <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
 <8e373d60-6dc1-4b48-af99-e0a0d3a324cc@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: c3de532f8403b8484765cd84d08400d3597cbae6
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

On Tuesday, April 15th, 2025 at 13:12, Borah, Chaitanya Kumar <chaitanya.ku=
mar.borah@intel.com> wrote:

> On 4/8/2025 10:10 PM, Daniel Stone wrote:
>=20
> > As it stands, I've gone through the implementation pretty thoroughly,
> > as well as our use of it in Weston. I'm happy with how it looks for
> > pre-blend, and I'm even happier that the implementation is written to
> > apply easily to apply to post-blend CRTC pipelines.
>=20
> Since we are planning to use this frame work on post-blend pipelines
> eventually. Should we change the name space of the current pre-blend
> helpers to reflect that?
>=20
> e.g.
>=20
> s/drm_colorop_curve_1d_lut_init/drm_plane_colorop_curve_1d_lut_init/
> s/drm_colorop_3dlut_init/drm_plane_colorop_3dlut_init/

No objections against that, but I'd also be fine with keeping the
current names because it's not yet clear how these functions will be
adapted for post-blending. Maybe the functions will be re-used and the
plane argument dropped, in which case it'd make more sense to keep the
current name. We don't know yet.
