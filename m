Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ABE971B32
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0068610E581;
	Mon,  9 Sep 2024 13:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VZ5nq96q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C9C10E580;
 Mon,  9 Sep 2024 13:37:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2D192A43723;
 Mon,  9 Sep 2024 13:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B12C4CEC6;
 Mon,  9 Sep 2024 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725889075;
 bh=Pn6nyHvAqcwyfTE4+On2+ckRU7uvzlXW4rA+Pb8MzGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZ5nq96qdLQAqHZv5BZdhg6rzvt3M6CBCAvVjvhludVsSxF5ZzSn2JVpFM1mfjMra
 sgFBRXfihE0MoxeN/ukaH5cCjyH0SScZvodf2YolXI+3JVXl1BjaaPXObfrcmh0Hro
 1Zs2MDPRKcEKd8BMXlumtcep9sck6biQBffhNX1f5A+HsgOVKrlIBx6Wjyvpk8+hjV
 IFBcBbq41rC+rTn1MH1bO+qzhAKBNUG4B7QafFvPZUkuotn49h3Z/RTXSaKaaunpC3
 FvHjOw+PX6VQqapQkZcfTOUexWqO90HAbcOSddXtRiydeDlA8soNbDudjse7Gq4jkH
 nbfvFwLO+OdKg==
Date: Mon, 9 Sep 2024 15:37:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, 
 quic_jesszhan@quicinc.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: allow encoder mode_set even when connectors
 change for crtc
Message-ID: <20240909-neat-stoic-hamster-cbbe42@houat>
References: <20240905221124.2587271-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wbqgwzlceddfxscp"
Content-Disposition: inline
In-Reply-To: <20240905221124.2587271-1-quic_abhinavk@quicinc.com>
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


--wbqgwzlceddfxscp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 05, 2024 at 03:11:24PM GMT, Abhinav Kumar wrote:
> In certain use-cases, a CRTC could switch between two encoders
> and because the mode being programmed on the CRTC remains
> the same during this switch, the CRTC's mode_changed remains false.
> In such cases, the encoder's mode_set also gets skipped.
>=20
> Skipping mode_set on the encoder for such cases could cause an issue
> because even though the same CRTC mode was being used, the encoder
> type could have changed like the CRTC could have switched from a
> real time encoder to a writeback encoder OR vice-versa.
>=20
> Allow encoder's mode_set to happen even when connectors changed on a
> CRTC and not just when the mode changed.
>=20
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

The patch and rationale looks sane to me, but we should really add kunit
tests for that scenarii.

Maxime

--wbqgwzlceddfxscp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZt76MAAKCRAnX84Zoj2+
dg5WAYC20PLU/szVZ6fRkZa73lIx9F2G/5R8TlaLMVQvypgF073JlIs6KT9eIzP/
spB6dRMBfAoce7Q/2I0P40sMiMLHudvyNXj5ufojY/uW1RXlkW++dChN1qDqF/xC
ULEQu0JR/A==
=tV3+
-----END PGP SIGNATURE-----

--wbqgwzlceddfxscp--
