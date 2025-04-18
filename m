Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D01A93434
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 10:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564DA10EB87;
	Fri, 18 Apr 2025 08:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="G2ZztimW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB5B10E17D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744963919;
 bh=KJOdSCbBYjdAocBY8yGze1LvEiWZHViM/MTYycy4oWA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G2ZztimWD7bYj//E75dWBXxjaXFMiaTTPrVFg9+sWNmWRwGxpjDrjCryN3L0hXhW0
 Qv/A0WqMCE7tEC0rdj3xe+NvxnPSO7531w29Uwt6kZueGBmeCYfJBb6BHAkvQfMMcU
 Mvjl+DH4wtzR05W41l/FKEICw69rh4r3J77Q8kTFVv3zypShFwG6AQ51NLYfMUz0DV
 Bt5wvO8UK/NwCL6hZm0gT5fbA4sfolH68zaFUN7kjvof8RzDTY7k0MWcMzDHVWjBOq
 xtnGi5PjKb/wgTfwAT5rz5fS9VVJY7cz56nHHOJ0e1GwK6xO/NJ7cUx898XSc5ib6W
 mHD3uGh2XpI5w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5870C17E03C8;
 Fri, 18 Apr 2025 10:11:59 +0200 (CEST)
Date: Fri, 18 Apr 2025 10:11:56 +0200
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
Message-ID: <20250418101156.0241a000@collabora.com>
In-Reply-To: <20250418022710.74749-5-adrian.larumbe@collabora.com>
References: <20250418022710.74749-1-adrian.larumbe@collabora.com>
 <20250418022710.74749-5-adrian.larumbe@collabora.com>
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

On Fri, 18 Apr 2025 03:27:07 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +	static const char * const gem_state_flags_names[] =3D {
> +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED] =3D "imported",
> +		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED] =3D "exported",

Okay, I think I know where the flag indexing issue comes from:
PANTHOR_DEBUGFS_GEM_STATE_FLAG_xx are flags, not bit positions, so we
can't use them as indices here.

> +	};
> +
> +	static const char * const gem_usage_flags_names[] =3D {
> +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL] =3D "kernel",
> +		[PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED] =3D "fw-mapped",

Same problem here.

> +	};
> +
