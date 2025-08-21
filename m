Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4575FB2F793
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F0A10E95C;
	Thu, 21 Aug 2025 12:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y+MBEtPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3457D10E94E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:09:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 50C4E60200;
 Thu, 21 Aug 2025 12:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A22C4CEEB;
 Thu, 21 Aug 2025 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755778178;
 bh=YVudOL9kLvUa7t5Z40vgTlIpdlCqhWXk8VlyZ7WFiNQ=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=Y+MBEtPOx9jut06XprjYa5k9qJRVLaN8rFTQrX6N3+YUimMlQw7rKcQQnzT8LHuDq
 qyjfPinXN7Sb6Zc20pEsKH73TA0q+LGlpNgbF6zhZlexfuzjT48ceGBsnILcrOVQUV
 /Z15DUI3a/e3OO8cqpMh3WFDcnQnQGkT0Nfe5oF53Kfa1c01CRuMBxYPRp3o8Vc41A
 Veq4phsAsmKxqBt5UopCNzBLPTEVTJfv0yDO63xUzSEdIdPyLkIsVXxHZVsIB7JPAL
 PrKwYke/zaA8eJy+iu6wB0WAfg7kbqZncty9vJfwAf6YRU0jGkdvm6rnHgdwVD6XnX
 YmV5ZHD7bAcdg==
Content-Type: multipart/signed;
 boundary=3a383ff1ea192992f3804c3bff8ea9d8903d7571fd6cf5190aac3da7f3cc;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 21 Aug 2025 14:09:34 +0200
Message-Id: <DC83F2197OLI.2KRLEH7GUBKSA@kernel.org>
Subject: Re: [PATCH v5 0/3] Decouple max_pclk check from constant display feats
Cc: <h-shenoy@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>,
 <praneeth@ti.com>, <u-kumar1@ti.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Swamil Jain" <s-jain1@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
X-Mailer: aerc 0.16.0
References: <20250819192113.2420396-1-s-jain1@ti.com>
In-Reply-To: <20250819192113.2420396-1-s-jain1@ti.com>
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

--3a383ff1ea192992f3804c3bff8ea9d8903d7571fd6cf5190aac3da7f3cc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Aug 19, 2025 at 9:21 PM CEST, Swamil Jain wrote:
> In an effort to make the existing compatibles more usable, we are
> removing the max_pclk_khz form dispc_features structure and doing the
> supported pixel clock checks using "max_successful_rate[]" and
> "max_attempted_rate[]".
>
> Changes are fully backwards compatible.
>
> After integration of OLDI support[0], we need additional patches in
> OLDI to identify the VP that has OLDI. We have to do this since
> OLDI driver owns the VP clock (its serial clock) and we cannot perform
> clock operations on those VP clock from tidss driver. This issue was
> also reported upstream when DSI fixes[1] had some clock related calls
> in tidss driver. When "clk_round_rate()" is called, ideally it should
> have gone to "sci_clk_determine_rate()" to query DM but it doesn't since
> clock is owned by OLDI not tidss.
>
> So add a member is_ext_vp_clk[] in tidss_device structure to identify
> this and avoid performing clock operations for VP if it has OLDI panel.
> For the same checks in OLDI driver, atomic_check() hook is added to its
> bridge_funcs.
> In the atomic_check() chain, first the bridge_atomic_check() is called
> and then crtc_atomic_check() is called. So mode clock is first checked
> in oldi driver and then skipped in tidss driver.
>
> Had the tidss_oldi structure been exposed to tidss_dispc.c, we could
> have directly checked VP type in dispc but since the structure is defined
> in tidss_oldi.c , we have to add additional member to tidss_device
> structure.
>
> [0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@l=
inux.dev/
> [1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/

Since that wasn't picked up from v4:

Tested-by: Michael Walle <mwalle@kernel.org> # on am67a

--3a383ff1ea192992f3804c3bff8ea9d8903d7571fd6cf5190aac3da7f3cc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKcMfhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hU4AF+IvgcxkPRSESU4r7IR/aM34rxVsUbczii
5ClhTBDU79TzVapcJx4a8PGB+f5WEwkjAYCPvJC/QF/bADblThy3D3ln7plKn30A
i1GnefaebiLizZ8l5IAVZTDxawBYVY2CIDU=
=QPzU
-----END PGP SIGNATURE-----

--3a383ff1ea192992f3804c3bff8ea9d8903d7571fd6cf5190aac3da7f3cc--
