Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F415C907C2A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1869210EB6D;
	Thu, 13 Jun 2024 19:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Vsw2lqcR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A4B10EB6D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:17:21 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6b06446f667so7669856d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718306240; x=1718911040;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ax+3nG0Kdev/eny6WkBwEporcnkaWtjPbwWuGAk8XSQ=;
 b=Vsw2lqcR9r5MbANgldsuH2gqI/npMnPGu5DrycpYHiTEdo8viy8OkJwv8nwmg+QoWd
 rrlw/ixI2vDumwkYTWhWStobhBi06jmUuJZx0EOZdSTuYx/aA27sXQrFALzRHRSfwUPC
 Uz3Wls1hcOpV0eDVHl6ScAlskmg/UOLH0SVSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718306240; x=1718911040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ax+3nG0Kdev/eny6WkBwEporcnkaWtjPbwWuGAk8XSQ=;
 b=D/c+niNcMLiiHt8YitX7dJtF6OzsBmaw4Zu62/swYrR+CYr6dAwm4E+cTsfgDW1V2m
 LaTEPgc67ASdI2Tals39E7nfa/kcSaRmSSPrry3U75PJ412RR23yy9KqR7pd+R5VjZ74
 WTwA7nx60+oUNWqCCUpF1eIw8WH9MjeYH3W3+ysqfsNNb44hME74ATJ+WRVaZNtu66Qc
 Y3C2AYDAV2/JXzwxw3V5P/+bh/1N8UD9WposoKkMHz46S8d8fiY8QyYN/7H/eFOXnd00
 S85LoV9xlNIRXTXr4TdYU6WVF2wt3ejsCAT534CcIGhNTrgAurgeEr7ND4vwinR7jF29
 hszQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZqSJmIGtPoPZXFroVzr18HCy23g6FWIMvMl4txHYh3ELaXit4KHTB31PQDZzTucs7d87EWugrgEuVusnrqdvhu7Rwv8kPIrwUZeirS5+b
X-Gm-Message-State: AOJu0Yymiqs5ksqgxfh3EHatygUJ344muWhwAH0vjjsIKXTop5Uq1wLv
 Zqp9GbS9KHUc90DJMtCQjUVP+87PCzZMVTlsFPB6UsQp4CDW3hfS7wRsKAMp1Q==
X-Google-Smtp-Source: AGHT+IEeXpn3Ttz0XbsYPXByW9dR39UVsdwJC6JosUg+iPFfKoIf29zQxFw7l7oJP0aQ82f3abYR7Q==
X-Received: by 2002:ad4:5a03:0:b0:6b2:b054:c64a with SMTP id
 6a1803df08f44-6b2b054c6c8mr4382156d6.1.1718306240532; 
 Thu, 13 Jun 2024 12:17:20 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 12:17:20 -0700 (PDT)
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
Subject: [PATCH v11 2/8] ptp/vmware: Use VMware hypercall API
Date: Thu, 13 Jun 2024 12:16:44 -0700
Message-Id: <20240613191650.9913-3-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
References: <20240613191650.9913-1-alexey.makhalov@broadcom.com>
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
2.39.4

