Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOjRAspclGm3DAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:19:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1C14BDFD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 13:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1910E4CE;
	Tue, 17 Feb 2026 12:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SuEm4duQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0C510E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GIej0ily7WnSrqU0W64FQXGZwiNhMRB89pCjmhe2c5k=; b=SuEm4duQXMHXoVr8GUgQKy2KOF
 OOvtfS0FDIgAOo1sAa1IHI2QEjGHXB7A+hnYv+in7E/i1f88cRcAS1yAjH6BoViUbd8N31cdMcGQT
 moTdXJF3LEbgGOwr56SwiD6SyLJdOHS61XOrwoBkyY4lNyFDG5mv/zzeaVuQqRQX0L7Ugqg/U8Sht
 oh5RqeF2HromI3JeJUxKLmr+dIY4vsfMTuJxn8O2aNgaelQSERB42wnU+fLlUtVAyebGj4ZynUPqS
 /hdVCkmO/8qOznbMIwUa/XPXZSeqZuO23xDX87NJQn/vAnXlGSg5tqGpsbBU/xzgIMGlQtySRdbzi
 GnOdzfbg==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vsK2r-001eTt-2f; Tue, 17 Feb 2026 13:19:13 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 17 Feb 2026 09:18:54 -0300
Subject: [PATCH 6/6] drm/v3d: Remove dedicated fence_lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260217-v3d-reset-locking-improv-v1-6-0db848016869@igalia.com>
References: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
In-Reply-To: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=ME8bZFoL5aJd/Dpdqn2DNmDb/JexMJR6PRr3FQ6UYaE=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBplFy0ad9h+Qu3M8nYlGO75X86XT2q1n4Tdt5vC
 pxu7GYg7fqJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZRctAAKCRA/8w6Kdoj6
 qm1PCACC+x7vE5s6/lDg/nBnwl6hvGBRkSZDXY9n5BmUGmNATAM6rDo1JLcDSdKRD3iIkvPvuTZ
 3NJwQ8C8vKFzOvN2pxc4qggMW/cuksUfHESrVKvKJCJiLviXO0v3VB+XJUBTvbHK2vHxC/nLBlI
 Oz3FPdjYloiUhHtEiZG3YKRfMvpnkwRZKMY2EVUvKVPvxLS0p7kCRkQw9GC7aMX9m9qv/TVD64U
 2g7rWQbeWakiqLBYTsM9Tma0CVkmmQy4RAcMqeXr3fkqSAjP4lPJpNYSqexd5KGkxvRaWl4Vv2Z
 vAVKMMH/Ut4uclJo8fGcxG+FOcn4P9dgnlya6t14LTjvZOre
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: AEC1C14BDFD
X-Rspamd-Action: no action

Commit adefb2ccea1e ("drm/v3d: create a dedicated lock for dma fence")
split `fence_lock` from `queue_lock` because v3d_job_update_stats() was
taking `queue_lock` to protect `job->file_priv` during stats collection
in the IRQ handler. Using the same lock for both DMA fence signaling and
stats protection in a IRQ context caused issues on PREEMPT_RT.

Since then, the stats infrastructure has been reworked: v3d_stats is now
refcounted and jobs hold their own references to stats objects, so
v3d_job_update_stats() no longer takes `queue_lock` at all.

With the original reason for the split gone, merge `fence_lock` back
into `queue_lock` to simplify the locking scheme.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h   | 2 --
 drivers/gpu/drm/v3d/v3d_fence.c | 2 +-
 drivers/gpu/drm/v3d/v3d_gem.c   | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 3de485abd8fc274b361cd17a00cab189d8e69643..6a3cad933439812d78da5797749c020a9bf46402 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -71,8 +71,6 @@ struct v3d_queue_state {
 	/* Currently active job for this queue */
 	struct v3d_job *active_job;
 	spinlock_t queue_lock;
-	/* Protect dma fence for signalling job completion */
-	spinlock_t fence_lock;
 };
 
 /* Performance monitor object. The perform lifetime is controlled by userspace
diff --git a/drivers/gpu/drm/v3d/v3d_fence.c b/drivers/gpu/drm/v3d/v3d_fence.c
index c82500a1df73bc454cd09ff04bf7a78833a3e473..8f8471adae34af7a444f5eeca4ef08d66ac1b7b5 100644
--- a/drivers/gpu/drm/v3d/v3d_fence.c
+++ b/drivers/gpu/drm/v3d/v3d_fence.c
@@ -15,7 +15,7 @@ struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q)
 	fence->dev = &v3d->drm;
 	fence->queue = q;
 	fence->seqno = ++queue->emit_seqno;
-	dma_fence_init(&fence->base, &v3d_fence_ops, &queue->fence_lock,
+	dma_fence_init(&fence->base, &v3d_fence_ops, &queue->queue_lock,
 		       queue->fence_context, fence->seqno);
 
 	return &fence->base;
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 859e63dd7e9738e3a3702edfb857ec3e844b052b..75d9eccd796664e67277c1f83ad59063f164d1da 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -296,7 +296,6 @@ v3d_gem_init(struct drm_device *dev)
 		queue->fence_context = dma_fence_context_alloc(1);
 
 		spin_lock_init(&queue->queue_lock);
-		spin_lock_init(&queue->fence_lock);
 	}
 
 	spin_lock_init(&v3d->mm_lock);

-- 
2.52.0

