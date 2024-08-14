Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1BC951828
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 12:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BD010E25D;
	Wed, 14 Aug 2024 10:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2cpNHXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E399510E25A;
 Wed, 14 Aug 2024 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723629656; x=1755165656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fbyDemeCEd+Wj+VZzePbEzVldroXXA4In/tCe5qY8c8=;
 b=M2cpNHXMfyXR6TfnOH2OZ0IC40gJrIird4uXrgeatSi3Pk9ydq3HsEsQ
 54xg51dMgTytovRLpYdyI7bddoD1uLAYV/B4OnVHpWHnKvexsL8euzWeH
 o91oKSglDShnrqGy5ucMvwqn26adTB73nRyKwv7Wx3DiLulOaaJ1G8vIX
 QLlj82JdvYHP6C/LSKxxAxadPeDCt8SuYPLB4GASnACwIshbjdOvsGP4s
 faxp7Q8ppKYtNr+QFvjUWsH60fdurlKEXCuFtUDcPS7anVmzpHVx7kckM
 XvkKpxSeF3Wxft0ACDHGCoXMI2lHcCFKFUMQDINDB0tLWxDIcQefqVmT1 w==;
X-CSE-ConnectionGUID: BzSUUCpjRWaRDDPV0gEWPQ==
X-CSE-MsgGUID: zuAiKFdJRVqMzdMuNjMztw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21993262"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="21993262"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 03:00:55 -0700
X-CSE-ConnectionGUID: 8wCEPYKcTne7qDTJ/5n0aw==
X-CSE-MsgGUID: EQvajPwfSFCxcj/HMqie0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="63831566"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 03:00:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v2 2/2] drm: use mem_is_zero() instead of !memchr_inv(s, 0, n)
Date: Wed, 14 Aug 2024 13:00:35 +0300
Message-Id: <20240814100035.3100852-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240814100035.3100852-1-jani.nikula@intel.com>
References: <20240814100035.3100852-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Use the mem_is_zero() helper where possible.

Conversion done using cocci:

| @@
| expression PTR;
| expression SIZE;
| @@
|
|   <...
| (
| - memchr_inv(PTR, 0, SIZE) == NULL
| + mem_is_zero(PTR, SIZE)
| |
| - !memchr_inv(PTR, 0, SIZE)
| + mem_is_zero(PTR, SIZE)
| |
| - memchr_inv(PTR, 0, SIZE)
| + !mem_is_zero(PTR, SIZE)
| )
|   ...>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

v2: Exclude GUID conversions, which are covered in [1].

[1] https://lore.kernel.org/r/20240812122312.1567046-1-jani.nikula@intel.com

Cc: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>
---
 drivers/gpu/drm/drm_edid.c                           | 2 +-
 drivers/gpu/drm/i915/display/intel_dp.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c        | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
 drivers/gpu/drm/imagination/pvr_device.h             | 2 +-
 drivers/gpu/drm/udl/udl_edid.c                       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ff1e47a9c83e..855beafb76ff 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1817,7 +1817,7 @@ static int edid_block_tag(const void *_block)
 
 static bool edid_block_is_zero(const void *edid)
 {
-	return !memchr_inv(edid, 0, EDID_LENGTH);
+	return mem_is_zero(edid, EDID_LENGTH);
 }
 
 static bool drm_edid_eq(const struct drm_edid *drm_edid,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 977f149551f6..6a0c7ae654f4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5184,7 +5184,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 			ack[3] |= DP_TUNNELING_IRQ;
 		}
 
-		if (!memchr_inv(ack, 0, sizeof(ack)))
+		if (mem_is_zero(ack, sizeof(ack)))
 			break;
 
 		if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index dfa1d9f30d33..ff11836459de 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -1117,7 +1117,7 @@ const struct drm_edid *intel_opregion_get_edid(struct intel_connector *connector
 
 	/* Validity corresponds to number of 128-byte blocks */
 	len = (opregion->asle_ext->phed & ASLE_PHED_EDID_VALID_MASK) * 128;
-	if (!len || !memchr_inv(edid, 0, len))
+	if (!len || mem_is_zero(edid, len))
 		return NULL;
 
 	drm_edid = drm_edid_alloc(edid, len);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 3527b8f446fe..2fda549dd82d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -506,7 +506,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 		goto out;
 	}
 
-	if (memchr_inv(ptr, 0, dmabuf->size)) {
+	if (!mem_is_zero(ptr, dmabuf->size)) {
 		pr_err("Exported object not initialised to zero!\n");
 		err = -EINVAL;
 		goto out;
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ecdd5767d8ef..b574e23d484b 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -668,7 +668,7 @@ pvr_ioctl_union_padding_check(void *instance, size_t union_offset,
 	void *padding_start = ((u8 *)instance) + union_offset + member_size;
 	size_t padding_size = union_size - member_size;
 
-	return !memchr_inv(padding_start, 0, padding_size);
+	return mem_is_zero(padding_start, padding_size);
 }
 
 /**
diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
index d67e6bf1f2ae..12f48ae17073 100644
--- a/drivers/gpu/drm/udl/udl_edid.c
+++ b/drivers/gpu/drm/udl/udl_edid.c
@@ -69,7 +69,7 @@ bool udl_probe_edid(struct udl_device *udl)
 	 * The adapter sends all-zeros if no monitor has been
 	 * connected. We consider anything else a connection.
 	 */
-	return !!memchr_inv(hdr, 0, sizeof(hdr));
+	return !mem_is_zero(hdr, sizeof(hdr));
 }
 
 const struct drm_edid *udl_edid_read(struct drm_connector *connector)
-- 
2.39.2

