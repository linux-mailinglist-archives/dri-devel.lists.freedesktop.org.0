Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEkqCFkCq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:35:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D710722529F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227F910EDBA;
	Fri,  6 Mar 2026 16:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="G/jXvTUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EFA10EDD6;
 Fri,  6 Mar 2026 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jv0b2JEOW9iBn3iWe6GzH0NQUfx7OxVSJdPJRTHu/TE=; b=G/jXvTUhAyYmBohIU1nIlGwdaG
 7PoGYYJfAoJfSHV8gQY8vqQKscikuHo9+Qt0v2ye2HE0u4B7ME3wYogwL4APdAbt5TXiPgF3vC093
 wNF514uDnhpt2oXXCUtAnQCp3KHPKweyY+swI5SJMQfqEfr64lljebQHI40vwA8KR4YdIClj7WFXS
 kJ2ByPhdogJqhuk7ewUV33cQVo3a+l99efkRTaTdPmjg0MtjzPBgJkc/fGYcM69yWtwVBEXpcfeCf
 74PRrqEpW6m6u1CFnPNfIY8bC7BL2uiwNuVxbjtYYG+OiV2yvK35I2DUwxbSR9DpSGcBYcILM0lLD
 5GDjL8ag==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vyY8u-00APXv-4S; Fri, 06 Mar 2026 17:35:12 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 28/29] drm/xe: Remove drm_sched_init_args->num_rqs usage
Date: Fri,  6 Mar 2026 16:34:44 +0000
Message-ID: <20260306163445.97243-29-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
References: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Queue-Id: D710722529F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.774];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,igalia.com:mid,igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:email]
X-Rspamd-Action: no action

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_dep_scheduler.c | 1 -
 drivers/gpu/drm/xe/xe_execlist.c      | 1 -
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c b/drivers/gpu/drm/xe/xe_dep_scheduler.c
index 51d99fee9aa5..004aac8b89e6 100644
--- a/drivers/gpu/drm/xe/xe_dep_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
@@ -78,7 +78,6 @@ xe_dep_scheduler_create(struct xe_device *xe,
 	const struct drm_sched_init_args args = {
 		.ops = &sched_ops,
 		.submit_wq = submit_wq,
-		.num_rqs = 1,
 		.credit_limit = job_limit,
 		.timeout = MAX_SCHEDULE_TIMEOUT,
 		.name = name,
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 755a2bff5d7b..1f8d358e60fd 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -337,7 +337,6 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	struct drm_gpu_scheduler *sched;
 	const struct drm_sched_init_args args = {
 		.ops = &drm_sched_ops,
-		.num_rqs = 1,
 		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
 		.hang_limit = XE_SCHED_HANG_LIMIT,
 		.timeout = XE_SCHED_JOB_TIMEOUT,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 9c8004d5dd91..67d8ce368486 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -66,7 +66,6 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	const struct drm_sched_init_args args = {
 		.ops = ops,
 		.submit_wq = submit_wq,
-		.num_rqs = 1,
 		.credit_limit = hw_submission,
 		.hang_limit = hang_limit,
 		.timeout = timeout,
-- 
2.52.0

