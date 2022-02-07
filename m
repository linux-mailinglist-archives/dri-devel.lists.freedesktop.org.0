Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF61C4AC987
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD3E10F902;
	Mon,  7 Feb 2022 19:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4926F10F546;
 Mon,  7 Feb 2022 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644262142; x=1675798142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZDgo5a2W+IftFE05o3OeNksso7rCdA4fJIqnyCbuQFw=;
 b=c+H8zv841pCA++aaGBhwVmWEImYI3VabdjKHy+zDeWbFmuiJTfgsfUXm
 VDFayPQgsQQS/sUkwQcHxYS6grpcGm06MxfeHy9t+/36QRJ3LJ6cho1/R
 Ho8W2z2PSNkvvyzpb2ymPxR+YJZreD46QvnkzG26xYnJ2CNq6TEUcLX1L
 DnsdryiSc+zmeh3mLcDy8uOZNPs59gQXf76NnIIVlsYCg69Jijtccf+lf
 V4Qfp9KtUjCV/1cPS2fU9ScdIdKywiLf5+jK9k/TDzHPNoyZSo7UGN+G4
 jLYAqYDOzOoKPhIViSYx6TJ9yi38QteYZWKYbvdhxN5AHtaNFzHeHCONq w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248556263"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="248556263"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 11:29:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="621659702"
Received: from normanma-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.85.164])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 11:29:00 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/i915/guc: Verify hwconfig blob matches supported
 format
Date: Mon,  7 Feb 2022 11:28:54 -0800
Message-Id: <20220207192854.862959-5-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207192854.862959-1-jordan.l.justen@intel.com>
References: <20220207192854.862959-1-jordan.l.justen@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index ce6088f112d4..695ef7a8f519 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -71,6 +71,26 @@ static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
 	return 0;
 }
 
+static int verify_hwconfig_blob(const struct intel_guc_hwconfig *hwconfig)
+{
+	if (hwconfig->size % 4 != 0 || hwconfig->ptr == NULL)
+		return -EINVAL;
+
+	struct drm_i915_query_hwconfig_blob_item *pos = hwconfig->ptr;
+	u32 remaining = (hwconfig->size / 4);
+	while (remaining > 0) {
+		if (remaining < 2)
+			return -EINVAL;
+		if (pos->length > remaining - 2)
+			return -EINVAL;
+		remaining -= 2 + pos->length;
+		pos = (void *)&pos->data[pos->length];
+	}
+
+	DRM_INFO("hwconfig blob format appears valid\n");
+	return 0;
+}
+
 static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
 {
 	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
@@ -91,6 +111,12 @@ static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
 	if (ret >= 0)
 		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
 
+	if (verify_hwconfig_blob(hwconfig)) {
+		DRM_ERROR("Ignoring invalid hwconfig blob received from "
+			  "GuC!\n");
+		return -EINVAL;
+	}
+
 	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
 
 	return ret;
-- 
2.34.1

