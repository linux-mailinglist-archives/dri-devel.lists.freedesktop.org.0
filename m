Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9581C108
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D48A10E71C;
	Thu, 21 Dec 2023 22:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804E810E716;
 Thu, 21 Dec 2023 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703197694; x=1734733694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XmD6xMGWVeq1qWnVvU1CNrzCFsAIQn1lcBHypKh9pHI=;
 b=Io5IcS7barAWzd3bLWiSBLldVxYzY4mAWtXUTgeUcBbnz0CkKH4zD/er
 uW4nDaXylrr18zC3eR19TyyiRMgb5wBX/vxO2lyFq/d45S4YuwYp8kSwq
 lqnkxmWDRdl/QjF6jfIw9XnmsKBZBwPd+qLroL8wejD66Jla/rGY0eibt
 UCq8zdSy11++WhW6WuR9ARO+cgeNceuEk5EZs25UjHGkKFTrFa0yOygcy
 l9Emh8lYnuHEfXla7WS0o8RSLLo1pLXppwNPUatjO21dujxTATSDYh87Z
 s+DUPQj6SEcOKM2m6CTUU/DLXQRAWlxrpEEEsQeQCA3g9SEm8M95XFbLv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2876519"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2876519"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920458213"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920458213"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 14:28:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/6] drm/xe: Use _ULL for u64 division
Date: Thu, 21 Dec 2023 14:28:05 -0800
Message-Id: <20231221222809.4123220-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221222809.4123220-1-lucas.demarchi@intel.com>
References: <20231221222809.4123220-1-lucas.demarchi@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 ogabbay@kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DIV_ROUND_UP_ULL() so it also works on 32bit build.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86867d42d532..3f0dcf54277b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -620,7 +620,7 @@ void xe_device_wmb(struct xe_device *xe)
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
 	return xe_device_has_flat_ccs(xe) ?
-		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
+		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
 bool xe_device_mem_access_ongoing(struct xe_device *xe)
-- 
2.40.1

