Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA5807A27
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 22:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2653F10E7A9;
	Wed,  6 Dec 2023 21:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C62910E0C2;
 Wed,  6 Dec 2023 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701897009; x=1733433009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S8DzasmKalhH9QoxINouAITQkW99a3IA1JGy7jft/VM=;
 b=itcu/raTYj18iyBtlvlc+dp8eenP1JuGLamuclPVLi5xlHOz1VJQM6aP
 YknbWttaUHhleCe43qGcXHQaoR78HyYwYWMvOxXRjKONUYjbJ3k2Hih3P
 XGkWgxpxqRMcO8zcs9HC8imBcjbHVqeaEyZaSZoyJwGKaQXN6fc0G4o6d
 0thETPA8w28zTcqQ0gFR1DYZS/cnjTAWG9pQQ4oaFiv8sKpcK48BK//Dw
 RPUAxibyqaTOacjbGUvWwfNGIJPaF54xU1rwYzMscoQqzxXdzl6Sly+Ic
 87NJFj6CPh3IcBT3lCIAsdkNP5dd+Ngn4tJLPNEuYtu8FgR/205GdnG8o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396917248"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="396917248"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:10:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="894879945"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="894879945"
Received: from karthik-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:10:05 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND AGAIN v2 1/2] drm/print: Add drm_dbg_ratelimited
Date: Wed,  6 Dec 2023 22:09:47 +0100
Message-ID: <20231206210948.106238-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206210948.106238-1-andi.shyti@linux.intel.com>
References: <20231206210948.106238-1-andi.shyti@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nirmoy Das <nirmoy.das@intel.com>

Add a function for ratelimitted debug print.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 include/drm/drm_print.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index dd4883df876a..5ed26a702e3e 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -602,6 +602,9 @@ void __drm_err(const char *format, ...);
 		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
 })
 
+#define drm_dbg_ratelimited(drm, fmt, ...) \
+	__DRM_DEFINE_DBG_RATELIMITED(DRIVER, drm, fmt, ## __VA_ARGS__)
+
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
 	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
 
-- 
2.43.0

