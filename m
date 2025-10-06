Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C561BBBD2F6
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 09:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8521110E3AD;
	Mon,  6 Oct 2025 07:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JZ2Yladu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF7310E3A0;
 Mon,  6 Oct 2025 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759734459;
 bh=EQOgiGE+g35klH/QbOf0cf+PLrLzO1ZuuCOjx+b7EqU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JZ2YladuvRsPBBU3RT4tqnwSWb600cQJGTiTxuqtg1sWx8PunjzZef1lb/R2yun1S
 IEv6jpwI9WQ0Iht2SViUWTe7YNC7kPkidSDWxlceUKWZjn10fhQeB/+H6vSfg9dEfV
 m8JqvuzZWCu/ZCBijPneuavvFHRIE15pHELuvluTUC96H8kZZI8K/IyB4CMl8wrAZk
 xW8nU4m9CzGyjyXQZOBQWdbzNraNbynmBIM5A0Ua9q5T+mlBQGBERC7Zm/etJje+c4
 vFlnyOoXVHitJmNM9LJNPyu2zTEIkyzLUuLt2MAcdxxye6DfQFXAe4XOy5kJDpYJ3D
 TlZ/yFhzkNgBg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2138217E0AC3;
 Mon,  6 Oct 2025 09:07:38 +0200 (CEST)
Date: Mon, 6 Oct 2025 09:07:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Christopher Healy <healych@amazon.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, kernel@collabora.com
Subject: Re: [PATCH v3 05/10] drm/v3d: Use huge tmpfs mount point helper
Message-ID: <20251006090730.364a1713@fedora>
In-Reply-To: <20251004093054.21388-6-loic.molinari@collabora.com>
References: <20251004093054.21388-1-loic.molinari@collabora.com>
 <20251004093054.21388-6-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Sat,  4 Oct 2025 11:30:48 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> +static void
> +v3d_huge_mnt_init(struct v3d_dev *v3d)
> +{
> +	int err;
> +
> +	/*
> +	 * By creating our own shmemfs mountpoint, we can pass in
> +	 * mount flags that better match our usecase. However, we
> +	 * only do so on platforms which benefit from it.
> +	 */
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		goto err;
> +
> +	/* The user doesn't want to enable Super Pages */
> +	if (!super_pages)
> +		goto err;
> +
> +	err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");
> +	if (err && err !=3D -EEXIST)
> +		goto err;
> +
> +	drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> +
> +	return;
> +
> +err:
> +	drm_notice(&v3d->drm,
> +		   "Transparent Hugepage support is recommended for optimal performanc=
e on this platform!\n");

With the changes suggested on patch 3, this can be shrunk a little bit:

	int err =3D 0;

	if (super_pages)
		err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");

	if (v3d->drm.huge_mnt)
		drm_info(&v3d->drm, "Using Transparent Hugepages\n");
	else if (!err)
		drm_notice(&v3d->drm,
			   "Transparent Hugepage support is recommended for optimal performance =
on this platform!\n");
	else
		drm_warn(&v3d->drm, "Couldn't create THP mount point (err=3D%d)\n", err);
