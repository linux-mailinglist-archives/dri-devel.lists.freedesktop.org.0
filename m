Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE1828228
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3DE10E3C5;
	Tue,  9 Jan 2024 08:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4A810E3C5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:41:08 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-28bd623c631so2487735a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704789668; x=1705394468;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPJVwuu4FbYV5iHDsqoRPE2dBrY067QdoWIAplCPCFE=;
 b=bJzZMFCV/2UNYJ6O67uwgtrQQqhmB8SPG+T7u2p4D74LuvMhWQcmTNqxlx43giA1Do
 UIAIhBeIqiVM8C8WIBdjXkmViHdikxScCeB08L4+9YmoDgmhiJr4OJImsUY0e8vG1+Bh
 yhHY7JZ1IxAt6XNEsuMmChbWkU5hy4frdMC1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789668; x=1705394468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPJVwuu4FbYV5iHDsqoRPE2dBrY067QdoWIAplCPCFE=;
 b=gXNQJXRZ6DPJRno9jSvmsQ5NjteYkXyEEHTrQCWTEjOCuQFtnUZFKiJd46PkXSEstt
 xUvFmrlNRrPFAh9owjm7EoUuKOIkJohnewqKTy0xI35tbGYBXbNFvAaq9gwTZeMUW5RY
 ZYbkQK02XbfDDdm5nnJJVG8t8KSN5b8Ofu4ZuL27Hb0e5UfFUtgTDqyvQNZLp4hImjpW
 mVhrcyWvSacdQ7tUWB4wiLbIMJMOSKbyYkyBlWkYveVBnXJUHBPDlfEIaY5sWHUHb/NJ
 O/VguhqFpekH4Oreb6LpIR+sYln5rebu91oMMrfPJdq8Nb9AWLyl+IayYDDUbg5Jh23n
 2gBg==
X-Gm-Message-State: AOJu0YxcoPgvnbM4Gg6Qh41KNbhwj08/tCV6VywnyvlHbSJROdTDBqZA
 44wpk9CKAbsxA3+uKGd3B+6Bt33qI/Zc
X-Google-Smtp-Source: AGHT+IHAPtZomE9mWKHoozKKh5MePdVFthGgcxrjU58Rdxj6mVhm/Q5Fx+S7eOIDUdrTFXC0gW+1xQ==
X-Received: by 2002:a17:90a:c392:b0:28c:825e:2cf4 with SMTP id
 h18-20020a17090ac39200b0028c825e2cf4mr2891154pjt.41.1704789668319; 
 Tue, 09 Jan 2024 00:41:08 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 sf15-20020a17090b51cf00b0028d435cc2cbsm4772293pjb.15.2024.01.09.00.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:41:07 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
X-Google-Original-From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v6 3/7] ptp/vmware: Use VMware hypercall API
Date: Tue,  9 Jan 2024 00:40:48 -0800
Message-Id: <20240109084052.58661-4-amakhalov@vmware.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240109084052.58661-1-amakhalov@vmware.com>
References: <20240109084052.58661-1-amakhalov@vmware.com>
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
Cc: dmitry.torokhov@gmail.com, tzimmermann@suse.de, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 dri-devel@lists.freedesktop.org, horms@kernel.org, akaher@vmware.com,
 timothym@vmware.com, linux-graphics-maintainer@vmware.com, mripard@kernel.org,
 jsipek@vmware.com, linux-input@vger.kernel.org, namit@vmware.com,
 kirill.shutemov@linux.intel.com, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
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

