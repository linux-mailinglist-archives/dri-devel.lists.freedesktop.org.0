Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED8B117B1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0327210E9AB;
	Fri, 25 Jul 2025 05:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmcZfTa8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C3F10E44C;
 Fri, 25 Jul 2025 05:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419895; x=1784955895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8hQxuTq8u2KBTpoeR8w9f+P98xGCHlDOmtK+ktnOh2c=;
 b=dmcZfTa8aobrFcSjmIoXOJq4Q1ErhpSnVgJFSeDh2FUpxO/mjxg9qZy7
 FKjqKonjn8zHBtUzfF8ZQPRPhDgyLBPulyjQJaw1dMc5orZrFNcU5k3Xv
 VdxD1paxT9ztU2H6BVxyT35UJPXzkSj4NB/TGodg8Q0rHjiDKYFsUWEWS
 gfsNBKJT4SLHEdKgxueCj6Krwj5viNBnsFxUDyj99EJ6CvkRT0Aolbh8V
 17JUCrmNCQs18FrK9fMJkOAmFSVo0THE82v8rniuNlFRTDBWp1hJ6Nnkm
 kMlPYcXbK7+Qke6Mp9lhXWjSwhVQ9iUhfARKCEfRkp+RZdy996COBLW+Q w==;
X-CSE-ConnectionGUID: ROx8bxBfTkWbe/JP/D0h+A==
X-CSE-MsgGUID: jSKk6Xt7T2mJcoM7V7bkUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299551"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299551"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:55 -0700
X-CSE-ConnectionGUID: EmO4vIc5TmKhgJ2syXEMwQ==
X-CSE-MsgGUID: 2H4LNfD3T42TAL9JATYYnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956643"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 17/28] drm/i915/writeback: Define function to destroy
 writeback connector
Date: Fri, 25 Jul 2025 10:33:58 +0530
Message-Id: <20250725050409.2687242-18-suraj.kandpal@intel.com>
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

Define function to destroy the drm_writbeack_connector and
drm_connector associated with it.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index def33191a89e..9b2432d86d35 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -180,6 +180,12 @@ intel_writeback_detect(struct drm_connector *connector,
 	return connector_status_connected;
 }
 
+static void intel_writeback_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_cleanup(connector);
+	kfree(connector);
+}
+
 static struct drm_writeback_connector *
 intel_get_writeback_connector(struct drm_connector *connector)
 {
@@ -208,6 +214,7 @@ const struct drm_connector_funcs conn_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.destroy = intel_writeback_connector_destroy,
 };
 
 static const struct drm_connector_helper_funcs conn_helper_funcs = {
-- 
2.34.1

