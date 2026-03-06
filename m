Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK6TI/i6qmmiVwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:31:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4332D21FB07
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F52310ECF7;
	Fri,  6 Mar 2026 11:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="icMb5jIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDA510ECF7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+KrL9/E7vCgubFbFM3jMS2U7xSMrgzJPNYJ1HixAboA=; b=icMb5jIms7v2q4pwGukGzjrZs0
 fZR33alV8HetW9NcyKd9OZRAKK3/+qgEvGRhDL5jcbq7QKf8CZT0yDx/+sYE8Q3HS0RWxcNbyEMru
 DmnOa6ZOZOROMp6ALhG+vnqL7AIF1jBU+a9zd18p2lJHMS0IzhydSqbKMz7fkrQalW335ECWZ+bkW
 vBaHSFobqXdBdS8v0vbSOiM02VvFpDZaIhm8m6y8jQNaKQ1IFVnRT80mcHYe9OFGve9CYxgjm5FYu
 HVcAUlK+kfXlhm9AdPlIaroXFxUz9vw/Gxn5/abFYJ+RaF4IHryvrGdYKt/dZ3UBvluIQSAS18bzF
 niv46xPA==;
Received: from [189.7.87.203] (helo=[192.168.0.16])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyTOT-00A0JZ-Jq; Fri, 06 Mar 2026 12:30:57 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 06 Mar 2026 08:30:38 -0300
Subject: [PATCH v3 6/6] drm/v3d: Remove dedicated fence_lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-v3d-reset-locking-improv-v3-6-49864fe00692@igalia.com>
References: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
In-Reply-To: <20260306-v3d-reset-locking-improv-v3-0-49864fe00692@igalia.com>
To: Melissa Wen <mwen@igalia.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2678; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=UAIbJYGQbeVaNGyUz9oPMVva8+grbJxv5BGlF5syCyc=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpqrreFrfup5LGa4ZPKMkuytkSn7UJ85vgQRRjf
 MNyyJ92zLiJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaaq63gAKCRA/8w6Kdoj6
 qhnTB/9SCyAryv1aCiSKyltjeGOVs4Bc6pne6Y5Gv0mh+zELHg7v68O8ZAk9rcrMA3QDsXWId+n
 lptrDqPCKORbvDzKXNSuhzhQSAZIxRAUHC0JvhI7oINOlYLUfigS7Q5nQgUSqwd4Da1cvWOJgen
 Z1LVzH8feTnnOeXurC7rLDGgmPjBuvu6rDQCC6HWcMqbhrkkvgGUPDbYhGC1FIFznW+5oHPU7Da
 iClmBhoeTg5zoDdfFqdVL/RagXYqdtotGTKIVuswdmI8Wj/CEDTn4/oqn3tx9zNMRK+QTp6OMFZ
 cGTt5QnvCozVzsvEvf+QU8WUKaxLDekK4bEJomNBolF+qmZP
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
X-Rspamd-Queue-Id: 4332D21FB07
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
	NEURAL_HAM(-0.00)[-0.970];
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
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
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
index 3c999f60003c8746fba3c635efcaa7ac8c9ecb41..c500136d045572fbaa1e69877b21255c9091dcb1 100644
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
2.53.0

