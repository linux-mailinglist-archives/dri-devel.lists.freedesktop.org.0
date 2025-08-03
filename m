Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11499B1922A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474A310E4D8;
	Sun,  3 Aug 2025 03:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DcdgjUXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AAB10E4D5;
 Sun,  3 Aug 2025 03:59:49 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3e3faafe30fso25242405ab.0; 
 Sat, 02 Aug 2025 20:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193589; x=1754798389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UXktWfyU/nC8G5w+/5cLAwZreh7IMfsApWH9fi/o5I=;
 b=DcdgjUXyuxpEdmfpd1PKFjgHa0EgS6LyKbQhdRnV95KV575o0sDQn3vASRHyoe5v1y
 P7Yusyh3Hr5PON0FO5Pcaq0JY7lBTDskfvA/8yQIwOPwevi7syEcNMI8Z0G1qPDIy7WC
 Cxzv/VMWjDpXFlsdqfcojelCWUSKyF6UxacTDWbAWmNtZ4zjoB+kvIIgToDML5IeX6Go
 Xloq7QwfNEdB76MLLCO8lwVvqxlbAlcU1ciSf8QH8sLzU+eWb6/2x7Ix2YUBgmqPDzzE
 7aFT3+xRU2eCe0LMCQeD53ejxnUCA45xu3xscAUnogm5+aodtkusxEkPzQHc4IHuuQox
 HxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193589; x=1754798389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9UXktWfyU/nC8G5w+/5cLAwZreh7IMfsApWH9fi/o5I=;
 b=cbH7t7aiichE/v0C0erJqhVral4mF5/Sk2j8swGt6rMBVqSaabJiL5lZIu5KPwNrNj
 zRTyWHoV+TpsLb/zBjrn6u6JtQ/LsjI5h4VgD0EzfOysV+iJhLRjDlr1MIh+onEIqNn6
 B5xGu9SDusxM2NgEHPUVG7Vkg08ReGx8/gbqs+Dk1eKOZtYzskiMuYJdpHD25CM+G0JU
 ZD8eVe0ZZln9T4+vDHr5BVezLlDsCrZrLqNGEl9YtW5qx62QidZKRboXlKWdRhiK9KZP
 MngzPTdR7IuGBwxBYLG9eU5HnuFqrTOYk0hOXL1SzNkznoWWZwtotd6awlyB7JPO/JMY
 W6zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7buzcFUzQ9iSZjqXEt+NL6Kc9BN7iAeaAR0O4pdqFbXSOab1vgCKdQ8453r8Pl1tZYCLNti0h@lists.freedesktop.org,
 AJvYcCUknvuiq+tVxgC0sFOOzE62gx0Gtg8dxbhv6Jc13iz1cYMCAw5ZgPbS79K8Tk3QLXKulzRs2BEdIS9D/U3Psw==@lists.freedesktop.org,
 AJvYcCVC5kC8Afr47bqtXL3HeKhNHNKg+8nbFFWZREoTjHO/31/2SnuwZS26enQ7fIShvoafmJe4IL3Lv44K@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypyXZQn+5DbR2HqfhGeCiG+bez9bFJFmJEWjIaXr0LOlFq9272
 /YmSpZRuiXOwZj6MZ822pygTAF6LLxLp8UqVwIt2z9jVTofFDAgR6nv6
X-Gm-Gg: ASbGnct9hJlRJQsxUdFCttIzEwM8dD+kjp3GMentv5lhBlCrIcfRxHOg49ffyeiJEX3
 OTWIvKnGuDltI+89GpDfqrJWFQ8UXWB4g4/2lNCjZJgxLSd2cfvyfnVTndeixZH2xbAWqYOaO02
 Bg5rlbP/GYVuGGZXYF3FdPoZWr9t1bNBYxAx4hyE4ad7JFWQGuJmmLBAHOu4S4QRmj2g/AxyEn0
 vQYyncQZ7QXtEGgnCmFijCSq6qEivqIRXVm0j0j+4F2HgB79jvI3vZIi676wBcp3eYWi6hiiejF
 vNsG5BbbyBdMKNJ6mmfYP1UgvFcmAUJgPEQ59wazkD9qxbGVHLWokgr7ft8+w6Uqt6K4tCvmPAi
 ZtTyhsTfoU5RCWAMLM9jZ0QQrh2i9TbHoAn/eJIp0SLbPN+tbkvn2Nzsls1coUojQuCinwVo60+
 AAHQ==
X-Google-Smtp-Source: AGHT+IHgubDEoBo5SwwKlV7BEp7xGRXkCfl1MA6t15Y/tj05GEqe4gbfRTAzanGZnInCRSiMQrumQQ==
X-Received: by 2002:a05:6e02:2164:b0:3e3:d1ef:83f9 with SMTP id
 e9e14a558f8ab-3e416116d3fmr99926145ab.6.1754193589138; 
 Sat, 02 Aug 2025 20:59:49 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:48 -0700 (PDT)
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
Subject: [PATCH v4 52/58] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Sat,  2 Aug 2025 21:58:10 -0600
Message-ID: <20250803035816.603405-53-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 32cd8ac018c08..f0b5b57646727 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -27,6 +27,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.50.1

