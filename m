Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKtTGuPmnmkCXwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C675A1970CE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA09110E74A;
	Wed, 25 Feb 2026 12:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="Pwj3QiKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2796110E74A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772021456; x=1772626256; i=natalie.vock@gmx.de;
 bh=vE6BV34eqD53MkZEQ0KxQv4BjU6AwnhtcLtyHhLjhIs=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Pwj3QiKJdNYqxdo/lIBbnbxGN3HhqscEwzn4VkHFIp/IriSbSxE7EGOb1Y0Ab/lI
 w6IC1SdNYd+HETG2SvYG8LX14QShSuGXiNG18haPfGS9OmWbFvv9eEDab2iYci/SA
 tI9QLaBDIEW/17SnIiwSkFpYn8lGxbS6T50VfKqGFIbraQY2JCpHVUAFpEFsZpKaL
 3lXshn3SeVX9wTalQJsoCj+Uz9yqIAR/B/wMIKSc0G1sV2J5A2bRvzRcmWbOFevXi
 uDsICF/n2hEl/E/WxsZun1XoQ+vimd1UfTN1fdY2lTstZxzOZCytXMmut6WCCFr08
 eULJsspWeBo74YUAYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GMq-1vhnUV31jU-00s8zi; Wed, 25
 Feb 2026 13:10:55 +0100
From: Natalie Vock <natalie.vock@gmx.de>
Subject: [PATCH v4 0/6] cgroup/dmem,drm/ttm: Improve protection in
 contended cases
Date: Wed, 25 Feb 2026 13:10:44 +0100
Message-Id: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTQ6CMBAF4KuYrq3pLwRX3sO4gOlM6QIxLWkwh
 LtbWGjcGJdvkvneW1jCGDCx82FhEXNIYbyXYI4HBn1798iDK5kpoaxopOVuwAE8b72PmFLIyB9
 xnBAmboF0TbWswXWs/D8iUph3+3oruQ9pGuNzr8pyu/6jZskFV6S11R2Ba+Hih/nkkG1kVm9Gi
 t+MKoyuKmOoM1h2fjH6w0gpfjF6WyMbIiCwBps3s67rC+SuF11NAQAA
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
 Natalie Vock <natalie.vock@gmx.de>
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:vsTJlS/wJadAocGjXli+9a8OAJQH5LuJx3OkakzwMuGe3w1YNod
 7CxEFe34HoK+u9UO3zd7pSWTLwYWC0bfLNhgvaGFk7F9SYdQCxhN3TXp1lUrZ63aDvcyQn+
 zXSV75Yt32qLr1r+FdD7L3ay3vhDI1m7lQ740Jz9yORmLsw9QpDKGxl+8oh6NIe9TMVx3sT
 Va2s290h3iEfjYQB7/RHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Bl/e80LNSCE=;rCtorSZYo7kSKcei/av2BuvFqSh
 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
 /2QqKxsO67SjtAiYc6J5zYZZioj3k
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,m:natalie.vock@gmx.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmx.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C675A1970CE
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
      cgroup/dmem: Add dmem_cgroup_common_ancestor helper
      drm/ttm: Extract code for attempting allocation in a place
      drm/ttm: Split cgroup charge and resource allocation
      drm/ttm: Be more aggressive when allocating below protection limit
      drm/ttm: Use common ancestor of evictor and evictee as limit pool

 drivers/gpu/drm/ttm/ttm_bo.c       | 198 +++++++++++++++++++++++++++++++-=
=2D----
 drivers/gpu/drm/ttm/ttm_resource.c |  48 ++++++---
 include/drm/ttm/ttm_resource.h     |   6 +-
 include/linux/cgroup_dmem.h        |  25 +++++
 kernel/cgroup/dmem.c               |  87 ++++++++++++++++
 5 files changed, 322 insertions(+), 42 deletions(-)
=2D--
base-commit: 61c0f69a2ff79c8f388a9e973abb4853be467127
change-id: 20250915-dmemcg-aggressive-protect-5cf37f717cdb

Best regards,
=2D-=20
Natalie Vock <natalie.vock@gmx.de>

