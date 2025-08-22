Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0877B31D47
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C98810EB49;
	Fri, 22 Aug 2025 15:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XxU+Y4/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC8F10EB49
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755875107;
 bh=1ZX66lBcIbneB1xLBQGHDyLO8ehd34quKOh+R4Cgc0o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XxU+Y4/pWJxFGq7WEbr1LyBymzSLpysU6IVmEBBTI7FlP9deGvyYHs98nvMahVqYf
 tIZ3o8V9H/83x2bdTuLeRAUhY/HVhJV2SMzNjMSjeefXrJO/cH9Nbpn0YXVcSsM9Lx
 yBEm2blpbPcZnFvQk3uuvkTJIDDtjo/ip1YvDenr8biFZZQ6ruOelRQ1i0R6Vy0nRp
 WXtI8v+dEW10WDIKcPCNAFMPBXdWWf2vvi5Ifn69PDgs5ukBC9cNOZETa775mMqNf4
 w4I7iFMmIZcVvV9EOCVuA9ygHlHzemJ5+XAhHXi5XF2v12yMiKAh0KpZ4JBe1WWVKs
 6tCPw8K4xO0cg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D32E817E0DE3;
 Fri, 22 Aug 2025 17:05:06 +0200 (CEST)
Date: Fri, 22 Aug 2025 17:05:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, Faith Ekstrand
 <faith.ekstrand@collabora.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>
Subject: Re: [PATCH 0/7] panfrost,panthor: Cached maps and explicit flushing
Message-ID: <20250822170502.38d9eaaa@fedora>
In-Reply-To: <20250822142954.902402-1-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
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

+panthor/panfrost maintainers/devs

On Fri, 22 Aug 2025 10:29:09 -0400
Faith Ekstrand <faith@gfxstrand.net> wrote:

> This series implements cached maps and explicit flushing for both panfrost
> and panthor.  To avoid code/bug duplication, the tricky guts of the cache
> flusing ioctl which walk the sg list are broken into a new common shmem
> helper which can be used by any driver.
>=20
> The PanVK MR to use this lives here:
>=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36385
>=20
> Faith Ekstrand (6):
>   drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
>   drm/panthor: Add a PANTHOR_BO_SYNC ioctl
>   drm/panthor: Bump the driver version to 1.6
>   drm/panfrost: Add flag to map GEM object Write-Back Cacheable
>   drm/panfrost: Add a PANFROST_SYNC_BO ioctl
>   drm/panfrost: Bump the driver version to 1.5
>=20
> Lo=C3=AFc Molinari (1):
>   drm/panthor: Add flag to map GEM object Write-Back Cacheable
>=20
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 64 +++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 67 +++++++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 23 +++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  2 +
>  drivers/gpu/drm/panthor/panthor_drv.c   | 58 +++++++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_gem.c   | 23 +++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h   |  3 ++
>  include/drm/drm_gem_shmem_helper.h      |  3 ++
>  include/uapi/drm/panfrost_drm.h         | 46 +++++++++++++++++
>  include/uapi/drm/panthor_drm.h          | 65 ++++++++++++++++++++++++
>  10 files changed, 348 insertions(+), 6 deletions(-)
>=20

