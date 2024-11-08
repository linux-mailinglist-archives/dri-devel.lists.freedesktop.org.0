Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0979C2254
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4BD10EA05;
	Fri,  8 Nov 2024 16:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="wvuCdy/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 511 seconds by postgrey-1.36 at gabe;
 Fri, 08 Nov 2024 16:46:38 UTC
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9893E10EA05
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:46:38 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1731083886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y8isQ+eC1NBDJ85mhmgiRP01XgjT4qvdr3jwt+UY19g=;
 b=wvuCdy/YsQr5y2ZLd7wKdSKLnnl9GdvdfoZrAkccd2PyafwFPUA5adoDCjZ0A2W0ehzRdu
 QyWalDT08pxaTLAk3zchX7qLvtLa2fTTAGrUwABmQ88jbZl6/P7Yp/6RofZUJzni1JZpMx
 /hJ84YXohGcqC4Ul/QvWzE4juichAa3wz0l72E0w7Sp3SXUEU4YpoBz9tbnuZZO9yj7T8D
 +UUtjE85ItWVYdfZ4yGC2LGisf6PrGQ2OW8aXy0m1/ZDpa3CRhCVVntYe+qKbb+bUJLoO+
 sxksUg6DJ9RR/+CiD26PqZ3X66Jg9ZmKloCi2N/Ytf2/fbSslOltMB2xQURPAw==
Content-Type: multipart/signed;
 boundary=342aba1a373c0c1c659dff9cb9078d09b156ee41058742d4af8979a7c0b6;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 08 Nov 2024 17:37:51 +0100
Message-Id: <D5GY0NXYFLS9.1YHBZ5502R764@cknow.org>
Cc: <dsimic@manjaro.org>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>, "Heiko Stuebner"
 <heiko.stuebner@cherry.de>
Subject: Re: [PATCH] drm/rockchip: dsi: convert to dev_err_probe in probe
 function
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
References: <20241108144425.1009916-1-heiko@sntech.de>
 <D5GWE4WJZMM8.1MPHPPQR2QW46@cknow.org> <3594835.iIbC2pHGDl@diego>
In-Reply-To: <3594835.iIbC2pHGDl@diego>
X-Migadu-Flow: FLOW_OUT
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

--342aba1a373c0c1c659dff9cb9078d09b156ee41058742d4af8979a7c0b6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 8, 2024 at 5:31 PM CET, Heiko St=C3=BCbner wrote:
> Am Freitag, 8. November 2024, 16:21:24 CET schrieb Diederik de Haas:
> > On Fri Nov 8, 2024 at 3:44 PM CET, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > >
> > > DRM_DEV_ERROR is deprecated and using dev_err_probe saves quite a num=
ber
> > > of lines too, so convert the error prints for the dsi-driver.
> > >
> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Should this have a Fixes tag?
> > Because in the PineTab2 case it reported an error, which was actually
> > just a deferred probe.
>
> A deferred-probe is an error ;-)   -517 in fact  ... just that convention
> nowadays is to not actively report on it but "fail" silently.

Good to know, thanks :)

> So personally I don't really consider it a fix, but more a style thing.
> I guess I'll let others chime in for that.

Then I agree that it should not have a Fixes tag.

Cheers,
  Diederik

--342aba1a373c0c1c659dff9cb9078d09b156ee41058742d4af8979a7c0b6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZy4+ZgAKCRDXblvOeH7b
bm7IAQDlu5u1RUaHveltxvLYbs1Lkju/X4N1ZMHhqsGMKvP6MwEApHelYqAyAA1h
JBDYWaKldiIhOrBuZQvjbtUN4ic/EQQ=
=BFts
-----END PGP SIGNATURE-----

--342aba1a373c0c1c659dff9cb9078d09b156ee41058742d4af8979a7c0b6--
