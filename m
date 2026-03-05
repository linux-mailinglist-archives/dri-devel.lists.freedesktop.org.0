Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDbEKhARqmmBKgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:26:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D52193F3
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCCC10E112;
	Thu,  5 Mar 2026 23:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="G8QNQd6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBAC10E112
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 23:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pSOU/nlsKiqauChFCxO02OnTvI4sBOcUwXzOr6axcWU=; b=G8QNQd6hzrPUUKhqV7fMkn01Te
 Ha5VQLsyAX5f0oLbXhYUOhqinQAVttoSjeO8WY2dFTg0je05EDE3mQ3vfxabXdfesU9UvtUIEzO1R
 EkkKsosyqB83HWROUiOSMYm5C3IndLqNK0sEi/LtRqvSHDoaNyMVlZz10eQIBioFyO3OmXLXd+KtI
 AANBtWOM+08brLiS51UiPVj3pLWmLCD1JVADu2AZRXJ9BI1GTo6RSI5C/pv1jEyT7fe7rMyIbKcRM
 DptSFJDDQv/UPdI+0xN5em0Lj8Hv3n6FRbH3QHXqTvxjNpicccG8UU1sz3hjmyCl0Hif5wAImpjl2
 zdGU9lBQ==;
Received: from [189.7.87.203] (helo=[10.0.0.1])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyI4s-009Zzo-DR; Fri, 06 Mar 2026 00:25:58 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/6] drm/v3d: Improve v3d_stats lifetime and locking
Date: Thu, 05 Mar 2026 20:25:49 -0300
Message-Id: <20260305-v3d-reset-locking-improv-v2-0-fd53c91f7726@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7Zi2SAVX3sOwgDLARGhJSxoN4
 e5WEpcu30v++xsE8kwBbtkGniIHdjaBOmVgxsYOhNwlBiWUFkoWGPMOPQVacXLmyXZAnhfvIvY
 9SW3yotBVC2m+eOr5daQfdeKRw+r8+3iK8mt/0ev/aJQoUHRteSmF1KWu7jw0Ezdn42ao933/A
 Lcl0LjBAAAA
X-Change-ID: 20260215-v3d-reset-locking-improv-ffe16c35569b
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=goOhhJXwelrZv67cXzPkw7o+B45yaebLVd44FAVlBfc=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpqhEDclJWzsVckOr3BsmRfG+VCH6AfNaCW1MUN
 qwoJmSiGoSJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaaoRAwAKCRA/8w6Kdoj6
 qvg1B/wLj/coZIRT+/+RYy8XZWP7LTKlrK90CJtj1AZU1c1gcSXrCw/I/VD1jhn3OTq36l498Ce
 jsKsmQXA0+16cuRhn3b8RTA2r5BdzfdNCy1chMqNx1n8nW+2CuXQ+rWkny2Ovdt2wIUSR9EGMQS
 3I8tQGU4ahn0d3HNjTH5mcqXzHjnBUVKMjX5vBAz84lK2Oqmy+npEYvWLEdd1cCwGF8lIZRF4P8
 ByTEu2uQisNHc1u6VljckZ8G1Df9szZwKVRbPhj3dHhnjGrR3e30iS/AixYK/ggCD4nfkF6hHJy
 5dXofW2D5nSXkpA7tj6ZLZTa6d3fQJIFOHTigMLCX9AU4zCR
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
X-Rspamd-Queue-Id: 027D52193F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,m:mcanal@igalia.com,m:itoral@igalia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.952];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email]
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
v1 -> v2:

- [All patches] Added Iago's R-b (Iago Toral)
- [3/6] s/kzalloc/kzalloc_obj
- [5/6] Add a comment explaining while the mutex is used in
        DRM_V3D_PARAM_CONTEXT_RESET_COUNTER (Iago Toral)
- Link to v1: https://lore.kernel.org/r/20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com

To: Melissa Wen <mwen@igalia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com
Cc: dri-devel@lists.freedesktop.org

---
Maíra Canal (2):
      drm/v3d: Handle error from drm_sched_entity_init()
      drm/v3d: Remove dedicated fence_lock

Tvrtko Ursulin (4):
      drm/v3d: Use raw seqcount helpers instead of fighting with lockdep
      drm/v3d: Refcount v3d_stats
      drm/v3d: Hold v3d_stats references in each job
      drm/v3d: Attach per-fd reset counters to v3d_stats

 drivers/gpu/drm/v3d/v3d_drv.c    |  57 ++++++++++-------
 drivers/gpu/drm/v3d/v3d_drv.h    |  46 +++++++++-----
 drivers/gpu/drm/v3d/v3d_fence.c  |   2 +-
 drivers/gpu/drm/v3d/v3d_gem.c    |  43 ++++++++-----
 drivers/gpu/drm/v3d/v3d_irq.c    |   2 +-
 drivers/gpu/drm/v3d/v3d_sched.c  | 133 +++++++++++++++------------------------
 drivers/gpu/drm/v3d/v3d_submit.c |   6 ++
 drivers/gpu/drm/v3d/v3d_sysfs.c  |   2 +-
 8 files changed, 151 insertions(+), 140 deletions(-)
---
base-commit: 21613f67ede11e495281b4a6dde72cd7db3ada4e
change-id: 20260215-v3d-reset-locking-improv-ffe16c35569b

