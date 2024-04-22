Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F88AD82A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 00:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA278112E0D;
	Mon, 22 Apr 2024 22:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="GmedYgP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28F5112E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 22:57:15 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ecee1f325bso4037229b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 15:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1713826635; x=1714431435;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbe175V7J4mZKX1qbMhvDPfRMOR41WhVMQTZgQjYbwc=;
 b=GmedYgP0WSCi+XRREwwhLOOYLhCqgPVMOCn97NfzqyP3snEUA3Oezt3ANcM3Y/0b0I
 pmI7zuGkP5iIOukHU/o7ty9X3ECIaFFSE6QQq8W8Zc9jLxGmIpsksqeHlBZv6sZQ9wrd
 X7nn7HYpAIB8MgcxCaD8y4sS6NXFn8bw1mu1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713826635; x=1714431435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qbe175V7J4mZKX1qbMhvDPfRMOR41WhVMQTZgQjYbwc=;
 b=VWh78tSasNz4Wvj52VsRF5T/EOWienWr7BIHNHg+plnUdkOMv9YLLac0VmzyB4DWk6
 FlK3pFRDB2fYejQ02tD2nZkCu/EBLVckEh+wlxT4LXBAFhNZEr5XUb6DV6oCF545E+W+
 ZeXynbPVV0uNZPD+PdIbo1yT3XjIZJcLmqILCbKXuFgIBEkImuxswk3gzb5W1z826tjh
 18UX6YgU7HNPwEhFiF86mKjrjHcankTuewgNBDbzjs/sheFZ99BAJYN4Wo8HMeP2WZ04
 9+xN+nHurWrsHkn8ZJYrGJB0NgmXN5RggvF5kNDAexKEoHCw8+IPZ4ojN7o4cHv7ajhj
 dl7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuCj+KskQTH5pNKsshGsN+ZqN5J+QB1Zs8zItZ//9WAbSn808M1dkkMZS1ON0kXEGB+N1/q7YSN80WxiY06v6I8ozYMKqExtaa/h2dabH/
X-Gm-Message-State: AOJu0YzRY7AoOYU+sUpchasJNb0QdooNM68na933z+jNyncCcrWqBQrd
 Y5MGWd/JAqBGbUTdXVazWM3gHwJkvYZpT1g7XVRAO5Cm+gyI19PkbL/VW5Ijig==
X-Google-Smtp-Source: AGHT+IEFR7KNfHlG9ODURmFuea8hUHKaNcbvVa/moCCwACPaA96hdooyXKpZmuNWh/BCyTnbNdW3EA==
X-Received: by 2002:a05:6a20:9484:b0:1aa:7097:49e2 with SMTP id
 hs4-20020a056a20948400b001aa709749e2mr13552908pzb.50.1713826635356; 
 Mon, 22 Apr 2024 15:57:15 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 e131-20020a636989000000b005e43cce33f8sm8093597pgc.88.2024.04.22.15.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 15:57:15 -0700 (PDT)
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
Subject: [PATCH v8 3/7] ptp/vmware: Use VMware hypercall API
Date: Mon, 22 Apr 2024 15:56:52 -0700
Message-Id: <20240422225656.10309-4-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240422225656.10309-1-alexey.makhalov@broadcom.com>
References: <20240422225656.10309-1-alexey.makhalov@broadcom.com>
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

