Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MbNAeaFpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:43:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D15D1D8E35
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D86910E4CC;
	Mon,  2 Mar 2026 12:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="bvgyhxe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Mon, 02 Mar 2026 12:43:13 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA9C10E4CC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772455391; x=1773060191; i=natalie.vock@gmx.de;
 bh=ldnGibj+E4o7b9LoeKe64HOT6hzpmFeBrBmkE4jkwmQ=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bvgyhxe6yyaakEvND8g00xXN94Ylxpr3hHALxwieh7RT+xXRuTbWm/Ac/p4/Nb9Z
 N/q7bLS4cDUiufv4rTcBiTkFj7a5Y0JXIa21pTC4qjvp+xwvYegeubu9MAyqZz7dO
 MKMW6livIc5XIBmpl3VNn4L7exlfaSKlSvjz6XT/ggw8F2jrfKNCxdAYNDtbElEm7
 1RYEVC9zvC860bKrQAllpvgahPsy9Vdk7iQR5eVTPSZQFqU5gpdxxuylJalsyny0G
 NHtlKwfNs2LqUhRiAIJvl8fpOUlMBXlBFTIA5htAlfqEKgdF6uucGh4KAPe//EfNY
 NUmMUR3lQ1qLbhpEog==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqaxO-1vJM8T0DlQ-00hImA; Mon, 02
 Mar 2026 13:37:33 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Subject: [PATCH v5 0/6] cgroup/dmem,drm/ttm: Improve protection in
 contended cases
Date: Mon, 02 Mar 2026 13:37:02 +0100
Message-Id: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTW7CMBAF4KsgrzHy+CchrHqPqotkPGO8CEF2Z
 FGh3L0OUkFsIpZvpPneu4tMKVIWp91dJCoxx+lSg9vvBJ77SyAZfc1CK+1UB076kUYMsg8hUc6
 xkLymaSacpUM2LbfQoh9E/b8m4nh72N8/NZ9jnqf0+6gqsF4/UQtIJTUb48zA6Hv8CuPt4EmsZ
 NFPBtQ2oytjmsZaHizVnW+MeTEAaosx6xromJHRWereGPvPNErrzTW2Mp6Otu0H4+Bon8yyLH8
 7ncCClAEAAA==
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
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Natalie Vock <natalie.vock@gmx.de>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:73Ui7PkiMmywYo0uNrCxGQvQIyQpqw2/QCQYieNULIzR/3ao8PG
 jPGSEM4tIxT7BvUGGNx8rWpcoCK0MxF/nYRtxoyIGhdTpoNKuYY8pbGPkDyXgR8wjJckbKq
 Iga0z4NNn0D4L3WpalYUbul0Jk07I10aa17TDitRH+ftQqCcFzuz52xZIRqOZdJ0tKHKuUh
 tpc40ydNJyZ4QFW/mPeDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uHbQ74XaVx0=;zfmbugUiqa/v18BTuuvASmk/9cN
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,m:natalie.vock@gmx.de,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmx.de,igalia.com];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gmx.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5D15D1D8E35
X-Rspamd-Action: no action

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
this to the dmem controller. The other patches are the TTM implementation:

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
Changes in v5:
- Added cgroup_common_ancestor helper to use with
  dmem_cgroup_common_ancestor (Tejun)
- Note: "drm/ttm: Use common ancestor..." needed minor changes since
  dmem_cgroup_common_ancestor now grabs a reference to the ancestor
  pool which needs to be dropped after use
- Removed extraneous whitespaces in "drm/ttm: Split cgroup charge..."
  and unnecessary changes done in "drm/ttm: Extract code..." (Tvrtko)
- Applied a comment from v3 about below_low not needing to be
  initialized in "drm/ttm: Be more aggressive..." (Tvrtko)
- Fixed uncharging the cgroup on allocation failure (Tvrtko)
- Fixed a typo in the message of "drm/ttm: Split cgroup charge..."
  (Tvrtko)
- Added case in ttm_bo_evict_cb for when charging fails, since we need
  to retry the charge (found myself)
- Link to v4: https://lore.kernel.org/r/20260225-dmemcg-aggressive-protect=
-v4-0-de847ab35184@gmx.de

Changes in v4:
- Split cgroup charge decoupling and eviction logic changes into
  separate commits (Tvrtko)
- Fix two cases of errno handling in ttm_bo_alloc_place and its caller
  (Tvrtko)
- Improve commit message/description of "drm/ttm: Make a helper..." (now
  "drm/ttm: Extract code...") (Tvrtko)
- Documentation improvements for new TTM eviction logic (Tvrtko)
- Formatting fixes (Tvrtko)
- Link to v3: https://lore.kernel.org/r/20251110-dmemcg-aggressive-protect=
-v3-0-219ffcfc54e9@gmx.de

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
Natalie Vock (6):
      cgroup/dmem: Add queries for protection values
      cgroup,cgroup/dmem: Add (dmem_)cgroup_common_ancestor helper
      drm/ttm: Extract code for attempting allocation in a place
      drm/ttm: Split cgroup charge and resource allocation
      drm/ttm: Be more aggressive when allocating below protection limit
      drm/ttm: Use common ancestor of evictor and evictee as limit pool

 drivers/gpu/drm/ttm/ttm_bo.c       | 214 ++++++++++++++++++++++++++++++++=
=2D----
 drivers/gpu/drm/ttm/ttm_resource.c |  48 ++++++---
 include/drm/ttm/ttm_resource.h     |   6 +-
 include/linux/cgroup.h             |  21 ++++
 include/linux/cgroup_dmem.h        |  25 +++++
 kernel/cgroup/dmem.c               | 105 +++++++++++++++++-
 6 files changed, 374 insertions(+), 45 deletions(-)
=2D--
base-commit: 61c0f69a2ff79c8f388a9e973abb4853be467127
change-id: 20250915-dmemcg-aggressive-protect-5cf37f717cdb

Best regards,
=2D-=20
Natalie Vock <natalie.vock@gmx.de>

