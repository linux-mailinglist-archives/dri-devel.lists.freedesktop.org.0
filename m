Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F4199A203
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 12:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BF110EAB7;
	Fri, 11 Oct 2024 10:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JUfyIGgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B751D10EAB7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 10:52:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8BCF65C57D4;
 Fri, 11 Oct 2024 10:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C46C4CEC3;
 Fri, 11 Oct 2024 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728643978;
 bh=TgpF+7NS9AXWbh1yGObPEQmNgPlJT65WHKDqj2GUMrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JUfyIGgNc+uLRBWg2wKp+RRQwWlfbf+dIPxsakYq4km3TJGto+6R5FKzX0KxDOKOF
 ObOIf/wywkRVHCI1DsWdhJ0ecgn755Q+fJXqdMsxWk1AKdA+qd2XyDeOv5tJiIZNka
 0ifRb8eZztP5KFnshHdRRJxc3WKa5k/cZTfHnYO6gU682bpusyq1dkjXLBm8p8kKRo
 5SVm2B3yIcjiDeCgDwRPiYC8oIIqV/SfEySP0d3o1ZSSxB4KT/Cvdym3ITQPpgqv+c
 gCGpl1WVfRKs/DJDIxsfMwb5YO85Z9wmWGfAzoZbB7FGpd3790ZIJ4afkGa9BaFpuf
 RtRvSJv1VIzfQ==
Date: Fri, 11 Oct 2024 12:52:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch, 
 jani.nikula@linux.intel.com, airlied@redhat.com, jfalempe@redhat.com, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/7] drm: Add physical status and BMC support to conenctor
Message-ID: <20241011-hungry-ultraviolet-mongoose-caad0d@houat>
References: <20241011065705.6728-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ypdi53ik4rdvpvbs"
Content-Disposition: inline
In-Reply-To: <20241011065705.6728-1-tzimmermann@suse.de>
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


--ypdi53ik4rdvpvbs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 11, 2024 at 08:43:05AM GMT, Thomas Zimmermann wrote:
> Track a connector's physical status separately from the logical status
> and implement BMC support for DRM drivers. Connectors with virtual BMC
> stay connected even if no display is physically connected. DRM clients
> then continue displaying output to the BMC.
>=20
> Ast and mgag200 have been doing this for a while. Moving this into
> struct drm_connector and probe helpers simplifies htese divers and
> makes the functionality available to others. Hibmc is a candidate here.
>=20
> Patch just simplifies code in probe helpers and has been acked as part
> of the series at [1].
>=20
> Pathces 2 and 3 add the physical status and a BMC flag to struct
> drm_connector. Usually physical connector status and regular, logical
> status are in sync, so nothing changes for most drivers. If the the
> BMC flag has been set, the logical status is always connected. The
> probe helpers also take care of sending hotplug events if the physical
> status changes.
>=20
> Patches 4 to 7 update ast and mgag200. Both drivers already implement
> their own tracking of physical status, which is now handled by DRM
> helpers. Ast also receives two simple bug fixes for cleaning up EDID
> properties in the BMC case.
>=20
> Tested on ast and mgag200 hardware. Another driver that could make use
> of this functionality is hibmc.

Generally speaking, it looks ok, but given how much of a corner case it
is, we should have kunit tests to cover the whole thing.

Maxime

--ypdi53ik4rdvpvbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwkDhgAKCRAnX84Zoj2+
dgOnAX9w/EFXGQELCJO9G22/OX9NUJUoPuQbkdmNLcTStR+RSnz0Dg4AwJRZqND8
dFIzmUsBfjL6UzzJod5jqC6Vq8mrC5P6pXbxGuGUOOmBkrPlnPH4xIJgrqkICCa6
F1yiOS8n6w==
=TwgA
-----END PGP SIGNATURE-----

--ypdi53ik4rdvpvbs--
