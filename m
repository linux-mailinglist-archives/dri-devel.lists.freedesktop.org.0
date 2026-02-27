Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD+HC72/oWnPwAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 17:01:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B265E1BA740
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 17:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355E10EBC6;
	Fri, 27 Feb 2026 16:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbZcXX+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A45E10EBC6;
 Fri, 27 Feb 2026 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772208049; x=1803744049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=koHnou0hLIQl25m1PJZtHQ0TYW6gInL0yMI+4cI1e6k=;
 b=kbZcXX+dVJiVOfrV6tdXWkMDtWIsT3aCGEXx//4+Gcm4UEX5wCL13BA8
 9Rxs/ZuLZy8y1IlYB21xLSo0LYUX+f6rUo7sL7CTDuDdLhYZlrcFZ279E
 pJnYDcFYt+v1rAsh6FQc2Kp79Z/pT5bq9rjLDO/neR9dzMg1m7xFz0CRt
 nusLYrDAC6049g2zPPnTcKjDFYG3bIfeQsu74I7390zMFc2Vgr4nobSKQ
 oNyvLSEdOKfbYJwPL2eWqZbQ5f7c+AI3MDngIuhlivZFErDAKki3tMiUo
 n52e3xa0BhrO0CBivFtPEWiTvnhMsL0b9VM+SR9wYLYAMrAfmrU9PAkPa g==;
X-CSE-ConnectionGUID: 40rAgr5lT1+ouSWjYf02lQ==
X-CSE-MsgGUID: 2IV2/8g4R8yPeSUj1JzWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75895477"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75895477"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:49 -0800
X-CSE-ConnectionGUID: jFZKHTuPTGKczSPKyReDLQ==
X-CSE-MsgGUID: ZXwjBbXyQ5+AWRZHZQmJVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="213791083"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:47 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: Avoid invoking the OOM killer when reading back
 swapped content
Date: Fri, 27 Feb 2026 17:00:12 +0100
Message-ID: <20260227160012.82309-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
References: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[intel.com:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B265E1BA740
X-Rspamd-Action: no action

In situations where the system is very short on RAM, the shmem
readback from swap-space may invoke the OOM killer.

However, since this might be a recoverable situation where the caller
is indicating this by setting
struct ttm_operation_ctx::gfp_retry_mayfail to true, adjust the gfp
value used by the allocation accordingly.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_backup.c | 6 ++++--
 drivers/gpu/drm/ttm/ttm_pool.c   | 5 ++++-
 include/drm/ttm/ttm_backup.h     | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
index 6bd4c123d94c..81df4cb5606b 100644
--- a/drivers/gpu/drm/ttm/ttm_backup.c
+++ b/drivers/gpu/drm/ttm/ttm_backup.c
@@ -44,18 +44,20 @@ void ttm_backup_drop(struct file *backup, pgoff_t handle)
  * @dst: The struct page to copy into.
  * @handle: The handle returned when the page was backed up.
  * @intr: Try to perform waits interruptible or at least killable.
+ * @additional_gfp: GFP mask to add to the default GFP mask if any.
  *
  * Return: 0 on success, Negative error code on failure, notably
  * -EINTR if @intr was set to true and a signal is pending.
  */
 int ttm_backup_copy_page(struct file *backup, struct page *dst,
-			 pgoff_t handle, bool intr)
+			 pgoff_t handle, bool intr, gfp_t additional_gfp)
 {
 	struct address_space *mapping = backup->f_mapping;
 	struct folio *from_folio;
 	pgoff_t idx = ttm_backup_handle_to_shmem_idx(handle);
 
-	from_folio = shmem_read_folio(mapping, idx);
+	from_folio = shmem_read_folio_gfp(mapping, idx, mapping_gfp_mask(mapping)
+					  | additional_gfp);
 	if (IS_ERR(from_folio))
 		return PTR_ERR(from_folio);
 
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 8fa9e09f6ee5..aa41099c5ecf 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -530,6 +530,8 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
 		p = first_page[i];
 		if (ttm_backup_page_ptr_is_handle(p)) {
 			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
+			gfp_t additional_gfp = ctx->gfp_retry_mayfail ?
+				__GFP_RETRY_MAYFAIL | __GFP_NOWARN : 0;
 
 			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
 			    should_fail(&backup_fault_inject, 1)) {
@@ -543,7 +545,8 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
 			}
 
 			ret = ttm_backup_copy_page(backup, restore->alloced_page + i,
-						   handle, ctx->interruptible);
+						   handle, ctx->interruptible,
+						   additional_gfp);
 			if (ret)
 				break;
 
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
index c33cba111171..29b9c855af77 100644
--- a/include/drm/ttm/ttm_backup.h
+++ b/include/drm/ttm/ttm_backup.h
@@ -56,7 +56,7 @@ ttm_backup_page_ptr_to_handle(const struct page *page)
 void ttm_backup_drop(struct file *backup, pgoff_t handle);
 
 int ttm_backup_copy_page(struct file *backup, struct page *dst,
-			 pgoff_t handle, bool intr);
+			 pgoff_t handle, bool intr, gfp_t additional_gfp);
 
 s64
 ttm_backup_backup_page(struct file *backup, struct page *page,
-- 
2.53.0

