Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC10D1QLfWkAQAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:49:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E832CBE42E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7B210E37C;
	Fri, 30 Jan 2026 19:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e91q8kLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500FD10E208;
 Fri, 30 Jan 2026 19:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769802574; x=1801338574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8/K03GpgZIgFTmTVLC4yUaUysz9Y7pUhHKW1zFivd6k=;
 b=e91q8kLELPQbjbILoweklqRVL/0cxREcvtqkTEar674U6V9OA4WwTxYU
 TblJm3fnNYBJQx5YfzLpVxXb1qhsE+rH0ZuxdeQiK8vdEvD6Xu3M2Ikv/
 WgMMpMS6RurNPMJ5NWVt/qKDHerzvtMPLv0RqDnp4F0Yy1DZtw6HIkJ3A
 Gerv0JsPxliPsFDcv8fLN4rCSYUiwtAIoPFxdM6EOEfRbs7e9+iTFHLg9
 +pNZ588jpv6y/S2cDxhWCskVFcJ969qpdmvdT/BYIvr0K57f56TismUYp
 v2oO9cTIDUxn0WHMfD/J8zBrYgeAhh3BwUr7Hs0d1C92Xxpe8UzEbE3pj Q==;
X-CSE-ConnectionGUID: a1FrXNiCRYCMUhI5rqSvcw==
X-CSE-MsgGUID: 5M1MEBwwTvi61EgredvzjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70260320"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70260320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:49:34 -0800
X-CSE-ConnectionGUID: K/ajz6KCQ0C0rai25a75OA==
X-CSE-MsgGUID: IRqJj1f+SPe/PEus8CfQjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="240202401"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:49:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 2/2] drm/gpusvm: Allow device pages to be mapped in mixed
 mappings after system pages
Date: Fri, 30 Jan 2026 11:49:28 -0800
Message-Id: <20260130194928.3255613-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130194928.3255613-1-matthew.brost@intel.com>
References: <20260130194928.3255613-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: E832CBE42E
X-Rspamd-Action: no action

The current code rejects device mappings whenever system pages have
already been encountered. This is not the intended behavior when
allow_mixed is set.

Relax the restriction by permitting a single pagemap to be selected when
allow_mixed is enabled, even if system pages were found earlier.

Fixed: bce13d6ecd6c ("drm/gpusvm, drm/xe: Allow mixed mappings for userptr")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index d733599ceb9a..871fcccd128a 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1495,7 +1495,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 			}
 			zdd = page->zone_device_data;
 			if (pagemap != page_pgmap(page)) {
-				if (i > 0) {
+				if (pagemap) {
 					err = -EOPNOTSUPP;
 					goto err_unmap;
 				}
-- 
2.34.1

