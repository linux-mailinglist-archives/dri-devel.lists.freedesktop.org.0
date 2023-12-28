Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A281FAA1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 20:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022F610E148;
	Thu, 28 Dec 2023 19:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7EC10E141
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 19:24:45 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-594e894a5eeso664860eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 11:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703791484; x=1704396284;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdRA67GFcUxloyx4tvXG24BR0us5wKd/dCuK68J3MHc=;
 b=UtOVzMQGKB7Upwphc+ywPPDjYs5Bfiq6NlLpef8JDPrdDs4rLuy9xBqmsuiBpjm2gu
 VM0/ih2JcuGM7YgD9OhO70XkResO2uVobHyUWZqhYPhiUNMBi8fcuJcdBZhwuuNqSnuD
 6ASfpd7Ls0EEPUQgMRGDEJl5NGu6dI0DFr/HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703791484; x=1704396284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bdRA67GFcUxloyx4tvXG24BR0us5wKd/dCuK68J3MHc=;
 b=APlvmsW2jIvV8VFPXdCNyR4PV+5f/b/XEHK3ngw2t+m3h0PQPAWIAay3g9Eq1SZZTr
 SlFEbe+Yp+fF6vhSNh2FGUAiaAcIvJUrqq+f2GbyAPsZjzqQ11Ut4cs8pBmtBNsGpBwp
 XFSMfGEJr+JzfUQtxaSpLiF20D7K8VPvyutgYwsIgsYHDcUbJfBbvpYKTnpjiDeB43gZ
 c6Fr6dqNtELJeSxIFv/t3T7R+PBu9Ao9Aa1jAF9WtZmIh4KDXiUp0zQjbHtiYKku99US
 jJP2/ylE/BSTvf7C1cs/V5kvObtstQhCLkh7cMnG/Gki5erUAL23CqfLsrPb2gcoVzj8
 K8cg==
X-Gm-Message-State: AOJu0Yzn9M+AOkXDj1xRLjHceG2vsL/9bBKR3Njnej5f8i9Ma8oFWf94
 YmC/JcTCY8WbNPfXKEFj3adrcI0Cu7DX
X-Google-Smtp-Source: AGHT+IGHYW0xYeyV3d3r2997V8Recw3s/K6MrDUwDBVQ7/8JTxUclwzguPNHYesx6/e0rfKwu0U8Qw==
X-Received: by 2002:a05:6358:103:b0:174:dc10:e528 with SMTP id
 f3-20020a056358010300b00174dc10e528mr5198591rwa.39.1703791484151; 
 Thu, 28 Dec 2023 11:24:44 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 k16-20020aa79990000000b006d9aa04574csm9522987pfh.52.2023.12.28.11.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 11:24:43 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v4 3/6] ptp/vmware: Use VMware hypercall API
Date: Thu, 28 Dec 2023 11:24:18 -0800
Message-Id: <20231228192421.29894-4-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231228192421.29894-1-alexey.makhalov@broadcom.com>
References: <20231228192421.29894-1-alexey.makhalov@broadcom.com>
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
 kirill.shutemov@linux.intel.com, airlied@gmail.com, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexey Makhalov <amakhalov@vmware.com>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Jeff Sipek <jsipek@vmware.com>
---
 drivers/ptp/ptp_vmw.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 27c5547aa8a9..e5bb521b9b82 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -14,7 +14,6 @@
 #include <asm/hypervisor.h>
 #include <asm/vmware.h>
 
-#define VMWARE_MAGIC 0x564D5868
 #define VMWARE_CMD_PCLK(nr) ((nr << 16) | 97)
 #define VMWARE_CMD_PCLK_GETTIME VMWARE_CMD_PCLK(0)
 
@@ -24,15 +23,10 @@ static struct ptp_clock *ptp_vmw_clock;
 
 static int ptp_vmw_pclk_read(u64 *ns)
 {
-	u32 ret, nsec_hi, nsec_lo, unused1, unused2, unused3;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(ret), "=b"(nsec_hi), "=c"(nsec_lo), "=d"(unused1),
-		"=S"(unused2), "=D"(unused3) :
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

