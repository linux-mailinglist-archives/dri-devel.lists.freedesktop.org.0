Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBCC4A0066
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C0710E752;
	Fri, 28 Jan 2022 18:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC5710E752;
 Fri, 28 Jan 2022 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643395937; x=1674931937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QJdXPyU5oTAxDiQoh/0/qeoqVUU5wh9YcGZsW6UH1UI=;
 b=E/fGaOjnD1k0jI9RbHlPn2sozPU82QZjxoWYU6HBAo6ghk041SeIUCH1
 3JSyk12GazTu8RO1RhuHOULMtnOQgynS4cayy9TvaZNeYAcZXjlyDWwEz
 goo8sgLrNQ/uSlR/vKaHGKojSF4JEs8IQ+zaCdkc6TciZ7uufRnfZr8zz
 9yWnLAWhTISnownJb2FLekJsrrZ0H0IyFzLByfIk5JcTdG8ltsodgFD4C
 pmGGO0bPx7cZPRq7waFjEd968kSbDyz95uUT43fQy95OxOKG5pyNcE8eh
 J6u3CEnK/lXHehLa1GwLbGdWy40PMkxsXzYhRy6WNPfYZGP21o/qJyvTM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="310490195"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="310490195"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="625718046"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:10 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/i915: align the plane_vma to min_page_size of stolen
 mem
Date: Sat, 29 Jan 2022 00:22:06 +0530
Message-Id: <20220128185209.18077-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220128185209.18077-1-ramalingam.c@intel.com>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Chris P Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Align the plane vma size to the stolem memory regions' min_page_size.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Matthew Auld <matthew.auld@intel.com>
cc: Chris P Wilson <chris.p.wilson@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index e4186a0b8edb..543877998078 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -46,17 +46,18 @@ static struct i915_vma *
 initial_plane_vma(struct drm_i915_private *i915,
 		  struct intel_initial_plane_config *plane_config)
 {
+	struct intel_memory_region *mem = i915->mm.stolen_region;
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 	u32 base, size;
 
-	if (plane_config->size == 0)
+	if (!mem || plane_config->size == 0)
 		return NULL;
 
 	base = round_down(plane_config->base,
 			  I915_GTT_MIN_ALIGNMENT);
 	size = round_up(plane_config->base + plane_config->size,
-			I915_GTT_MIN_ALIGNMENT);
+			mem->min_page_size);
 	size -= base;
 
 	/*
-- 
2.20.1

