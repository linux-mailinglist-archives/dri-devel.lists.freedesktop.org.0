Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0364B19210
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E080610E4CB;
	Sun,  3 Aug 2025 03:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hnDxgya6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A4E10E4C5;
 Sun,  3 Aug 2025 03:59:32 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-87faacc4b8fso183464339f.1; 
 Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193571; x=1754798371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyoOqz+KNU5cHFw0iNonI9mdJpTRYeIGpSlVGT5QSqU=;
 b=hnDxgya6k4+Ge92kcmT0Kdzz1iEMC+AHDlzOsfRIAgCBBcteIvktCjb2F7QJEthqu9
 6yyQyokTw/u+5ZLQ8acFfd1SF0MBM8zQlK5lcFn6teGruaDKX3fG5DlT8XMmAwTdANLk
 mFNIipds1nkXroxst0UJe9JAHZQb+KsyPO2wdp+NS34R3AsLtoUpsmA5RXg0i5jXHQHE
 wU671vsSQoYHAJMbISHjEzqCoxV1X5IFWeE0qu30wqYArz7FYEcoYgxHjNkUtFZI/e6E
 z/r5GV9FVfSWV8msnbw96IJ4auBAYCtO1t3+KHSzStldn+cVqNO1KyGj9XAKiUXcGtAB
 KmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193571; x=1754798371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iyoOqz+KNU5cHFw0iNonI9mdJpTRYeIGpSlVGT5QSqU=;
 b=iWAzqWDnb0Lbc2yYAAw7j6fCyd7lec2zW0DfJZwVRI8u0zMrDzckSGT9+4o4py/WYO
 fc59qCWeOMQ1+PuQYS7QNdOz6RtvQoWsVJjNRUlHQLe0ec9xUq7A3RbK1VmiwrnOPTWT
 ILt0XQ2OtGja8na3nM4TlA8tZezrmLd3GkIbBd14f5uPHSvXp3u8LJz9Rauanzf8qmxy
 sLr+gdB01c0bw4D6SGqg7/1HqK8KjRR2b07A5A8KPtUte5kaLGcfAiTC+zNlYYQ0tD2A
 yDNPXPpaWZef2y7qFcxKsLBgH+N6BOD6pIBG25ehw/pN5K0IgLbg7LdDzYnWicTqHuTF
 0O/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFLMnznT6+kXFjBKLyHRhVqtpkTA90bwDcOdRxEOPXG5uEpaK6K0fjwySSj+xk015A6LBQ6nDm@lists.freedesktop.org,
 AJvYcCWqJwmf+mOcdN1qst/7ORWeAiKEib75aTF2+TRA4zwPyQBSEJnMLETS/NyIRvojbY1qZlnjGNTSz1cZ@lists.freedesktop.org,
 AJvYcCXtRHYXnf7Ol+cyVPk8t+I873L92n9+WTUU2BT1vj+pwmVwX3revpIlLMuJF4AMClysPxdzjQWWnOKOrrK+9A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0wWDvZP5APKPmFwdNmX8EO/zBvvAOAHdW0v6Hs9fHXioeTEys
 hJLw+a5jCoZ6vZSyuaGJLPh/8SLa0Er4IXKABL9WN5UWG+mSeX+rJ5z7
X-Gm-Gg: ASbGncsdVSBA1KFYxACusZ8HPEdM/nVVKA8bt+1xN23FIoscPrrH/RL76gO4OGnJnVp
 zBzkVlhHOPFOvdVALwTQXSdIEHB3ioMI1oZ1GDB9h7XxuRw1DBLGGLwPT83c0VTUL6HEaTawzck
 /denuDyPjeVjIhxAGE0GQeG7UcVw7Y179/nuPbeXmC8g/FmgJ9EBjeTgr66FLTNYUN081jvTmGS
 BhbRT0sjCabmRXnf7ZERdmk2yRkiAAqjz6EHc5LLPZVbk2f0W2qGGcYqE962eHwWWK61YG4kM22
 J4FTtQnu8O/yljEHL9hHvFWu12ueDSAQKS9Egnp9szoaxMaOfp3/z5lhK7UOqKQnX/y3ekIziBQ
 NqsTStSnNbajTQWV7P1Dn5T8GGMKDrc3BjtYxFj6/Gge3zFBGsxx0ULGjr/1W5eCVhdIV4EeCmB
 K6BA==
X-Google-Smtp-Source: AGHT+IGah3M6q8sow7PmA2xw/j3+4wUg16/XNoOr3ocRA+wBN5F5xifQppQnjG3O+XbNYtlZUh4PWQ==
X-Received: by 2002:a05:6e02:2686:b0:3df:45bb:2900 with SMTP id
 e9e14a558f8ab-3e416109eacmr108511895ab.5.1754193571601; 
 Sat, 02 Aug 2025 20:59:31 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 39/58] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Sat,  2 Aug 2025 21:57:57 -0600
Message-ID: <20250803035816.603405-40-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 39497493f74ca..8d169a6d7053d 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
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
 
 /**
  * DOC: overview
-- 
2.50.1

