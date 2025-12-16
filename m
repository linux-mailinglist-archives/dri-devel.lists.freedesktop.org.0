Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7EDCC20B0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34AA10E231;
	Tue, 16 Dec 2025 10:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D75xMK5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F53810E231
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765882750;
 bh=81mSqGBXdRim7M1hfkjhMzNiNPOkG7y+lUATlQcbHTs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D75xMK5uje/F5YOgyp3hxy+T6ifGweEbKWjlmsTYVBecHrsXQAwBMtRF6GiZxKJw3
 RjEbKcwxgN+iZgf7KxwLUWvIM7AyhlNrg1uriO8yhFbBSJTQsohaXFzXuLLu+vNcdd
 a3VWiDeATrrewwMt2MowENobBV0KpfNOaaHdNgGXSiCNxFVTsIsqaR9mRXF6+Va69z
 fsvZOhWJoyKU3pmSnsnRIoU4f5BXH9ZxWWFcxB805tlRxfH08aDF09ZLgXwr5J/2dt
 QM1Xt27B7Sur7FXRC3/of/vVhXlx3acixyWs7Rv8kJOKPnsGMg8W28rYpa+/m0ytOK
 in9Zj3n1PG+dQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 607BD17E1149;
 Tue, 16 Dec 2025 11:59:10 +0100 (CET)
Date: Tue, 16 Dec 2025 11:59:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mihail
 Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
Message-ID: <20251216115906.50fe104d@fedora>
In-Reply-To: <20251215171453.2506348-2-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-2-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Mon, 15 Dec 2025 17:14:47 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> This patch extends the DEV_QUERY ioctl to return information about the
> performance counter setup for userspace, and introduces the new
> ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
> performance counters.
>=20
> The new design is inspired by the perf aux ringbuffer [0], with the
> insert and extract indices being mapped to userspace, allowing
> multiple samples to be exposed at any given time. To avoid pointer
> chasing, the sample metadata and block metadata are inline with
> the elements they describe.
>=20
> Userspace is responsible for passing in resources for samples to be
> exposed, including the event file descriptor for notification of new
> sample availability, the ringbuffer BO to store samples, and the
> control BO along with the offset for mapping the insert and extract
> indices. Though these indices are only a total of 8 bytes, userspace
> can then reuse the same physical page for tracking the state of
> multiple buffers by giving different offsets from the BO start to
> map them.
>=20
> [0]: https://docs.kernel.org/userspace-api/perf_ring_buffer.html
>=20
> Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Reviewed-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

A couple things pointed out by Adrian have not been fixed, I think (see
below).

> ---
>  include/uapi/drm/panthor_drm.h | 565 +++++++++++++++++++++++++++++++++
>  1 file changed, 565 insertions(+)
>=20
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index e238c6264fa1..d1a92172e878 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h

[...]

> +/**
> + * struct drm_panthor_perf_info - Performance counter interface informat=
ion
> + *
> + * Structure grouping all queryable information relating to the performa=
nce counter
> + * interfaces.
> + */
> +struct drm_panthor_perf_info {
> +	/**
> +	 * @counters_per_block: The number of 8-byte counters available in a bl=
ock.
> +	 */
> +	__u32 counters_per_block;
> +
> +	/**
> +	 * @sample_header_size: The size of the header struct available at the =
beginning
> +	 * of every sample.
> +	 */
> +	__u32 sample_header_size;
> +
> +	/**
> +	 * @block_header_size: The size of the header struct inline with the co=
unters for a
> +	 * single block.
> +	 */
> +	__u32 block_header_size;
> +
> +	/**
> +	 * @sample_size: The size of a fully annotated sample, starting with a =
sample header
> +	 *               of size @sample_header_size bytes, and all available b=
locks for the current
> +	 *               configuration, each comprised of @counters_per_block 6=
4-bit counters and
> +	 *               a block header of @block_header_size bytes.
> +	 *
> +	 *               The user must use this field to allocate size for the =
ring buffer. In
> +	 *               the case of new blocks being added, an old userspace c=
an always use
> +	 *               this field and ignore any blocks it does not know abou=
t.
> +	 */
> +	__u32 sample_size;
> +
> +	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
> +	__u32 flags;
> +
> +	/**
> +	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
> +	 *
> +	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
> +	 *
> +	 * For the same GPU, different implementers may have different clocks f=
or the same hardware
> +	 * block. At the moment, up to three clocks are supported, and any cloc=
ks that are present
> +	 * will be reported here.
> +	 */
> +	__u32 supported_clocks;
> +
> +	/** @fw_blocks: Number of FW blocks available. */
> +	__u32 fw_blocks;
> +
> +	/** @cshw_blocks: Number of CSHW blocks available. */
> +	__u32 cshw_blocks;
> +
> +	/** @tiler_blocks: Number of tiler blocks available. */
> +	__u32 tiler_blocks;
> +
> +	/** @memsys_blocks: Number of memsys blocks available. */
> +	__u32 memsys_blocks;
> +
> +	/** @shader_blocks: Number of shader core blocks available. */
> +	__u32 shader_blocks;

You need an extra

	__u32 pad;

to have things aligned on 8 bytes.

> +};
> +

[...]

> +
> +/**
> + * struct drm_panthor_perf_ringbuf_control - Struct used to map in the r=
ing buffer control indices
> + *                                           into memory shared between =
user and kernel.
> + *
> + */
> +struct drm_panthor_perf_ringbuf_control {
> +	/**
> +	 * @extract_idx: The index of the latest sample that was processed by u=
serspace. Only
> +	 *               modifiable by userspace.
> +	 */
> +	__u64 extract_idx;
> +
> +	/**
> +	 * @insert_idx: The index of the latest sample emitted by the kernel. O=
nly modifiable by
> +	 *               modifiable by the kernel.

"modifiable by" repeated twice.

> +	 */
> +	__u64 insert_idx;
> +};

