Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87DA1C191
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC4C10EA71;
	Sat, 25 Jan 2025 06:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TxuQ59UQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9376510E2F1;
 Sat, 25 Jan 2025 06:47:28 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-844e10ef3cfso218974639f.2; 
 Fri, 24 Jan 2025 22:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787648; x=1738392448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5Fx4vD8830ygmwK/CbGq51e5E9vq9b3i0UwFgjm2S0=;
 b=TxuQ59UQpnJ2bS97t49h6zkGapIlu1WCCxiajBv8MJQ5BHMjZhaxE+ahsW495yV87h
 1vk3oiEmdvuK20zV87+yApnfBHbY4l/XJC4Gp/stQBoPHl5mPWIGAI48Lkxt+IH82XN6
 F8BGZmv6OutdbjLgVCs9yFpKieR6iLKgbxOtSHAF4qzrhWzUVvqEbql8AO11XBjbuPW2
 1YbliNXVuUD0TN7qFNor5zk73mn+nyBXammIw6qvEjp3fFFsfS+/EDU+YsobgG/NKqg6
 ne8LlvlMqTfWE92dqQkBfI8I/B025jwcOtWrvnIMKUBTGZzGC6IHDuT9jAHxLWILOaQV
 GdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787648; x=1738392448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5Fx4vD8830ygmwK/CbGq51e5E9vq9b3i0UwFgjm2S0=;
 b=J+/NXtaLFdAVA+EeCkYUM5ttPvlI4V3GFJqgt8VgfVzjcfhR6DqnQDbWSGZDZHZm1o
 6oPcE2w53X2+8kbzryh/aCZ6QJdbXj5x6usu6UssxzfU73xT7ArvOb3h9TvpIMmQRBym
 zjbT94En0pmXJhYxlym5r6dx3m9QTtEWSACaC5rCaAZqbZ3+KTEXcBuKSUwqGKQPpCcw
 0p2++RxTLci7BZeLSCaY8IUUIGKvn1CcJafUyTrLAWcHm2EAk+e8q6IPKoQZWQtuzGx9
 sh7026Zm3vwaeDojWoXRY0MMNLEMBIcBZHIk9ffueZ56GwCvq4p3owNWMnLcLjOClnWE
 Tr6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8AhVpTcanlC81NDxmmPiUBO8xJdKBgzDs2Kf0Oa4Cwl+LWa5lYVSe0jIWQpfBRwAUP7gWMwgHUUSd@lists.freedesktop.org,
 AJvYcCVodNoh7g3s1pvypUBsOFBD34uyuIHrFUoF4Pv2GAo7fw1tGX8WmpBbIk1otLurCUeDLIGBsugN1iZ/Jr9t4Q==@lists.freedesktop.org,
 AJvYcCWxWx5R1LBNxv0W/Gf+lxk5DU8H9UT0aZjatxlHSyw32Pc+eNjJXEJxXPK7/zlmeIr0TxZZjG8u@lists.freedesktop.org,
 AJvYcCXGuyer3OcEq7GRZku3o0nzlXCAfa17SZd1Ks28KK2KqwhAq5R/+Ae/tXkdctgLwpW4li4XaQV2QAOg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyK0HVksFhRmGCZbf94q9DaBZW7KrgmFk6halO6QaFAc/2pRYh
 Vd8Uj2NPfBPmLKHR1k5xCBsnGTYkpV/AgwkDojbyeWuIz+Wie+BJ
X-Gm-Gg: ASbGncvhn1d7Y5MONPRnFhJ0/JMCsIcd5AEEjQmuS6JXGRjxFZG+qvcaM3bzL7JPoYu
 nyxSWyldqbVefGz09en8xBO31hdZ5a1MbeBEd12DXXs13FWaCxPaveUpBwnX/wT8NcD6NeTYrDW
 ZyQxjQE+1MWcnGsM7akHid4zmmkdF+gn8ewdZaa3wBd3uRtUr9snichiTyILHb5bejGYGhvwjez
 329t9IIN7L5SNnTP4cX0y8s4C1yb5VEVKH/Ku2CqBrQMDWRSKMMM1xSwGYLRKCGC/5Q3qHtBOc6
 2r6KWeG4BFUnNUpU90iBneQGr4qHRLb22coDeA==
X-Google-Smtp-Source: AGHT+IFRDe2KcxcBNECeYYJdcgCZVcjRpFlIg8aq2/iCR1BiW/gFQkHcZx8djmRi6ashMmRnx1PoRw==
X-Received: by 2002:a05:6602:418d:b0:844:bb0c:b899 with SMTP id
 ca18e2360f4ac-851b6170923mr2710428339f.1.1737787647828; 
 Fri, 24 Jan 2025 22:47:27 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:27 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 47/63] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Fri, 24 Jan 2025 23:46:01 -0700
Message-ID: <20250125064619.8305-48-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 6ee51003de3c..04884ff96c96 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -42,17 +42,7 @@
 
 #include "drm_dp_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
-- 
2.48.1

