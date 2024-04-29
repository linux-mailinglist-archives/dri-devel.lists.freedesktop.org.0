Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736ED8B6034
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 19:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A114F10F6BB;
	Mon, 29 Apr 2024 17:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="u0N6tblE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8D310F6BB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 17:35:30 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714412128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=n0mr83jQFnbS/LkT/ppLN9l+vhlOUacudDF+vKeopdw=;
 b=u0N6tblEIt128FzOUGXN46EKaYoLHh9F+OyQOHRxcnKwKywR5h/zwb27HJAQ0TaS0TWucL
 AnBthNT9fyVV73vfCeLLLEWAjbt2+PD8kpQ9hEBbfXIVIPVUCfCh9e4aWxRzrmXGPaBX8A
 A+k7Gcnbf+i3tQtBP4G8KomY946lgLc=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] drm: drm_of.c: Using EXPORT_SYMBOL_GPL instead of
 EXPORT_SYMBOL
Date: Tue, 30 Apr 2024 01:35:21 +0800
Message-Id: <20240429173521.709719-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Linux kernel puts strict limits on which functions and data structures
are available to loadable kernel modules; only those that have been
explicitly exported with EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() are
accessible. In the case of EXPORT_SYMBOL_GPL(), only modules that declare
a GPL-compatible license will be able to see the symbol.

Since the whole drm_of.c file is declared with GPL-2.0-only license, so
let us keep functions in that source file consistently.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/drm_of.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..1ca36d654e61 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -44,7 +44,7 @@ uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_of_crtc_port_mask);
+EXPORT_SYMBOL_GPL(drm_of_crtc_port_mask);
 
 /**
  * drm_of_find_possible_crtcs - find the possible CRTCs for an encoder port
@@ -77,7 +77,7 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 
 	return possible_crtcs;
 }
-EXPORT_SYMBOL(drm_of_find_possible_crtcs);
+EXPORT_SYMBOL_GPL(drm_of_find_possible_crtcs);
 
 /**
  * drm_of_component_match_add - Add a component helper OF node match rule
@@ -181,7 +181,7 @@ int drm_of_component_probe(struct device *dev,
 
 	return component_master_add_with_match(dev, m_ops, match);
 }
-EXPORT_SYMBOL(drm_of_component_probe);
+EXPORT_SYMBOL_GPL(drm_of_component_probe);
 
 /*
  * drm_of_encoder_active_endpoint - return the active encoder endpoint
-- 
2.34.1

