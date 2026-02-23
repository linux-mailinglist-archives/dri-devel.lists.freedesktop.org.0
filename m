Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EivOtnUnGkJLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:29:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F417E5CB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E239810E453;
	Mon, 23 Feb 2026 22:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lrar5eKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A93F10E453;
 Mon, 23 Feb 2026 22:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771885783; x=1803421783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I02v5LYNcZqb3x+3eaGsHOBVYexqrW7eU4j43mdmBUM=;
 b=Lrar5eKJi/dq0yIUNHmSvbgCorbvpIgckxh/A8cY1x/V76iGzeJbdM9Y
 L7135/xQd66waDiaixQ3L7/8wVRRuGk5+Qc4fUcPz4PEsnBenbxZ7afV/
 f8pdRXCv0pLvsV7xhic5Ws2+nP/WGLuF2hU3WVNIpV6lqdhyXadBsYjrl
 HPbyOPyqPyykZj91tVT3iojO1UGQuNF8swBy/r7AppFOmTFapUUqLs/aj
 mzpCnYU2RSnt+8L7WleKZvpY+iVBCE5ch7ea1eDpbWOdS6wYr1o4Cuw4p
 YnJ1lA8V16eq5I0hNNXPuo836aEKVUEAh9J2ffDap2MH8DzQv9/W6YJ75 w==;
X-CSE-ConnectionGUID: oklGQuqjQe2+KGfGbzUIvQ==
X-CSE-MsgGUID: OPbCk0MCTee1VcqKX66qFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71921648"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="71921648"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:29:42 -0800
X-CSE-ConnectionGUID: fS+nCH/DSFeHgIQpZGBYww==
X-CSE-MsgGUID: JPebEQfuTmynAO0rXkgEkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215720957"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:29:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Bart Van Assche <bvanassche@acm.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/pagemap: Unlock cache->lock before freeing it
Date: Mon, 23 Feb 2026 14:29:37 -0800
Message-Id: <20260223222937.2008492-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,acm.org:email,suse.de:email,intel.com:mid,intel.com:dkim,intel.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 843F417E5CB
X-Rspamd-Action: no action

From: Bart Van Assche <bvanassche@acm.org>

Although freeing a spinlock without unlocking it is fine, this confuses
static analyzers. Hence this patch.

Fixes: 77f14f2f2d73 ("drm/pagemap: Add a drm_pagemap cache and shrinker")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap_util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
index 14ddb948a32e..50cb5f9cdac5 100644
--- a/drivers/gpu/drm/drm_pagemap_util.c
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -74,6 +74,8 @@ static void drm_pagemap_cache_fini(void *arg)
 		cache->dpagemap = NULL;
 		spin_unlock(&cache->lock);
 		drm_pagemap_destroy(dpagemap, false);
+	} else {
+		spin_unlock(&cache->lock);
 	}
 
 out:
-- 
2.34.1

