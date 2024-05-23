Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944218CD7B3
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 17:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BA410E95A;
	Thu, 23 May 2024 15:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyRs39AQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D88F10E941;
 Thu, 23 May 2024 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716479487; x=1748015487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LWxOpwsQKaJr2wkzuXxKCrV6aG4OKNoCsg0wjE3wLWw=;
 b=VyRs39AQlmEpVfxx7D+T/PPrZnI3+g9VGYT9ec5fPXcZTPybbYutJHE6
 klxO/H9W592m+jZeWUsRT1FUG+oMW9z+i2oPA+7mLR6x3jrN8r7XFrSyM
 YYL8XuvnewDGnkJXIOUy+RcOtVapV86vnn5337C8CQxjCqLDVQ4qWaOEU
 Y2L4zsvdjzuczotBnzMaTmfoaZE1np2BSnYjzCyqUJJiIB7aBIWTQgXCm
 eZEEU7wCdBY9/HT0ExaLDEDTzFsxdqe3Hnr+gGr5XQ05w5Erjf8D9CXl0
 YoHLsovOjK5ZaiA4OQ0f+ZRgGt0Qxuf5NQ7R8CInzEsPDcqX9C00S7bHY Q==;
X-CSE-ConnectionGUID: 4dBmi3qaSgmKF7otBgjmUQ==
X-CSE-MsgGUID: yNYIPyuUR6WMcDtN1xt2nQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16644266"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="16644266"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:51:27 -0700
X-CSE-ConnectionGUID: 1zN68PPiQrS29sCHwNf1+Q==
X-CSE-MsgGUID: Zr6Hen4NSbeQqED/WtlVTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="34324920"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:51:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 2/4] drm/nouveau: fix -Wformat-truncation warning in
 nouveau_backlight_init()
Date: Thu, 23 May 2024 18:51:07 +0300
Message-Id: <de3297edb7f22cfc0654ee15aa0f774fbe607133.1716479340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716479340.git.jani.nikula@intel.com>
References: <cover.1716479340.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enabling -Wformat-truncation yields the following warning:

../drivers/gpu/drm/nouveau/nouveau_backlight.c: In function ‘nouveau_backlight_init’:
../drivers/gpu/drm/nouveau/nouveau_backlight.c:56:69: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Werror=format-truncation=]
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                                                                     ^~
In function ‘nouveau_get_backlight_name’,
    inlined from ‘nouveau_backlight_init’ at ../drivers/gpu/drm/nouveau/nouveau_backlight.c:351:7:
../drivers/gpu/drm/nouveau/nouveau_backlight.c:56:56: note: directive argument in the range [1, 2147483647]
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                                                        ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/nouveau/nouveau_backlight.c:56:17: note: ‘snprintf’ output between 14 and 23 bytes into a destination of size 15
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Silence the warning by checking the snprintf() return value.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d47442125fa1..1d77a5f280c5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -49,13 +49,18 @@ nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
 			   struct nouveau_backlight *bl)
 {
 	const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
+	int ret;
 
 	if (nb < 0)
 		return false;
 	if (nb > 0)
-		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
+		ret = snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
 	else
-		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
+		ret = snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
+
+	if (ret >= BL_NAME_SIZE)
+		return false;
+
 	bl->id = nb;
 	return true;
 }
-- 
2.39.2

