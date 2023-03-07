Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E676AE314
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800B910E4D1;
	Tue,  7 Mar 2023 14:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AEF10E4D2;
 Tue,  7 Mar 2023 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678200444; x=1709736444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RTl07B8IGLPgCHnpywvdwU8/wV68ZLNipyhheT0w5eg=;
 b=jkOzO6CJAYx/Gdhy+gQsMlBLdJw7eVg4HERYla+xXnTrf3klztB4oaX4
 KEJjv0qIN4b80jTabK/EhQhAG425Snz2twvF1J4tO7uXM4+czacLUtol/
 bxHPX4MG47HDUrcVOfNPJspDKiWU4Ih5pl7gW4r+T7yfSU+990MGKXZy1
 uy4mkXD7OssaenqCmWy1uMsYZbZ25taAxYtvdikaT22gp3C749/b64A1y
 TAqNmJrpVxfqlGP+hQRr9GQeX92J9Mo8hvNdbZMpg3HAz+4onS2XVCcI+
 VlX1z/2oFYUzFdGFAae591OpCukwfrgnp/qr8LZ3Z0HHdxC9Rd2FFp3R9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400687295"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="400687295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800414409"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="800414409"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.10])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:47:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/ttm: Unexport ttm_global_swapout()
Date: Tue,  7 Mar 2023 15:46:18 +0100
Message-Id: <20230307144621.10748-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unexport ttm_global_swapout() since it is not used outside of TTM.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index ae2f19dc9f81..64a59f46f6c3 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -137,7 +137,6 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
 	mutex_unlock(&ttm_global_mutex);
 	return ret;
 }
-EXPORT_SYMBOL(ttm_global_swapout);
 
 int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		       gfp_t gfp_flags)
-- 
2.39.2

