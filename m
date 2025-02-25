Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32473A44357
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1CA10E6FA;
	Tue, 25 Feb 2025 14:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="REv2BHHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65710E6F9;
 Tue, 25 Feb 2025 14:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1740494753; x=1740753953;
 bh=2yOAPW2VetlTHtNsRq8Uu/gKuxQsWhSKlrxs6ueMk/k=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=REv2BHHLz0Q2Tt7Y1zhHgRyWqC1UnT2CyR8joVDeQFRF69M8w2YYYQoY3YAthyOmp
 jFhqco/UHsapEaVgxQa4x1iEXqJV4Wde2lp25N0PD7kcaXMetkSC/hFkEhSSaYtrtk
 gFR81ysXc8my4QpHTdfDmUz/cNLdytLo3SF9qIj5oC3Pq1iTRsqsVS7oDxA12z2C2g
 ttkZDz9+VCZnUYujA9R5gGZOfbw7NpebsYFheROCTyGBzFqnLLL+rC5Z/M9Pu2VEG9
 PzgrLHjFaGCapAiZbump+hqgtx0ICzsKF4ja9tF8gsMj5EbZxDnqrwefjN9+wj6ezT
 LyId/NlWZF0GA==
Date: Tue, 25 Feb 2025 14:45:49 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [V7 02/45] drm/vkms: Round fixp2int conversion in lerp_u16
Message-ID: <YEcSNl71FeEEa6hG0zCc-mlVnSgqcNKQtk4DZoLzZbhTvS73_VbTkg3eMTsFUeV82Z0p2sSk1cS6llYeU4q4_VWWg8l2MQi4Gmz8ervZHe0=@emersion.fr>
In-Reply-To: <1a523721-0228-4ed4-932e-ad4bcf317ff5@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-3-alex.hung@amd.com>
 <99a8779c-bb1c-44fc-b8a3-56ea80425c15@bootlin.com>
 <sumH-jMWxEB0ReC-xhqT2YbATq4l_TMfU2_ogO2tyM7iYG5Fp0XM7guLPCcUOuxW6uLW1YOoTNegOUOJVGiWYDxGaaGcXNjA5eZ8axRgl8E=@emersion.fr>
 <f307f2d3-44e4-45bf-ba94-57459043b7a6@bootlin.com>
 <1a523721-0228-4ed4-932e-ad4bcf317ff5@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: fa274b44b7a39a17dd4c3228b603d14d92dfd8da
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

On Tuesday, February 25th, 2025 at 15:43, Harry Wentland <harry.wentland@am=
d.com> wrote:

> > > We need to be a bit careful when merging patches from the same series
> > > via multiple trees. Maybe we'll merge the colorop stuff via the amd
> > > tree? I don't remember the rules around trees, and I don't know if it
> > > would be fine to merge the vkms changes in that tree as well. (I only
> > > remember Simona recommending against merging via multiple trees, beca=
use
> > > it's painful.)
> > >=20
> > > If we can't merge the vkms changes via the amd tree, they will likely
> > > need to wait for the amd tree to be merged back in drm-next?
> > >=20
> > > If we merge some changes via drm-misc-next, then we won't be able to
> > > merge the rest via amd, if the rest depends on these changes.
> >=20
> > If the drm-*-next branches are synchronized often, I propose to split i=
nto 4 series:
> > - 2/45, in drm-misc-fixes (it is a bug)
> > - 3/45, in drm-misc-next (only the vkms part needs it, can be merged ju=
st after 1 with minor conflict resolution, which I can do)
> > - 1, 4..13, 21..45, in drm-amd-next
> > - 14..20, in drm-misc-next, once drm-amd-next is merged in drm-misc-nex=
t (I don't expect huge conflicts if this is merged "soon", afaik nobody is =
currently working on the composition algorithm)
>=20
> I would think it's easier if it all goes in via drm-misc next,
> except for patch 2 which can be part of drm-misc-fixes. Alex
> and I based our branches on drm-misc-next. There shouldn't be
> major conflicts with drm/amd code but we can check that before
> merging.

That sounds like the simplest solution to me :)
