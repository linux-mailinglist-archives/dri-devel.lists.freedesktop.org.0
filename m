Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C37BFAFE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25AC10E33C;
	Tue, 10 Oct 2023 12:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8875C10E33C;
 Tue, 10 Oct 2023 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696940203; x=1728476203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4b290UuADYzo8HimFx6+MUFP60YFM6y6WoHDK+i2AvE=;
 b=Z+wHlrz/ypoVJFqd3zfJ3mQ7bmOA0eTK6NlIUdp7f9TpEZaw8FjoQ/l9
 FsC3F89rX+gvWkpLYM2lN3riR+3meZn2UE1Z3t38Q67w99CxdBzLb0BIx
 rUwMwsboNHop3U1fzdFHfuMNWT4UexApB62eIx1VqcDVEo+z9h8fXIcP1
 N+RsHo6cm+/yhnb+flcNRYtBzQNYDp7qcQFXI3rpmx4b+y6mm5EEZhUqx
 ZsiQ9bTy91coql7OT9sfDTFy63u1FS1qu35TQcWmCjdJA4E6yet+gCyVC
 74Iwy+4n3dqmS4cUl5oODed/G+eGiZZDgWMR69QBDLmt3fe/ENsDNqXBW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470641536"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="470641536"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="753384989"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="753384989"
Received: from ppalanyk-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.148.82])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:16:34 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND v2 1/2] drm/print: Add drm_dbg_ratelimited
Date: Tue, 10 Oct 2023 14:15:44 +0200
Message-Id: <20231010121545.1046793-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
References: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
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
index a93a387f8a1a..ad77ac4b6808 100644
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
2.40.1

