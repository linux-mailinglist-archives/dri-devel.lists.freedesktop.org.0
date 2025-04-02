Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7423A79453
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA7610E8A5;
	Wed,  2 Apr 2025 17:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bMUslWwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5C810E896;
 Wed,  2 Apr 2025 17:42:59 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3d6d6d82633so491955ab.0; 
 Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615779; x=1744220579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTbNTI64Sdb94F5FeGTeZQmx91wNwlAKHYCBLiEXOdM=;
 b=bMUslWwyHJGkm5c0ZTP+IdJ/7L+RoLPBjNQ+KtCcqMrgQYMm6QZuSt5eBxMe9GiABt
 gzv4dXzJF0GNpUXEWB0MZUamSyhUtM4W9teFqHpKCXalFqNlojnLZh1BkD6aZlTlc42I
 6GcsFbUHpMRpzYCWSC2ivgrxbpKObppBxK6KUfS82paltKqQtE7qr/ih9Xc/EDH2Tjnb
 iWbnTkEVMcS6rhFNUNEOBFc+E4EYavmUzZYmJV5TA4qc0GrPMJnf70aQma2HQiNlLVW8
 xu640b8OZHudCMS0tkGhaeJHHAIs/GLOus6e2eH26rlTkh1S1QhR9k7HROrOf1cS6gcW
 yaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615779; x=1744220579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTbNTI64Sdb94F5FeGTeZQmx91wNwlAKHYCBLiEXOdM=;
 b=rnZ5lQD1WAfC3t7944OmEA3ni/mTHYTQO9/3UH9+geRgxzJh/SP5T+pqHTJHkt9054
 oWLu26W4t3pig8DGJHZIPZ4QASQyxpTF9zTO/b8JW6imGu8AEsYlKdTwWYrYVl8WRJWO
 p8HNtTHtrjw3XEBIWKdBmFTDGE01Gnl0MaYFUiShpyPPGZ9SwnuVYdUcL8yK/PyqQvMC
 4wZN40271Vd7bttTf01jQFBPcWtlJYQcjAyr0IwhCyREtPIuQkvlDbS4oZQbLLvB87pn
 27LB5h63KAYq7d/Nqtj3tj6dtd/qf5PfHYKjSPG3hhrKhfsn7PTxiL+tmL9fgxHBEvLf
 WpbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg0YK34fG4X8toWnJm5k1maIaPD6mCkwuOT5ypS2LP3T1FfbWCkR59whOF8VXmlrt70SoXfqtEE05b@lists.freedesktop.org,
 AJvYcCVzGZGPRdAW6V3QMe7fWWl7OMV+fCMUty2XWIpdVLRtzKnY2yqZF929t5RKLhBmB2pwXsf++GvJ@lists.freedesktop.org,
 AJvYcCWVKkMvcOs7KjEn73bGMc6z1SLwvpYK3+y15Cb/WN9QDiKOj8+ae96Af1lPy5yEo+oizZh1PMVTsS0cjccG/w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykERskzqs/99dQ0Nhr1r8TJC87dQi3xHOSipo/FPeXOCEAd8xk
 M2HRZd2EhHBmus8U9UNlm/Vh4V6vV2fmMLtMzTK8hTTqkvPN9D2a
X-Gm-Gg: ASbGncvApcmMNWSuO+DWegK+BYmHydBp9SMZAoWq4Hs8dSfDP2VRtV+wAZJ/kH3vZMx
 a10PDWh/lQJSdz2mA3B3k+q+deM9wo4Lba2z71wYTzLiAYqOnDMnT8zui0ThjAqj+k9FUsF53vb
 PnFlRuLBhQoP/Gy1u342ZN9schWvBzXsTrz4LkgkftzN8yVft2M+EeK1gm2w29xrCQpDh6X8d9b
 KSXDY1UxTgHxSkHX/YMfU1FqcnSBJ8t9UBXKQxeIsxBmiLg6mKrAmEDPTznr0Sy8cEIx8mPvr5o
 W0Hja53cGD17YhfL0CLp3wHvkOldgm1hvUald5tdbhB+vWhz6TlneSnD956rNzxXP+mALUmwF+8
 H5Q==
X-Google-Smtp-Source: AGHT+IF3u0H+oGQ2/wIhP84jzTNGBP4fVHIk9OQhmyCTNULQcvXR/2W1nzJq7bC541uOcFJorl3+xw==
X-Received: by 2002:a05:6e02:198f:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d6d548bc33mr33323115ab.9.1743615779091; 
 Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 46/54] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Wed,  2 Apr 2025 11:41:48 -0600
Message-ID: <20250402174156.1246171-47-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0f32471c8533..2b4f862fe5d4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -279,6 +279,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.49.0

