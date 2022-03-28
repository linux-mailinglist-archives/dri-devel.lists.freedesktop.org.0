Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188A4E9F70
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 21:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A4610EC6E;
	Mon, 28 Mar 2022 19:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BA010EC83;
 Mon, 28 Mar 2022 19:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648494429; x=1680030429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aV72eiNbFQojrgOHXlBFcVVE5yGUs4sDzt209QLZecA=;
 b=S7Cg/Q6IFZ1UUy4Vz43dRC22p8Oj11xx11/Ytn0X68fwTiXTbxe8eaKi
 7gNyj/kjrQzvW8vQ/9tg0oJLOrEsB6FC1tBOCykbuqeFPOjK1l9oeV8j3
 83Ju+bVIwsgtBB+QgSRouz4zR/kvXoaF4Mju+LqcekKkiAgL5Q+7tu1my
 m7dLEW40Jk8S+kZ3Fz/CTEwkb51Tc5/MPxW17WiS2HRsQeonM8ADoUDfO
 ej3SzcG8Vx+yfj2Iw3uW57BKOv5TkX1rMgCMcJzJwu141hcMDgE93Auf0
 cv7Au07axpXNX4J2wBQuFUuryEDgjt8pqFB5FkEUd7CbT01vsR7FyMA5U g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239678698"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="239678698"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563921008"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 12:07:07 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 5/9] drm/i915/selftest_migrate: Consider the possible
 roundup of size
Date: Tue, 29 Mar 2022 00:37:32 +0530
Message-Id: <20220328190736.19697-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220328190736.19697-1-ramalingam.c@intel.com>
References: <20220328190736.19697-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consider the possible round up happened at obj size alignment to
min_page_size during the obj allocation.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index c9c4f391c5cc..b5da8b8cd039 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -152,6 +152,9 @@ static int clear(struct intel_migrate *migrate,
 	if (IS_ERR(obj))
 		return 0;
 
+	/* Consider the rounded up memory too */
+	sz = obj->base.size;
+
 	for_i915_gem_ww(&ww, err, true) {
 		err = i915_gem_object_lock(obj, &ww);
 		if (err)
-- 
2.20.1

