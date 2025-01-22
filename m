Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCAA1942E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F2010E716;
	Wed, 22 Jan 2025 14:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQ88OaMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BBC10E704;
 Wed, 22 Jan 2025 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737556906; x=1769092906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rWYl9o5mm8UNIWhQMZc2/vOLUXsBfEDE9VfAJiUlIQk=;
 b=WQ88OaMtrlMYvU7WEmw6su0i++ICrjjX+Ivae1QBnSSIWmtO3kehefnc
 2NDbGkww1gER2jlZsc4x/rHxbk5bCT5x5wctntJJ8rhm5kO+iEdeoGFD5
 GIcuQl+38mf7PEyhb4g3Tr5ej74jEcG9DQBzM881XbwmAPcXTgjM9C8CE
 /p9guCT5kFzE3LAuv1igOm+b/C14QgF0vIv80buC6u+GQA85/qREzXwhn
 oXeMhyNTnJPe9AwoyfzohUP7gKMUvfrm7fN0XScNOh/IR+/aslOzBNkBQ
 wqkx+tqvkJp2i1jpbtHdQDr/J/ZHqn/bdTZVIsLp2UmiK90BKkuS50jLH Q==;
X-CSE-ConnectionGUID: xWFNS0aaQ9WCrtKROn15bQ==
X-CSE-MsgGUID: vri/Ykt8Qw6CRjtlMu6FqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="60484654"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="60484654"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:41:46 -0800
X-CSE-ConnectionGUID: i420t5HoTNmI41giacccsA==
X-CSE-MsgGUID: 9M8kAXPsTJ+pBV3HvudNdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107087720"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:41:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 simona.vetter@ffwll.ch, jani.nikula@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/client: include types.h to make drm_client_event.h
 self-contained
Date: Wed, 22 Jan 2025 16:41:33 +0200
Message-Id: <6c69cb005cc3a2b968b6c9675d0ba03173f6c574.1737556766.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1737556766.git.jani.nikula@intel.com>
References: <cover.1737556766.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

drm_client_event.h uses bool without types.h, include it.

Fixes: bf17766f1083 ("drm/client: Move suspend/resume into DRM client callbacks")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_client_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
index 99863554b055..1d544d3a3228 100644
--- a/include/drm/drm_client_event.h
+++ b/include/drm/drm_client_event.h
@@ -3,6 +3,8 @@
 #ifndef _DRM_CLIENT_EVENT_H_
 #define _DRM_CLIENT_EVENT_H_
 
+#include <linux/types.h>
+
 struct drm_device;
 
 #if defined(CONFIG_DRM_CLIENT)
-- 
2.39.5

