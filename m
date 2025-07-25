Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5447FB1179E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41B910E431;
	Fri, 25 Jul 2025 05:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpCNF0iU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED1610E429;
 Fri, 25 Jul 2025 05:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419875; x=1784955875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M3N0CDFzCKUsX/6w9zEYNW3WpSQgmejBbI955Tg7R7M=;
 b=SpCNF0iUcW72+4BycL9Y77H+JbDQBU1gKG+6NivkyPBYUQo4gGHoXIOc
 Q7raUqvv93fWom6VWvGky1SfXtXHUYEr7Wp6pWqhLWt7ROer1dWPCowUb
 2zVAdsJTfXXkIMuqepb6aw6+0zedHjBJZKvCWXlRGZlnht1eLrNpdZqJF
 Q2DFauvGo6QmQUP5pYy7gL6pvCtg2tGnsxfOLd6dH3q2HebutqfRtl+Rj
 5qFcYnxGjTGIz6/oHFicMG5h4nCVnGiERAAkMaf8R5fyVs+tYKwNymTui
 ak8beebfcYi7lTytR79hmL+RWZ1VVSOTQWpQfT38njRxNLAzBcw8xy4Nf A==;
X-CSE-ConnectionGUID: V/ZPXQm2RdG/9AAkGpzZcA==
X-CSE-MsgGUID: BZrDpqd2Su+XfYpnxZp4qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299529"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299529"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:35 -0700
X-CSE-ConnectionGUID: bmNxmsCWTa2LNWTrYbOd/w==
X-CSE-MsgGUID: ie47XDyMRzeqYge4RcoYMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956586"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:33 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 08/28] drm/i915/writeback: Define the
 get_connector_from_writeback hook
Date: Fri, 25 Jul 2025 10:33:49 +0530
Message-Id: <20250725050409.2687242-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Define the get_connector_from_writeback hook to get the drm_connector
from drm_writeback_connector.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 1ff078a191df..02f4910d7797 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -43,6 +43,13 @@ static struct intel_writeback_connector
 			    connector);
 }
 
+static struct intel_writeback_connector
+*to_intel_writeback_connector(struct drm_writeback_connector *wb_conn)
+{
+	return container_of(wb_conn, struct intel_writeback_connector,
+			    base);
+}
+
 static int intel_writeback_connector_init(struct intel_connector *connector)
 {
 	struct intel_digital_connector_state *conn_state;
@@ -77,6 +84,15 @@ intel_get_writeback_connector(struct drm_connector *connector)
 	return &wb_conn->base;
 }
 
+static struct drm_connector *
+intel_get_connector_from_writeback(struct drm_writeback_connector *connector)
+{
+	struct intel_writeback_connector *wb_conn =
+		to_intel_writeback_connector(connector);
+
+	return &wb_conn->connector.base;
+}
+
 static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -92,6 +108,7 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
 };
 
 static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_funcs = {
+	.get_connector_from_writeback = intel_get_connector_from_writeback,
 };
 
 int intel_writeback_init(struct intel_display *display)
-- 
2.34.1

