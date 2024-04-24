Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A28B16E7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 01:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5674113E93;
	Wed, 24 Apr 2024 23:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="cCEDZ67f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661B2113E93
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 23:14:28 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6ed9fc77bbfso372556b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714000468; x=1714605268;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aunCHk/+21TGD3cC0MnOgjQi+s2AopaplDfw/uAJlwA=;
 b=cCEDZ67fe1IHO02TGVtEK3Acdo2gZQaKA3Dhs7sgkcJyIY60Q2fDyQ1c0SUZeHR0C+
 zvQyHDxIBlLE23LB7WwdfF0C584SUC73fuLYjIH6+H5uCh3QvVBi9Zu/+fBQly4hOgCx
 NiTsEzza7dL/eKlmaBPqrOIZaHyNLwy7GunfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714000468; x=1714605268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aunCHk/+21TGD3cC0MnOgjQi+s2AopaplDfw/uAJlwA=;
 b=gFvyc9J4Yfg+c8LvI8t1Dnb1w4Blkt2gmJIs+DEceO333mk00OY+yiabOV0ZD+b98I
 REi/Xq0htKtgphG3wsFBdVSnh+OV2PZvtNi1HrBMMkJ44zaYPjgWtGhsUUmY1+kNcLxH
 3CiS6cGJd+LitzdHRfICHnEdJ1LoxAwl9vwd2LPrWyWpA7dDtDmd4EsbbFRT3Xmvi1U1
 3u95UsSzL+HUR4FHGXArQDT+PsTLlckh79jcamYHsQHqPM66sWvB+rSKimYIhmglDHQF
 0DSeUhtTuzlhdR1H5kYz1WcnnOVg3+pvYN+lOZRNVcwx3To/ZLDvMcHwOAy1biJXUcMR
 zXkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGm4F+251HnCJxyX+/2NTb9kYlTSnV4eGJGuVAKho1OFhRDMyVyyHUm+SLQAbBTgnEXjFRnXS0vKq0oPfRaFUPOmGSvfhZb/dfgr/2bwxe
X-Gm-Message-State: AOJu0YyhDgTFgKrSakvJbP+nnCxyIYcpdbeCpON8HytjzqfN3yZelaGC
 TDpOA27rXLptP1gWDMTB7ksAVqyTWZnKgH35qU9ROknqPpfZsPxwyaKNqxAUFg==
X-Google-Smtp-Source: AGHT+IHHdzGAXQ8gL0olZCSpi68pN5CG8/dpakkeGHeT/XAiJRJCeztoRovHlbGUOJO8Jirtf9fuow==
X-Received: by 2002:a05:6a20:9c8f:b0:1a9:8836:ae37 with SMTP id
 mj15-20020a056a209c8f00b001a98836ae37mr4530009pzb.12.1714000467703; 
 Wed, 24 Apr 2024 16:14:27 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([64.186.27.43])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170903111100b001e520495f51sm12383936plh.124.2024.04.24.16.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 16:14:27 -0700 (PDT)
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
Subject: [PATCH v9 1/8] x86/vmware: Correct macro names
Date: Wed, 24 Apr 2024 16:14:06 -0700
Message-Id: <20240424231407.14098-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <adcbfb9a-a4e1-4a32-b786-6c204d941e9f@broadcom.com>
References: <adcbfb9a-a4e1-4a32-b786-6c204d941e9f@broadcom.com>
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

VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. And move bit-shift
operation to the macro body.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 11f83d07925e..f58c8d669bd3 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -49,10 +49,11 @@
 #define VMWARE_CMD_GETVERSION    10
 #define VMWARE_CMD_GETHZ         45
 #define VMWARE_CMD_GETVCPU_INFO  68
-#define VMWARE_CMD_LEGACY_X2APIC  3
-#define VMWARE_CMD_VCPU_RESERVED 31
 #define VMWARE_CMD_STEALCLOCK    91
 
+#define GETVCPU_INFO_LEGACY_X2APIC           BIT(3)
+#define GETVCPU_INFO_VCPU_RESERVED           BIT(31)
+
 #define STEALCLOCK_NOT_AVAILABLE (-1)
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
@@ -476,8 +477,8 @@ static bool __init vmware_legacy_x2apic_available(void)
 {
 	uint32_t eax, ebx, ecx, edx;
 	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
-	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
-		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
+	return !(eax & GETVCPU_INFO_VCPU_RESERVED) &&
+		(eax & GETVCPU_INFO_LEGACY_X2APIC);
 }
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.39.0

