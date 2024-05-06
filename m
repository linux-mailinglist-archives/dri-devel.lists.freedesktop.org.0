Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598028BD706
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 23:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C82510F7FE;
	Mon,  6 May 2024 21:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="FQhQZHo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A5410F7FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 21:53:47 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1ecc23e6c9dso13808295ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 14:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715032426; x=1715637226;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbe175V7J4mZKX1qbMhvDPfRMOR41WhVMQTZgQjYbwc=;
 b=FQhQZHo4VFbmlMfqEX/cXGhVn84LwTEa5V41YuGCTpSi309Bn/HHmtve6tHdirWOWz
 Nf+Nggc0c8Gj3IFRAUohcXNHoec1iry/U+cX7Rmu/JWJqfHiGhsUM/JYc9f6QY7H+4pm
 zUwDGXPirMmIGWlsyxQ35Qp8lDHDNXT5ZDWCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715032426; x=1715637226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qbe175V7J4mZKX1qbMhvDPfRMOR41WhVMQTZgQjYbwc=;
 b=S89P36Mrz61/ullPEYN1FRpk8+LpHxfM5+ZsxitpZN3R0tZzoSuYNgQWUV3n6a9fKH
 ze72S5n+QxW5x8TECVTd0W5cq+EbiuTLoQJr33iqmzgHKVcCp+ZV11ymkkHOxQsIXuIo
 cDKns+78Awbv2sGPMMsc+UnKFK0YH4wurBt6+SVgf9LxWY429XN1DcIHiWvWaCfS59+S
 CGpriF/JFznapxpCjMMFm++H1ftVFik0qJ1BtFLAaZH6KE9IeQ1Dadr+FWxkMcFu/RkU
 3J8Dxnw6doda+ak5BxfmHaqZU6wioZa/195VQkRxDOt1KCg8js54N4BhaUTBewU+qMKK
 RddA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7/iEchTdmyd+Pm+roccwTayd/fzTQWLvgKeqeFn62ZKgfx98wBDho8K0d8ylh7KKSwBSxYIT44Mtjprh71HThm9rt31eigFkVaOV1al6n
X-Gm-Message-State: AOJu0YwlW6E3T649Z43miZsqMg74gwPLhrNIWsWy40/f8kSnIsEva34L
 kKrQYo7qZxqlwVW4DE5H1GdzRha5r+0G1b5UQu9BZyXwG/JtPngLdzlAUwkVMg==
X-Google-Smtp-Source: AGHT+IF9KGLbu1mYoD5+HNwJ4RqC9puh1gLYMQgkGGUeZcF7dPV+YrdASSz/bi69CBBVXAU8JRj2Fg==
X-Received: by 2002:a17:902:ab8b:b0:1eb:156f:8d01 with SMTP id
 f11-20020a170902ab8b00b001eb156f8d01mr9782604plr.40.1715032426230; 
 Mon, 06 May 2024 14:53:46 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a170902f54800b001ed6868e257sm5664008plf.123.2024.05.06.14.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 14:53:45 -0700 (PDT)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 timothym@vmware.com, akaher@vmware.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Nadav Amit <nadav.amit@gmail.com>, Jeff Sipek <jsipek@vmware.com>
Subject: [PATCH v9 4/8] ptp/vmware: Use VMware hypercall API
Date: Mon,  6 May 2024 14:53:01 -0700
Message-Id: <20240506215305.30756-5-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240506215305.30756-1-alexey.makhalov@broadcom.com>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
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

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Nadav Amit <nadav.amit@gmail.com>
Reviewed-by: Jeff Sipek <jsipek@vmware.com>
---
 drivers/ptp/ptp_vmw.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 279d191d2df9..e5bb521b9b82 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -14,7 +14,6 @@
 #include <asm/hypervisor.h>
 #include <asm/vmware.h>
 
-#define VMWARE_MAGIC 0x564D5868
 #define VMWARE_CMD_PCLK(nr) ((nr << 16) | 97)
 #define VMWARE_CMD_PCLK_GETTIME VMWARE_CMD_PCLK(0)
 
@@ -24,17 +23,10 @@ static struct ptp_clock *ptp_vmw_clock;
 
 static int ptp_vmw_pclk_read(u64 *ns)
 {
-	u32 ret, nsec_hi, nsec_lo, unused1, unused2, unused3;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(ret), "=b"(nsec_hi), "=c"(nsec_lo), "=d"(unused1),
-		"=S"(unused2), "=D"(unused3) :
-		[port] "i" (VMWARE_HYPERVISOR_PORT),
-		[mode] "m" (vmware_hypercall_mode),
-		"a"(VMWARE_MAGIC), "b"(0),
-		"c"(VMWARE_CMD_PCLK_GETTIME), "d"(0) :
-		"memory");
+	u32 ret, nsec_hi, nsec_lo;
 
+	ret = vmware_hypercall3(VMWARE_CMD_PCLK_GETTIME, 0,
+				&nsec_hi, &nsec_lo);
 	if (ret == 0)
 		*ns = ((u64)nsec_hi << 32) | nsec_lo;
 	return ret;
-- 
2.39.0

