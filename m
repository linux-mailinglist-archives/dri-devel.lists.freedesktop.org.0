Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92007870C6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 15:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CD810E556;
	Thu, 24 Aug 2023 13:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6105610E55F;
 Thu, 24 Aug 2023 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692884796; x=1724420796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P0O6G2/CrFNJpKPpSGKj5tREVyfb3wwBr12VCvepkEQ=;
 b=IdQJ/zrJ1JInk9kOWgHExrzNYH4D5H+7giqehxr2qUjnMhnbnHEOyfnn
 d1jTTNOgI8Hvso5mqAHo4cIKJ+mhUx0zjsuCmH83Ac2H+QF9e7Fk5M4hx
 nPnbQPMYsVUIvaQ/KmpcINsP0xkvmMbzLVTt3FjPcJmfifVIjwfrNNmlS
 7kUtGH8OzIPHI2RBCy0Y7eKbR7jcDhGOcAKuO82+3XxLZg2s0d7SSv63X
 7DrVn/rqH6H44P8NlNN6xtUO2ZXFc3g6mV0thwEzITaRaCWNCaaMwhmjL
 BY1vrktPrGDax+7G+jLU7c5PDY5SLbbaId4B6VWs7hV/SDiCOz+pf4Xxr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354773272"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="354773272"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="983706495"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="983706495"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/cec: add drm_dp_cec_attach() as the non-edid version
 of set edid
Date: Thu, 24 Aug 2023 16:46:05 +0300
Message-Id: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692884619.git.jani.nikula@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Connectors have source physical address available in display
info. There's no need to parse the EDID again for this. Add
drm_dp_cec_attach() to do this.

Seems like the set_edid/unset_edid naming is a bit specific now that
there's no need to pass the EDID at all, so aim for attach/detach going
forward.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_cec.c | 22 +++++++++++++++++++---
 include/drm/display/drm_dp_helper.h  |  6 ++++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index ae39dc794190..da7a7d357446 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -297,7 +297,7 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
  * were unchanged and just update the CEC physical address. Otherwise
  * unregister the old CEC adapter and create a new one.
  */
-void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
+void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address)
 {
 	struct drm_connector *connector = aux->cec.connector;
 	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
@@ -339,7 +339,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 		if (aux->cec.adap->capabilities == cec_caps &&
 		    aux->cec.adap->available_log_addrs == num_las) {
 			/* Unchanged, so just set the phys addr */
-			cec_s_phys_addr_from_edid(aux->cec.adap, edid);
+			cec_s_phys_addr(adap, source_physical_address, false);
 			goto unlock;
 		}
 		/*
@@ -370,11 +370,27 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 		 * from drm_dp_cec_register_connector() edid == NULL, so in
 		 * that case the phys addr is just invalidated.
 		 */
-		cec_s_phys_addr_from_edid(aux->cec.adap, edid);
+		cec_s_phys_addr(adap, source_physical_address, false);
 	}
 unlock:
 	mutex_unlock(&aux->cec.lock);
 }
+EXPORT_SYMBOL(drm_dp_cec_attach);
+
+/*
+ * Note: Prefer calling drm_dp_cec_attach() with
+ * connector->display_info.source_physical_address if possible.
+ */
+void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
+{
+	u16 source_physical_address = CEC_PHYS_ADDR_INVALID;
+
+	if (edid && edid->extensions)
+		pa = cec_get_edid_phys_addr((const u8 *)edid,
+					    EDID_LENGTH * (edid->extensions + 1), NULL);
+
+	drm_dp_cec_attach(aux, source_physical_address);
+}
 EXPORT_SYMBOL(drm_dp_cec_set_edid);
 
 /*
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 86f24a759268..3369104e2d25 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -699,6 +699,7 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux);
 void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
 				   struct drm_connector *connector);
 void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
+void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address);
 void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
 void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
 #else
@@ -716,6 +717,11 @@ static inline void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
 {
 }
 
+static inline void drm_dp_cec_attach(struct drm_dp_aux *aux,
+				     u16 source_physical_address)
+{
+}
+
 static inline void drm_dp_cec_set_edid(struct drm_dp_aux *aux,
 				       const struct edid *edid)
 {
-- 
2.39.2

