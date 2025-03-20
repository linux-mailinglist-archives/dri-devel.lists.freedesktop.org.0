Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40840A6ADB8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B7F10E6D5;
	Thu, 20 Mar 2025 18:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SrLNERo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F19710E6A3;
 Thu, 20 Mar 2025 18:53:55 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-85b58d26336so94051939f.2; 
 Thu, 20 Mar 2025 11:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496834; x=1743101634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9QKot+Tk4Bgkz5Rby7fJAPuBANHR0qgjbLES/Oc8d8=;
 b=SrLNERo0TBqPWk2SHy8KlshKIvwmbjf0OmVRgha6HukpQwYUiNL1FcDuqtlDQtufHU
 hs6ehLY3jXpdDV/SH2s68MFH6Vmel5mn5isMaJ3TgugEWn1accWF8kZPr6+NLXXErnQJ
 a5hXH6ILVzJ2MO1N1IiHplEp6mbwW/P+cdx0lof+AElc/66opW4jWa91hrIhcS0Ch6GR
 Zgt7ZcGZ1ehcoba3SP8MOoEKa9MZ7qEsZygxif2dBFoqSYWS2IOZj5SmivbBRBj+HxuJ
 PiCR6Zn4zOtYn+8iNUdnJLCOVcI5Ju/F4252qiHmghqEC3msfkiCu2gVbQpLyXViUunk
 p9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496834; x=1743101634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9QKot+Tk4Bgkz5Rby7fJAPuBANHR0qgjbLES/Oc8d8=;
 b=ojtrgK6/YTigcV6+sHGgv2BnMCC8z7OTzxkV03XzaJXdc9hzdXoEpun7SXnhlCd5pq
 rMme4qt3d3Wdomwp/Q4UslobN+Uy67041U4A9qSfcZg6kBt56E410WGaHAHq5ZXyUfAf
 V8iiJnH+NA187WRVTCqRPaFZAqx4VE2NB7fEDAO7YUlVeLJX9AKwivaHZsLUJizAsIv3
 2SC4a9GnKMFplMy5qDAuD6FwWmzd7FmiRZXZd9QHZG/ndSceT6OI3ItNP3ccDcpN7YNQ
 LlXAnTREgpprGG39y4r7gSZPn9Mg51OccAVMZVRj+Xv7GV5/TLd0Z9a2zxlpmv3cKsyk
 2rDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeLXKUb1oqPjBYasAxm74buFr7NUENk3dNXGnsgy1jBctLWPpDAKxv9pRGQ6CLJ/y5lL9xR4uDk3nb@lists.freedesktop.org,
 AJvYcCUlJIyITIdk0TrqrwukRoFpL5NLdbmaDNnExyulfXLLXPpKL1ZLHt1cB6oQpdeZwWUY2AVyteg87s7XlNu0vkVI8Q==@lists.freedesktop.org,
 AJvYcCWTAKk1pUe++IRwUlZA1HBrnMJQTqwgC3VK5mV6PTh1TwnmqPx/MfuQErsp4oDkDDUD5kPheoS0@lists.freedesktop.org,
 AJvYcCWyH8JZbhsyHpLsZG+7zhEuv+/aAFojyJlRNGEwNBN2CfHPB3re9VPBAhW4Jjl4akIWKREAUUP83gQsc6t7aw==@lists.freedesktop.org,
 AJvYcCXrPBFun16LwMfRp0lGG49k6qSUyftKHJvIboIuQdBY6A/Ghtfv14Boif2Ad4YEDcLenyYQSUpo9FqW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPBoa/NAL7JhbMaFyHGhnjW9nvHcO9IxYjRFy1CXjJ9qEDisB5
 EKFexrhw5qDFEE29iZZFOVyP1unpYe5CeDEnNExk3dF0XNEkei6T
X-Gm-Gg: ASbGnctZztfDImIx9dVwwNuTVsyUtN4ny6PAxwp/ycBLfFnHrzPtr8z8dppnAjP4M0B
 vauAc7VeslfmPqEEpf/yydDDAmcul2oUlx3owlsSCw7uR1W4VVStK4fudCtNSY/8+s54ymkdQjb
 ahfBrYfR0nGHOt2NnF9ZNkFsXtC7eHNVVz6GKBuwcQgfSupNVQ4X8SBiIqSv70w4p1rwJJ9l+TT
 tv27n6rAfJx2qssSmtK0K4ADKyQjJ6pG5AqATh/aRWSNLyC4eZbU9M6TwiqKzNE0ZmbLLAM0i31
 glN8HtWEPc1xvO6yOwh74//uy9pPwAFnr1LidzqwsbnHzABMoWmS5AtWTgYzqE+Ras2nCXT8J3a
 Ldg==
X-Google-Smtp-Source: AGHT+IFfy+Zv4FYAC/PuIemcn5jp6axQXB+zw3jO+0pK/TsGPc1J6v/eMPg/pfYlNqXYocVPsCUG2Q==
X-Received: by 2002:a05:6602:2c15:b0:85b:577b:37da with SMTP id
 ca18e2360f4ac-85e2cc62797mr34378439f.9.1742496834340; 
 Thu, 20 Mar 2025 11:53:54 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 44/59] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Thu, 20 Mar 2025 12:52:22 -0600
Message-ID: <20250320185238.447458-45-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe uses
has drm.debug calls.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 2d4874d2b922..756dba5c88f8 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.49.0

