Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E96D0A17
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D141710EEF5;
	Thu, 30 Mar 2023 15:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741C810EEDD;
 Thu, 30 Mar 2023 15:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190875; x=1711726875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1bWoPoWQaCVN0/mOsD5PrsT3h4bTLxrhMvfS/tk12Lc=;
 b=m/t7COWcDoPyzqtRO4o+qfskk5F3rAvMVdKlNgtlOcjifLD3IvPrqgRO
 OyQrh0Elt5TnpV/kftq5oTP8P7Y2/c+Dfv9VDMvXR4Q9lfZdJSKHIl44/
 QZpFtwgbu5wKqxc8QQRUl69Iu+Y2ZrweofSjbJwsYu0AeqeZc51URCJU2
 yyouhXGlqUmoSKYShJ3V4ylxJ87yZ1C/RRchvQrpcF/NXEHs7p8v0m3o9
 fn7iePKYndqtSwo6KRLK0xrCYZDWI5Cs86gXr2eJzN0usEz9Yqh/Vi05L
 8njgD8wwGMDAE50qHdETZKInaLQabqePUF9QCwJhKA+ZG9S/LPQyKbH2p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406196752"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="406196752"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662068080"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="662068080"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/12] drm/connector: update edid_blob_ptr documentation
Date: Thu, 30 Mar 2023 18:39:49 +0300
Message-Id: <187a36d3274f2e33e7a57143d59382528f2730d9.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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

Accessing the EDID via edid_blob_ptr causes chicken-and-egg
problems. Keep edid_blob_ptr as the userspace interface that should be
updated via dedicated functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_connector.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c8be6a343589..56ecfcbe2ae2 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1551,8 +1551,12 @@ struct drm_connector {
 
 	/**
 	 * @edid_blob_ptr: DRM property containing EDID if present. Protected by
-	 * &drm_mode_config.mutex. This should be updated only by calling
+	 * &drm_mode_config.mutex.
+	 *
+	 * This should be updated only by calling drm_edid_connector_update() or
 	 * drm_connector_update_edid_property().
+	 *
+	 * This should not be used by drivers directly.
 	 */
 	struct drm_property_blob *edid_blob_ptr;
 
-- 
2.39.2

