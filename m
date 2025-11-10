Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86422C46A39
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A0C10E0E0;
	Mon, 10 Nov 2025 12:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="UoeO25v7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D1A10E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1762778344; x=1763383144; i=natalie.vock@gmx.de;
 bh=awEy95ld/mtEcSIrhlxErx0MDqioA1cQNtihSN+y5x8=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UoeO25v7MZsdMPV7MYdltmnGBiKBFAG3RBTQ5I+F81SSGQO3tqImCiPe6ffhBvME
 HoYqOfpUmkxSVrB8zZuOiqlmEgK7ew7GymO6xBwa6bZ/jOpUklIz0i6BmflcIP+T2
 HFreIyxZQt+0i95oxbYYHkJ7A2XeB9RvKIdopPXClOCNVhfSakjRbLL83nAn0qnh0
 hfAQt5JEBFf28Gy8YUpfMAFhcX7giwOcr6C49AFRpyQwL57P1OsTc5ccPKnl+cfet
 BR/E41B7KHX+X3C22MZE8Hudp8Dxpm9VFPitBfCxjKevdDxwg3BvuMid1MWhqUDie
 wAyN6iYPcfEjHbupGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.42.49.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1wAwbJ0Skr-014HdM; Mon, 10
 Nov 2025 13:39:04 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Subject: [PATCH v3 0/5] cgroup/dmem,drm/ttm: Improve protection in
 contended cases
Date: Mon, 10 Nov 2025 13:37:29 +0100
Message-Id: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAIncEWkC/43OOw6DMAyA4asgz02VBwG1E/eoOkDiBA88lKCIC
 nH3BgbGquNvyZ+9QcRAGOFZbBAwUaRpzKFuBZi+HT0ysrlBcqn5Q2hmBxyMZ633AWOkhGwO04J
 mYdo4Vbta1MZ2kPfngI7W0369c/cUlyl8zlNJHNN/1CQYZ9IppVXnjG1N44f1bhEOMsmLEfw3I
 zOjqqosXVdi/vNi9n3/AhY41mUGAQAA
X-Change-ID: 20250915-dmemcg-aggressive-protect-5cf37f717cdb
To: Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:LfhkCGXVUqTMXmwZz6oVyPSwv2hgMh57hxZKORsicpzru2oFrRL
 R8JruIsHOLaMjcxcjAsxCq7pGwYjAoiIvQWUzc4DPGKwI4tfIUvD+vWXH/xQCkwI7kgo71F
 RDwQprAAScN3XVEXWxGYjq76qNOhNB5fSDHpFAjHyBYO2l4sc3ssrJUUuk+M0wI+0IDwK3Y
 g1H7TR4YAJxkFZI0US4ag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g8xk9woMxEE=;OV7dgDGB71H7tr6a3WmX16GK1US
 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
 MLKgFpGoA9pvXBsKabSV+Zi95c=
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

Hi all,

I've been looking into some cases where dmem protection fails to prevent
allocations from ending up in GTT when VRAM gets scarce and apps start
competing hard.

In short, this is because other (unprotected) applications end up
filling VRAM before protected applications do. This causes TTM to back
off and try allocating in GTT before anything else, and that is where
the allocation is placed in the end. The existing eviction protection
cannot prevent this, because no attempt at evicting is ever made
(although you could consider the backing-off as an immediate eviction to
GTT).

This series tries to alleviate this by adding a special case when the
allocation is protected by cgroups: Instead of backing off immediately,
TTM will try evicting unprotected buffers from the domain to make space
for the protected one. This ensures that applications can actually use
all the memory protection awarded to them by the system, without being
prone to ping-ponging (only protected allocations can evict unprotected
ones, never the other way around).

The first two patches just add a few small utilities needed to implement
this to the dmem controller. The second two patches are the TTM
implementation:

"drm/ttm: Be more aggressive..." decouples cgroup charging from resource
allocation to allow us to hold on to the charge even if allocation fails
on first try, and adds a path to call ttm_bo_evict_alloc when the
charged allocation falls within min/low protection limits.

"drm/ttm: Use common ancestor..." is a more general improvement in
correctly implementing cgroup protection semantics. With recursive
protection rules, unused memory protection afforded to a parent node is
transferred to children recursively, which helps protect entire
subtrees from stealing each others' memory without needing to protect
each cgroup individually. This doesn't apply when considering direct
siblings inside the same subtree, so in order to not break
prioritization between these siblings, we need to consider the
relationship of evictor and evictee when calculating protection.
In practice, this fixes cases where a protected cgroup cannot steal
memory from unprotected siblings (which, in turn, leads to eviction
failures and new allocations being placed in GTT).

Thanks,
Natalie

Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
=2D--
Changes in v3:
- Improved documentation around cgroup queries and TTM eviction helpers
  (Maarten)
- Fixed up ttm_alloc_at_place charge failure logic to return either
  -EBUSY or -ENOSPC, not -EAGAIN (found this myself)
- Link to v2: https://lore.kernel.org/r/20251015-dmemcg-aggressive-protect=
-v2-0-36644fb4e37f@gmx.de

Changes in v2:
- Factored out the ttm logic for charging/allocating/evicting into a
  separate helper to keep things simpler
- Link to v1: https://lore.kernel.org/r/20250915-dmemcg-aggressive-protect=
-v1-0-2f3353bfcdac@gmx.de

=2D--
Natalie Vock (5):
      cgroup/dmem: Add queries for protection values
      cgroup/dmem: Add dmem_cgroup_common_ancestor helper
      drm/ttm: Make a helper for attempting allocation in a place
      drm/ttm: Be more aggressive when allocating below protection limit
      drm/ttm: Use common ancestor of evictor and evictee as limit pool

 drivers/gpu/drm/ttm/ttm_bo.c       | 192 +++++++++++++++++++++++++++++++-=
=2D----
 drivers/gpu/drm/ttm/ttm_resource.c |  48 +++++++---
 include/drm/ttm/ttm_resource.h     |   6 +-
 include/linux/cgroup_dmem.h        |  25 +++++
 kernel/cgroup/dmem.c               |  87 +++++++++++++++++
 5 files changed, 317 insertions(+), 41 deletions(-)
=2D--
base-commit: f3e82936857b3bd77b824ecd2fa7839dd99ec0c6
change-id: 20250915-dmemcg-aggressive-protect-5cf37f717cdb

Best regards,
=2D-=20
Natalie Vock <natalie.vock@gmx.de>

