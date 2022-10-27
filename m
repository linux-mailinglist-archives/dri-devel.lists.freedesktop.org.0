Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773C610577
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 00:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D52010E727;
	Thu, 27 Oct 2022 22:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9871410E381;
 Thu, 27 Oct 2022 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666908807; x=1698444807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/7k5EAV6jB6qZMVAulIHh3vE+4BwyUrOYXjqjHcWcHI=;
 b=fjRausAQC4xL+CHqZ1khV5wkw+DQxZeS02WB/ewSlGpWzcfcPyGHjPus
 Ys6bCANa5hOBIE5Gi6FepPFZK/J4rThX4FCqIQe2vqzS2360OOgWsXvX3
 24RvPgTXbg40M+EuXAYCR1HNPJ9MaWkNQERVrXCf1FRZaDGTrTq0GEJML
 rc8y3hs29AOwzbXhsdFxD2O57gIfqUX7XOSwND6Mp/M5OxZytfNDC5JEy
 xvKCcGF5dujhfytai5U5VJMgVewZz4BaOP2r7ohSmjFxa8IwQ/flIOSxN
 gOijEM00xrIAEAHTSSNV4Rdr4KkHhMgqPc0MJxn5jl4ZkJbZCTkAVCfuK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="295763453"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="295763453"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="610528971"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="610528971"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 15:13:26 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/mtl: don't expose GSC command streamer to the
 user
Date: Thu, 27 Oct 2022 15:15:54 -0700
Message-Id: <20221027221554.2638087-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no userspace user for this CS yet, we only need it for internal
kernel ops (e.g. HuC, PXP), so don't expose it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 79312b734690..ca795daca116 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -211,6 +211,10 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		if (intel_gt_has_unrecoverable_error(engine->gt))
 			continue; /* ignore incomplete engines */
 
+		/* don't expose GSC engine to user */
+		if (engine->class == OTHER_CLASS)
+			continue;
+
 		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
 		engine->uabi_class = uabi_classes[engine->class];
 
-- 
2.37.3

