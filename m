Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E94750FD0D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1ED10E464;
	Tue, 26 Apr 2022 12:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7FD10E464
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650976281; x=1682512281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e4th8uJasSx6KPyjfEQUYIDA242GShSGpYteX8kiMr0=;
 b=Z67nyVGKs4oGYybI2ouvwxl/fyHc3GOAay+VqP4IIYPvOZKzX7HPOVCR
 BEhhIhkVHq2Q6F5iTQPKzt3yRheMWMSOM7lRWZfX8H2//C5UxkkiHU5EJ
 eyikWajQeusJEAwaO344xm+ksevNjzZNTbAWf1KLJvWrfZ6Bh3uylguv7
 XW+a6h3sxakWT53z6xd49XgzK9t4Mc2hOCPAL36E8UpK9WCoSlOXLqRf0
 FJhKWXyjnBpFRLT7LP+FXMjXLTWE6VI+SCKpwh6MHSFe92wBBDcOmfTb0
 nT8xXClTEd22wrch+9ebrobKD5jVpWZ1CWsfWEHzkricqRvyqVcLOlCKr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="263154680"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="263154680"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:31:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="558287619"
Received: from pbasx-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.32.62])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 05:31:19 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Use luminance range from static hdr metadata
Date: Tue, 26 Apr 2022 15:30:44 +0300
Message-Id: <20220426123044.320415-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426123044.320415-1-jouni.hogander@intel.com>
References: <20220426123044.320415-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of using fixed 0 - 512 range use
drm_luminance_range_from_static_hdr_metadata to obtain panel range. If
that fails fall back to static 0 - 512.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index fb6cf30ee628..6673af455808 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -293,8 +293,13 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 		}
 	}
 
-	panel->backlight.max = 512;
-	panel->backlight.min = 0;
+	if (!drm_luminance_range_from_static_hdr_metadata(&connector->base,
+							  &panel->backlight.min,
+							  &panel->backlight.max)) {
+		drm_err(&i915->drm, "No backlight range data in static hdr metadata, using fixed 0,512\n");
+		panel->backlight.max = 512;
+		panel->backlight.min = 0;
+	}
 	panel->backlight.level = intel_dp_aux_hdr_get_backlight(connector, pipe);
 	panel->backlight.enabled = panel->backlight.level != 0;
 
-- 
2.25.1

