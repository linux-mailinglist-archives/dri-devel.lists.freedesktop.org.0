Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC26EUTueWkF1AEAu9opvQ:T2
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:08:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9601FA00DD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F7E10E68E;
	Wed, 28 Jan 2026 11:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mbFEqtMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC5910E686;
 Wed, 28 Jan 2026 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XyQbPx4NyqvVfGhQbWsK0ZPD+RUNlqviLfN4Hpb1lKc=; b=mbFEqtMInXN4qmLb7Sjn9m4+2X
 PmqG35gI/oEBiErH7YrcSLKg6s4urnqyviI9djHNaRC8TNyIjVkAVQ7Lt08ihHmeN6+I7Wjr+x23B
 aoQSXuDhpecocummjF+JP1kejazdk7zOgp557tMuNQerwtz9obLf+cTSxVV8d72jUDdsm9eVo9BWU
 E+7FUPj4EHpAecmEAfh/guknBENNbmBLRR4lB3M1aC+CZQvLYKfLxkLTPKERdwbHIAcwtNSpyfrOz
 yWEppPldycWikzXXj9Eg0Zn/9u0Q6qw4ukCfs6LCCVHEkJmAGwC7hqg//sayqhR8Gc0oINXHkd7uA
 VWcsIWaQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vl3PT-00Aqgw-QF; Wed, 28 Jan 2026 12:08:31 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v6 31/31] drm/sched: Remove drm_sched_init_args->num_rqs
Date: Wed, 28 Jan 2026 11:08:06 +0000
Message-ID: <20260128110806.38350-32-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
References: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,igalia.com:mid,igalia.com:email];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-]
X-Rspamd-Queue-Id: 9601FA00DD
X-Rspamd-Action: no action

Remove member no longer used by the scheduler core and the drivers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 include/drm/gpu_scheduler.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index cea2ee956422..53417baebd49 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -608,8 +608,6 @@ struct drm_gpu_scheduler {
  * @ops: backend operations provided by the driver
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
  *	       allocated and used.
- * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
- *	     as there's usually one run-queue per priority, but may be less.
  * @credit_limit: the number of credits this scheduler can hold from all jobs
  * @hang_limit: number of times to allow a job to hang before dropping it.
  *		This mechanism is DEPRECATED. Set it to 0.
@@ -623,7 +621,6 @@ struct drm_sched_init_args {
 	const struct drm_sched_backend_ops *ops;
 	struct workqueue_struct *submit_wq;
 	struct workqueue_struct *timeout_wq;
-	u32 num_rqs;
 	u32 credit_limit;
 	unsigned int hang_limit;
 	long timeout;
-- 
2.52.0

