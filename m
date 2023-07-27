Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1463376567D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190F410E5AA;
	Thu, 27 Jul 2023 14:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B1410E08C;
 Thu, 27 Jul 2023 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469718; x=1722005718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B9qnVY+VRZNAFFFX4OtVO4JHbUPNlQ3pFjeRAUcBYnk=;
 b=JCimNEIVCTC91X7YT3T8IL9Dp1LQnXBG1eLUYXqff5AH6R1Toauyeq3K
 wUpaXl7y3ys8/q17Uhx0u3o9kVAknUMHFlg6LVoBs8RcP3IyEWpZXGSh+
 sZ7J7rsWO0glzdsYzuDtN24IoJ5RtQNv67KCs7A5ksmV8Su9WlHDm270s
 vynsMdDwmR8Ulhd3NoA9Uf9QpTYlUJHSCVBwH2DgPiEvO9Jken8YbKri7
 Ek5QmpmuKxInOH+vv/oATC+4tbEIxfH/UAQJyjoTKA7GBA/wERbPL7du4
 S3Iu2j0Sze2ulZmzbSHcJ4utnxfM1bx+Xxljy6yIuOqJ3uXKcy2HCMC8C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399268379"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="399268379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870433711"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.208])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:18 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 1/8] drm/i915: Skip clflush after GPU writes on Meteorlake
Date: Thu, 27 Jul 2023 15:54:57 +0100
Message-Id: <20230727145504.1919316-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
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
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Fei Yang <fei.yang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

On Meteorlake CPU cache will not contain stale data after GPU access since
write-invalidate protocol is used, which means there is no need to flush
before potentially transitioning the buffer to a non-coherent domain.

Use the opportunity to documet the situation on discrete too.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index ffddec1d2a76..57db9c581bf6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -24,9 +24,22 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
+	/*
+	 * Discrete GPUs never dirty the CPU cache.
+	 */
 	if (IS_DGFX(i915))
 		return false;
 
+	/*
+	 * Cache snooping on Meteorlake is using write-invalidate so GPU writes
+	 * never end up in the CPU cache.
+	 *
+	 * QQQ: Do other snooping platforms behave identicaly and could we
+	 *      therefore write this as "if !HAS_LLC(i915) && HAS_SNOOP(i915)"?
+	 */
+	if (IS_METEORLAKE(i915))
+		return false;
+
 	/*
 	 * For objects created by userspace through GEM_CREATE with pat_index
 	 * set by set_pat extension, i915_gem_object_has_cache_level() will
-- 
2.39.2

