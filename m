Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024294AC986
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBFA10F4D0;
	Mon,  7 Feb 2022 19:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055E010F4D0;
 Mon,  7 Feb 2022 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644262141; x=1675798141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9yWUVUyz9UOxMkhp/w/qzVhNI3aYGlTvAACbuDaHtfk=;
 b=e61k8j9c0+eeTR8VIyeOHTf2/EhkrJLq8Dn3mMYXuEX3YnK24ge2cko7
 epu/F607zMZ4QFYIiI6xrjGcvp0cKUTQKlCglJKMhthalPflHSRloHdr5
 5j1M4ym4XDyxS6+NkeVd/zwhxcvcIgL6ShPBu6gwDAd/FnOOg0HpkSak/
 8RsK5nygSbcdtkxXpFQGlr70R+TfbDpG6hou92Xv79O+nbpa4gjLpm1mu
 tywZ3o3ofoWtSQVDbGVJbyjIWeG0fgdC6fyYoQrw48cbWAn7c05c+TrNe
 Ozlv5wLJQ+4SmO8uTkGvQyAIA8uRbV5OH5SssbtKTHCikOyFF6NVEyP8a w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="246382465"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="246382465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 11:29:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="700578773"
Received: from normanma-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.85.164])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 11:28:59 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
Date: Mon,  7 Feb 2022 11:28:53 -0800
Message-Id: <20220207192854.862959-4-jordan.l.justen@intel.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also, document DRM_I915_QUERY_HWCONFIG_BLOB with this struct.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
---
 include/uapi/drm/i915_drm.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 069d2fadfbd9..38b8c11e91f0 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3276,6 +3276,30 @@ struct drm_i915_gem_create_ext_protected_content {
 	__u32 flags;
 };
 
+/**
+ * DOC: GuC HWCONFIG blob uAPI
+ *
+ * The GuC produces a blob with information about the current device.
+ * i915 reads this blob from GuC and makes it available via this uAPI.
+ *
+ * The returned blob is an array of items described by struct
+ * drm_i915_query_hwconfig_blob_item. The
+ * drm_i915_query_hwconfig_blob_item length field gives the length of
+ * the drm_i915_query_hwconfig_blob_item data[] array for the item.
+ *
+ * The length of the query data returned by
+ * DRM_I915_QUERY_HWCONFIG_BLOB will align with the end at the final
+ * drm_i915_query_hwconfig_blob_item entry.
+ *
+ * The meaning of the key field and the data values are documented in
+ * the Programmer's Reference Manual.
+ */
+struct drm_i915_query_hwconfig_blob_item {
+	u32 key;
+	u32 length;
+	u32 data[];
+};
+
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
-- 
2.34.1

