Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C5554593
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4B610EB8B;
	Wed, 22 Jun 2022 11:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439C210E28A;
 Wed, 22 Jun 2022 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895626; x=1687431626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qmjoXBya/xuRKVcpsmrxxAGjY4QwcSSNUNsZtHLH6vA=;
 b=hmrPRBvQUN15HbnWz0HgNR/3BC1JD3F5VTHHHWESmFV51nZf2TeamXDc
 qqpEGyPRitZoBxgT9homUQUB9uOJcisFB/JMWCUzbwJY9l0q355Ie8kmW
 ovNLPAGj42OVuKnLw+zGtQxIbSdu7Z9Jr+mNy89TzBai0MRmMsQMQbCaw
 aoqTdHE9DL58pfI//gUZGCuYy4PsC2ghAzf7hLvbD9keqCtfqAncJs3fs
 WaIVHFGaAoyQTemSaKQXBkYx0je1v0rQaELnGrk2vxkr6ndu9emolbGHD
 2KaPEIh3aY3koLV3aCZFRCEjWRerw1pr7UcWGsDdoqD4T0kI2TVSzItRA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281461392"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281461392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="585674335"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/13] drm/todo: add entry for converting the subsystem to
 struct drm_edid
Date: Wed, 22 Jun 2022 13:59:27 +0300
Message-Id: <9084dafccd1eff483dca6636e1a2a9c3d72034f9.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to stop duplicating EDID validation and parsing all over the
subsystem in various broken ways.

v2: Update to reflect drm_connector_helper_get_modes()

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/todo.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 513b20ccef1e..04ef31e3405f 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -480,6 +480,31 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
+Convert core and drivers from struct edid to struct drm_edid
+------------------------------------------------------------
+
+Go through all drivers and drm core KMS code to convert all raw struct edid
+usage to the opaque struct drm_edid. See commit e4ccf9a777d3 ("drm/edid: add
+struct drm_edid container") for rationale.
+
+Convert drm_get_edid() and drm_do_get_edid() usage to drm_edid_read(),
+drm_edid_read_ddc(), or drm_edid_read_custom().
+
+Convert drm_add_edid_modes() and drm_connector_update_edid_property() to
+drm_edid_connector_update(). See drm_connector_helper_get_modes() for reference
+for converting the ->get_modes() hooks.
+
+Convert decentralized, direct struct edid parsing to centralized parsing in
+drm_edid.c. Prefer one-time parsing as part of drm_edid_connector_update() and
+storing the result in drm_connector->display_info over adding individual,
+exported parser functions.
+
+During the transition period, it may be necessary to use drm_edid_raw(), but do
+use it sparingly. Eventually, all of them need to go.
+
+Contact: Jani Nikula <jani.nikula@intel.com>
+
+Level: Intermediate
 
 Core refactorings
 =================
-- 
2.30.2

