Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1D787110
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1800C10E55B;
	Thu, 24 Aug 2023 14:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D058E10E559;
 Thu, 24 Aug 2023 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692886050; x=1724422050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iu/suKih6SvO7K41LZZhTb67gFMYH9kGQGspb4lizg4=;
 b=Y+4iHHC04un8r/6oHGM6FYHPhs0I1N5tSvP3AP5CDoaisTiCQUN/3QRS
 uHIjqt0APbbuxSDAV0/sGvi8rTBPRHgaqv8qORVQ7erFQZJkwPtexGF00
 xZRRuKeEqTd0W42WK7Fq2Lkq0SQoPpqYsj0jUB5jthV3LgsBzQCWlHARf
 YsA7XIJcuYLqG0kPa9FYeszA+ddSqazG/U1fkCm4dsE+0dRyRmE6IWGLa
 ps9UuFo9iwtwWxE7iW5RdHovqG/jJrRqT2m6NdvG5qLJjdDMXz1APvn/z
 i00vthvvj9BJCpe1eWRMNLnqzroyH17iVojMJuMbYSYrZwRxIQJGM2j4L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364633911"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364633911"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766545261"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="766545261"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 06:46:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] media: cec: core: add note about *_from_edid() function
 usage in drm
Date: Thu, 24 Aug 2023 16:46:07 +0300
Message-Id: <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
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

In the drm subsystem, the source physical address is, in most cases,
available without having to parse the EDID again. Add notes about
preferring to use the pre-parsed address instead.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/media/cec/core/cec-adap.c     | 4 ++++
 drivers/media/cec/core/cec-notifier.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 241b1621b197..2c627ed611ed 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1688,6 +1688,10 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 }
 EXPORT_SYMBOL_GPL(cec_s_phys_addr);
 
+/*
+ * Note: In the drm subsystem, prefer calling cec_s_phys_addr() with
+ * connector->display_info.source_physical_address if possible.
+ */
 void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
 			       const struct edid *edid)
 {
diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 389dc664b211..13f043b3025b 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -195,6 +195,10 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
 
+/*
+ * Note: In the drm subsystem, prefer calling cec_notifier_set_phys_addr() with
+ * connector->display_info.source_physical_address if possible.
+ */
 void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 					  const struct edid *edid)
 {
-- 
2.39.2

