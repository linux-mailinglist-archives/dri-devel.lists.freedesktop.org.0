Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81358375AF0
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7A6EDE5;
	Thu,  6 May 2021 18:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215066ED29;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: r1TYn1NBtMC66ufoxPCWEi4mJvraVLtEfo08GC2cwLa9hG55MzXEzr7KPdFZHvICUcogsD6l3g
 cMDPzfCfkpaA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531024"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531024"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: C0muQx2u5mE4RfXYRw8//pXuug2WQKsokfiBRogev6qasR7IUQJLCdzpKadlhMiOyyfzUgze5z
 XbDHdE/CnNJQ==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583553"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 62/97] drm/i915/guc: Disable bonding extension with GuC
 submission
Date: Thu,  6 May 2021 12:14:16 -0700
Message-Id: <20210506191451.77768-63-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the bonding extension to return -ENODEV when using GuC submission
as this extension fundamentally will not work with the GuC submission
interface.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index e6bc5c666f93..bb827bb99250 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1675,6 +1675,11 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
 	}
 	virtual = set->engines->engines[idx]->engine;
 
+	if (intel_engine_uses_guc(virtual)) {
+		DRM_DEBUG("bonding extension not supported with GuC submission");
+		return -ENODEV;
+	}
+
 	err = check_user_mbz(&ext->flags);
 	if (err)
 		return err;
-- 
2.28.0

