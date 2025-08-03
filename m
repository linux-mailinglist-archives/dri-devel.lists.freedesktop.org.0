Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1CB19212
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B5E10E4CE;
	Sun,  3 Aug 2025 03:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UmHvnWbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE2310E4CB;
 Sun,  3 Aug 2025 03:59:33 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3e3d31a9ac7so12935125ab.0; 
 Sat, 02 Aug 2025 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193573; x=1754798373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aX0wy3dIOkODQINpUya7i2089vNboqetAJr/ccri1K0=;
 b=UmHvnWbshc3G4Mrm8+DMaBm2CVy5bo63ZDeZCXf3rXiv61RuKczsSAf3RjuoxjeNl+
 o/O3MJHpiOnyNPWU6Vbpb5woegKfiWhQi6K8t1AmtHh3Qk0OFTGNNT/PSmHAZOP68ANl
 1y5kNr16UA2bjOkPKSd1Ii0wTt06EPvepEWiBE3rAO40yao41aW1W89dyg6QaHj5Gbus
 FRECmoCOwNQuiZkplNilELyHLWpUPZGYZBJ1Zd9OcVROW6XuA72RP8oth9rJydycWtyT
 08urwfLitbh76dpvpGPgmQJq5DaYPCwdBtsfnwYTIQ/VLPA4yBAIyGhF4Rj7jd4fScmn
 t3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193573; x=1754798373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aX0wy3dIOkODQINpUya7i2089vNboqetAJr/ccri1K0=;
 b=akpQIqM/rqfE4IvkQBa6KqHUOwTTzKEeLkC7yCuMjvB6maoQWnZKCc/vNcEi2JQhXC
 HUVWkq0FVQI3zgvVpqmvxQhPAlEfj03J6GCKkqXN+TvmbidyAHFwD7k3bcXQ3rbEfe6X
 MUM4qOL9NVm+WHEftsaepGXdBXl7YLG9ak0IkYOjR3H+E4JM88Csfs4ZsgGhMvjNfypA
 XTdGJkpvjcv2glOZDdXdEz6VhqZsYx8foeufe4cTr7aqxhMwcicI3ttvTdtthDmJLO1Y
 uvUr7dc2/6WfSy/uZe+7D/aVWN4OtYl+H+4ZYzjDaSALMT7hMqi0hsCr+5Kt/0BZIfhZ
 3j9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOhkCe7z82oGKRCafjx/UpA9fplibDl2CUTxBwdRNH4a5qXPqVMe8eT0NWo7E9b3j05TiBgg6GFs+V@lists.freedesktop.org,
 AJvYcCUvQZr2RPc+x+yB6utB+gxw26tG8iBPAtsuxVJFVr6S+yHBhGIjkS7l8QZb2ALjvVXhwDXQqn6uDKpH1zdrCg==@lists.freedesktop.org,
 AJvYcCWhsl+WRaspF8LKNKw/Hj/5mcUVm4Uu4H9GISOkxBH7fb8Iygp9H4HHSpkPW0Hw+Hn1TIDJqVli@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxvyZZoa2kSZe80h9utjKIIpEsiMC9XwmxmCx6g84+8hiFBBhM
 4l9UMfDgwGD+I4aOQ0Z+ymWsnEDXYpnrcnpknnPxp4CHRU2cCvwjGbag
X-Gm-Gg: ASbGncsu0GZoAfEPKy7lNLLcF95QNwoZE+qxgylG7wRVO6B6pwTgQmuU7B6i92/X75z
 Dp27UeDl6zucTze3SNLewGs5211YKdgcbIIW6CDs3mizwbNkfSrXKWfICCnKZnCws+qBvfv9V0t
 k6xWjsqhSKLVYF5ZxwDRsz7aZ9zobvBqdcSPd88oQbpvrKXqbrdQR1Q2yUZ1KFhEEEEOvVyhHmS
 sHEyoOZD4Uunpou7c3UlkqTFwYSM9+K8CjyVWke7DRfQHSNOLHfb+JmNbeHsHQFhFNGAYm73NOM
 C/qtxI1fzO4q8Wq+zzCKboIGXYbz5eZHvStrOuQCKHu7FgB1Zmuebir76uH5+pKXcBoM4S7sewN
 AQNoD0EfpjeealS6VuMFOb37kW3vaD9b8y/Y8DjwAEAM7xZgCcxMa5eVP/IcoFeKJw3ZC/jArvJ
 y9UA==
X-Google-Smtp-Source: AGHT+IGc+JsMKOicIj4OsJejzSDjbJADbBCmxpF9C67GucCVwf4NPItA66Nt3F/BJKgx0ySRSJwRNw==
X-Received: by 2002:a05:6e02:228f:b0:3df:5333:c2ab with SMTP id
 e9e14a558f8ab-3e4163772c7mr75665075ab.17.1754193572894; 
 Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
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
Subject: [PATCH v4 40/58] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Sat,  2 Aug 2025 21:57:58 -0600
Message-ID: <20250803035816.603405-41-jim.cromie@gmail.com>
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
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index ea78c6c8ca7a6..f296fb9de0aa9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -43,17 +43,7 @@
 
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
2.50.1

