Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8C4E32CB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE04910E4AA;
	Mon, 21 Mar 2022 22:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1DD10E4A8;
 Mon, 21 Mar 2022 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902679; x=1679438679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LCKPvL6ljYOdfrQiWKbAsqmZxKIfDulvrlaCugD/4X8=;
 b=kr8CR4tVWEsSmI99RNqUp32bIsiDoChcHNibzE3Wpee/YhqF61C7z54a
 anpXcJrimAQl/4PCWB3ajdmNBwS/9sXi78H4wMwf939pIkdTQKwoJ2R4T
 ydREcKNPcwupCrAHTp3E90g48OyAd6dIVSqq+EOU4Iilyz162XvXsv+Tk
 VQhnd5RJIM4aodX0I6qwZpZHduGA9E4GTkKyUmlvPg/uzlSzjgC2+czOS
 50iR4z+YFdZGU/TOYh/X8AMACZWZ0TpNR2ozeFG9GDU5ANeLFAwB8HLa8
 FnTTfv/VUoixMuX4KLq6RlPuyDSdZTBX/J3JSYccUvgz9woyCDvgbuRTG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257613706"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="257613706"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="543414234"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:44:37 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 6/9] drm/i915/gt: offset handling for multiple copy engines
Date: Tue, 22 Mar 2022 04:14:56 +0530
Message-Id: <20220321224459.12223-7-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220321224459.12223-1-ramalingam.c@intel.com>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle the src and dst chunk offsets for different instances of the copy
engines.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 39a5f8ae664d..5f6341f91622 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -614,6 +614,9 @@ static int emit_copy(struct i915_request *rq,
 	u32 instance = rq->engine->instance;
 	u32 *cs;
 
+	src_offset += (u64)rq->engine->instance << 32;
+	dst_offset += (u64)rq->engine->instance << 32;
+
 	cs = intel_ring_begin(rq, ver >= 8 ? 10 : 6);
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
-- 
2.20.1

