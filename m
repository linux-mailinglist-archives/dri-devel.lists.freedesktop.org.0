Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ECCA052E0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 06:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE1E10EB86;
	Wed,  8 Jan 2025 05:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giGYVywO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032910EB82;
 Wed,  8 Jan 2025 05:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736315625; x=1767851625;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Q1i3g6RNBwkp+C5h4or7IS5/PL3ebdEaHpg1Uuogsc0=;
 b=giGYVywO06vjx0NwJ2lESkpnn0OT53427/CUds0a5uOcuamQ4ptkTxNZ
 fAIvS90Uj8U9pJkxZMncjv+FYHNfvoDvSPAFm7rdbC0uVgSJK8CrNXI7H
 HIBgySM8Y5bjmjnkOOB0H8Z+aQhz0uHvEEL175PsUhOMu7pNQv0n4JQgB
 nZSZc8RBdvRY6BvQ8tEhiFS7h3VtFmIQzusxEKY7t+ReqccLpifwIQvzv
 YDfakKyQIoMqGzuKpXwrQ7PiGPWt+4DYe1AbDNqws7KT/3jY+P7yobb0v
 5tpq24EvoXa0Tn+W2prgSr/3lDB7O5oewVy7YjBO3lUtGmh6RMrf3dttN Q==;
X-CSE-ConnectionGUID: tLp95DFPQDKSSWo4FOEBYQ==
X-CSE-MsgGUID: lRpQhSwfR36DwWNDqEbaTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="61903905"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="61903905"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 21:53:44 -0800
X-CSE-ConnectionGUID: UQRwPUlxQJqmCXuG0w6WXg==
X-CSE-MsgGUID: AjT+8Oq9Rdi8uQ9NX+J3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107024152"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 21:53:43 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 08 Jan 2025 11:09:01 +0530
Subject: [PATCH v3 3/5] drm/plane: Function to check async supported
 modifier/format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-asyn-v3-3-f4399635eec9@intel.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-0-f4399635eec9@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Seperate function for async flips is to be called in order to check the
provided format/modifier support.
At present the flag for async flip is stored in crtc_state as async flip
is supported on only one plane for a given crtc. The same is being
used over here to decide the async function pointer.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 4f35eec2b7770fcc90c3e07a9068b31c0563a4c0..9e08ba4318cf0c07fa0701023659986855e0e98a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -238,12 +238,21 @@ int drm_plane_create_format_blob(struct drm_device *dev,
 	mod = modifiers_ptr(blob_data);
 	for (i = 0; i < modifier_count; i++) {
 		for (j = 0; j < format_count; j++) {
-			if (is_async ||
-			    !plane->funcs->format_mod_supported ||
-			    plane->funcs->format_mod_supported(plane,
-							       formats[j],
-							       modifiers[i])) {
-				mod->formats |= 1ULL << j;
+			if (is_async) {
+				if (!plane->funcs->format_mod_supported_async ||
+				    plane->funcs->format_mod_supported_async(plane,
+									     formats[j],
+									     modifiers[i])) {
+					mod->formats |= 1ULL << j;
+				}
+
+			} else {
+				if (!plane->funcs->format_mod_supported ||
+				    plane->funcs->format_mod_supported(plane,
+								       formats[j],
+								       modifiers[i])) {
+					mod->formats |= 1ULL << j;
+				}
 			}
 		}
 
@@ -910,6 +919,7 @@ bool drm_plane_has_format(struct drm_plane *plane,
 			  u32 format, u64 modifier)
 {
 	unsigned int i;
+	bool is_async = plane->crtc->state->async_flip;
 
 	for (i = 0; i < plane->format_count; i++) {
 		if (format == plane->format_types[i])
@@ -918,8 +928,12 @@ bool drm_plane_has_format(struct drm_plane *plane,
 	if (i == plane->format_count)
 		return false;
 
-	if (plane->funcs->format_mod_supported) {
-		if (!plane->funcs->format_mod_supported(plane, format, modifier))
+	if (is_async ? plane->funcs->format_mod_supported_async :
+			plane->funcs->format_mod_supported) {
+		if (!(is_async ? plane->funcs->format_mod_supported_async(
+						plane, format, modifier) :
+					plane->funcs->format_mod_supported(
+						plane, format, modifier)))
 			return false;
 	} else {
 		if (!plane->modifier_count)

-- 
2.25.1

