Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKvJGWAEfWmRPwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:20:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BB2BE10A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF7510E1A3;
	Fri, 30 Jan 2026 19:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAfxBwDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19BE10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 19:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769800796; x=1801336796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ArryxHa+jiKUqqeRU7Mto+OusYsWqNgXy/sL6rs0MZg=;
 b=BAfxBwDvXhLgcyp7IMxTRsVyQFag1IdzgOJvuVn03qTQ4sfXgK3JFYQD
 Nb6O8tsF5HECwU/IztYdi4tdd863alvZb1e2Lx8ht7MZI/1ooUwSG32BQ
 bSHHS85nB4Hrw8RE4AUPNf0PpwcgInIngYtUS5CMwdhqYPHYyxS1InEA4
 RxnEtsphjj7yP8xTrwTmKz7dbzNa73R71mfhGoDS6sXcnxJKpzNqn75mp
 NE2vvz6UbffXOVHXXBW8CbRTW46qr9EnAtbf2A9aRHKDG4o8chPPXY6kR
 so66XBcoe6kf/6UpY9ad1Fn+5Uff0d3pSANw0Wr3uBdHtqryJt9cTVvzR g==;
X-CSE-ConnectionGUID: 0EBA8PGaQmWycNQJWEZzPQ==
X-CSE-MsgGUID: eRR5706wRLaMJs3IBgMZKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71093989"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71093989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:19:55 -0800
X-CSE-ConnectionGUID: JCIM6PkZSaCBXx5lEaL9Mg==
X-CSE-MsgGUID: 6upiI/U4R6yYaiH/XPsqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="231846931"
Received: from dut4086lnl.fm.intel.com ([10.105.8.241])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:19:54 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/gpuvm: Do not prepare NULL objects
Date: Fri, 30 Jan 2026 19:19:54 +0000
Message-ID: <20260130191953.61718-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: E9BB2BE10A
X-Rspamd-Action: no action

Statis analysis issue:

drm_gpuvm_prepare_range issues an exec_object_prepare call to all
drm_gem_objects mapped between addr and addr + range.  However, it is
possible (albeit very unlikely) that the objects found through
drm_gpuvm_for_each_va_range (as connected to va->gem) are NULL, as seen
in other functions such as drm_gpuva_link and drm_gpuva_unlink_defer.

Do not prepare NULL objects.

Fixes: 50c1a36f594b ("drm/gpuvm: track/lock/validate external/evicted objects")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 14469765a780..76f70686f0e6 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1322,6 +1322,9 @@ drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
 	drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
 		struct drm_gem_object *obj = va->gem.obj;
 
+		if (unlikely(!obj))
+			continue;
+
 		ret = exec_prepare_obj(exec, obj, num_fences);
 		if (ret)
 			return ret;
-- 
2.43.0

