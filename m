Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7EDA232CD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 18:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8410610E06B;
	Thu, 30 Jan 2025 17:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="eywZYJdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E26910E36D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 17:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738258155; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=A+SsHuVX3sf3+VAWzVwK1MjlZoR1xPPnyRlniEfnvy+4vEvwKnRBDH/zhgQnAa3lIJXjbJsjOR7tO+fK2jihW3qrlJt3sQUEVbAcuGxDM5lmApQf0UK2AVS4xS9WC5/aMbG0tNF0AsLN6xkqWJ8+1k34z2S2F2m7eP28v9ry7fc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738258155;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MJtkl06MZmKKWS/Wyt3m43oW6LdnP587UJ5C+2GbfgY=; 
 b=Ju4p9MZSyZEqTnU160JefVPvFQ46L97Y6GizKpJMbULMjnGFN8jQpagnBCAH+T67MAnTiquxRaWalJ5jm50dvjMv59dSojjZLReyU5izVeGPj2y8LrOUKxo0PJE8i3wvA+eMArrPWdmovUgnjPL8sYegRT0BIsZi5fe/7b+0Suc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738258155; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MJtkl06MZmKKWS/Wyt3m43oW6LdnP587UJ5C+2GbfgY=;
 b=eywZYJdVMeFDRNXlMjrvldqnCpC13IGzCy0ktY+sU8FhwDIDPeA+sbmgVJWTZ0qY
 XcxsOKzfr9A3YCkNTF8+v7W++lSpVLJe+yYFP6qPTV7v2t0xFMUBbV/g0HuTlYawYfW
 jBQMXIDhPQ2HfarqeC+Gbs4+fK2bgSOqie7aa/uA=
Received: by mx.zohomail.com with SMTPS id 1738258149303588.4722290961884;
 Thu, 30 Jan 2025 09:29:09 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v10 0/5] drm/panthor: Display size of internal kernel BOs
 through fdinfo
Date: Thu, 30 Jan 2025 17:28:08 +0000
Message-ID: <20250130172851.941597-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
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

This patch series enables display of the size of driver-owned shmem BO's that aren't
exposed to userspace through a DRM handle. Also fixes a use-after-free bug in the
existing fdinfo implementation for Panthor.

Discussion of previous revision can be found here [1].

Changelog:
v10:
 - Simplified locking scheme in panthor_vm_heaps_sizes
 - Fixed kernel test robot warning about documentation
 - Added some R-b tags to patches
v9:
 - Added proper locking around group pool xarray to prevent UAF errors.
 - Added proper locking around vms pool xarray loop for the same reason
 - Added new patch that fixes UAF error because no locking when accessing 
   fdinfo group stats.
 - Some minor cosmetic and naming changes.
v8:
 - Made print_size public and added prefix argument for drm_print_memory_stats
 - Updated documentation commit to reflect new name tags
 - Some minor polishing
v7:
 - Added new commit: mentions the formation rules for driver-specific fdinfo keys
 - Added new commit: adds a helper that lets driver print memory size key:value
   pairs with their driver name as a prefix.
 - Modified later commits to make use of the previous ones.
 - Deleted mentions of now unnecessary memory keys in the old revision.
v6:
 - Replace up_write witnh up_read, which was left out in the previous version
 - Fixed some minor comment and documentation issues reported by the kernel test robot
v5:
 - Replaced down_write semaphore with the read flavour
 - Fixed typo and added explicit description for drm-shared-internal in
 the fdinfo documentation file for Panthor.
v4:
 - Remove unrelated formating fix
 - Moved calculating overall size of a group's kernel BO's into
 its own static helper.
 - Renamed group kernel BO's size aggregation function to better
 reflect its actual responsibility.

[1] https://lore.kernel.org/dri-devel/20250123225325.3271764-1-adrian.larumbe@collabora.com/

Adrián Larumbe (5):
  Documentation/gpu: Clarify format of driver-specific fidnfo keys
  drm/file: Add fdinfo helper for printing regions with prefix
  drm/panthor: Expose size of driver internal BO's over fdinfo
  Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
  drm/panthor: Fix race condition when gathering fdinfo group samples

 Documentation/gpu/drm-usage-stats.rst   |  5 ++-
 Documentation/gpu/panthor.rst           | 10 +++++
 drivers/gpu/drm/drm_file.c              | 27 ++++++++----
 drivers/gpu/drm/panthor/panthor_drv.c   | 14 ++++++
 drivers/gpu/drm/panthor/panthor_heap.c  | 26 +++++++++++
 drivers/gpu/drm/panthor/panthor_heap.h  |  2 +
 drivers/gpu/drm/panthor/panthor_mmu.c   | 33 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h   |  3 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 58 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.h |  3 ++
 include/drm/drm_file.h                  |  5 +++
 11 files changed, 176 insertions(+), 10 deletions(-)

-- 
2.47.1

