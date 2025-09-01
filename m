Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF49B3DA7D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A2510E22E;
	Mon,  1 Sep 2025 07:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hvYft1NT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8882210E22E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 07:00:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 92540601BB;
 Mon,  1 Sep 2025 07:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD57C4CEF0;
 Mon,  1 Sep 2025 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756710051;
 bh=ZeFbSr4PbTwyBV2OZDCGcrnpJKQZAVSA0iWy33B9hkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvYft1NTetVSsSX4p5CXUeKpmkLpiMxaAl1TTkydFWd6PqU8Xx1OHJJipNZB9g/hU
 Q+sRzxY8fnQZMhwPyCihTGDq8ntIem3BjpvVz3NCFdlmwbhqQjDTOmU3um4Rkc2DuE
 EPrDo+cptEIOJ2PFpAb9Us/eQ7mwmujATMjjfzgCAP3zHBGkNaYE0ijcyE1MfktsR0
 TVwXkf1mK+aFAUopGFN0I+bjs83gtzJRHDY+Ffqc3I8cI+5ZuU2uqHvRh8VVyXYDby
 0+iaSjKuzNuUiWOazmYBLsb1G6uBInMMhtu3tteE59SicP/ceX3qoBADDbjW1I4xUt
 uBotJSPLxSEnA==
Date: Mon, 1 Sep 2025 09:00:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: John Ripple <john.ripple@keysight.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: break probe dependency loop
Message-ID: <20250901-airborne-marten-of-serendipity-b55e21@houat>
References: <20250820152407.2788495-1-john.ripple@keysight.com>
 <20250820152407.2788495-2-john.ripple@keysight.com>
 <CAD=FV=VfCWFViDE1a5-_KtH0Pfo2EnCJeo2k8MaWuRHhmMPMMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hoexycmw3smg4mip"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VfCWFViDE1a5-_KtH0Pfo2EnCJeo2k8MaWuRHhmMPMMA@mail.gmail.com>
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


--hoexycmw3smg4mip
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: break probe dependency loop
MIME-Version: 1.0

On Fri, Aug 29, 2025 at 09:40:30AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Wed, Aug 20, 2025 at 8:24=E2=80=AFAM John Ripple <john.ripple@keysight=
=2Ecom> wrote:
> >
> > The commit c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our
> > DSI device at probe") was intended to prevent probe ordering issues and
> > created the ti_sn_attach_host function.
> >
> > In practice, I found the following when using the nwl-dsi driver:
> >  - ti_sn_bridge_probe happens and it adds the i2c bridge. Then
> >    ti_sn_attach_host runs (in the ti_sn_bridge_probe function) and fail=
s to
> >    find the dsi host which then returns to ti_sn_bridge_probe and remov=
es
> >    the i2c bridge because of the failure.
> >  - The nwl_dsi_probe then runs and adds dsi host to the host list and t=
hen
> >    looks for the i2c bridge, which is now gone, so it fails. This loop
> >    continues for the entire boot sequence.
>=20
> Which i2c bridge are you talking about? You mean the one created by
> i2c_add_adapter() in drm_dp_aux_register()? I guess I'm confused about
> why the DSI probe routine would even be looking for that adapter.
>=20
> In any case, I don't _think_ your patch is valid. Specifically, if you
> notice ti_sn_attach_host() can return "-EPROBE_DEFER". That's a valid
> error code to return from a probe routine but I don't think it's a
> valid error code to return from a bridge attach function, is it?

It's not documented anywhere though, so we'd need to document (and
assess) if it's acceptable first.

We should also amend
https://docs.kernel.org/gpu/drm-kms-helpers.html#special-care-with-mipi-dsi=
-bridges

Maxime

--hoexycmw3smg4mip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVEoAAKCRAnX84Zoj2+
dupqAX40hRyvkHZyIYywMCfPVV2IAYd6DnoXJ6H/p4qb5Xz2UwikqugDDzxJcmJ1
qaDvsaUBf2sKrCfvVaAcGQ3ULwYe+Zs3Aa4WJtjToWES91VYZVPd2gULYsnDqmP2
DNZQNQ6AtA==
=1bEs
-----END PGP SIGNATURE-----

--hoexycmw3smg4mip--
