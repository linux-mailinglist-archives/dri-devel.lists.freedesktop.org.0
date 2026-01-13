Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04E8D1A095
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7DB10E35F;
	Tue, 13 Jan 2026 15:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uSfoIVOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A49310E35F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:56:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F005343D88;
 Tue, 13 Jan 2026 15:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547ACC116C6;
 Tue, 13 Jan 2026 15:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768319793;
 bh=XmmO4eigvsjhYZsKYVguJ3MD+xURrXSOfaIeJSmmkzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uSfoIVObSK1ZHvp48d0wP9bpnVJIp/Mqv+0QSOcJFL4eofct0tFh+RV4UY6Ce6Xza
 imS1H3EonpbiPriEgQX4ZbQl+NrRj7Iws8fD+jyqeLkwl9JPJHPB328ljaiLHsJJ1l
 UmPhFHyTubshC6zSHdyKUheoQJH1H5yEpmIQepSx5j03b3SYK8pnRxlvz4/Klkb3/L
 46HtF9Jo8oD2KRgFkkOUyEHQab8iD6wcxjb01dWLdImkUmD05zXeW+YBcITviUK0Wd
 FOyPsLHiwN8wAWlZ+Sj9M0GwC6/qGtGBmJnoI1m3ixU3xg2atj0dLefGAyn8iMgjWZ
 HYIAJyhYukNmw==
Date: Tue, 13 Jan 2026 16:56:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Xiao Kan <814091656@qq.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, w@1wt.eu, security@kernel.org,
 kanxiao666@gmail.com, xiao.kan@samsung.com
Subject: Re: [PATCH v2] drm: Account property blob allocations to memcg
Message-ID: <20260113-kickass-sensible-basilisk-66d487@houat>
References: <20260105-abiding-aloof-locust-dcadac@houat>
 <tencent_817B74448A3DED2A1535F6290308666E4206@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nockj24eq2mz3xjv"
Content-Disposition: inline
In-Reply-To: <tencent_817B74448A3DED2A1535F6290308666E4206@qq.com>
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


--nockj24eq2mz3xjv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm: Account property blob allocations to memcg
MIME-Version: 1.0

Hi,

On Mon, Jan 05, 2026 at 11:14:13AM -0500, Xiao Kan wrote:
> DRM_IOCTL_MODE_CREATEPROPBLOB allows userspace to allocate arbitrary-sized
> property blobs backed by kernel memory.
>=20
> Currently, the blob data allocation is not accounted to the allocating
> process's memory cgroup, allowing unprivileged users to trigger unbounded
> kernel memory consumption and potentially cause system-wide OOM.
>=20
> Mark the property blob data allocation with GFP_ACCOUNT so that the memory
> is properly charged to the caller's memcg. This ensures existing cgroup
> memory limits apply and prevents uncontrolled kernel memory growth without
> introducing additional policy or per-file limits.
>=20
> Changes since v1:
>   - Drop the per-drm_file blob count limit.
>   - Account blob data allocations to memcg via GFP_KERNEL_ACCOUNT instead.
>=20
> Signed-off-by: Xiao Kan <814091656@qq.com>
> Signed-off-by: Xiao Kan <xiao.kan@samsung.com>

It looks like you sent two different patches labelled v2? Sending a new
version in itself is not a problem (and even encourage), but you should
always bump the version number.

Maxime

--nockj24eq2mz3xjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaWZrKgAKCRAnX84Zoj2+
dke0AX0XqaaweRGyv7Lfp2P44eeacopKQH3Ngpyh3UWZO2fk4XmKMyveOr/lWhXN
h8WEF1ABgOPlCUbB12J/wp0yiavQjIGP+LrfJ07ImS6Sj9t5dGzvIS47mApwbC3m
9Vk2EDZk3w==
=5oNp
-----END PGP SIGNATURE-----

--nockj24eq2mz3xjv--
