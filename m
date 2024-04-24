Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D918B1089
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B1F113C96;
	Wed, 24 Apr 2024 17:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="a+DxrA39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6782E10FD57;
 Wed, 24 Apr 2024 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978035; x=1714582835; i=friedrich.vock@gmx.de;
 bh=MbvTuuavhMIBSvaKJNeb41Uwjo9gDgySKSe17CKNkoM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=a+DxrA392jn0lbrpElqiMwPUOPlqQ6GqResnavr8z+ALVaopxgfE7Eu1jwNlYgpr
 wq8m5KC5TnIPGFSsvd/akTRIQPm/BkFUhwJEO5WQJD11yc81MNfqdIgZlDAjcq3q6
 yvd3PINA8xjH6IxUp3SyDuNtcGXf1hIR4w5t96/z0QqfaTtCYBGha9kOMyJsM8RKt
 xT/SrKVfA1DSVXbUfk77Wq1lrz93D9gu5ZpWMZYZ+Nz3DYd3PgJfsntJxtmLSNLOj
 jllK3x4s8jFiJMjbcRCFmKotxrhG192x8fXpTJ8mQNPTJjUlHZ/ojLdoZ7NhT4qzx
 80mdFucvqzXi+W0dGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOzOw-1sKce72DPg-00PBeP; Wed, 24
 Apr 2024 19:00:35 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 00/18] TTM interface for managing VRAM oversubscription
Date: Wed, 24 Apr 2024 18:56:50 +0200
Message-ID: <20240424165937.54759-1-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:30kTPdv++K5EX4INp1vyNl0EJ8DFgJuY/JhxEH/wDtGrOKjUH/u
 Kpz4/NJOxkxYUmMA4Waqs7AnA8gwkE1Hyuh02aNtoVOdUYYCd2UW8v+N3js/3yR3gmczsC/
 m2W12B3eno6yOllKGjQM2DLOXdJ+q2pXt4P4L9yp8ZybZ7nHLcCQWHfxf7lBuVX98lzO61P
 FrePvuQ8j9qZ90AP35dyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O3y2JqGNOmE=;XNuet24Yr1cpAKTmPcu5JjgGdV7
 EIx4TcxNeyE0Ma7QSUMOjkxV0YMXl+/sJVgVKRlwKv9GLYAH3+q+44D1faezpj6HctHp/lgD4
 IW3kctHH7d0QbBmNSec5ctQPm7mW5CqHymTNkODok9dRmMtixiNqz1ofJynlsaq9rK4tt0rwO
 /ojXLIdZeugBlSSVQ9pOEUUc1zDYygBa+FWJYSAKlu1MG6EDXk+Xn4L0TKXY1Nfj587lfIgDf
 BYcCxkOmzhZsNcOavHXVqKKaInL4RlPHLmHaFA3MrUB6X2HeDyWGDAJiwkehemuIMpdIr2kt8
 rUPRR5jtClnd5xuRttPoMY5KiNpxf3P/cigmTekO8fOUhbzRS5MkVv7WKPYJdRAyQk/ZSS+J4
 FpozlaoGikNrfHneFm1OIFR4FJLGClk2nWn6Lmsyclyw+CMZQ1Vf/pnkaFXY5boXT/+akpJXj
 0AxzPJPqJTttlbH/z44dA84QV9uFOS0ZmSOgmuEUoe0miJJH01vIBGg0tbbviwr+1OX2GNynl
 lAOfwHEU74PRCKT01zPH5FltmDb3oYl1QjFC85+Z+YypyU8hK71GCrZR1lQWLkNLEoBio57cw
 jKtdnZGLpRvT2IOh0MarAOqMM1q5jTqakKSBZFIXpKcdQrUsQOynrhoHTjn4i0tw/Nek3L+rO
 sM9gbiNkiVn83lAlPixgUKUv0XhBGxupyvXkPHHPBsXcG1rENJiqyR4G3jOxOjugsV/QDIq5G
 IgKub5AiaE48zkTYd59fKE90LSfERhJHypUPLFMBYbILFSqZoHVXoF1p/Ry56JMrgFUr0VPrI
 oY2B/hCDOP2xfh6+xaGjbq827MpMe+bDn3KMKlPQ9Udak=
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

