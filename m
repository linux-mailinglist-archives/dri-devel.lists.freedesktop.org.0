Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C814F9B8C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 19:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC13D10E7C1;
	Fri,  8 Apr 2022 17:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80D210E7C1;
 Fri,  8 Apr 2022 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649438543; x=1680974543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4MDbH8qtQ/mP4eOelUvBnbrDjsnZnvaNl7IVgWbJHAc=;
 b=VhroSOASmsh2duDFpAhBxGY/HIPkAK3JcRkWFYEhEqITrTIwRlHeubBZ
 6UsJ5nxmmf1pM1yeUDVVVvsT72Ef9tGIQTg51ZQ4ZGT8UexWT9r0igq1D
 0gZiVhUGpqlTr6IxI9omm0eBFyzRYy83akBxkC8a+YIpG1eAcCbgq9wIm
 D7sVQNT7bwzkFBSCg0dDt09DKTNkRd405NnXZDVIhUelmH6n8LJVex1Ju
 jjqli6id2epKfLQciH7mZ3KfbApkd7wX4nRvbPgqRd10TwME7sV6nC3dY
 +55o96fi09qcQY6YBrfTNcF6Wztoly8pdAKM6brac+fGa5tOCBsUsLjpj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="241583352"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="241583352"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 10:21:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="525458389"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 10:21:56 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/dp: Factor out a function to probe a DPCD address
Date: Fri,  8 Apr 2022 20:21:53 +0300
Message-Id: <20220408172154.807900-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor out from drm_dp_dpcd_read() a function to probe a DPCD address
with a 1-byte read access. This will be needed by the next patch doing a
read from an LTTPR address, which must happen without the preceding
wake-up read in drm_dp_dpcd_read().

v2: Add a probe function instead of exporting drm_dp_dpcd_access(). (Jani)

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/dp/drm_dp.c    | 28 +++++++++++++++++++++++++---
 include/drm/dp/drm_dp_helper.h |  1 +
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
index 580016a1b9eb7..b58e30132768d 100644
--- a/drivers/gpu/drm/dp/drm_dp.c
+++ b/drivers/gpu/drm/dp/drm_dp.c
@@ -527,6 +527,29 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
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
+	return ret < 0 ? ret : 0;
+}
+EXPORT_SYMBOL(drm_dp_dpcd_probe);
+
 /**
  * drm_dp_dpcd_read() - read a series of bytes from the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
@@ -559,9 +582,8 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_DPCD_REV,
-					 buffer, 1);
-		if (ret != 1)
+		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
+		if (ret < 0)
 			goto out;
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

