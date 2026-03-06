Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AtWBOm6qmmiVwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:30:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F6C21FADB
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878C610ECEC;
	Fri,  6 Mar 2026 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Y9uAb+wA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537DA10ECEC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S8VIPR9wZF7EjkmP+VSRDb10/h3iSXDMC1NhcbG5bHo=; b=Y9uAb+wAD2mb3fMsHKwiFyTPL6
 hnwKjHYk2u4nHwIaca9TR54UELyjKGEtvbioX/obzIA5JwPX3fba/bdI4gESMrmJpS2C7jqpP5bcL
 oeksedi2oKd88PDKZZ2gdfUm8WXn64XuOBauTpSk+q8PegO8ZvftcoKZ0YB4ddzHR4RSXiPJFdUMk
 A9LSAwLOlrhEtnWGkA+zpC74VyUaYaKFzIJ3Gugk/gA4rnMpVlzazb8GpkFhJW3DjfsLGTzmrQFMe
 uzDgFZG/D9xwpzn+TqS72BAcz6NXkUiJ/uAMcnISFxAmS6T2WjDI/HWhD4dx3+MFmZLFPd9ea8gDm
 Ak8YwJ2A==;
Received: from [189.7.87.203] (helo=[192.168.0.16])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyTOC-00A0JZ-Ou; Fri, 06 Mar 2026 12:30:41 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 0/6] drm/v3d: Improve v3d_stats lifetime and locking
Date: Fri, 06 Mar 2026 08:30:32 -0300
Message-Id: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OSw6CMBCA4auQrh3Thy3gynsYF1BamAiUtKTRE
 O5uITHGhS7/SeabWUgwHk0g52wh3kQM6MYU4pAR3VVjawCb1IRTrihnEqJowJtgZuidvuPYAg6
 TdxGsNUxpIaUqa5LWJ28sPnb6ekvdYZidf+6XItumbzT/jUYGFGhTF6eCMlWo8oJt1WN11G4gm
 xr5RxL0z3uRJ8k2UuiS2Tzn6kta1/UFuEdt+wsBAAA=
X-Change-ID: 20260215-v3d-reset-locking-improv-ffe16c35569b
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=l+jSrmyTnOZRzPHHvlZsdV1jw1+AbH1Y2YgHIE3eRTI=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpqrrdTpOpDbs0PIvNaZlEzu2PX6kuli3y7qtsc
 atHvBR8bt6JATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaaq63QAKCRA/8w6Kdoj6
 qqjHCACFpVu8AuE6IeARsXg7YpXk2Xhv8vs0H0gP/1izJUftKJsT5NNUjzSVkxDnvU0fLSLqXKw
 NWsO4A/PXINGWZ/jo92rs2nxBBB+Tc5jClQ4+C2lLWaXZL6GJlNak2WNlBjF4eMWeDiKbpJnVft
 6Jm+VwBHfTXTQ8l/4/Aipgnlic3aUivWlzTq2GWz+4UBHhOLXHVtJfVVt70kfNpzfi5FYnroNHQ
 N8kvr7CX1Y3D0lOskecjhoHwh6fcCKONH2tA6N8w2xBboQa057N59m9W7veJBoW/ao3StcEzac7
 YfCx41/0AaxXO0JXDd000vT0BzT8N1Ikh5r8f5KIEfkZpYhx
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
X-Rspamd-Queue-Id: 73F6C21FADB
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
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.963];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
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

v2 -> v3:

- [5/6] Remove mutex from DRM_V3D_PARAM_CONTEXT_RESET_COUNTER (Tvrtko Ursulin)
- Link to v2: https://lore.kernel.org/r/20260305-v3d-reset-locking-improv-v2-0-fd53c91f7726@igalia.com

---
Maíra Canal (2):
      drm/v3d: Handle error from drm_sched_entity_init()
      drm/v3d: Remove dedicated fence_lock

Tvrtko Ursulin (4):
      drm/v3d: Use raw seqcount helpers instead of fighting with lockdep
      drm/v3d: Refcount v3d_stats
      drm/v3d: Hold v3d_stats references in each job
      drm/v3d: Attach per-fd reset counters to v3d_stats

 drivers/gpu/drm/v3d/v3d_drv.c    |  55 ++++++++--------
 drivers/gpu/drm/v3d/v3d_drv.h    |  46 +++++++++-----
 drivers/gpu/drm/v3d/v3d_fence.c  |   2 +-
 drivers/gpu/drm/v3d/v3d_gem.c    |  43 ++++++++-----
 drivers/gpu/drm/v3d/v3d_irq.c    |   2 +-
 drivers/gpu/drm/v3d/v3d_sched.c  | 133 +++++++++++++++------------------------
 drivers/gpu/drm/v3d/v3d_submit.c |   6 ++
 drivers/gpu/drm/v3d/v3d_sysfs.c  |   2 +-
 8 files changed, 147 insertions(+), 142 deletions(-)
---
base-commit: e597a809a2b97e927060ba182f58eb3e6101bc70
change-id: 20260215-v3d-reset-locking-improv-ffe16c35569b

