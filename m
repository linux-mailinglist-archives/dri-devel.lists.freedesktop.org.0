Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HAJHcNclGm3DAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:19:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2878214BDD9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070DB10E250;
	Tue, 17 Feb 2026 12:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PgozRn4e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D2E10E249
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8FOCovjdqg6EGk7eroN8pbGsbCemvqyCciQPm2uysWI=; b=PgozRn4evrXTlg18vOa9vUWVTf
 fIVpWU2sESA3GLUg67h39d0WuoiVqex282Y4C2dPfjmWDK7HTbTApn/wGQWx5U+WIYAIzx3r2sfds
 z4O0l048/1k+YTELL21uDl7i/IPjk2ZRrSDvJcQrlG+Dw9P8BEaU1zpzLm329FM+i/lpBDanEgvdA
 VD693mvAb4gxuZRoFM7lULbTEPPzIXIEbKqFH+FFl8eI7BVI20Jmo6807ISl7HpaX9BP10s36hFdt
 61BVZB5dTtAAUHxH95hVUAIMBh0j/yWxzars4f/TRc9x1C2zj/ECGU4rlq6O1c9gKEGCvtxKO7wQK
 9EC2dx1g==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vsK2g-001eTt-Cf; Tue, 17 Feb 2026 13:19:02 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/6] drm/v3d: Improve v3d_stats lifetime and locking
Date: Tue, 17 Feb 2026 09:18:48 -0300
Message-Id: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKhclGkC/x3MwQqEIBCA4VeJOTeQisL2KtGhbGyHSmMMCaJ3X
 9njd/j/BzIJU4a+eUCocOYUK1TbgP9OcSXkpRp0p12nlcViFhTKdOGe/MZxRT5OSQVDIOW8sdZ
 9Zqj5KRT4/q+H8X1/KMVh4GoAAAA=
X-Change-ID: 20260215-v3d-reset-locking-improv-ffe16c35569b
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=mrmdU5bZEjmRCVVVE4CTctYyniXnUVx6En1MYb9v9pE=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBplFyzHG7+QCIG3xGexPwbpYFPti8/mNZlY60MA
 wUtXqSzs8GJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZRcswAKCRA/8w6Kdoj6
 qqfRB/9nDXCfn5h65XAOTbrvRnpyHbt617ts5Af88b/Q3+zCjTUV5OiGEd+BoEwblJndKnOPBq1
 aDNkXTUZGFy/YM9HbGfGqHUszqDNLA/7/UvScFTBB28j2TtVTC2jhTEW8UgX5zODHyU1wwrHHMQ
 VG5i7ZqMc2FLrJ6HAHMIg3b46+Y7p03Noot7e6xICpGwJh0sP3pPfq4flEcSejrr6WkrZ16vJid
 vB6WF47et/xsTbGaPfjUN9h1RdfPHpDTLEyGE9aeBKo6K0A8MXxusbqle6xEWJgaswJ2eibdAZU
 lP72p8ipDe5iilrsXmSXFBDABe29dBSKNG+q5tgSdVI+CkqJ
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 2878214BDD9
X-Rspamd-Action: no action

This series aims to improve the `struct v3d_stats` lifetime management.
The commit fa6a20c87470 ("drm/v3d: Address race-condition between per-fd
GPU stats and fd release") addressed a race-condition between the per-fd
GPU stats and the fd release by clearing `job->file_priv` before the V3D
per-fd structure is freed and assuring that `job->file_priv` exists
during the per-fd GPU stats updates.

However, this approach introduced a tricky file_priv NULL-ing dance with
the `queue_lock` spinlock. This series aims to address this issue in a
simpler way: converting `v3d_stats` from embedded structs to
heap-allocated, refcounted objects. This simplifies the code and leaves
`queue_lock` exclusively for job management.

The series also switches to raw seqcount helpers to resolve a lockdep
annotation issue, fixes missing error handling in drm_sched_entity_init(),
and removes the now-unnecessary dedicated fence_lock.

Best regards,
- Maíra

---
Maíra Canal (2):
      drm/v3d: Handle error from drm_sched_entity_init()
      drm/v3d: Remove dedicated fence_lock

Tvrtko Ursulin (4):
      drm/v3d: Use raw seqcount helpers instead of fighting with lockdep
      drm/v3d: Refcount v3d_stats
      drm/v3d: Hold v3d_stats references in each job
      drm/v3d: Attach per-fd reset counters to v3d_stats

 drivers/gpu/drm/v3d/v3d_drv.c    |  53 +++++++++-------
 drivers/gpu/drm/v3d/v3d_drv.h    |  46 +++++++++-----
 drivers/gpu/drm/v3d/v3d_fence.c  |   2 +-
 drivers/gpu/drm/v3d/v3d_gem.c    |  43 ++++++++-----
 drivers/gpu/drm/v3d/v3d_irq.c    |   2 +-
 drivers/gpu/drm/v3d/v3d_sched.c  | 133 +++++++++++++++------------------------
 drivers/gpu/drm/v3d/v3d_submit.c |   6 ++
 drivers/gpu/drm/v3d/v3d_sysfs.c  |   2 +-
 8 files changed, 147 insertions(+), 140 deletions(-)
---
base-commit: 0ef1dcf4c16bb6d90e8fbf7b18f3d76b79fcde9d
change-id: 20260215-v3d-reset-locking-improv-ffe16c35569b

