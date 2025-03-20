Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE22AA6ADBC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C1610E6B4;
	Thu, 20 Mar 2025 18:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bOYgzOIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2749610E6A3;
 Thu, 20 Mar 2025 18:54:04 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-85b5e49615aso98880039f.1; 
 Thu, 20 Mar 2025 11:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496843; x=1743101643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhoA9XaTmEGFO/43twqabJw5GWuyyTcgJpDDhp+La9k=;
 b=bOYgzOIm256r4o0gEK0kJiykYxBRi2Mfrqj5Ouoc5Kkxj99jTSXxjCP0rAhi8VLq1b
 S0dUmL/PY5XsnNNlRs6cpZzbgra6xcMkElNeB/b+tfQorrHNjTsZGve8TckTLk0L9sy9
 uUkYBEtsIKBqtqJ5vXd6jEeksGLx/LDY/zbpzEt1eR0XTTNhbRyQzS4l8uMb30YM/150
 bZV/SrLL7XwRQ0hSkfm96vCy+XZAfSBPXWC4rvvblFii5Tv3wtPS2ZTpyadvDQbNvFP1
 S+V1q5O8W1yaqntRHCxRDKRoST3qBWZULUzTuj5pIyQA0at00nEIZEeUho5KWMmQSCYG
 TfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496843; x=1743101643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhoA9XaTmEGFO/43twqabJw5GWuyyTcgJpDDhp+La9k=;
 b=ewtlU9UmJxQ7v+yZ+PBMGPUh1bT88UgG18RYPROQpoyDc1RGydUV4EEY3PwLNb7Hh+
 heLXin5eCPAr3dtJL6MnM+We5LRWjQCFvLOi8yqZ1U9Ady+0XfryQeTgXqg/1h+SgHmT
 JRTtWW0R4wxx3JbqlMZJWA6SOpSpptWwJX8weAQ9fGYAiIj4f0stBTRooIWigS+CMUdd
 sWXcdkeu2Osf3NrDta7iLgLEW8DVPUNGH9DYjuiXZtJk0g0L6NVxebR5R4q/7P4EvHMZ
 I5+sfUF1pU4KZ4XN7SIhb7UDHWukNOonHKmXsC5I4LUur0Id6obCuqRADOKD71JwecCl
 Ygkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFqOQP5sLtjpNdX6xWkkvN55XE+fGL/9uvRjiRfGMKe0am/ZQR8OQSDvpfQ1wImXJbfjEsjXCIg3+Wege3eA==@lists.freedesktop.org,
 AJvYcCUqZ3SkRDi6V2QJLSMocdWmU82jDZeRg0mzcaFkKZEq7Sv7Xb//MfjyXwuGYgVAb7XcbCwNfoHf@lists.freedesktop.org,
 AJvYcCVdjWmyye0QX9Wlb8zfxi8lxCjUF2YBjqGG57+ydYN+FdFOTNtlg2X0PvePrzOUwsqSHxs8BLW1RueKmNeejhXaeg==@lists.freedesktop.org,
 AJvYcCWeCfBO2tZUKm3Cwjzqu+IGzli6+9bPCSV7SkCkcrytreRXvhVAxo8L9uWvmyC9sZzM1LR/gEpYQDyg@lists.freedesktop.org,
 AJvYcCXurrkKaULH+R7or2RyUVwtNb7p8NM9Aan+W9C9GywtxCxDysyr+K+cxQ4eXNNQDqXeO9/x0df8WXrZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO62mYYHcFQI7Ri8HD63Vln/Wra2y6bRbDFmr7+rs+k8T7WZvb
 8+ejeYwiEhVJEdglAYZjIkwNDhnVTF3cfeM5ovi7Z7HfrNev1cETSYlXDg+J
X-Gm-Gg: ASbGncvMFm7OVEslIarPL/xbEXlKdN3xZknciJiCqf87KaQ7f/ZktLnDjzGKT96iaXg
 twyK+JlTNbv4261U1eEDZ3iNsHYs1MSHK+ZgNbpCY93YmZA642XtSrh+EKkEUX2UbdQ0SF0gtQm
 qCEXlfBzxs9kciJay1felDXcNbhW1a853FdIoVfJzuMOVmHOCExuj/PHX0NbZv+yV4IPvDrgsMP
 WFc9+KnSj+b+gt2fN+bc+N/0kYjPc/vOGqjxJBlVrIvJEOAHtVhJVEp2SZ+FyuD9zenuyWYoCYx
 lqveIMM0XaHdcUrtiIp8wSYL4/HZlPKIWtwoVXh4Q6F98LMMSpUvbsKZmK0YBSJyPkLAQ5GQ1/6
 S4Ech8ovYN5HJ
X-Google-Smtp-Source: AGHT+IEgHOQE0JzedJrkXwHL1alAF/zpRzjzP5naMxSeByqgvmG3tMoR3XIdy0yOgUxGxTjx2CzHVg==
X-Received: by 2002:a05:6602:4742:b0:85d:9a7a:8169 with SMTP id
 ca18e2360f4ac-85e2c904c6dmr48889039f.0.1742496843424; 
 Thu, 20 Mar 2025 11:54:03 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:54:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 52/59] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Thu, 20 Mar 2025 12:52:30 -0600
Message-ID: <20250320185238.447458-53-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e0409aba9349..4b9da64661fb 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.49.0

