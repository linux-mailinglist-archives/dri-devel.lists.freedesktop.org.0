Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7AA70ECC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 03:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F18010E0EA;
	Wed, 26 Mar 2025 02:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="d1IBjpB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F9710E0EA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 02:15:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742955313; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AFSHvKP6TMReVXblrCeI+VLFGyc+tao+CPbPCZ4APWnelkS7oS27V+NIvL6Ljm3ee0o2oeNY0HLuSoChuPHV5HE+MCmhDQmH7u8l0QX/+OZi7ar1QTg0RDcyTDVZ+pX4i3BwbYF4gkewKMObScSWiIQsJS3GRIZtNcD2MB5spJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742955313;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=bkI99F4sFaHM854UZGCamO4NLmxrSsEW7Gqx7MEBCFg=; 
 b=ex5Qaiy1bv7mVq4+eRqpmcElNXk1R5hVZhc3lERYL3D+QTeXD4nxqf5jWjTLbFqm40438DswLyaDoGRoejDr2mDU5tT4AwqFaOcV7MB8qjQQc//V7a9nIIyYRKxrK0G/v/jnF9KnpkR91Ud9X3bE/7Kk3XKvHSQWQqn/+IvjxMc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742955313; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=bkI99F4sFaHM854UZGCamO4NLmxrSsEW7Gqx7MEBCFg=;
 b=d1IBjpB6DWBjCyxUJuwWl+mV4q4rCXko4aXy4xn4eFdrSsoSHR6F31aB++lGNwVp
 kNSkPd7MLoZrVnF1keDcDn/kKMgz1MO4VJFkrZqN55vC/h7m/pB/2OLxK3VUt99ZawS
 DjGFm2z9bPL2NqSTnIqSsTmImDVnf3DwtYlNq94I=
Received: by mx.zohomail.com with SMTPS id 1742955311000731.7711688459303;
 Tue, 25 Mar 2025 19:15:11 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 0/6] Introduce sparse DRM shmem object allocations
Date: Wed, 26 Mar 2025 02:14:20 +0000
Message-ID: <20250326021433.772196-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This patch series is a proposal for implementing sparse page allocations
for shmem objects. It was initially motivated by a kind of BO managed by
the Panfrost driver, the tiler heap, which grows on demand every time the
GPU faults on a virtual address within its drm_mm-managed ranged.

Because keeping a struct page pointer array that can describe the entire
virtual range is wasteful when only a few backing pages have been
allocated, at Collabora we thought a sparse allocation approach with
xarrays was a more efficient choice.

Since sparse and 'dense' DRM shmem objects must be managed slightly
differently, the API is expanded to allow client drivers to create sparse
objects and also to expand their page backing range, but everything else
should remain as transparent as possible and be handled from within the DRM
shmem system itself.

Discussion of previus revision can be found here:
https://lore.kernel.org/dri-devel/20250218232552.3450939-1-adrian.larumbe@collabora.com/

Changelog:
 v2:
  - Removed patch with helper for non-blocking shmem page allocations.
  - Moved page_array definitions away from scatterlist interface to hide
  them from consumers.
  - Refactored sg_alloc_append_table_from_pages() so that it now calls
  sg_alloc_append_table_from_page_array() to avoid code duplication.
  - Undid extension of __drm_gem_shmem_create() argument list so that a sparse
  shmem object is now fully defined in a parent function.
  - Moved check for absence of backing pages when putting an object into
  drm_gem_shmem_put_pages()
  - Added explanatory comments above DRM WARN'ings across yet unimplemented
  shmem code paths, like kernel vmap's and UM mappings of sparse objects
  - Created drm_gem helper for doing the actual sparse allocation, to keep
  the interface aligned with the existing one with regular shmem objects.
  - Split the body of drm_gem_shmem_get_sparse_pages_locked() into two separate
  functions, one which performs the actual page allocation, and another
  one that retrieves an sgtable.
  - Expanded the argument list of drm_gem_shmem_get_sparse_pages() and its
  children functions so that it takes an gfp mask, in the even that we would
  want to do non-blocking allocations, for instance like when we wish to
  avoid races with the shrinker memory reclaim path.
  - Created shmem helper that returns whether an shmem object has any backing pages.

TODO:
The following items need to be worked on, and will be the subject of a v3 of this RFC:

 - Handle the special case when some of the pages in a sparse allocation range are
   already present, rather than bailing out immediately.
 - Redefining panfrost_gem_object::sgts into an xarray or perhaps a sg_append_table
   to avoid memory waste in allocating more sgtable pointers than we could need.
 - Deciding on the rules for sparse shmem object's kmaps and UM maps.

Adrián Larumbe (6):
  lib/scatterlist.c: Support constructing sgt from page xarray
  drm/shmem: Introduce the notion of sparse objects
  drm/shmem: Implement sparse allocation of pages for shmem objects
  drm/panfrost: Use shmem sparse allocation for heap BOs
  drm/shmem: Add a helper to check object's page backing status
  drm/panfrost/panthor: Take sparse objects into account for fdinfo

 drivers/gpu/drm/drm_gem.c               | 117 +++++++++++
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 264 +++++++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c |  14 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  86 ++------
 drivers/gpu/drm/panthor/panthor_gem.c   |   2 +-
 include/drm/drm_gem.h                   |   6 +
 include/drm/drm_gem_shmem_helper.h      |  29 ++-
 include/linux/scatterlist.h             |  17 ++
 lib/scatterlist.c                       | 175 +++++++++++-----
 10 files changed, 579 insertions(+), 133 deletions(-)


base-commit: 2f9d51740cc30e0d2c8a23a55b1e20cf2513c250
--
2.48.1
