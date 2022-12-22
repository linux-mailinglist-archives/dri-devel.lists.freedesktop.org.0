Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB3654889
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E29210E5BB;
	Thu, 22 Dec 2022 22:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F5410E5A3;
 Thu, 22 Dec 2022 22:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748122; x=1703284122;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+3OIgtfqf/OzkI9uIOy3C0/QaoKcrHuJ8pzvQ1rDVII=;
 b=GPjW7aLbuqJ3/WscG6fCMqBbK3g8djbbCcdF5RaQqRas+cvidEgLdngp
 u5eusKnqUZ+nHGYDYv8QEseY5zXkt/JtSU+vuJVSWi9NrHeIgHPSirgTZ
 OBpeYtQHvU9rWq0n99lXCkuzBjjbvl+XWyXJKz1jPMEJf8oy5kUPehFfR
 xXU6QG61HC2uPgCaAuwrrkIyq3hgzAoeCP6kaeeQ/uAAUCzgp6SGedTCS
 IkDf2swFVGjKbSMmKU1zKw8NzelhoHqmGDfjU7ba9suGqdPLRcFYcDikW
 d4Nd1XB61vz099SLMiRGDDh2alSk2GWEC7axHqq5i4xAqTk8vx/kd7kSD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472868"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472868"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412337"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412337"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 20/20] mei/hdcp: Also enable for XE
Date: Thu, 22 Dec 2022 14:21:27 -0800
Message-Id: <20221222222127.34560-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Xe, is a new driver for Intel GPUs that supports both integrated
and discrete platforms starting with Tiger Lake. Let's ensure
mei/hdcp can accept xe instead of i915 whenever that is in use.

Cc: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/misc/mei/hdcp/Kconfig    | 2 +-
 drivers/misc/mei/hdcp/mei_hdcp.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index 54e1c9526909..2ac9148988d4 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_HDCP
 	tristate "Intel HDCP2.2 services of ME Interface"
 	select INTEL_MEI_ME
-	depends on DRM_I915
+	depends on DRM_I915 || DRM_XE
 	help
 	  MEI Support for HDCP2.2 Services on Intel platforms.
 
diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index e889a8bd7ac8..699dfc4a0a57 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -784,7 +784,8 @@ static int mei_hdcp_component_match(struct device *dev, int subcomponent,
 {
 	struct device *base = data;
 
-	if (!dev->driver || strcmp(dev->driver->name, "i915") ||
+	if (!dev->driver ||
+	    (strcmp(dev->driver->name, "i915") && strcmp(dev->driver->name, "xe")) ||
 	    subcomponent != I915_COMPONENT_HDCP)
 		return 0;
 
-- 
2.37.3

