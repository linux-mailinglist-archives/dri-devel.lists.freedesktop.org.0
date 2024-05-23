Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A28CDA99
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 21:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D001C10ED85;
	Thu, 23 May 2024 19:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PAwEOnQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12FC10E1D8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 19:15:16 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-43e23ce7b07so36223831cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716491716; x=1717096516;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uHMYUJYhS9fLzUcof3ntSmUnLahUe/mGFjgJPys0Prk=;
 b=PAwEOnQfAJeonrhJkHaRrsq2sm7Hhm4PhEaPp8IEw0RyHzxqKBCaxdLi5O6eI/gRR3
 YHt+SHt6ocDAtb0aOAez2hBwIesqcxRLrXF+oLVV4HjkILQlN9N3uixhsVWIOIBsUZ3R
 xq8z7NsWJnMOhFI7q4mj8SzR2dSIDU3goA0EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716491716; x=1717096516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHMYUJYhS9fLzUcof3ntSmUnLahUe/mGFjgJPys0Prk=;
 b=SRVo67f3wMPjTTSTszDf64jnJkmrpUeygbKP+c/2a8Q7Ix4S/SOfNH2hBcyHdgT+o4
 kuJyyisUfA5syRig4xUws1lVSMG0ATmnxlz2R9pjpZqjA9nMsOyIicCNcVas8jNq1BSi
 /B9FgBwXHqmYxTHfhXsWj4/PXd6pHZT97L6p11INMLbFUTw9VU6hyNAxRXb03tVHafQQ
 UQYglQ7MoZFVIVkq7Ze1wVNwdQd5N92KWbupkfWA0w0FyAg4LcFKUdEY4TuzSSqsRfrh
 CRJq3D71nGawTeYCTBDfA3PiZdT6xo0a2Eo2PONZHL+Ho9h9PXARn6e+o4nwFipC85K0
 63dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfUjcp9fsNrIBBMZUdsmukfmk9XAP2X8IXFlKLJ3laoynVUCb8kY8O57ShlCdHz4Rsfcpss+cxGA+TGmXeECYpDCV7rI20h59WFApvI1V6
X-Gm-Message-State: AOJu0Yy9bjgMcYsqHCaAvnotyL4F5c+fJ1qECYUSnzDmaAKQ5gQaU6q9
 +ikA2743FECQh8PlzxbRsUjLwcfxIDEtdeYZMxgNc5tTsGmWj597J6Gd/+yd4Q==
X-Google-Smtp-Source: AGHT+IFaSpHOaQG+6UeUCtVGRI/ILrUKTLrw9mZL+0TgADU5BA3XN+dK8zNwM9U3mMN6EkgRA6eSzw==
X-Received: by 2002:a05:622a:1650:b0:43a:f441:75ab with SMTP id
 d75a77b69052e-43fb0e64ca6mr342501cf.22.1716491715608; 
 Thu, 23 May 2024 12:15:15 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e4a89b61dsm21219821cf.45.2024.05.23.12.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 12:15:15 -0700 (PDT)
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
 Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: [PATCH v10 2/8] ptp/vmware: Use VMware hypercall API
Date: Thu, 23 May 2024 12:14:40 -0700
Message-Id: <20240523191446.54695-3-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
References: <20240523191446.54695-1-alexey.makhalov@broadcom.com>
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
---
 drivers/ptp/ptp_vmw.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 7ec90359428a..20ab05c4daa8 100644
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