Hi everyone,

recently I've been looking into remedies for apps (in particular, newer
games) that experience significant performance loss when they start to
hit VRAM limits, especially on older or lower-end cards that struggle
to fit both desktop apps and all the game data into VRAM at once.

The root of the problem lies in the fact that from userspace's POV,
buffer eviction is very opaque: Userspace applications/drivers cannot
tell how oversubscribed VRAM is, nor do they have fine-grained control
over which buffers get evicted.  At the same time, with GPU APIs becoming
increasingly lower-level and GPU-driven, only the application itself
can know which buffers are used within a particular submission, and
how important each buffer is. For this, GPU APIs include interfaces
to query oversubscription and specify memory priorities: In Vulkan,
oversubscription can be queried through the VK_EXT_memory_budget
extension. Different buffers can also be assigned priorities via the
VK_EXT_pageable_device_local_memory extension. Modern games, especially
D3D12 games via vkd3d-proton, rely on oversubscription being reported and
priorities being respected in order to perform their memory management.

However, relaying this information to the kernel via the current KMD uAPIs
is not possible. On AMDGPU for example, all work submissions include a
"bo list" that contains any buffer object that is accessed during the
course of the submission. If VRAM is oversubscribed and a buffer in the
list was evicted to system memory, that buffer is moved back to VRAM
(potentially evicting other unused buffers).

Since the usermode driver doesn't know what buffers are used by the
application, its only choice is to submit a bo list that contains every
buffer the application has allocated. In case of VRAM oversubscription,
it is highly likely that some of the application's buffers were evicted,
which almost guarantees that some buffers will get moved around. Since
the bo list is only known at submit time, this also means the buffers
will get moved right before submitting application work, which is the
worst possible time to move buffers from a latency perspective. Another
consequence of the large bo list is that nearly all memory from other
applications will be evicted, too. When different applications (e.g. game
and compositor) submit work one after the other, this causes a ping-pong
effect where each app's submission evicts the other app's memory,
resulting in a large amount of unnecessary moves.

This overly aggressive eviction behavior led to RADV adopting a change
that effectively allows all VRAM applications to reside in system memory
[1].  This worked around the ping-ponging/excessive buffer moving problem,
but also meant that any memory evicted to system memory would forever
stay there, regardless of how VRAM is used.

My proposal aims at providing a middle ground between these extremes.
The goals I want to meet are:
- Userspace is accurately informed about VRAM oversubscription/how much
  VRAM has been evicted
- Buffer eviction respects priorities set by userspace - Wasteful
  ping-ponging is avoided to the extent possible

I have been testing out some prototypes, and came up with this rough
sketch of an API:

- For each ttm_resource_manager, the amount of evicted memory is tracked
  (similarly to how "usage" tracks the memory usage). When memory is
  evicted via ttm_bo_evict, the size of the evicted memory is added, when
  memory is un-evicted (see below), its size is subtracted. The amount of
  evicted memory for e.g. VRAM can be queried by userspace via an ioctl.

- Each ttm_resource_manager maintains a list of evicted buffer objects.

- ttm_mem_unevict walks the list of evicted bos for a given
  ttm_resource_manager and tries moving evicted resources back. When a
  buffer is freed, this function is called to immediately restore some
  evicted memory.

- Each ttm_buffer_object independently tracks the mem_type it wants
  to reside in.

- ttm_bo_try_unevict is added as a helper function which attempts to
  move the buffer to its preferred mem_type. If no space is available
  there, it fails with -ENOSPC/-ENOMEM.

- Similar to how ttm_bo_evict works, each driver can implement
  uneviction_valuable/unevict_flags callbacks to control buffer
  un-eviction.

