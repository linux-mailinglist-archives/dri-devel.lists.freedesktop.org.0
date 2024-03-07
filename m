Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B87875947
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 22:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241510EBC0;
	Thu,  7 Mar 2024 21:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PLOOAu4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3A310EBC0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 21:30:05 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e622b46f45so160176b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 13:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1709847005; x=1710451805;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Feyhzg/TR2GQbj1o1biQfDTvdEbNWX0xziUVAK97Nvg=;
 b=PLOOAu4RsC+FPEdZs9QwRf58kSJeEv4th1CM+Vle5QdwsDJt2FTL5iFnO/bgKPUalf
 QGOMy3jmfE+WzKa27S1n1xOcacOF+Y+rthy49FQ4FYMId5zfQHXd+a4HPFqoP4MHtKjx
 N4BKKbmK3jN20IvdALRm1rCljCCcKXv25bFXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709847005; x=1710451805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Feyhzg/TR2GQbj1o1biQfDTvdEbNWX0xziUVAK97Nvg=;
 b=PnmRsNUCDZMObKDzd6RmNVzwLbzJZmXCErSiSOpmYcYjE/bGMfbLXoV6Nk0Ro3HIiQ
 WG+jvJM0DmIoJ/sYJUILIPip9/ThhSx0DnIzwUAzm3abn/a6A0qz4cRc2AZnqTRdm1Wd
 cOQV2uwrWww+GUSHcg/WZ0h1rO85TYF99BLZFLBYZ3EkCL95Dxeo6yFw3VmaeiV++k5b
 jTmRS4lcn7Om1SgLZtSyaq0OPW6GvhbHwqGdxqhE7I1B4h8VHD2v5R4uF/X27lX0t04b
 tuWnH+VfDDdDpOZOEtR/h0EySEvtW+hTEstCgNoZ39+z/d3G//oXdOKQq7D2h8Rd3bbO
 OasQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd5YzJIdrZq/rGMFV3CUfmlJPHxgGpGv8J7v5g0YFW6rWNYSE2kGjc/uoGissdbA+UI4YIRv5udRSB1GR4Cq7Gw+m5N5dm+bRc+OHoAb2e
X-Gm-Message-State: AOJu0Yw6uKXWhMhdw0MYZtDTiAe4TYzNf02p+r8mrABVwGo39u/xGMbu
 dNtvL2oTNcot3wCNvOUq8RqDHqvzHdDD+FbAOHXkqRpZux+qo/m9Esnk7joWQQ==
X-Google-Smtp-Source: AGHT+IH9OHYBQPXQb7OICX+HbM6+SdDdiit+wioICdr/cHaeFQ14VaIDLC5V3mR+Gh0DgUqUIeZdxg==
X-Received: by 2002:a05:6a21:78a7:b0:1a1:3ecb:5303 with SMTP id
 bf39-20020a056a2178a700b001a13ecb5303mr9695877pzc.0.1709847005037; 
 Thu, 07 Mar 2024 13:30:05 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([64.186.27.43])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a17090abd0c00b00299db19a81asm1991021pjr.56.2024.03.07.13.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 13:30:04 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Cc: x86@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 namit@vmware.com, timothym@vmware.com, akaher@vmware.com,
 jsipek@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, horms@kernel.org,
 kirill.shutemov@linux.intel.com
Subject: [PATCH v7 3/7] ptp/vmware: Use VMware hypercall API
Date: Thu,  7 Mar 2024 13:29:45 -0800
Message-Id: <20240307212949.4166120-4-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
References: <20240307212949.4166120-1-alexey.makhalov@broadcom.com>
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

From: Alexey Makhalov <amakhalov@vmware.com>

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

