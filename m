Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC78376333
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 12:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E1A6E03B;
	Fri,  7 May 2021 09:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA9B6E03B;
 Fri,  7 May 2021 09:59:57 +0000 (UTC)
IronPort-SDR: b3cUPqwOs3Gm6v4WrXDW2Ew0NbTxW0MffnvLNdkPj1ytzwIMrMYUsD0Lh4QQRWSZKGoq/q/1TM
 Z4ftXFVf2f+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185824697"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="185824697"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 02:59:56 -0700
IronPort-SDR: YosjoQJuKwsE0kuenBfnyQ4Cr3gXYkBMUJWcC3k0Nldeh74PG9v/iXRXiPlWCX3h3xp1eUpYts
 kscCrWMja7dQ==
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="434842132"
Received: from flydon-mobl2.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.20.229])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 02:59:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/stolen: shuffle around init_memory_region
Date: Fri,  7 May 2021 10:59:48 +0100
Message-Id: <20210507095948.384230-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We generally want to first call i915_gem_object_init_memory_region()
before calling into get_pages(), since this sets up various bits of
state which might be needed there. Currently for stolen this doesn't
matter much, but it might in the future, and at the very least this
makes things consistent with the other backends.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 293f640faa0a..b5553fc3ac4d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -657,9 +657,11 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 	if (WARN_ON(!i915_gem_object_trylock(obj)))
 		return -EBUSY;
 
+	i915_gem_object_init_memory_region(obj, mem);
+
 	err = i915_gem_object_pin_pages(obj);
-	if (!err)
-		i915_gem_object_init_memory_region(obj, mem);
+	if (err)
+		i915_gem_object_release_memory_region(obj);
 	i915_gem_object_unlock(obj);
 
 	return err;
-- 
2.26.3

