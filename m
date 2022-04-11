Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293754FBCFF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6E210E2D0;
	Mon, 11 Apr 2022 13:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650E610E3D6;
 Mon, 11 Apr 2022 13:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649683544; x=1681219544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=llxrA//BTM9nivqVRxdZEuenNFhdfez0LUACrQiAV+0=;
 b=BCMyCEcGthCcdisbdT7iT+oDIF8bq6OrRLi+U2es9+Ua5EEgnmHdq1Pu
 zw2OAxLvsD04Ebk0jvJ6vnGMG+6E4rKI0oZ6DY+0A8TpjDG10faVqBmVO
 ZG7y99eHqPsZBSbwmc6JZZGmZzQdnBT4f7TS1bPIlnVWCDt7d4TLfZM31
 2XxKcBW1ftpWJ46Br/4TXenhuvTyXyvsz8BDvFHkSaMc85efTJrFki7XH
 XmmjIhzKxc3NRQlHU9Pf6D36Q2VKgq3/BccyhbCQmD5zWyDNQovYXPbRD
 SnFsNTGdDxOBk/ieZcSrH8ALhQwW8Z1MAjSjUV5JYWt4I6fH/q3plhX0z w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261552585"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="261552585"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:25:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="507109882"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:25:42 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/dp: Factor out a function to probe a DPCD address
Date: Mon, 11 Apr 2022 16:25:39 +0300
Message-Id: <20220411132539.984647-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408172154.807900-1-imre.deak@intel.com>
References: <20220408172154.807900-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor out from drm_dp_dpcd_read() a function to probe a DPCD address
with a 1-byte read access. This will be needed by the next patch doing a
read from an LTTPR address, which must happen without the preceding
wake-up read in drm_dp_dpcd_read().

While at it add tracing for the 1 byte read even if the read was
successful.

v2: Add a probe function instead of exporting drm_dp_dpcd_access(). (Jani)
v3: Add tracing for the 1-byte read even if the read was successful. (Khaled)

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/dp/drm_dp.c    | 33 ++++++++++++++++++++++++++++-----
 include/drm/dp/drm_dp_helper.h |  1 +
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index 580016a1b9eb7..2a1f5ff6633cc 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -527,6 +527,31 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
 	return ret;
 }
 
+/**
+ * drm_dp_dpcd_probe() - probe a given DPCD address with a 1-byte read access
+ * @aux: DisplayPort AUX channel (SST)
+ * @offset: address of the register to probe
+ *
+ * Probe the provided DPCD address by reading 1 byte from it. The function can
+ * be used to trigger some side-effect the read access has, like waking up the
+ * sink, without the need for the read-out value.
+ *
+ * Returns 0 if the read access suceeded, or a negative error code on failure.
+ */
+int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
+{
+	u8 buffer;
+	int ret;
+
+	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1);
+	WARN_ON(ret == 0);
+
+	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, ret);
+
+	return ret < 0 ? ret : 0;
+}
+EXPORT_SYMBOL(drm_dp_dpcd_probe);
+
 /**
  * drm_dp_dpcd_read() - read a series of bytes from the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
@@ -559,10 +584,9 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_DPCD_REV,
-					 buffer, 1);
-		if (ret != 1)
-			goto out;
+		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
+		if (ret < 0)
+			return ret;
 	}
 
 	if (aux->is_remote)
@@ -571,7 +595,6 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset,
 					 buffer, size);
 
-out:
 	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, buffer, ret);
 	return ret;
 }
diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index 1eccd97419436..91af98e6617c6 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -2053,6 +2053,7 @@ struct drm_dp_aux {
 	bool is_remote;
 };
 
+int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
 ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 			 void *buffer, size_t size);
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
-- 
2.30.2

