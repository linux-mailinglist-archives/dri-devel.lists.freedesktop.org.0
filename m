Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522C3A983A6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 10:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D2E10E17D;
	Wed, 23 Apr 2025 08:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NKA1Mh7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B272A10E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745397388;
 bh=CMgueHlFXZUotyZU8ge0rGS/3vwqIXsNLIe3dmF84Jo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NKA1Mh7TOAuUKbCkFN8QWi/M6JVhYLKcd1bas8iS7V6CX0kldmId9tCqrktVo8YSc
 YpVHcf4Gklognd+mBjfqhIt+hmHDPcShgS09xIwpOvtRyiuQAe/WG8JRudaAMewEu3
 LIskSJ+gNxWssehUQ6q5GtpnhTUHIuZBKZmdaZL3CS00+bbplQeRhby9nSa3fd3n/q
 LSAAk84KyOERbUkjTrsk/Wq6+5WGHVcTlhZSoUti/nVT7aExX6rxp8c1E9CsnxAeMW
 uHCfm9XofeRXlOZLanF9J5jdb3D1pUVpPgGEUonTtJAYS+zqxPSlQF0DJP1LwsaK+T
 30vixbFDICojw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EDBD17E0C96;
 Wed, 23 Apr 2025 10:36:28 +0200 (CEST)
Date: Wed, 23 Apr 2025 10:36:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v10 0/4] Panthor BO tagging and GEMS debug display
Message-ID: <20250423103624.22d55b6f@collabora.com>
In-Reply-To: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
References: <20250423021238.1639175-1-adrian.larumbe@collabora.com>
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

On Wed, 23 Apr 2025 03:12:30 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This patch series is aimed at providing UM with detailed memory profiling
> information in debug builds. It is achieved through a device-wide list of
> DRM GEM objects, and also implementing the ability to label BO's from UM
> through a new IOCTL.
>=20
> The new debugfs file shows a list of driver DRM GEM objects in tabular mo=
de.
> To visualise it, cat sudo cat /sys/kernel/debug/dri/*.gpu/gems.
> To test this functionality from UM, please refer to this Mesa patch serie=
s:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224
>=20
> Discussion of previous revision of this patch series can be found at:
> https://lore.kernel.org/dri-devel/20250418022710.74749-1-adrian.larumbe@c=
ollabora.com/
>=20
> Changelog:
> v10:
>  - Simplified printing of GEM state and usage flags: now they're printed =
numericaly,
>    and their meanings given in the DebugFS file prelude
>  - Some minor formating changes
>  - Fixed all checkpatch issues with --strict
>=20
> v9:
>  - Added padding field to uAPI BO label ioctl struct
>  - Simplified copying and bounds checking of label in ioctl function
>=20
> v8:
>  - Renamed NULL to NUL in comments describing NUL-terminated strings
>  - Removed 'size' parameter from labelling ioctl() as max length can be
>    handled by the kernel itself
>  - Made sure to use kfree_const() everywhere labels are freed
>  - Replaced maximum label size with numerical constant rather than page s=
ize
>  - Added some warnings and checks in kernel BO labelling function
>=20
> v7:
>  - Improved formating of DebugFS GEM's status and usage flags
>  - Deleted some spurious white spaces
>  - Renamed usage flags setting function
>=20
> v6:
>  - Replaced some mutex calls with scoped guards
>  - Documented data size limits in the label ioctl
>  - Simplified GEMS status flags treatment (Panthor doesn't use madvise)
>  - Fixed some array size and string bugs
>  - Improved the naming of GEM status and usage flags to reflect their mea=
ning
>  - Improved the formatting of the output table
>=20
> v5:
>  - Kept case and naming of kernel BO's consistent
>  - Increased the driver minor after new ioctl
>  - Now adds BO to debugfs GEMs list at GEM object creation time
>  - No longer try to hide BO creator's name when it's a workqueue or modpr=
obe
>  - Reworked the procedure for printing GEM state and kernel BO flags
>  - Turned kernel BO flags and GEM state flags into bit enums
>  - Wait until BO state is marked as initialied for debugfs display
>=20
> v4:
>  - Labelled all kernel BO's, not just heap chunks.
>  - Refactored DebugGFs GEMs list handling functions
>  - Added debugfs GEMS node mask to tell different kinds of BO's
>=20
>=20
> Adri=C3=A1n Larumbe (4):
>   drm/panthor: Introduce BO labeling
>   drm/panthor: Add driver IOCTL for setting BO labels
>   drm/panthor: Label all kernel BO's
>   drm/panthor: show device-wide list of DRM GEM objects over DebugFS

Queued to drm-misc-next.

Thanks,

Boris

>=20
>  drivers/gpu/drm/panthor/panthor_device.c |   5 +
>  drivers/gpu/drm/panthor/panthor_device.h |  11 ++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  69 +++++++-
>  drivers/gpu/drm/panthor/panthor_fw.c     |   8 +-
>  drivers/gpu/drm/panthor/panthor_gem.c    | 207 ++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h    |  86 +++++++++-
>  drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
>  drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
>  include/uapi/drm/panthor_drm.h           |  23 +++
>  9 files changed, 413 insertions(+), 11 deletions(-)
>=20
> --
> 2.48.1

