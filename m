Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394B51D53F
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D4510F96C;
	Fri,  6 May 2022 10:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7163810F946;
 Fri,  6 May 2022 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831855; x=1683367855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HgeNDGzi+0QMpiQwoNnEG61MqqkOaM1jTupHUWhlaQ8=;
 b=Ml3i3MfrnOzDRlMEB7YgTNfrwX2A5vNjhY8roevlBvMzLw19EB1zeU1z
 snetAicEVLWtUGEgIYGBL7hitTtH+CP5ck2NAeTep58TQrXit/UBLbY1K
 7sSeyJYh56htl2V1agOHGv1hFyxt8coISnBbugW1U5qS+zSiFACzk44Km
 AI029g4wz0PlY32Pfo+m60fCzc7XFc8FDQyOZdIWGkMRwlmBTjOdAf2yh
 1FiT0RTEpCCgxHEXZm936zeIulGstpMUC9yKGKikJGfVwMzdsc2RYE3K/
 K4fDoIBlVZDLH88FHwgBf2+itp1Lg9Lg67Zbtawp7k4fs4QGhSGnMUnWe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248959289"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248959289"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:10:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="735566981"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:10:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/25] drm/edid: add struct drm_edid container
Date: Fri,  6 May 2022 13:10:10 +0300
Message-Id: <263c5eea832947e740cc73b8bb187b91a3f1b79e.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce new opaque type struct drm_edid to encapsulate the EDID data
and the size allocated for it. The contents will be private to
drm_edid.c.

There are a number of reasons for adding a container around struct edid:

* struct edid is a raw blob pointer to data that usually originates
  outside of the kernel. Its size is contained within the structure.

* There's no way to attach meta information (such as allocated memory
  size) to struct edid.

* Validation of the EDID blob and its size become crucial, and it's
  spread all over the subsystem, with varying levels of accuracy.

* HDMI Forum has introduced an HF-EEODB extension that defines an
  override EDID size within an EDID extension. The size allocated for an
  EDID depends on whether the allocator understands the HF-EEODB
  extension. Given a struct edid *, it's impossible to know how much
  memory was actually allocated for it.

There are also some reasons for making the container type struct
drm_edid opaque and private to drm_edid.c:

* Have only one place for creating and parsing the EDID, to avoid
  duplicating bugs.

* Prepare for reading a pure DisplayID 2.0 from its own DDC address, and
  adding it within the same struct drm_edid container, transparently,
  and for all drivers.

* With the idea that the drm_edid objects are immutable during their
  lifetimes, it will be possible to refcount them and reduce EDID
  copying everywhere (this is left for future work).

Initially, just add the type. In follow-up, we'll start converting the
guts of drm_edid.c to use it, and finally add interfaces around it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index dcef92c8887a..480fd9fbe412 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1567,6 +1567,15 @@ static const struct drm_display_mode edid_4k_modes[] = {
 
 /*** DDC fetch and block validation ***/
 
+/*
+ * The opaque EDID type, internal to drm_edid.c.
+ */
+struct drm_edid {
+	/* Size allocated for edid */
+	size_t size;
+	const struct edid *edid;
+};
+
 static int edid_extension_block_count(const struct edid *edid)
 {
 	return edid->extensions;
-- 
2.30.2

