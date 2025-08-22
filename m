Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ACFB31540
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7825A10EAB1;
	Fri, 22 Aug 2025 10:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UQbflZrs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9256010EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:25:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65B6D60266;
 Fri, 22 Aug 2025 10:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38943C4CEED;
 Fri, 22 Aug 2025 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755858340;
 bh=3eipDB3UV6BUjIS7lwaxbO4H/ODhWWsXLvXxzUmsIok=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=UQbflZrsG0DI7acJsysqxKhAY1Uk8uHRpKNB/krK9xE4EsrpRHE2XkzEb8WCPhzxq
 S/5Y337V2804diMfBItjtmYaf9kLOg4kzmjPbKG2Didug9Nc80LfTfrvf/HeyYTbGI
 qaIYqxUyEXWkA+tLt2nPe+cv1e5QmR4gfcqoukn77oCm+1r6sRzGYLqKqJQ0kYpf3W
 +RYm+S85PVZozgJP4BJZTtUqVWMp115+fZrFkU5IpeX1QX9c9JhdFRgfo9pa9LMPnU
 V7ECy9n5/OmLzymQTwuSz747J6gO3w37KK4OUOPV3Z9O+T1mkczAicLBTI2nyg8fOJ
 1L1w6jkslUZiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Aug 2025 12:25:34 +0200
Message-Id: <DC8VTZ5OZY42.1OCS3QJHZGPAK@kernel.org>
Subject: Re: [PATCH v2 3/3] gpuvm: remove gem.gpuva.lock_dep_map
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Steven Price" <steven.price@arm.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Rob Herring" <robh@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
 <20250822-gpuva-mutex-in-gem-v2-3-c41a10d1d3b9@google.com>
In-Reply-To: <20250822-gpuva-mutex-in-gem-v2-3-c41a10d1d3b9@google.com>
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

On Fri Aug 22, 2025 at 11:28 AM CEST, Alice Ryhl wrote:
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 4a22b9d848f7b3d5710ca554f5b01556abf95985..598ba376b9430cdd4ab7bacdc=
15de031a887cf71 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -196,10 +196,20 @@ enum drm_gpuvm_flags {
>  	 */
>  	DRM_GPUVM_RESV_PROTECTED =3D BIT(0),
> =20
> +	/**
> +	 * @DRM_GPUVM_IMMEDIATE_MODE: use the locking scheme that makes it safe
> +	 * to modify the GPUVM during the fence signalling path

I think this isn't entirely true yet or at least can be ambiguous for now,
because it doesn't prevent users from having DRM_GPUVM_RESV_PROTECTED set, =
which
requires the DMA resv lock to destroy a struct drm_gpuvm_bo, which may happ=
en
from drm_gpuva_unlink().

So, for now, until we have the deferred drop idea in place, it also
requires DRM_GPUVM_RESV_PROTECTED to not be set.

(Eventually, we of course want both to be represented as a single flag, suc=
h
that it becomes an either or.)

I also wouldn't say "makes it safe to", but rather "makes it possible to
safely". We have no control over what the users do with the mutex. :)

NIT: missing period

> +	 *
> +	 * When set, gpuva.lock is used to protect gpuva.list in all GEM
> +	 * objects associated with this GPUVM. Otherwise, the GEMs dma-resv is
> +	 * used.
> +	 */
> +	DRM_GPUVM_IMMEDIATE_MODE =3D BIT(1),
> +
>  	/**
>  	 * @DRM_GPUVM_USERBITS: user defined bits
>  	 */
> -	DRM_GPUVM_USERBITS =3D BIT(1),
> +	DRM_GPUVM_USERBITS =3D BIT(2),
>  };
