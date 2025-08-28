Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A84B39835
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 11:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDC310E95E;
	Thu, 28 Aug 2025 09:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WMTyq+k2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6ED10E95D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 09:27:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3203F44F1C;
 Thu, 28 Aug 2025 09:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC04C4CEF4;
 Thu, 28 Aug 2025 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756373258;
 bh=r/M9f7QJp9Hkjjyl4KwvKc1dnUJA0dXw9egGgYD0RgI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=WMTyq+k2jCs5omx99TLS9vPAOlxhd6rtCZ68Eu+MheAwiGYH54rebvMyh6HMQIFDI
 f5OZ9weYfDXvjRPDubWjfohiH4s4EEurx6tdQwozVtMQza8EWO0B1/1b/GSGd7ixuY
 CueaEXLUO8eRXGUta8R8zgVjaSPYZR5GD/xKanv4Kgmv43iAsdqeg+NWh5sQQvgsZl
 3lDeAH0ISnZTB9EWFS4BjWr5HFeVoGGkeV8wCRSaQyIV1zyxujJfHe6mmywkGTyCv+
 t2l42e7+90zXuqpP/AgdqDukvL6jYCEs0XVHdO+jZwsVQZfS8Ny0wAVbOX/sTrvjr+
 FCDfYs4tL7tGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 11:27:32 +0200
Message-Id: <DCDYCT8QSYGM.XIKU6FJ1ESAQ@kernel.org>
Subject: Re: [PATCH v3 3/3] gpuvm: remove gem.gpuva.lock_dep_map
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
References: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
 <20250827-gpuva-mutex-in-gem-v3-3-bd89f5a82c0d@google.com>
In-Reply-To: <20250827-gpuva-mutex-in-gem-v3-3-bd89f5a82c0d@google.com>
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

On Wed Aug 27, 2025 at 3:38 PM CEST, Alice Ryhl wrote:
>  #ifdef CONFIG_LOCKDEP
> -/**
> - * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gp=
uva list.
> - * @obj: the &drm_gem_object
> - * @lock: the lock used to protect the gpuva list. The locking primitive
> - * must contain a dep_map field.
> - *
> - * Call this if you're not proctecting access to the gpuva list with the
> - * dma-resv lock, but with a custom lock.
> - */
> -#define drm_gem_gpuva_set_lock(obj, lock) \
> -	if (!WARN((obj)->gpuva.lock_dep_map, \
> -		  "GEM GPUVA lock should be set only once.")) \
> -		(obj)->gpuva.lock_dep_map =3D &(lock)->dep_map
> -#define drm_gem_gpuva_assert_lock_held(obj) \
> -	lockdep_assert((obj)->gpuva.lock_dep_map ? \
> -		       lock_is_held((obj)->gpuva.lock_dep_map) : \
> +#define drm_gem_gpuva_assert_lock_held(gpuvm, obj) \
> +	lockdep_assert(drm_gpuvm_immediate_mode(gpuvm) ? \
> +		       lock_is_held(&(obj)->gpuva.lock.dep_map) : \

NIT: I think this can just be:

	lockdep_is_held(&(obj)->gpuva.lock)

If you want I can fix it up on apply.

>  		       dma_resv_held((obj)->resv))
>  #else
> -#define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
> -#define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
> +#define drm_gem_gpuva_assert_lock_held(gpuvm, obj) do {} while (0)
>  #endif
