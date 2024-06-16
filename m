Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D169909B15
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 03:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713FF10E103;
	Sun, 16 Jun 2024 01:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="OESshnrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED40E10E103
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 01:25:37 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-797f1287aa3so234642985a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 18:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718501136; x=1719105936;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vmh7B10VjitCXi5UnMX7IBHWWNFhALchrxl9IDbnSME=;
 b=OESshnrXf+Ink9sMZi+1ybxNNHRivf56VzEkvbq9la1FmlyYgqtNq0Y+ei9u1oJ0sa
 JskWKlBwfbNtJsVRQvNgmbgpNH6nvnyVtSjAsXBnEaDs+hDKDgFUfm6ynpobbP2whnxb
 u7kCc+nU0lb+jIvwJD2aDWRKp+e0uSGoHl2ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718501136; x=1719105936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vmh7B10VjitCXi5UnMX7IBHWWNFhALchrxl9IDbnSME=;
 b=tIrBKEsCnzTj6wCW/TlMOueHDygzRmTI9XojsMpZcH/KDjE0fKF9mDAxjVYHbXItf9
 bzmmSq7zhZ7YW3FwUaIvuTyKXPD8/bsGsJ5dujYDxwSTUdEVzQ8+DdOvI5nRlxQir9R7
 jCYwl4010t/UA+4+5eY0Fcsd60aq0PNFsvVm6GD1pXNED5w0KMa/C3dikArwvXu04JrO
 PbJBVMLvXw1ECUPioTCFZXcwMc/4aGMoVt5Cl1WgITpZaFo5xkAjTMlLSgTdqRE9zQU7
 yf1pxCSelODb0Uh1Hdi1ymws46I9EzaPIMPlyT6dlJWmf5jyxeMXcvavOLm85izAp6FH
 mzxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0dAb6X/ZnMZvLxEPJTyb08tdqffpTlXa0TlITN7/7qhKGBHE6xz1tRj7SEjRn85EDVB+BkicCmQy3RVRmiplGQxORKYCeiBdM0H8dvXLi
X-Gm-Message-State: AOJu0Yz98IsPmbAjcgEM49rJ5V7PneEGI8f7PwJ+8zwTDt5WPWJvK+y9
 A6a84eqcNhhe4Lk7v10JGdlDPfYgZDbAxwjRGDUZWqOSESNzfkmHRLC3EcYzbA==
X-Google-Smtp-Source: AGHT+IF3o2n1vuAWzivHA2bQV4+Plh7YsZ6B36O+Td3GL1zNvsydHY+4muaeP2QpJFgYTbtdwi7YNA==
X-Received: by 2002:a05:622a:130a:b0:43a:b542:d1dd with SMTP id
 d75a77b69052e-44216af8850mr64153021cf.36.1718501136510; 
 Sat, 15 Jun 2024 18:25:36 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f310dae0sm32256121cf.97.2024.06.15.18.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 18:25:35 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, bp@alien8.de,
 bcm-kernel-feedback-list@broadcom.com, lkp@intel.com
Cc: zack.rusin@broadcom.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-iio@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 dragos.bogdan@analog.com, anshulusr@gmail.com, andrea.collamati@gmail.com,
 oe-kbuild-all@lists.linux.dev, x86@kernel.org,
 Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH 1/2] drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
Date: Sat, 15 Jun 2024 18:25:10 -0700
Message-Id: <20240616012511.198243-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <202406152104.FxakP1MB-lkp@intel.com>
References: <202406152104.FxakP1MB-lkp@intel.com>
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

VMWARE_HYPERCALL alternative will not work as intended without
VMware guest code initialization.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-lkp@intel.com/
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
index faddae3d6ac2..6f1ac940cbae 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VMWGFX
 	tristate "DRM driver for VMware Virtual GPU"
 	depends on DRM && PCI && MMU
-	depends on X86 || ARM64
+	depends on (X86 && HYPERVISOR_GUEST) || ARM64
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select MAPPING_DIRTY_HELPERS
-- 
2.39.4

