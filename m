Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE9141121
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 19:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88CE6F8C0;
	Fri, 17 Jan 2020 18:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AE56F8C0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 18:51:03 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDAD82072B;
 Fri, 17 Jan 2020 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579287063;
 bh=4ObExroSCWGNve5s7TIFQsVIfvlgT8E/TPphO4LISMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ydq2ZkRUsvqU3hkGtut5GGp6gk3tig3v5IzWC0YDjWoD1OmLFBzxqUTfVJgzpvthV
 C4QSN44EN3HR2sdBc8jelB1x/Q4HC5rtFrq4GNGwiQTqXf5gNjEDSOIwad8hOUetBv
 DP1Vk4rjtXYXfmA7q99VjJ7oaZG/v8V2VOrMwC7s=
Date: Fri, 17 Jan 2020 19:51:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v3 0/2] drm/modes: Apply video parameters with only
 reflect option
Message-ID: <20200117185100.dukz3e7np3z3df7k@gilmour.lan>
References: <20200117153429.54700-1-stephan@gerhold.net>
MIME-Version: 1.0
In-Reply-To: <20200117153429.54700-1-stephan@gerhold.net>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2050578624=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2050578624==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uwwjmypui72mlvgs"
Content-Disposition: inline


--uwwjmypui72mlvgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 17, 2020 at 04:34:27PM +0100, Stephan Gerhold wrote:
> At the moment, video mode parameters like video=540x960,reflect_x,
> (without rotation set) are not taken into account when applying the
> mode in drm_client_modeset.c.
>
> One of the reasons for this is that the calculation that
> combines the panel_orientation with cmdline->rotation_reflection
> does not handle the case when cmdline->rotation_reflection does
> not have any rotation set.
> (i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK == 0)
>
> However, we really should not generate such a value in the first place.
> Rotation values should have exactly one rotation angle set
> (DRM_MODE_ROTATE_0 for "no rotation").
>
> This patch set changes the command line parser to make sure that we generate
> only valid rotation values (defaulting to DRM_MODE_ROTATE_0).
>
> Finally it allows DRM_MODE_ROTATE_0 when applying the rotation from
> the video mode parameters to make parameters without rotation work correctly.

For both,
Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--uwwjmypui72mlvgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXiICFAAKCRDj7w1vZxhR
xWDxAP45kBL/5cehzw/XENZhwg7OY1VXhJzlmwNrg1wAEuKOngD/f/wtyLXFhjFk
rhQg2u9f3Jj0m2P+pKa+vdXTsl1jBgo=
=B6rY
-----END PGP SIGNATURE-----

--uwwjmypui72mlvgs--

--===============2050578624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2050578624==--
