Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3BEA1C1A1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F405D10EA8B;
	Sat, 25 Jan 2025 06:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O9Oavc4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA80C10EA69;
 Sat, 25 Jan 2025 06:47:31 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3ce915a8a25so9044525ab.1; 
 Fri, 24 Jan 2025 22:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787651; x=1738392451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bLkPNu2Q5EYmviVwXAixj7ZJhhmJ3xs87XYWfnwbjNs=;
 b=O9Oavc4MybZ1Ww8EJNMEYWP6hmMhmxT9CgYs68eyDKHy8fa88TMycvFaAGIBVb4xlb
 3ftdMxbZZaUWNouWrx5mkmSKSfUs5Nx89TR/fhGLpd1ZU1qvGLOzaeSVcn9x9DNtb+IY
 mmOIuN4ciS/wF7ho/18eq+AvTveDWz9NC6yyakGDSAOL8AH4psHywhfF+BIBghp3ERfe
 B5nim5elsiqO4kZCGt7ykAcudbJeWoFiQzT0xhah34E/iIEK19RfREKlJLi1dLQzyKMI
 PBmhugNfOgp6h3JrXzjF8xa7I0mo4GzR9oezRtk16BCCMv8kJ196Jy7oWkCkkWkgkQHI
 COJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787651; x=1738392451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bLkPNu2Q5EYmviVwXAixj7ZJhhmJ3xs87XYWfnwbjNs=;
 b=AE7pid/VkAqWAVxxh4wxJ1n2mhl81+4cBmbtVRfeoKVlkneu99HK2/l12aW3jRMb4s
 Me+s8gxr8UiU4fxE3CsP/ahQuzzltsCpM56luVFLgRhG1UDCN9m7MF1LNAiGQmPsi5pF
 oz64/4HXSvNxYK4lALMhmD/FCC8wKZoXm427pcdTYwl7QrGSi6ATrlU7A7hLkvjnq05U
 E6/coBLdwOVKrPvTEd1Bj0S5bGgNjx72wEjlcgVBTofbcKMdlyAym73EFvirhLnFxzzN
 OS98+oFYSmnfV5WzKKXMgNd8tLba8xmDUivQiTzhxNTOsU/V3bCFPZwa6mZxZT9t941J
 UFEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWHp+cCdGfvZ8jdoCb1w1bPakyj+KtvqHJkbuudBXhJj3hV5wfwjzfJYAMycaKyqKNF788TmE4BN1Q/3em/w==@lists.freedesktop.org,
 AJvYcCW5DlVlfOPx4Em5LICUHCIRAGRC6wbbGL47k6330Ixa6LREpHE2rwa83UnDMKOFXigIEw9eIVik8Mq9@lists.freedesktop.org,
 AJvYcCWvjMgt9h1Ao4Zowo6degSfZd3XjkDsiLr5+sNQwQM0L21SHVEVVRV63cNTwQPcqjy4HoeAnEwm@lists.freedesktop.org,
 AJvYcCXC7UFMRETPvtomHe115rCRSQrd+p5yHKmVYpgos8k0JBqm7CQUzEMP+L09pCuLmCT5PHaQv13eXWyl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0OlsYVvd7G8kIVABsp2CcBXopCiYTF/pf7O5696xUa0+lD5ta
 SKaMDSZ2ZUVGgHsWw4xltZmPkEBSoTxqTiH3AB1ikjdY4u3aaWx2elORhQ==
X-Gm-Gg: ASbGncsabPeHfP9N436pwRT7+3atUUvpiURjEm0i1oDRjzFqFconh2s4m/QHW9j3PTl
 BXp0wqTzCpx54pYoXZ/276JwvHY4o/5IHxQLCYY5NHfnAgq/GJHrEjVU5eD8Ts0Q5URcecyiDmg
 mDekCa8X4p1A10Ib9/fz9duFk+irJr75xapyF12/uicbqLGhw634yCdl6f8zjQZUKwc0Rr5zZUe
 VJ/F8k8lJf7n/hTCwJ3dNJQMwu18F6Miz+/ViXHVnfCmfK5q3MQapfDx31t5WfCLv8Ys15utLVm
 TV7CLcn7u+X67J9TB88ySN4R4VGtO/aco9mNAg==
X-Google-Smtp-Source: AGHT+IE+1sdA59rvtPU5SkxEWaRpr0NIdPh+RV46664Rr2xVtF4kdC2MMHfvNMK5CKli+LmN1bSAtw==
X-Received: by 2002:a05:6e02:170b:b0:3cf:b365:dcf0 with SMTP id
 e9e14a558f8ab-3cfb365f19bmr116839155ab.19.1737787650985; 
 Fri, 24 Jan 2025 22:47:30 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:30 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 50/63] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Fri, 24 Jan 2025 23:46:04 -0700
Message-ID: <20250125064619.8305-51-jim.cromie@gmail.com>
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

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ffca6e2e1c9a..fca1a1250161 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -45,6 +45,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.48.1

