Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B755B19227
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB2810E4D1;
	Sun,  3 Aug 2025 03:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJKAh+23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798CC10E4CC;
 Sun,  3 Aug 2025 03:59:47 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3e3d94aa969so14697705ab.1; 
 Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193587; x=1754798387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2JGFRfrIhHONHk9F3zUV83hFGKQa8jTEAD0j3plUI0=;
 b=VJKAh+23HRFCmIEpijITXlF2BnETQjacVyZLoRk8LyGbpNrvJBvtP8O+78PEQQV6mp
 RE0poK+3HF1h7MqPNPxNfROTqqH7Q2vJF07uqD7I2wzafJQSEL31OoF8Py4upesLH63S
 TZ00kBzPWmxUSahyfnTWeGb3frxgF3ANmFOhdJFgC6kdO4GoTtc1griEj4Z6WnFZgRZq
 l9gOpyReVQ3s2+/rsB1XqDC0L0ejdmtunDTlQNVv9mwFDRJwL/Wn7zYG72H0U0u5tYGw
 7nfhYYxYft1wF/3qeAkvymxB5Hd4Mmys1ucKvZkCIaNxdtSoV8ZI+QmwUH4MgZ8UAe2S
 lHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193587; x=1754798387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2JGFRfrIhHONHk9F3zUV83hFGKQa8jTEAD0j3plUI0=;
 b=o9c76xquqCHfbCrxYKsQRwAO0HrEfvxy6c7iJU57UNhjrSa+zwfgFW0sBRTAR71wH8
 pRfMtlZogaLNg7Gin9M9j3ORReFhmgKnVkRfDWUBD6WtufQXfcydVYCgAU9kIZoyg7og
 h5i/tChdlsYmmX5yiCQdCaG/Ruf18kSsppSwmfXPOmPtTE4JQ6XkZRxTIkUTX47hMDWC
 bHkD9HPwV+Kk+fS/dnWByYOtpeV3XWzSqkBj0HTVIGHjmLyp6qSMFymQa9jy54xiM0TN
 fmvnL4hGfhsQud22osUYfxnlB8JOpcczwrNkiUEejwP/6rQyZhouF7jRBOZelu6h/KIQ
 NA5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVTI6dMmFgyOGcebE/gxGEEXbOtztFccbe5kyaOd6/bg8uSgQ6+4Ta6h1e0ABF8Z//oSHxce4JyvKQ9L4Uxg==@lists.freedesktop.org,
 AJvYcCVtSGe1FqRo6AXcRpGL08TRx07FFsflhkHLSAxF5Ev4dPkhY+yj4IEp4tJgevmB64v802ZJpkjiZGey@lists.freedesktop.org,
 AJvYcCXxZYPE16t3B1KeVcqbG30wHouHg+DZ6MGfkbiCo6rJ3nxsV+SJ6aTQaSDhnGoE3xOL4FO3Xt2e@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywWh5lbjYS6jbKAPLcIk2U1gO7RvxbsoA1lA6fWPrx9Hmegbf2
 zOo1sdD7QW+ATruvAD7PfRVmJLoW+Ys7wucioJHYTct2rTfT4eesIQwr
X-Gm-Gg: ASbGnct7xM2rQuhaHoJ0EgsYBk78OW6v2IZ+WTvNStYpnlgykERrJHIhE5qy1+2fk2m
 tbaGqcLYlXyWK/MVrOXF99Ci2xRpFGT3XOYbJIv99AYPgn2sBrDf4QECLXXgRcLiMwmUrSl5ZLE
 5sk6WGSSC0HRvdvwNE5FKYwxu3juFnKMfOelYlyhDria965uqtJkF8QYOTNhqCSdsYRr7aGt4he
 vvIJQYGAFuLFlMkWGO7fkxD1q5YWyiW+b90LBF5Ji6xXD1DQYGdx+ZJEUx2naV/o3P1bIB4pqJW
 4IKdkYE7+sN4tPugzxfLXIWj5XNZmWiv9o6GeY/qel5xDZIDjwugLQdxjypUYLHHUC4Ugsx5FNC
 vau41jZg3jcaqpn82cRFRTBXSwxO7pOWCHv8LJrKnFNzYt872LWquUilo0H+1Bck8g7+oDXaI7f
 oDofK8yEsqXoiO
X-Google-Smtp-Source: AGHT+IHqVFvq1DXgRalOAEJ4e6OJ3Wn8/7Lu6yNitZbnZoklyriFDbu+1seaMWuZezPTVSx6Id5Rjg==
X-Received: by 2002:a05:6e02:3042:b0:3e3:ccdb:6ccc with SMTP id
 e9e14a558f8ab-3e4160fb7femr85375625ab.3.1754193586726; 
 Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
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
Subject: [PATCH v4 50/58] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Sat,  2 Aug 2025 21:58:08 -0600
Message-ID: <20250803035816.603405-51-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a24d1655f7b8e..29e47700688a9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -37,6 +37,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.50.1

