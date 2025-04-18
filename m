Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD63A934A0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 10:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA74E10E0A3;
	Fri, 18 Apr 2025 08:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NR23A4/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA39510E0A3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744964813;
 bh=e3658IgZ8nOTRetGLbWCrC9hScdhNn7J2xOl2EFdMAk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NR23A4/34J+WhMJ/VlGpByqJi03M1NBdFpU9qVyY+AhAynvsUF7jXUxmzIIc5e2pv
 gxYojrrZc29HcVQydeAEPdKO6nc0n6L2Sz66A/OimLAtcc3YlG9nK0Ob+JjovsJFQ8
 NFkxkMtRZgD3xMM4SUHfbZMFx3FQBXUK9ffj+fI3fcqD5QGNKKMEl/wds9Qj6ERF5a
 f2stTSn/cyZ8uR7VpMoX8ZIbX6hi58QiK/JODzmj7gz615J4tp+N+dzjt2/yfzVe7Y
 gjVs7fwfPgpYRffAgc32cxviYC3W2UyVxP3YV7bfi39Z+pTz24DTP1QTORG0c9OJaE
 NhKoGD8kAABKQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 074DB17E10F7;
 Fri, 18 Apr 2025 10:26:52 +0200 (CEST)
Date: Fri, 18 Apr 2025 10:26:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v9 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250418102649.41a609d6@collabora.com>
In-Reply-To: <20250418101156.0241a000@collabora.com>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
 <20250418022710.74749-5-adrian.larumbe@collabora.com>
 <20250418101156.0241a000@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 18 Apr 2025 10:11:56 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 18 Apr 2025 03:27:07 +0100
> Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
>=20
> > +	static const char * const gem_state_flags_names[] =3D {
> > +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED] =3D "imported",

FYI, the compiler seems to be happy with:

		[ffs(PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED) - 1] =3D "imported",

but I'm not sure we want to fix it this way. The other
option would be to define bit pos in the enum and then
define flags according to these bit pos:

enum panthor_debugfs_gem_state_flags {
	PANTHOR_DEBUGFS_GEM_STATE_IMPORTED_BIT =3D 0,
	PANTHOR_DEBUGFS_GEM_STATE_EXPORTED_BIT =3D 1,

	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED: GEM BO is PRIME imported. */
	PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED =3D BIT(PANTHOR_DEBUGFS_GEM_STATE_=
IMPORTED_BIT),

	/** @PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED: GEM BO is PRIME exported. */
	PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED =3D BIT(PANTHOR_DEBUGFS_GEM_STATE_=
EXPORTED_BIT),
};

> > +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED] =3D "exported", =20
>=20
> Okay, I think I know where the flag indexing issue comes from:
> PANTHOR_DEBUGFS_GEM_STATE_FLAG_xx are flags, not bit positions, so we
> can't use them as indices here.
>=20
> > +	};
> > +
> > +	static const char * const gem_usage_flags_names[] =3D {
> > +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL] =3D "kernel",
> > +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED] =3D "fw-mapped", =20
>=20
> Same problem here.
>=20
> > +	};
> > + =20

