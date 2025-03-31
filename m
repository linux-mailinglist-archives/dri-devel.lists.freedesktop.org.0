Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC582A76322
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 11:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3508210E3A5;
	Mon, 31 Mar 2025 09:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kXS0tvzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88B510E3A5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 09:26:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DFF6D5C43E7;
 Mon, 31 Mar 2025 09:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A85FC4CEE3;
 Mon, 31 Mar 2025 09:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743413171;
 bh=8uQQu7+EY6UlKafQATpv0A1NuNzpUDuoj+w9L+TW0NA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kXS0tvzfWFMwF5kmNamOV7IvnsfCHCQGAMnGgfx6/urRR6TaGbot3SR1Hi5UG27aD
 xAC/1vTmitYD/gsBK34f77yQPMPsWZlLMG89OCF8ycU1uhPzH8xY+rPL37F6j6WxNR
 KZo7yRmqeUiWXeCk1xofSVZLJhbr4xboAHFKSQu4ln+YifaxXLZ4n2sAEzrR/uWALp
 grySxfLGN6ze72bj9IFOdJJfVJVmALvT5lXxXQHNnJMoULuMO5liUpgmHJ7/y/1QVs
 D1v+WIbJmT5EdydR6vPNUkR9LAO3ROau3jVexvPKLKyBrpUQciA2fIQjM6cTkms+BG
 Bp3kiktOFKoYA==
Date: Mon, 31 Mar 2025 11:26:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, javierm@redhat.com, 
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 12/18] drm/sysfb: ofdrm: Add EDID support
Message-ID: <20250331-ruddy-mighty-tuatara-cb3daa@houat>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-13-tzimmermann@suse.de>
 <87a59fdfx5.fsf@intel.com>
 <52c88e06-9a13-4784-89b1-3d0037872054@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ttxe3iso6nz73rd"
Content-Disposition: inline
In-Reply-To: <52c88e06-9a13-4784-89b1-3d0037872054@suse.de>
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


--2ttxe3iso6nz73rd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 12/18] drm/sysfb: ofdrm: Add EDID support
MIME-Version: 1.0

On Thu, Mar 20, 2025 at 02:08:56PM +0100, Thomas Zimmermann wrote:
> > Despite the nitpicks, overall LGTM.
>=20
> Thanks for reviewing.
>=20
> Since I have your attention and you're knowledgeable wrt EDID: byte 20 of
> the EDID header indicates the type of output (analog, HDMI, DP, etc). I
> intent to use this for setting the connector type to something better then
> UNKNOWN. Does that make sense?

I don't think it would work:

  - EDID doesn't indicate the kind of KMS output (ie, source) but the
    type of sink. Ie, what the monitor is capable of dealing with, not
    what the connector can emit. If we have (passive or active) bridges
    in between, it does mean that we can have an analog sink connected
    to a digital connector.

  - Since it depends on the sink, it can change over time, ie you plug
    an analog monitor, remove it, and plug a digital one. That would
    mean changing the connector type (and thus name exposed to
    userspace) at runtime, for the same driver.

  - Since it depends on the sink, it assumes the sink vendor didn't
    botch the EDID. This one is a pretty big if :)

Maxime

--2ttxe3iso6nz73rd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+pfsAAKCRDj7w1vZxhR
xfGpAPwMfhXbVpDWjNp0nOUEu65ARr9BnvgZmCiVAfSFt3LR0gD+LfsQr6HHb9Vb
VnEMD1I7bBYytoGmRyXw91K8Uf3Xsgk=
=U7uz
-----END PGP SIGNATURE-----

--2ttxe3iso6nz73rd--
