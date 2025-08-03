Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829EB19217
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E0110E4C5;
	Sun,  3 Aug 2025 03:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mPxdTiEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E6C10E4C9;
 Sun,  3 Aug 2025 03:59:37 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3e40212e6ceso14463545ab.0; 
 Sat, 02 Aug 2025 20:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193577; x=1754798377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFh2RZochPrtpmKEJNCfPiOKK4EQdlmU3N2ti5dUWmM=;
 b=mPxdTiECCYH8slfPRcO/ftQqepkBFZrB9nzA6BdcV4YI9I1+HPRZfEaKfEbE6mYJnj
 8TxKGHedmuJ8S+7kzqdESobcjyeODyPerHZ62kDi5KKv6wtn4rS7L/jQosLaX+6AAOdX
 6vg+sTJQ6qjeqPrX+vf7JqDpKKSpdCuqU/JuTkiyUrobl/1XJOo2VOsdQa7KNXBAfYzT
 eCKgZKWNS63TErlK53ZvTW7Pl2lAOQ6OO4x+E7yncwUtp6w9Gs/PGi4yMsF4ZjgbevWh
 BaApTulb2m6GTWFnUTnEHDbPhDn29HTAwUe2T7McAvaVCjw7JeluKZ2y+pVp5Ed9xLXt
 S1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193577; x=1754798377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFh2RZochPrtpmKEJNCfPiOKK4EQdlmU3N2ti5dUWmM=;
 b=hsYoYZ36lYDw6lGVoTfNBm51XsGXLE3S2QpMl5Qgx8WW6s8bgGOcHPcry/8vL/eakK
 BAyYXWY71aWaUOLIBZH4xo05EFf5y/ZHRpIK04sZGHBJPj413qglLBcM6Xypl5pqN6p7
 dMqT5JhJZD0BhArF7CvO1geKaHn9wcXLTay0ZQhYw2kMZ9ihK/w6tgiOQHEVlBL/G7iY
 MbjWnq8jkVwD4G13hqAe82FTVgi00hPAvp2QtpsrJX04t1XoudJE7d8krJbzcGjOG4gm
 A1J3EyRZJc6yJoYGBp98gwbdzBet5qeu3OqZyQ1DL6HG1CjQ0HgXU8JrS2OdsVMjOw6X
 0R4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgVHfhZ+ibyj1UFettCjfr4vKZdWXSHnB7fBE//NdljNas12Mxwh8dC5QTFe3t4ZlPkl2eNmHC@lists.freedesktop.org,
 AJvYcCUiD7e+8J/HBYlekG9oBPdXjyuwl+gIbc4H2xkaC+P/E+5zeli1qGDz6WedsCEibr1Rp7DnwiMgnBnZAp95OQ==@lists.freedesktop.org,
 AJvYcCVIucUWsbvLbrhjD01NrRs5LiyT5523gHYM5i230Y9oiTk1grHAaSf9GPHnQRZqAEcVvnb3soZjWZA6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4QGOc0JW1Pe/Sim+yWTaHriU/6d4T4IdMuyAt4TEEWap+wu6Q
 Je2+W25zb6U72vvVg+fee4z8AIIJQYn9j5B0dScPA9V1x0zSmbjq41MB
X-Gm-Gg: ASbGnctGRBKVOlsZ3omOMoCqUc7GXNZzBcScMXT2EHeNd+0W7Q6Z3PPOq7Gu8s0U9a+
 f1K00+ASSYxA5vgB/uQRPWS+F3rLrdEs7qEepD8vwczhke4NPavDnhBLYgUfS8EtNcJGUljgqUk
 OrpB6SOWaBEuYWmAP2FUOULDNnnzJWxAgmLDrgGjWKmgeLCHz7qn5/c/XmA2uWbS9NUY/ubz+OZ
 v+Xb0ymHXhaJOgZbzIxODDTAWMVOG+23cRAhxygteABrVE2BWPrAeLAJqvlXmMaocgYATM78yTk
 QJbL8cBMiNumwWF4L8f0N04dYcGNJSoI+1DB06vDjfCgQ8R0IHpVPhqP9iMjCmOvbflSwysHRWj
 celkPgK4lo678v2RaUwRhYrBGluq9QUipCfoTC5NlDpaWtaYt73FYZP9YoswO8kB1IGQWNsbxxv
 xIbA==
X-Google-Smtp-Source: AGHT+IHpBDdR6FigTlQRJF71kEZPG5C4dRibFN0rdBgPoSfyb0NYf4gIgt2t1ZdaE/8lcZCX/fEPYQ==
X-Received: by 2002:a05:6e02:32c4:b0:3df:3ad6:bfb2 with SMTP id
 e9e14a558f8ab-3e416180bbbmr90758155ab.17.1754193576851; 
 Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
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
Subject: [PATCH v4 43/58] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Sat,  2 Aug 2025 21:58:01 -0600
Message-ID: <20250803035816.603405-44-jim.cromie@gmail.com>
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

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index e32e680c71979..4487b5a41cbda 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -48,6 +48,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.50.1

