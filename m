Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648CAA6B7FC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0F810E76A;
	Fri, 21 Mar 2025 09:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YC6O89GI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CD410E764;
 Fri, 21 Mar 2025 09:48:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E1835C6CF4;
 Fri, 21 Mar 2025 09:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97055C4CEE3;
 Fri, 21 Mar 2025 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742550487;
 bh=FSX5wgQpGviIl9j796MwaDns+PlHxhknGnllWqJ5QFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YC6O89GIBcbRsW6Izy2UHgotEkBbGnaE7WgDaDacZyyegTLmDQPxZK7S3etURRpmF
 2UH5HK0hgXJHnTFNougjY4BhmGu/Ig1xTRwBSWKeXxjaxORlBvZR7GYPRU8EfhHTH8
 RqpsYyJq9tSpcgr/7Wgc1JxNvoaO3jq+PHw+EQMRtmpi/sck9wm2K2xKhTnsRk9PBv
 GTCLPlogntytBZvoc40lVDVWEmtobMORdjfPDB6LFlsf8W0L/TP2ZhxKeklAZ4tPU2
 7CBf6zI7sYum3ZCfog82hNbwhzW+ix4AOo85OAviirHqthe58lRSNKfC+Dbu7pVq4A
 C1N7G4QGC1TmA==
Date: Fri, 21 Mar 2025 10:48:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: lumag@kernel.org, neil.armstrong@linaro.org, 
 dri-devel@lists.freedesktop.org, dianders@chromium.org, jani.nikula@intel.com,
 lyude@redhat.com, 
 jonathanh@nvidia.com, p.zabel@pengutronix.de, simona@ffwll.ch,
 victor.liu@nxp.com, 
 rfoss@kernel.org, chunkuang.hu@kernel.org, cristian.ciocaltea@collabora.com, 
 Laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge detect
 hook
Message-ID: <20250321-optimistic-prompt-civet-bdcdba@houat>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="psdl227jg277o23m"
Content-Disposition: inline
In-Reply-To: <20250321085345.136380-2-andyshrk@163.com>
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


--psdl227jg277o23m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge detect
 hook
MIME-Version: 1.0

On Fri, Mar 21, 2025 at 04:53:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
>=20
> In most cases, we can get the connector by drm_atomic_get_connector_for_e=
ncoder
> if the encoder attached to the bridge is enabled, however there will
> still be some scenarios where the detect hook of the bridge is called
> but the corresponding encoder has not been enabled yet. For instance,
> this occurs when the device is hot plug in for the first time.
>=20
> Since the call to bridge's detect is initiated by the connector, passing
> down the corresponding connector directly will make things simpler.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

FTR, I'm against it and would have appreciated that you wait for a
meaningful closure to the discussion we've had on this.

Maxime

--psdl227jg277o23m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9010wAKCRAnX84Zoj2+
dpUPAX9qG8wGWX/jIylnSMvlLPoWW5QTzLixBoLyAKtU+LQ4ih9kDaR+T2+Jw3ZK
sF/MmZQBfivyGBZWnETXE8ErmIijVVrG0Ds9DeKvJyKxigYqbXaEmWDvYU2tYiyP
IaXj31fvOQ==
=X15G
-----END PGP SIGNATURE-----

--psdl227jg277o23m--
