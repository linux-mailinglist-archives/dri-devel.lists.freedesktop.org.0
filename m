Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D37B57B5C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D80F10E48B;
	Mon, 15 Sep 2025 12:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="iYRS3fKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E5410E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1757940157; x=1758544957; i=natalie.vock@gmx.de;
 bh=XLov8RlCWVl2IID+p1nO7hFPn6pJtz7G6VeAVxCQSZI=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iYRS3fKehATp/uxB6fiiczJIblqRd1QljOs+jlKqF9atH4naV3ykuvTzKIkeBQsq
 zu9NjPA0luLc/8GhQuaELX5wXgo+9NYsGkh2cfkf/k3mBr3nuUvMvEwHoTVNcguqe
 MRut30GBIaH2RfFIN2EerNQCxSKlV8WpHbGpn6Ck/6wYGbjt5kODH2FAl0ihGB+Vd
 wRM6NSHVnhUUMywUVDoIG3mGzfQyWqI/WI7auh1PJ3RVftvx7zot6BH9domqq7ZTl
 mGickUcgCGGC712CFFkvAL//6hevCI1/Kv6b7q2fjLtGusXcCzsqSKcyzerx9/A8p
 RWCk5oB5byV2yGiBlA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Db0-1v0LNU16jY-00GrfM; Mon, 15
 Sep 2025 14:37:00 +0200
From: Natalie Vock <natalie.vock@gmx.de>
Subject: [PATCH 0/4] cgroup/dmem,drm/ttm: Improve protection in contended cases
Date: Mon, 15 Sep 2025 14:36:27 +0200
Message-Id: <20250915-dmemcg-aggressive-protect-v1-0-2f3353bfcdac@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAEsIyGgC/x3MSwrDMAxF0a0EjSuIU4xpt1I6SOVnV4N8kEIIh
 Oy9psMzuPckhymcnt1Jhl1dl7kh3DqS7zhXsOZmGvoh9o8QOU+YpPJYq8Fdd/BqywbZOEq5p5J
 Ckvyh1q+Gosf//Xpf1w9dWjLEawAAAA==
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
X-Mailer: b4 0.14.2
X-Provags-ID: V03:K1:T8PyzfoH1hc2vAl/Us3KIQxM+TEyirqF5n4UST3Ytz5SxusridW
 yh+k8tm1ekbZMkH/Th0c4JmeIljW8inUNLEi6Bre8wQ8lnsq93QFwjatwazwJ7sv1IBh18m
 88jToxsA1qCibKyzq9jTKGBH1KcfbuKFdcVN4EY5M23qfeyGb/7nVJxVe1uemH8M5xcp//4
 TZB386H/ZEPyljxWAI1uw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+VVsHfH+QDE=;nexcBqSLXmJP9wOPGtlzKhsVlQ0
 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
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
Natalie Vock (4):
      cgroup/dmem: Add queries for protection values
      cgroup/dmem: Add dmem_cgroup_common_ancestor helper
      drm/ttm: Be more aggressive when allocating below protection limit
      drm/ttm: Use common ancestor of evictor and evictee as limit pool

 drivers/gpu/drm/ttm/ttm_bo.c       | 79 ++++++++++++++++++++++++++++++++-=
=2D----
 drivers/gpu/drm/ttm/ttm_resource.c | 48 ++++++++++++++++-------
 include/drm/ttm/ttm_resource.h     |  6 ++-
 include/linux/cgroup_dmem.h        | 25 ++++++++++++
 kernel/cgroup/dmem.c               | 73 +++++++++++++++++++++++++++++++++=
++
 5 files changed, 205 insertions(+), 26 deletions(-)
=2D--
base-commit: f3e82936857b3bd77b824ecd2fa7839dd99ec0c6
change-id: 20250915-dmemcg-aggressive-protect-5cf37f717cdb

Best regards,
=2D-=20
Natalie Vock <natalie.vock@gmx.de>

