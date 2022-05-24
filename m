Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6245B532806
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A68710F558;
	Tue, 24 May 2022 10:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687A810F558;
 Tue, 24 May 2022 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388871; x=1684924871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m3JtCU5ZZfSmTvjoFXepJKjGW+Y13lPCL3zJPAOyLJ8=;
 b=aNhDi3MZbyGaWhjPSxzMEyatf4+QqvH5aC8b+NutPbFwaSCns5mNcvgD
 6qAd6VMhtM7ynceAcHXB+DgafxO/ohtv9z7HF1vhkokEIx6QsQnoNYLvC
 SeoCDRuT35XuCuuw0b8x6pPH5TLwv07zVOr7LTYD+9LX8jzR9BtzB7ydm
 tjkIX703TA4VauFQdS2GRXXSRt5QeaJ9yTnvniKtetH9W1qNQ/JYsrSVA
 2HBaKSHglB+0VB1vjWjk4YEQM6h+VxErK8HxbR0ss6PmsL0SiiG4RQZKu
 x1XGJj3TMG2PC5fsU3PM/picK5YnX2zQWGAYYvJn5wHtEho1f30HjSH38 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273607417"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="273607417"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:41:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="676304995"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:41:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 13/13] drm/todo: add entry for converting the subsystem to
 struct drm_edid
Date: Tue, 24 May 2022 13:39:35 +0300
Message-Id: <8b7bf6b190aa8b9463a47006e1308b253139112a.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653381821.git.jani.nikula@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to stop duplicating EDID validation and parsing all over the
subsystem in various broken ways.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/todo.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 513b20ccef1e..982e4e29825f 100644
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
+drm_edid_connector_update(). See drm_helper_probe_get_modes() for reference for
+converting the ->get_modes() hooks.
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

