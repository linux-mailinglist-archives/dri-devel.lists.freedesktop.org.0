Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF3D1E02B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC9E10E5EC;
	Wed, 14 Jan 2026 10:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pN0XnPc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17A110E5EC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:25:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D21160052;
 Wed, 14 Jan 2026 10:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70922C4CEF7;
 Wed, 14 Jan 2026 10:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768386320;
 bh=/G0hPN7tF2VQr3A3z7o2ONwXq18rHIyi9oJC0xHRDBI=;
 h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
 b=pN0XnPc2DJImBLwmJvjM2oNnAlHIE3Kqoft/Rb1FnZrBHtTeHP9WtRcdjiZz+0Vpc
 XCu8x+4OXEwrBJE6/xObeuLcTRfv/7C/EaoijnEDhaU9DL1KbGadZv9ta/BHoX/G4N
 wtpEMsQsU99U8ap56HCe7jMWvNmYTCydWhCxQ1wsWNIlPDGifsGpgKSpXI0CCcba8Z
 6sulIHwj9PNQ0pdFbpA50GFmYmt3IFoW0hhsvEHKx79vtBZYXIALeblOYEaVSiaL+4
 3zmqJCiVhRDpTFc/XjoVB2FgTQ+hH/YweCjrBpFF1oVRFWBwYZ5M7KUNdW2BMwuMDq
 Jltc06xaZA4qA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7eb0cd624331cbee9ee88fbf3e64a6b1cd9e4c24279d11d0edad060d6005;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 14 Jan 2026 11:25:11 +0100
Message-Id: <DFO8MODWITUW.12PP5XZKPR7FL@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Swamil Jain" <s-jain1@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
Subject: Re: [PATCH v3 2/3] drm/tidss: Power up attached PM domains on probe
X-Mailer: aerc 0.20.0
References: <20260107174525.1702585-1-s-jain1@ti.com>
 <20260107174525.1702585-3-s-jain1@ti.com>
In-Reply-To: <20260107174525.1702585-3-s-jain1@ti.com>
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

--7eb0cd624331cbee9ee88fbf3e64a6b1cd9e4c24279d11d0edad060d6005
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jan 7, 2026 at 6:45 PM CET, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
>
> Some SoC's such as AM62P have dedicated power domains
> for OLDI which need to be powered on separately along
> with display controller.
>
> So during driver probe, power up all attached PM domains
> enumerated in devicetree node for DSS.
>
> This also prepares base to add display support for AM62P.
>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> [j-choudhary@ti.com: fix PM call sequence causing kernel crash in OLDI]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>

Tested-by: Michael Walle <mwalle@kernel.org> # on am67a

-michael

--7eb0cd624331cbee9ee88fbf3e64a6b1cd9e4c24279d11d0edad060d6005
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaWdvBxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hDQAF/ZthYmk3jSMbxH03FLpsKg7gCLmCWYjfA
0xWDvcRPJKb0Uds6of/PbMPMPtfQ9z+rAX0a6mLC+znYbB4nwlKuhum6W9McZp1p
EL2xTHr44m3/k5IasFhHRMbQz5QEhnwJ5nY=
=K6zL
-----END PGP SIGNATURE-----

--7eb0cd624331cbee9ee88fbf3e64a6b1cd9e4c24279d11d0edad060d6005--