This is what patches 1-10 accomplish (together with an amdgpu
implementation utilizing the new API).

Userspace priorities could then be implemented as follows:

- TTM already manages priorities for each buffer object. These priorities
  can be updated by userspace via a GEM_OP ioctl to inform the kernel
  which buffers should be evicted before others. If an ioctl increases
  the priority of a buffer, ttm_bo_try_unevict is called on that buffer to
  try and move it back (potentially evicting buffers with a lower
  priority)

- Buffers should never be evicted by other buffers with equal/lower
  priority, but if there is a buffer with lower priority occupying VRAM,
  it should be evicted in favor of the higher-priority one. This prevents
  ping-ponging between buffers that try evicting each other and is
  trivially implementable with an early-exit in ttm_mem_evict_first.

This is covered in patches 11-15, with the new features exposed to
userspace in patches 16-18.

I also have a RADV branch utilizing this API at [2], which I use for
testing.

This implementation is stil very much WIP, although the D3D12 games I
tested already seemed to benefit from it. Nevertheless, are still quite
a few TODOs and unresolved questions/problems.

Some kernel drivers (e.g i915) already use TTM priorities for
kernel-internal purposes. Of course, some of the highest priorities
should stay reserved for these purposes (with userspace being able to
use the lower priorities).

Another problem with priorities is the possibility of apps starving other
apps by occupying all of VRAM with high-priority allocations. A possible
solution could be include restricting the highest priority/priorities
to important apps like compositors.

Tying into this problem, only apps that are actively cooperating
to reduce memory pressure can benefit from the current memory priority
implementation. Eventually the priority system could also be utilized
to benefit all applications, for example with the desktop environment
boosting the priority of the currently-focused app/its cgroup (to
provide the best QoS to the apps the user is actively using). A full
implementation of this is probably out-of-scope for this initial proposal,
but it's probably a good idea to consider this as a possible future use
of the priority API.

I'm primarily looking to integrate this into amdgpu to solve the
issues I've seen there, but I'm also interested in feedback from
other drivers. Is this something you'd be interested in? Do you
have any objections/comments/questions about my proposed design?

Thanks,
Friedrich

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6833
[2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/tree/spilling

Friedrich Vock (18):
  drm/ttm: Add tracking for evicted memory
  drm/ttm: Add per-BO eviction tracking
  drm/ttm: Implement BO eviction tracking
  drm/ttm: Add driver funcs for uneviction control
  drm/ttm: Add option to evict no BOs in operation
  drm/ttm: Add public buffer eviction/uneviction functions
  drm/amdgpu: Add TTM uneviction control functions
  drm/amdgpu: Don't try moving BOs to preferred domain before submit
  drm/amdgpu: Don't mark VRAM as a busy placement for VRAM|GTT resources
  drm/amdgpu: Don't add GTT to initial domains after failing to allocate
    VRAM
  drm/ttm: Bump BO priority count
  drm/ttm: Do not evict BOs with higher priority
  drm/ttm: Implement ttm_bo_update_priority
  drm/ttm: Consider BOs placed in non-favorite locations evicted
  drm/amdgpu: Set a default priority for user/kernel BOs
  drm/amdgpu: Implement SET_PRIORITY GEM op
  drm/amdgpu: Implement EVICTED_VRAM query
  drm/amdgpu: Bump minor version

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 191 +---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h     |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  26 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  50 ++++
 drivers/gpu/drm/ttm/ttm_bo.c               | 253 ++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_bo_util.c          |   3 +
 drivers/gpu/drm/ttm/ttm_device.c           |   1 +
 drivers/gpu/drm/ttm/ttm_resource.c         |  19 +-
 include/drm/ttm/ttm_bo.h                   |  22 ++
 include/drm/ttm/ttm_device.h               |  28 +++
 include/drm/ttm/ttm_resource.h             |  11 +-
 include/uapi/drm/amdgpu_drm.h              |   3 +
 17 files changed, 430 insertions(+), 218 deletions(-)

=2D-
2.44.0

