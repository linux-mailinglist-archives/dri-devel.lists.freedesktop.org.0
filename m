Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2264E4869
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454BC10E562;
	Tue, 22 Mar 2022 21:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2D110E54B;
 Tue, 22 Mar 2022 21:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985266; x=1679521266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLH4uKIwkLXT+EpFRPMNRvpzzJdCpPrGegyk0mmu0fc=;
 b=cs8713D/5yQL9HTtelEpLE0+q3R7SD4ksS9Xd85RwtLqsXIK9oqsgjJC
 2UcQywJbQ5yLZirYXuTKSYLo05usA7ZwPQQvlQxqeDigdgQN4zDpOKtZx
 //D23iWVU5ZknNtqv6gLP1Or995C82eV4rCB6LY5BCRyFJ3qUCQFwmTcz
 MscxgQUxCNfiVjq4D2FdGOSs2wVxO3tHytDp+d5m297cvA35oIhX0Tn4s
 1UZQLj7+EwWfOelRnwVJFx4If27gRtEXwBnJVHJxTgqGIdYTla2qYRuQd
 LL6p7I8ECqqdpaRpOdKdvYZeqiCjcPAMw29ob+awuGL/bw5dsNWp8Ne4B Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="321154929"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="321154929"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="543905276"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 01/19] drm/edid: add drm_edid_extension_block_count() and
 drm_edid_size()
Date: Tue, 22 Mar 2022 23:40:30 +0200
Message-Id: <c492b3887df42fa4166fb65ee10fa611c276cf98.1647985054.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1647985054.git.jani.nikula@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
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

Add abstractions for getting the number of EDID extension blocks and the
total EDID size in bytes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 ++++++++++++++++++
 include/drm/drm_edid.h     |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 561f53831e29..f4b49693e666 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2198,6 +2198,24 @@ struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid_switcheroo);
 
+/**
+ * drm_edid_extension_block_count - get the number of EDID extension blocks
+ */
+u8 drm_edid_extension_block_count(const struct edid *edid)
+{
+	return edid->extensions;
+}
+EXPORT_SYMBOL(drm_edid_extension_block_count);
+
+/**
+ * drm_edid_size - get the EDID size in bytes
+ */
+size_t drm_edid_size(const struct edid *edid)
+{
+	return (drm_edid_extension_block_count(edid) + 1) * EDID_LENGTH;
+}
+EXPORT_SYMBOL(drm_edid_size);
+
 /**
  * drm_edid_duplicate - duplicate an EDID and the extensions
  * @edid: EDID to duplicate
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 144c495b99c4..7a19daa00c0c 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -564,6 +564,8 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
+u8 drm_edid_extension_block_count(const struct edid *edid);
+size_t drm_edid_size(const struct edid *edid);
 struct edid *drm_edid_duplicate(const struct edid *edid);
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
 int drm_add_override_edid_modes(struct drm_connector *connector);
-- 
2.30.2

