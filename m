Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIIQMybUiWklCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:33:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960B10EAAC
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FA289A86;
	Mon,  9 Feb 2026 12:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4ijSELz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0F89A86;
 Mon,  9 Feb 2026 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770640419; x=1802176419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rGAZuR6UfPK56DkYKGI3iMscgEKfyIEUA5FhS9qP+WU=;
 b=f4ijSELzX6a6BwvRS0VlWe68UIYOV0u4a9h0YqsZlYyRpVqVrO6stMUu
 Yiva1AzpYVaEWlLYSE4ovachxvUQqVXUbA0vjzR+Wqx3iiZ5CfIJX5m+O
 4GXvMitK14fmCRr15vXpW++D28u6qvF4eeZ6SO/TLX5/DJ3VuZ8dU62fE
 YnwrhJA7vfQJACpFRtqNTFqByXHKb+mpRvR/rXLREF7KsyjIE/z1LRghx
 ghfWBD7XqOekd/jM+SrQHrXoZAYPNeUoAJoV7r9L6bchGZpOtAOIoRfSf
 SGWSQN55xCnHkEOe38tuSOE0QagOKUuQGHgmycyIjCWMIX6VhtSdWhUcD A==;
X-CSE-ConnectionGUID: MamwSMqZSWq6lhZjCHVQng==
X-CSE-MsgGUID: 6F4PfauaSFePSPo0GNkXQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75599061"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="75599061"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:33:39 -0800
X-CSE-ConnectionGUID: xQsdmmXCR7Sxdj5b8xKVZg==
X-CSE-MsgGUID: J2wKmNdYTlymR2c3XmjS4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216075230"
Received: from dev.igk.intel.com ([10.211.135.225])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:33:37 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH] drm/gpusvm: Fix unbalanced unlock in drm_gpusvm_scan_mm()
Date: Mon,  9 Feb 2026 13:34:33 +0100
Message-Id: <20260209123433.1271053-1-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.35.0
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[maciej.patelczyk@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 5960B10EAAC
X-Rspamd-Action: no action

There is a unbalanced lock/unlock to gpusvm notifier lock:
[  931.045868] =====================================
[  931.046509] WARNING: bad unlock balance detected!
[  931.047149] 6.19.0-rc6+xe-**************** #9 Tainted: G     U
[  931.048150] -------------------------------------
[  931.048790] kworker/u5:0/51 is trying to release lock (&gpusvm->notifier_lock) at:
[  931.049801] [<ffffffffa090c0d8>] drm_gpusvm_scan_mm+0x188/0x460 [drm_gpusvm_helper]
[  931.050802] but there are no more locks to release!
[  931.051463]

The drm_gpusvm_notifier_unlock() sits under err_free label and the
first jump to err_free is just before calling the
drm_gpusvm_notifier_lock() causing unbalanced unlock.

Fixes: f1d08a586482 ("drm/gpusvm: Introduce a function to scan the current migration state")
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 871fcccd128a..c25f50cad6fe 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -819,7 +819,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 
 		if (!(pfns[i] & HMM_PFN_VALID)) {
 			state = DRM_GPUSVM_SCAN_UNPOPULATED;
-			goto err_free;
+			break;
 		}
 
 		page = hmm_pfn_to_page(pfns[i]);
@@ -856,9 +856,9 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 		i += 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 	}
 
-err_free:
 	drm_gpusvm_notifier_unlock(range->gpusvm);
 
+err_free:
 	kvfree(pfns);
 	return state;
 }
-- 
2.43.0

