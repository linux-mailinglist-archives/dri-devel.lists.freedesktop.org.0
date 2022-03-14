Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E04D80A9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 12:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8311810E5F1;
	Mon, 14 Mar 2022 11:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5A610E60E;
 Mon, 14 Mar 2022 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647257351; x=1678793351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fv44H5lTqRod7biB5SfRoxWFdpVdXt3pEgqmcwPMbZU=;
 b=n36sJ8FvD8VDIgLIgqgt+Uim40k6NtmpOLLOf11z3Vsuu8p7AeHUq+Mi
 2I6RfKbR0ND+n7PnzgpJIZvlHc5x0ZKT/GtKXGAsovPOQ2CTgWdezDIEm
 5zU2IBS6ItsjS9cG84N8HaR4UdGwre7oAp9X6a0Bl37/ox78Ba4LTD7Vw
 0DYlVPIi/8gu2LN/CI+EW62iPKIBdrna98CCyzrtEGiDBXo2rgdpHfr+e
 xEiSReULTrZy5dgOsmejhq8A7m3yxYldPaQ5R2m8PGlvSojzUH2F5Mtoy
 jcY/ZIPsjbm6JUtExAjiWet5enBdDILL6TuS5mAMgjL/exQDsQ4o7yqhd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="254830975"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="254830975"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 04:29:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; d="scan'208";a="556374323"
Received: from znagyx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.7.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 04:28:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/i915/stolen: consider I915_BO_ALLOC_GPU_ONLY
Date: Mon, 14 Mar 2022 11:28:33 +0000
Message-Id: <20220314112837.352931-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314112837.352931-1-matthew.auld@intel.com>
References: <20220314112837.352931-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Keep the behaviour consistent with normal lmem, where we assume CPU
access if by default required.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 6df1600708a7..369a2a60bd7a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -695,6 +695,14 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
 	if (size == 0)
 		return -EINVAL;
 
+	/*
+	 * With discrete devices, where we lack a mappable aperture there is no
+	 * possible way to ever access this memory on the CPU side.
+	 */
+	if (mem->type == INTEL_MEMORY_STOLEN_LOCAL && !mem->io_size &&
+	    !(flags & I915_BO_ALLOC_GPU_ONLY))
+		return -ENOSPC;
+
 	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
 	if (!stolen)
 		return -ENOMEM;
-- 
2.34.1

