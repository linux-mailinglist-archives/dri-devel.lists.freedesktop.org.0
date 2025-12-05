Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A77CA75EC
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7D010EACA;
	Fri,  5 Dec 2025 11:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ffq4RXvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7DA10EAC6;
 Fri,  5 Dec 2025 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934077; x=1796470077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAnaoZd0t6Tx6aoGsWwn+BYiPd3L85S/8P4PLaKHreg=;
 b=Ffq4RXvnW18T+98+UVTDdRwi12/22E4akfJjEzRPuqFWxXCUU0YnUNKE
 BAiwnH7AeIRrrrWcbM+NAoidFJW4cF3EjrGEJQlJ4A9Ipxoi6ypbEFO2F
 U2uLjZZnau0IrYnf2c36D2APTosUXnKu5IRLPhPX8n6LAa4dbRR0Pljz/
 AVrlSUvtIzf63QCmeC4Wd/qOlI3miHZh34kbuLud8dPmvGWdkXed4msVl
 Iy/IdOjLWkjU64zMq8I3DhfE/yhETqxaoCGs9b38e9u3yXaQ0f+2nYC33
 9lNQEVz/tlPEaz5+qFJwsMEd6nNwnEEhCl8AGsTulqp7kO86QajELz8Ex w==;
X-CSE-ConnectionGUID: aAXsRGowReW3iuUVw/ETGg==
X-CSE-MsgGUID: dxNzCsoDTpuKNKlQMpvOiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65968423"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="65968423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:27:56 -0800
X-CSE-ConnectionGUID: s+crzjk6SXmkZj9+lxibXg==
X-CSE-MsgGUID: +HxeKP6/SEOgs6wMeSL6PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="232650307"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:27:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 01/25] drm/vblank: Unexport drm_wait_one_vblank()
Date: Fri,  5 Dec 2025 13:27:17 +0200
Message-ID: <9560c0002dc00f396bd610b8b6385edab7110a58.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Thomas Zimmermann <tzimmermann@suse.de>

Make drm_wait_on_vblank() static. The function is an internal interface
and not invoked directly by drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 14 +-------------
 include/drm/drm_vblank.h     |  1 -
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 32d013c5c8fc..c15d6d9d0082 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1286,18 +1286,7 @@ void drm_crtc_vblank_put(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
-/**
- * drm_wait_one_vblank - wait for one vblank
- * @dev: DRM device
- * @pipe: CRTC index
- *
- * This waits for one vblank to pass on @pipe, using the irq driver interfaces.
- * It is a failure to call this when the vblank irq for @pipe is disabled, e.g.
- * due to lack of driver support or because the crtc is off.
- *
- * This is the legacy version of drm_crtc_wait_one_vblank().
- */
-void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
+static void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	int ret;
@@ -1321,7 +1310,6 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 
 	drm_vblank_put(dev, pipe);
 }
-EXPORT_SYMBOL(drm_wait_one_vblank);
 
 /**
  * drm_crtc_wait_one_vblank - wait for one vblank
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index ffa564d79638..94ee09b48895 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -302,7 +302,6 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
 int drm_crtc_vblank_get(struct drm_crtc *crtc);
 void drm_crtc_vblank_put(struct drm_crtc *crtc);
-void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);
 void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
 void drm_crtc_vblank_off(struct drm_crtc *crtc);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc);
-- 
2.47.3

