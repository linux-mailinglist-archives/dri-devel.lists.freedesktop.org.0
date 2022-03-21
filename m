Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDAB4E3209
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 21:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3210E489;
	Mon, 21 Mar 2022 20:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719A610E489
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 20:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=+iAje8HwoTKVVLsYWwFwzmevqMzSU+vHd9tB8rvnpPo=;
 b=Dx/BdeKDKr6Jz7BFJAQVU4IP344Oqgt4621CERh1G1ZOrKNgWjuQFXS0
 TgszBxQo9BVrNkSWTe/MYkTtjTTJ6UWNTsl0eswAGkKY8QiT1cC6dh8e6
 hTgXwe4yxyWfN2ZOYAuNZcZ8eZijxucPeaoCXpl7x6bJL26PCQUMUbUJO c=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,199,1643670000"; d="scan'208";a="27317259"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 21:48:55 +0100
Date: Mon, 21 Mar 2022 21:48:55 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 18/22] drm/i915: Use drm_mode_init() for
 on-stack modes
In-Reply-To: <YjjKnUbcJRpcoxoI@intel.com>
Message-ID: <alpine.DEB.2.22.394.2203212147050.3189@hadrien>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-19-ville.syrjala@linux.intel.com>
 <877d8upbsp.fsf@intel.com> <YjjKnUbcJRpcoxoI@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1112260562-1647895664=:3189"
Content-ID: <alpine.DEB.2.22.394.2203212148250.3189@hadrien>
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
Cc: intel-gfx@lists.freedesktop.org, Nicolas Palix <nicolas.palix@imag.fr>,
 dri-devel@lists.freedesktop.org, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1112260562-1647895664=:3189
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2203212148251.3189@hadrien>



On Mon, 21 Mar 2022, Ville Syrjälä wrote:

> On Wed, Mar 16, 2022 at 10:00:06AM +0200, Jani Nikula wrote:
> > On Fri, 18 Feb 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > >
> > > Initialize on-stack modes with drm_mode_init() to guarantee
> > > no stack garbage in the list head, or that we aren't copying
> > > over another mode's list head.
> > >
> > > Based on the following cocci script, with manual fixups:
> > > @decl@
> > > identifier M;
> > > expression E;
> > > @@
> > > - struct drm_display_mode M = E;
> > > + struct drm_display_mode M;
> > >
> > > @@
> > > identifier decl.M;
> > > expression decl.E;
> > > statement S, S1;
> > > @@
> > > struct drm_display_mode M;
> > > ... when != S
> > > + drm_mode_init(&M, &E);
> > > +
> > > S1
> > >
> > > @@
> > > expression decl.E;
> > > @@
> > > - &*E
> > > + E
> > >
> > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > I wonder if that cocci could be added to scripts/coccinelle or something
> > to detect anyone adding new ones?
>
> Maybe.
>
> Julia & co, would you be open to having drm subsystem specific
> coccinelle scripts? If so where should we put the?
> scripts/coccinelle/drm perhaps?

That would be fine.  It is possible to make a script only apply to a
specific directory, but I think that that is not necessary in this case,
since you mention types that are only relevant to drm code.

julia
--8323329-1112260562-1647895664=:3189--
