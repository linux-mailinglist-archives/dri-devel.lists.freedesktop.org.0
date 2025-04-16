Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1FA91506
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FAB10EA4C;
	Thu, 17 Apr 2025 07:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FaGXBAS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0344F10E86F;
 Wed, 16 Apr 2025 07:33:22 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-af6a315b491so5656507a12.1; 
 Wed, 16 Apr 2025 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744788802; x=1745393602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BHkkBSUEnJtBBjxdrXpYHYmA889tBVCePybNfFBjZCM=;
 b=FaGXBAS3L6BCT+zPYPQdH4p4BthJjOPM8e48gkHHyKbZ9tINJ2cJJJlIKc3oBFOMon
 9uRcPwSAnpx60Oc87WQhcsle6C2lPVICQHpXmbvUTqTdbzSxcg/Rm/NzbevTOm7yamal
 ddeswogx8APaPfFhEvBcdonqxM6hWNIBQvnAku5EOv6C+QikG5Ww0C2M1ZdsoY5jkqiG
 bGYXaKi6I+NF/d6YIQrl0dkCho3j2PDGWCv+ANnFyIo3nZVOyTVo3qUbmueV7pf59wkX
 r+mlktSoJSqSr2oXuoBboI8hADIMd7kjsMN5cFqLUfYlY9/8LdEDtmmetGdbhwV3PFlU
 4c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744788802; x=1745393602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BHkkBSUEnJtBBjxdrXpYHYmA889tBVCePybNfFBjZCM=;
 b=lmD48SnnG6EtVE/HiWLJtUl6cu7FUEBrfiH5NPOHTY7C87efcXwzylpurIrN96SNOE
 Ra4hcatmSWR5LsgQBkahepfA22hAZWR7bFokvP2F/GylxV/2k+jvGnUZg/ocHzeFGyjW
 1WkflwzupS/y0UV407H6Jlb6CL2H1SncJ6cGSYlyWOT4W3vCm/b4u0EaK4OCBxzD0YYz
 ANNRItBs3RIpzJ3rdnJrSjQiApaxl7w10nxjIFx3knf8wCFZ+VgVog/N7WkkDCmKFIW2
 3o9R2SHjgRQjp0P7ZusdzbcMeePNUxzx405hD9pBdshc9xe9EGW1czwlhQxx8vGyMKSh
 DC3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE1zifNmpH+AURj3V1UeiNQtfhcpu1r6E6iaRb9I6fUpyiClEA7kuytL2Fw0rBjiefkb8LNk03@lists.freedesktop.org,
 AJvYcCWJqEF4sorBQaaaWc+Jk+NpY7vKBMfY4nbmrczI27WUoIKyso9PNRzt8iQXDUr61Dhr4YaILaJM3exK@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx9XWe0tBCD5PuSh8phnoM9LFCH6etiAjc7DDtRd7WYCCvcBxJ
 vlZBVablMtHmJRPl66gEroVQA/OwJN2pQNAZu5mFRoSPk+DtbbQ=
X-Gm-Gg: ASbGncvvXprzEnjEJnNP/EIWJtVEHJvzMwSMmW0RxE7RBITqaKJiAy7ZtFruJYMJ3rE
 /BdwSsMalEUpcAETAvUkcMhcN7qQdv0j/uk2O3FpB+4MAplT88w0yspBsltgvHmWgTbPQO9E7Ak
 zFGSU+yaenpooD2HQDied3Zz8DdM8X+3Je7DFxHq7Y7Ns3NfDdaDv5avXCOhoBwZuqamffFCBoB
 40STCjzThiDsSh+aVsBsPT8tUyf+40bOxJYHSKjhVY5Cr0piXNEQPnuZwgR0Mlzf/kKqjZ4tJMy
 /wd+PJa9eHTlcirttolfUmozo0DeRMqWOf7nJtPt4C0EJOGMrw9p
X-Google-Smtp-Source: AGHT+IFLWgEp5oj4dvUn/SbRKIWaHPfRDLLf1Fv5DfWee3CnAQT0vY2xt1RkVb9UhgQN+Oqxzum4Aw==
X-Received: by 2002:a17:90b:5824:b0:2ee:f687:6acb with SMTP id
 98e67ed59e1d1-30863f1936cmr1284633a91.13.1744788802331; 
 Wed, 16 Apr 2025 00:33:22 -0700 (PDT)
Received: from debian.ujwal.com ([152.58.237.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-308611f3e51sm863339a91.16.2025.04.16.00.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 00:33:21 -0700 (PDT)
From: Ujwal Kundur <ujwal.kundur@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com,
 sunil.khatri@amd.com, Hawking.Zhang@amd.com, Jun.Ma2@amd.com,
 Yunxiang.Li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: [PATCH RFC] drm/amdgpu: Block userspace mapping of IO
Date: Wed, 16 Apr 2025 12:58:26 +0530
Message-Id: <20250416072825.3790-1-ujwal.kundur@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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

This is a RFC patch for blocking userspace mapping of IO register(s)
before ioremap() calls are made. Out of the available IRQ sources, CRTC
seemed the most appropriate for this task, however I'm not quite sure
about that as well as the type, which I've set to 0.

If I understand correctly, we actually want to block certain ioctls from
userspace that can interfere with ioremap but I don't see a dedicated
source for that.

Signed-off-by: Ujwal Kundur <ujwal.kundur@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a30111d2c3ea..365af52af6e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -47,6 +47,7 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/efi.h>
 #include "amdgpu.h"
+#include "amdgpu_irq.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_i2c.h"
 #include "atom.h"
@@ -4367,7 +4368,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	ratelimit_set_flags(&adev->throttling_logging_rs, RATELIMIT_MSG_ON_RELEASE);
 
 	/* Registers mapping */
-	/* TODO: block userspace mapping of io register */
+	/* Block userspace mapping of io register */
+	amdgpu_irq_put(adev, &adev->crtc_irq, 0);
+
 	if (adev->asic_type >= CHIP_BONAIRE) {
 		adev->rmmio_base = pci_resource_start(adev->pdev, 5);
 		adev->rmmio_size = pci_resource_len(adev->pdev, 5);
@@ -4380,6 +4383,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		atomic_set(&adev->pm.pwr_state[i], POWER_STATE_UNKNOWN);
 
 	adev->rmmio = ioremap(adev->rmmio_base, adev->rmmio_size);
+
+	amdgpu_irq_get(adev, &adev->crtc_irq, 0);
+
 	if (!adev->rmmio)
 		return -ENOMEM;
 
-- 
2.20.1

