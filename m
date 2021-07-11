Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D623C3B19
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 09:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794186EB84;
	Sun, 11 Jul 2021 07:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432FE6EB89;
 Sun, 11 Jul 2021 05:50:14 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id l18so13077886iow.4;
 Sat, 10 Jul 2021 22:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUO2MpmIkpz5hk5OMfz1zDgFEamJA/bkKepVVtTsO3Y=;
 b=T4Bint3avKEjdVQFJ7H5Ua1fzhlTvfSMpuzlZmEEZG33uATVnS2zsOLqCj6E5OlDg4
 w/NzUJn/Vv+xBQ8mf38wNDPJw1cZpG28KjosfLSogp9v83s90/WTtKrWB+f8s0K4XGi7
 iwgJkE00khPeZIogUHxqCPws98ajYDOmesx1i7a1SoqhQbab1WNvUZ8BugX5QfGleDkU
 +fUNcdCKrZZPbll2ijV05C8/qpQbb/y1x2gv54G8KoKm72GKEFWL0HkCoU8HMs8qzfb0
 fKxdXpm7Vrqiush5gOvoo1WUiLTL6149BinTO35ID1N5E1mACgqGaZG4oV04NCjHOmep
 adTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUO2MpmIkpz5hk5OMfz1zDgFEamJA/bkKepVVtTsO3Y=;
 b=krDdrXm9b97A2WQ8ZQGQGyn4bEvZbgzsGQFHA2M+uXa5eqEw46tfBdu4xmAkWo0NDy
 /omLFQenmQ88xMu6TtZAVMlvVrVKd2vFijTWg6rXm0rOsGNUNNoUSR2jwl1IwFbIZHlB
 27O6c9UDLOFRVhMe+MM3d1k7WaZA3lScdFSXRYhGofx+AJACx1BpvsppT/qzCWXQIdWn
 dW2jgCo2Djlolai6/PErsSf2VLnkf1W0ezyR2qAb/2R3RDjYFLE/nNiDNS91XGP2kKIS
 IkRa8YPCp/A+7tdgwkEwJFV7OD7KsdShW1puqiJyGFJI0FJS54FpGJ/lVMo/wf/feZ5C
 T7og==
X-Gm-Message-State: AOAM530wWw4BmzWi/QASv2AjQ6h07NTzoho2gNQ7BimuKvlN2AWYJd/K
 kSiNo8a5zHcvY/st1odp89Y=
X-Google-Smtp-Source: ABdhPJxPNSdXW2SdBDXeauqnEm3MMvu9wOMXaZZkOzhx/qrun+yLXndZvq+sF/ai7j76OQxBZYcDXA==
X-Received: by 2002:a5d:8511:: with SMTP id q17mr35667488ion.98.1625982613674; 
 Sat, 10 Jul 2021 22:50:13 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x8sm5852400ilq.63.2021.07.10.22.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 22:50:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH v2 1/4] drm_print.h: rewrap __DRM_DEFINE_DBG_RATELIMITED
 macro
Date: Sat, 10 Jul 2021 23:49:59 -0600
Message-Id: <20210711055003.528167-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711055003.528167-1-jim.cromie@gmail.com>
References: <20210711055003.528167-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Jul 2021 07:52:04 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

whitespace only, to diff-minimize a later commit.
no functional changes
---
 include/drm/drm_print.h | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9b66be54dd16..6419b4e7c5dc 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -524,19 +524,24 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG_DP(fmt, ...)						\
 	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
 
-#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
-({												\
-	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
-	const struct drm_device *drm_ = (drm);							\
-												\
-	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
-		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
+#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)		\
+({									\
+	static DEFINE_RATELIMIT_STATE(rs_,				\
+				      DEFAULT_RATELIMIT_INTERVAL,	\
+				      DEFAULT_RATELIMIT_BURST);		\
+	const struct drm_device *drm_ = (drm);				\
+									\
+	if (drm_debug_enabled(DRM_UT_ ## category)			\
+	    && __ratelimit(&rs_))					\
+		drm_dev_printk(drm_ ? drm_->dev : NULL,			\
+			       KERN_DEBUG, fmt, ## __VA_ARGS__);	\
 })
 
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
 	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
 
-#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
+#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) \
+	drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
 
 /*
  * struct drm_device based WARNs
-- 
2.31.1

