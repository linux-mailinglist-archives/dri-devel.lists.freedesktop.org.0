Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E5D1EF79
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 14:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852FC10E28F;
	Wed, 14 Jan 2026 13:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jrDzRtBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E794410E28F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768396023;
 bh=j6bw6zeuuahLfoAQbMI2dlZBjEcPD8A7SE2ErYP+St4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jrDzRtBT2KNIn85SoyHNWWDAdqqyrQ4Q2hzFcUmU5w3we4RiQlrZF9NZbRA9H1uyc
 qht+MJiv1MhKzY30jkbHTmmLDCxIOhuddjSmTBejEZgvB4+eP3w6ahnqHv5RSczZ9Z
 mxHuSPjM6GihdtuKAiM8ZJ+JRqZHvMPV/xk7L7mCIiBKoSsqlh25/gXw/KboHYiqWU
 AR57J7+zrMfHXQJsIBq2KBxHxxh1SzsgXerVIKu8drYBGmYjWAqis64piILILG+mvF
 BcbOlSswTvZ2q3bO0tqVF8xVxSv2a/EfNFMcNRkHkoOh7Xz8WB7/FUJOFUq/mLz8sR
 Exj+eRM5RTqmA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 921FA17E10F4;
 Wed, 14 Jan 2026 14:07:02 +0100 (CET)
Date: Wed, 14 Jan 2026 14:06:57 +0100
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
Message-ID: <20260114140657.4b0392f1@fedora>
In-Reply-To: <20251215171453.2506348-2-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-2-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

> +/**
> + * enum drm_panthor_perf_block_type - Performance counter supported block types.
> + */
> +enum drm_panthor_perf_block_type {
> +	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,

If it's internal-use-only, it shouldn't be exposed here. That's another
case of "I want an HW-agnostic uAPI so I can reconcile things up in
the KMD if things change on new HW, but I want it to match the current
HW mapping because it's simpler". If we really want to standardize the
block types that are exposed to the user (and after discussing it with
you, it seems you have valid reasons to want that), I'd rather have a
tightly packed enum with only the block types visible to the user. It
looks like METADATA is the only block we want to hide at the moment, so
it shouldn't be too hard to special-case this block.

> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_FW,

Let's prefix those values with DRM_PANTHOR_PERF_BLOCK_TYPE_ to avoid
the blk vs blk-type confusion.

> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_CSHW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_TILER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
> +	DRM_PANTHOR_PERF_BLOCK_SHADER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_FIRST = DRM_PANTHOR_PERF_BLOCK_FW,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
> +
> +	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
> +	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,

I think I'd just go for

	DRM_PANTHOR_PERF_BLOCK_TYPE_COUNT,

and drop DRM_PANTHOR_PERF_BLOCK_{FIRST,LAST,MAX) definitions, with a
comment stating that DRM_PANTHOR_PERF_BLOCK_TYPE_COUNT must stay last
in this enum.

> +};
