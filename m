Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64EAAED904
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 11:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6F010E3DF;
	Mon, 30 Jun 2025 09:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.b="H7CMqKrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 556 seconds by postgrey-1.36 at gabe;
 Mon, 30 Jun 2025 09:49:27 UTC
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4FF10E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 09:49:27 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id B669610C;
 Mon, 30 Jun 2025 11:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1751276409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=9/Pvq0WY1sYNzPktOn10uj39CmA1imLYf9C5hVYfwFU=;
 b=H7CMqKrjjwduzohcLlYNC2KPKKiE54GtbG0UXi8RMQjlMvkNy/KUS7tCKEaVW3nXO25Fsk
 yJTxpGaaQ//JwA85vUXnjV9qJeG5azMY//2vak9E7Uc77ZfoiDYkFO2bX2kKEy5XKJctHw
 /RkilStMgMS2WbdX+7940u7sZAXBRVh/2dLFovlIPfnRbevPqGgVk/hGltwAE6Dt8HDXkj
 KC14NB+abcmH3ekLowwOOLOWYjye0dNWlY6SVvBhCDozaJSOab9qoF+7bcoD+uUcIXEK4s
 EAyv4RP9OZ1Yq+o1Y31RP/dOG9GbscHWOUR1CHwpo65LedYwiRdOrTbS5g7L9w==
Content-Type: multipart/signed;
 boundary=966e033f37f2d4f4fc473532ff78d6a575d67b30c1d1668f1feb4b49830d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 30 Jun 2025 11:40:07 +0200
Message-Id: <DAZROB4RXK9C.WMSDJSU3N9CL@walle.cc>
Subject: Re: [PATCH] drm/tidss: Set crtc modesetting parameters with
 adjusted mode
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Jayesh Choudhary"
 <j-choudhary@ti.com>, <jyri.sarha@iki.fi>,
 <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>
X-Mailer: aerc 0.16.0
References: <20250624080402.302526-1-j-choudhary@ti.com>
 <d6ac1fe1-eeac-430c-ada6-d19386781b53@ideasonboard.com>
In-Reply-To: <d6ac1fe1-eeac-430c-ada6-d19386781b53@ideasonboard.com>
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

--966e033f37f2d4f4fc473532ff78d6a575d67b30c1d1668f1feb4b49830d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Tomi,

On Tue Jun 24, 2025 at 1:47 PM CEST, Tomi Valkeinen wrote:
> On 24/06/2025 11:04, Jayesh Choudhary wrote:
> > TIDSS uses crtc_* fields to propagate its registers and set the
> > clock rates. So set the CRTC modesetting timing parameters with
> > the adjusted mode when needed, to set correct values.
> >=20
> > Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >=20
> > Hello All,
> >=20
> > After the DSI fixes[0], TIDSS is using crtc_* timings while programming
> > hardware[1]. But while testing on TI's J784S4-EVM platform, I noticed
> > that crtc_timings are not propagated properly.
> >=20
> > The display pipeline there looks like:
> > TIDSS -> CDNS-DSI -> SN65DSI86 bridge -> DisplayPort
> >=20
> > Consider the case of 1920x1080 resolution where the EDID mode has clock
> > of 148500kHz. After adjustment, the clock changes to 148800kHz. While
> > this change is reflected in mode->clock, its not propagated to
> > mode->crtc_clock.
>
> Hmm, so CDNS-DSI changes the adjusted_mode->clock, but in the end tidss
> doesn't actually use the adjusted clock at all? I'm pretty sure I tested
> that... I need to try it (and this) again.

FWIW, without this patch, DSI isn't working on my board (DSI -> DSI85
-> eDP). At least without the (now dropped) patch "drm/tidss: Adjust
the pclk based on the HW capabilities" [1].

That is, it was working with v3 of your DSI patch series, but not
with v4. I'll need this patch together with v4 to get DSI working.

Maybe that helps,
-michael

[1] https://lore.kernel.org/all/20250402-cdns-dsi-impro-v2-3-4a093eaa5e27@i=
deasonboard.com/

--966e033f37f2d4f4fc473532ff78d6a575d67b30c1d1668f1feb4b49830d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaGJbeBEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+BHiAX9DJFRcAbwH02oCGkRueG+13LtNgmiCzp+H
eqWrhagx5aZAEsSrHAF8Q2D4tJLv9HMBf38xCW0EuhlUq8su5Trfs3JE1RDjmZ7n
R/PtTjmFS/4x0jcQpL+Oh7Mf+Qq5rmyXsg==
=yXux
-----END PGP SIGNATURE-----

--966e033f37f2d4f4fc473532ff78d6a575d67b30c1d1668f1feb4b49830d--
