Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACE6CF3016
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 11:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8BC10E1A2;
	Mon,  5 Jan 2026 10:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l05CSQ3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306E010E1A2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 10:36:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2037060010;
 Mon,  5 Jan 2026 10:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784D4C116D0;
 Mon,  5 Jan 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767609392;
 bh=fZAF4IpsKhaowNHMcT2duqCcyEV9SPiypmH/Z4YSBX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l05CSQ3jSoiAylIu7sFYjlGH8SG6FPyeTwyJdagQNIQlHzPeEcGdBzmZy5rS1b4aA
 TmV4+VYaoo0f4uE7f0vZHzinzcX8bV0uxW5yrz2Y4Cimyyt9Mimll0PjFZoDilYA7E
 7mcYKhQJyaLkPlaPtcXW6wamvkFqkM9xIWlebrqvjuj0qXg1nnapqTU6F6ik3ydurj
 f4QOutlqDyIpmVmfmUtyXFRRIdbp1UtY0yxiJ+2BdE0U4zepUmK8OS1RZpOVvwFYCd
 IXb5AUuvt+HX6odv8ahd1GXBkg5VHE/VXJaAFYLvpf59PJmtuA2R8P1RhFTo5MszGa
 OclWXDlVPsz3Q==
Date: Mon, 5 Jan 2026 11:36:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Xiao Kan <814091656@qq.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, w@1wt.eu, security@kernel.org,
 kanxiao666@gmail.com, xiao.kan@samsung.com
Subject: Re: [PATCH] drm: limit property blob creation per file
Message-ID: <20260105-abiding-aloof-locust-dcadac@houat>
References: <tencent_B0A522AEEC81573BA9934E2340B672ABDA09@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2wrotq3h6k65de3m"
Content-Disposition: inline
In-Reply-To: <tencent_B0A522AEEC81573BA9934E2340B672ABDA09@qq.com>
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


--2wrotq3h6k65de3m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: limit property blob creation per file
MIME-Version: 1.0

Hi,

On Sat, Jan 03, 2026 at 10:25:29AM -0500, Xiao Kan wrote:
> DRM_IOCTL_MODE_CREATEPROPBLOB allows userspace to create property blobs
> whose lifetime is scoped to a drm_file.
>=20
> Currently, a single drm_file may create an unbounded number of blobs.
> Repeated ioctl calls can trigger unbounded kernel memory allocation and
> lead to OOM, resulting in a denial-of-service.
>=20
> Introduce a per-drm_file limit on the number of user-created property
> blobs. The limit is enforced at the point where a blob becomes associated
> with a drm_file, matching the existing ownership and lifetime model.
> This bounds per-file allocations while the total number of DRM file
> descriptors remains constrained by existing kernel limits.
>=20
> Signed-off-by: Xiao Kan <814091656@qq.com>
> Signed-off-by: Xiao Kan <xiao.kan@samsung.com>

Wouldn't it make more sense to account the allocation in memcg by
passing GFP_ACCOUNT to the kvzalloc call in drm_property_create_blob?

Maxime

--2wrotq3h6k65de3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaVuUKAAKCRAnX84Zoj2+
doKtAX47hIGTiCp1Ga+OhYHT+1cRzyxatFoSU35dHAF+Dq5kgr9KbQRFtPjZalYn
BbwxrtABf3bf6UH2hJEgOXtA+dqvFeJ6ox23j00bw8f7HUrL/Ak0KkdoSl8kJ6NJ
+tNrmoZHDg==
=vPEa
-----END PGP SIGNATURE-----

--2wrotq3h6k65de3m--
