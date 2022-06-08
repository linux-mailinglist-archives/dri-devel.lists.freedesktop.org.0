Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B1542880
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD8D10EF6E;
	Wed,  8 Jun 2022 07:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E91310EF41;
 Wed,  8 Jun 2022 07:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674715; x=1686210715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qmjoXBya/xuRKVcpsmrxxAGjY4QwcSSNUNsZtHLH6vA=;
 b=Pg7+dmXkDzuKX7R1h4Jpro7vNpWT691mD76Qrmr1Z+uXfJK+7OSX1nRO
 rMF28AgT/yIM0717gxST16I4eiHWe2OqEosSB3dlh6Brnkz+0znDgzyDE
 ihNVWvb+73kexR3g7de1e/rh6tPsCSORaY/EuHXMYZ8RMkVrG/TODISIh
 JGMk4Forb3EftGAmRqlj+eEZ6C/IISoSMn2cFWjiFlLUYepb28Olm09yc
 cooy+1D/wrQ8lKKCRl+actk8NmVh46J4JPyDL4VSgICCFYcj2enBJTaDi
 voU5ATvQGrZFE7JvQU/MNQQDBMYADX1As28SlVgUCB32iUQ+AaQGVn//4 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="256634434"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="256634434"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="826808327"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/15] drm/todo: add entry for converting the subsystem to
 struct drm_edid
Date: Wed,  8 Jun 2022 10:50:45 +0300
Message-Id: <c6b45097910d806c25c346ecbe9894cab58f9956.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
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

