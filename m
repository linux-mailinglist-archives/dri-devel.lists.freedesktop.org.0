Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6918CFD58
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF50D10EE07;
	Mon, 27 May 2024 09:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjPVcqnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD1710F9DC;
 Mon, 27 May 2024 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716803017; x=1748339017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kX/sBp/2yGju2wTUjHprdWNQAUXdkMNFUKH9WEbbo14=;
 b=kjPVcqnmOMPrqzgbCXWGaPPOf2pzswVGs2vZmsZiBNK57ya1hQkUc3AH
 o5qE0L+X54ZM5TFHM+F8kIt8dlKmb0aPS50o0SaVyHue6lngTI8y52bh7
 ot9+TwDtW6NwcPTQjN2XfMZw5oGg73GH5LQhDsWuTNuHrkdnLPBKUwbm1
 oA1bVjxvfN7fTXS6OcO288zNfZMe6VN0kzpJLhiUL/hjQtOHDyw+Ia6cC
 ZwjWsqmts+Wxm3ms/rZv2R0NUdH6l6b8Vnf2Jks3mvefysf8Mk3WvY9JM
 LQtGJHCygfwAa1OTrxc7cse6HGyOA0xZ0zsSe7AwGmpi3KjGbJf9Dk3SJ Q==;
X-CSE-ConnectionGUID: 3K5mzBIQRXyECEPvhXhDkA==
X-CSE-MsgGUID: PDlTKCs/Say0DNLNCN3DUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="30622011"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="30622011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:43:37 -0700
X-CSE-ConnectionGUID: BU8w17P/RTOaD3mKYYsjRg==
X-CSE-MsgGUID: ltom8v50RYuZpBF6zoHqSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="35187640"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.200])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:43:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 2/2] drm: use mem_is_zero() instead of !memchr_inv(s, 0, n)
Date: Mon, 27 May 2024 12:43:20 +0300
Message-Id: <20240527094320.2653177-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527094320.2653177-1-jani.nikula@intel.com>
References: <20240527094320.2653177-1-jani.nikula@intel.com>
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

Cc: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c        | 2 +-
 drivers/gpu/drm/drm_edid.c                           | 2 +-
 drivers/gpu/drm/i915/display/intel_dp.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c        | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
 drivers/gpu/drm/imagination/pvr_device.h             | 2 +-
 drivers/gpu/drm/udl/udl_edid.c                       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 516eb3968e26..7d847021ddc9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2432,7 +2432,7 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
 		goto out_fail;
 	}
 
-	if (memchr_inv(guid, 0, 16) == NULL) {
+	if (mem_is_zero(guid, 16)) {
 		tmp64 = get_jiffies_64();
 		memcpy(&guid[0], &tmp64, sizeof(u64));
 		memcpy(&guid[8], &tmp64, sizeof(u64));
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 7f8e1cfbe19d..3d3097422235 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2697,7 +2697,7 @@ static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
 {
 	u64 salt;
 
-	if (memchr_inv(guid, 0, 16))
+	if (!mem_is_zero(guid, 16))
 		return true;
 
 	salt = get_jiffies_64();
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f68a41eeb1fa..9970c22f616b 100644
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
index c0a3b6d50681..be3685e115ab 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5055,7 +5055,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 			ack[3] |= DP_TUNNELING_IRQ;
 		}
 
-		if (!memchr_inv(ack, 0, sizeof(ack)))
+		if (mem_is_zero(ack, sizeof(ack)))
 			break;
 
 		if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 68bd5101ec89..293c4d920cf9 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -1117,7 +1117,7 @@ const struct drm_edid *intel_opregion_get_edid(struct intel_connector *intel_con
 
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

