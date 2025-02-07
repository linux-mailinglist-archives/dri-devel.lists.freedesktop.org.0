Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6124A2C8F1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984F510EB76;
	Fri,  7 Feb 2025 16:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="m+l0jBJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC16810E047
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738945783;
 bh=CTg/oPt7b8oDc+wpDgmpUzTTliBbDj+D/KiMzWPe6wg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m+l0jBJc2+iprI6Pu9oAN8vZvFcertgTLFqvOC1P0Cf9VU8moZlNVRZxTS+ML6aBh
 G1pCo6/0HOXqFJxWmsDkvSkoTE03JlUCGl4Mb/oqTR1fEqyQTtvq23xAtTATRaDaO5
 MJEDmnG2FxgwQjEX2QUP0rH/r2ZLN6TJy/mv1snvQP5kK9TNdsMR6M6cF5Dd0sCFla
 EfOK4JfX3CzuSkoOnpwn/MhwtyrOPpWkat8fKqRZIoCiwJ+ZbLAdJ7MXmcgbvhtV0F
 LHLnW5Vh17bwySYzpWPGmFgTs3tfTj9hIiYzyYg4SJafUiyZqFJRpEZPjqoXDM6lhD
 P+7cCBNuAglyg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CF71617E1507;
 Fri,  7 Feb 2025 17:29:42 +0100 (CET)
Date: Fri, 7 Feb 2025 17:29:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, kernel@collabora.com, Tvrtko Ursulin
 <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/5] drm/panthor: Display size of internal kernel
 BOs through fdinfo
Message-ID: <20250207172935.2fa23902@collabora.com>
In-Reply-To: <20250130172851.941597-1-adrian.larumbe@collabora.com>
References: <20250130172851.941597-1-adrian.larumbe@collabora.com>
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

On Thu, 30 Jan 2025 17:28:08 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This patch series enables display of the size of driver-owned shmem BO's =
that aren't
> exposed to userspace through a DRM handle. Also fixes a use-after-free bu=
g in the
> existing fdinfo implementation for Panthor.
>=20
> Discussion of previous revision can be found here [1].
>=20
> Changelog:
> v10:
>  - Simplified locking scheme in panthor_vm_heaps_sizes
>  - Fixed kernel test robot warning about documentation
>  - Added some R-b tags to patches
> v9:
>  - Added proper locking around group pool xarray to prevent UAF errors.
>  - Added proper locking around vms pool xarray loop for the same reason
>  - Added new patch that fixes UAF error because no locking when accessing=
=20
>    fdinfo group stats.
>  - Some minor cosmetic and naming changes.
> v8:
>  - Made print_size public and added prefix argument for drm_print_memory_=
stats
>  - Updated documentation commit to reflect new name tags
>  - Some minor polishing
> v7:
>  - Added new commit: mentions the formation rules for driver-specific fdi=
nfo keys
>  - Added new commit: adds a helper that lets driver print memory size key=
:value
>    pairs with their driver name as a prefix.
>  - Modified later commits to make use of the previous ones.
>  - Deleted mentions of now unnecessary memory keys in the old revision.
> v6:
>  - Replace up_write witnh up_read, which was left out in the previous ver=
sion
>  - Fixed some minor comment and documentation issues reported by the kern=
el test robot
> v5:
>  - Replaced down_write semaphore with the read flavour
>  - Fixed typo and added explicit description for drm-shared-internal in
>  the fdinfo documentation file for Panthor.
> v4:
>  - Remove unrelated formating fix
>  - Moved calculating overall size of a group's kernel BO's into
>  its own static helper.
>  - Renamed group kernel BO's size aggregation function to better
>  reflect its actual responsibility.
>=20
> [1] https://lore.kernel.org/dri-devel/20250123225325.3271764-1-adrian.lar=
umbe@collabora.com/
>=20
> Adri=C3=A1n Larumbe (5):
>   Documentation/gpu: Clarify format of driver-specific fidnfo keys
>   drm/file: Add fdinfo helper for printing regions with prefix
>   drm/panthor: Expose size of driver internal BO's over fdinfo
>   Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
>   drm/panthor: Fix race condition when gathering fdinfo group samples

Queued to drm-misc-next.

>=20
>  Documentation/gpu/drm-usage-stats.rst   |  5 ++-
>  Documentation/gpu/panthor.rst           | 10 +++++
>  drivers/gpu/drm/drm_file.c              | 27 ++++++++----
>  drivers/gpu/drm/panthor/panthor_drv.c   | 14 ++++++
>  drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++
>  drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 33 ++++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
>  drivers/gpu/drm/panthor/panthor_sched.c | 58 ++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_sched.h |  3 ++
>  include/drm/drm_file.h                  |  5 +++
>  11 files changed, 176 insertions(+), 10 deletions(-)
>=20

