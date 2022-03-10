Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD14D46E3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 13:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9151510EAAA;
	Thu, 10 Mar 2022 12:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4C210EA64;
 Thu, 10 Mar 2022 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915303; x=1678451303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=89+L9vNASUDCU160pGuR8ZIFXpMDpU2hcS8loid0pc4=;
 b=GQJ/GE7KUkLoMjQBVkQzLi1HwUX7rs8Ez1YhE616NIxHby4+VTXxz8AC
 NZmuhx6mfGi/LbHtqbL5vDNjM2t58tB7ispO3JGe4ahcIiO5w8NN07xwL
 x7S/UhPG7/QYWFV6ol3hz9YP5DQiYMXfd/TCw36S9ZxCb6YDmd0kr1nII
 21/xBmFsebKPzXbI/8eC5Mj5eHoitSJl16NB8LdczRcisAy4p8cy39p/J
 4rWVmwv+PnAFryzSCh+K7V4sOg8KlbZIFdyjx05SN/xp4I7A3j2lxL2Hw
 FbYFTXgM4lrwEWQ9Bn9bs/q6ncQlLyTAAJ8BWaIoUot7t303uNfg+UgPr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341665155"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="341665155"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:22 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="496237725"
Received: from tcuddihy-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.1])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/i915/stolen: consider I915_BO_ALLOC_GPU_ONLY
Date: Thu, 10 Mar 2022 12:27:46 +0000
Message-Id: <20220310122751.89693-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310122751.89693-1-matthew.auld@intel.com>
References: <20220310122751.89693-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Keep the behaviour consistent with normal lmem, where we assume CPU
access if by default required.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

