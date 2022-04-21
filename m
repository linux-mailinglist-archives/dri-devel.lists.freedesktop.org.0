Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6350A2BC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 16:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C052310E627;
	Thu, 21 Apr 2022 14:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AAF10E41B;
 Thu, 21 Apr 2022 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4vyoabUptigSLi47grfw1QocqbtW5Ln8ukV2CRJUJG4=; b=pchOrqjQdVW3hwE/rTgWxP76bm
 9lva3qJRt0BgKhpOYcKqJFcWIcljHBF1NK+K34R/nmS6UcBJz3aHwKe+O0BAMyQvbQKvkswDVEwHY
 4D/emZDEM+8+ghI6+EhazyO+O5fkaMMjEj5iJYjJwdOAJn4NOJLOyu53KfPV8iEV+Foj0oQRnsnvp
 p9Z7E04M45L6KPv4PPCASF+emxRloBxoK3JzHMkWA72Odfj3Z0yx4oJD6V2H1AHzHLAgPcMFLG15K
 NyW/9wnhOY378csKMTPZVBSxinrCfNemYlsaMIEJZz51K5ndzIWRGBQmIgmg+LdidNF964PSwdpSs
 TccRm4LA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nhXwX-000CFk-2l; Thu, 21 Apr 2022 16:38:01 +0200
Date: Thu, 21 Apr 2022 13:37:47 -0100
From: Melissa Wen <mwen@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: AMD display drivers handling DRM CRTC color mgmt props
Message-ID: <20220421143747.247mohbio436ivqo@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tceca5h5txpfjyw4"
Content-Disposition: inline
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
Cc: Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tceca5h5txpfjyw4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm examining how DRM color management properties (degamma, ctm, gamma)
are applied to AMD display drivers. As far I could understand thanks
Nicholas documentation on amdgpu_dm/amdgpu_dm_color, DC drivers have
per-plane color correction features:

* - Input gamma LUT (de-normalized)
* - Input CSC (normalized)
* - Surface degamma LUT (normalized)
* - Surface CSC (normalized)
* - Surface regamma LUT (normalized)
* - Output CSC (normalized)
                            =20
so DM is "adapting" those DRM per-CRTC properties to fit into three of
these color correction stages, which I guess are the surface stages:

* - Surface degamma LUT (normalized)
* - Surface CSC (normalized)
* - Surface regamma LUT (normalized)

I'm trying to understand what this mapping is doing. A comment mentions
that is not possible to do these color corrections after blending, so,
the same color correction pipe is performed on every plane before
blending?  (is the surface the plane?) Does this adaptation affect the
expected output?  Moreover, is there something that I misunderstood? :)

That said, if the DRM color mgmt supports per-CRTC 3D LUT as the last
step of color correction, I don't see how to accommodate it in the
mapping above, but I see DC already supports programming 3D LUT on DPP.
Once DRM has the 3D LUT interface and DM mapped it as a DPP property,
the 3D LUT will be at the end of the color correction pipeline? Is there
anything I need to worry about mapping DRM 3D LUT support? Or any
advice?

Thanks in advance,

Melissa

--tceca5h5txpfjyw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJhbCkACgkQwqF3j0dL
ehyyrg/+OQqORjWSmWDUaSPcqg45AkjV8sZ6VwKxy244eoCSnOykDzBsIiDHwHXl
O1XqFYoccn339iEogx6P+dyDy7RhE6zmwiHe8uhGsiHTg/qctQZqvqF07SrxnIzy
7LZmfUXW2OgUTpCXcePPb5YKkZ+EfL79IVG33RGOiClMEqR2c2q94sQ7sHENrXpg
kosPrTQLd0VFrq5kUZjmSMF0rGy0I1ysY56MuGPgYbU1Hoh0WkBkzrqYOR/B/L9z
VVnpzoPT37M4atKkRGmngGAiqGtmoaOqoLq4d+UToQDn2OHr7CDqNbPDwBYGERqb
Z1Yi9QqnOXeo2jncApi0IN4CtBuWPbuUW1lTj9WsFZxMIWyb/YV600y9HUPAbTQ6
K930X00zHAXDuVj83HpIMH/Eo8pudhv0ErOX/RycfiPiLqY0I6DyFt86LO4ViLm5
JzG0cvm+vqq2hfUt1YuPmqlPAOUuq0xOe1FYgVEoHetVLvZMer2lVXMysApF029C
GTfZh6Lk9yQ0yOXEUomUUKjAxwkn46ViE8n88QtBLy6c+GekkYwyqL93JJg6HmNc
0oNOznoDbgb5utFsEV0Kb4mLsVkW0SQ9i8lwFO5QjeM1cFKmkEV1QS+RlItIYqbY
RYJ79q6wCJl29nITtq4mMieEZ5tyl7XfEs062RTPQmehzh1Y5+8=
=Jd40
-----END PGP SIGNATURE-----

--tceca5h5txpfjyw4--
