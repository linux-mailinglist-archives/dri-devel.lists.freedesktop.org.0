Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1108CDAA2
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 21:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6153A10F24F;
	Thu, 23 May 2024 19:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Eaec/ucg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873D210EF72
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 19:15:44 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6aa282ece86so15304336d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716491743; x=1717096543;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4QGCJNvGWko8B9wup6iwCm4c9keuD69o33VzvSan8uM=;
 b=Eaec/ucgB6H/ZF9GRFTX/7MarisiIlb7uwOjcNjQBHG87/O6GEEyT/n4Lrcs8mnN0V
 APwEGZ2yzvEjzm+0M111E73ql5ak5IepyTvvmxNedfThGdPR8vtTEhnRHUGpu/uww58Z
 E+BsS3uzSnGP0hayT3CH4eM3/0C+e/YVyy8vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716491743; x=1717096543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4QGCJNvGWko8B9wup6iwCm4c9keuD69o33VzvSan8uM=;
 b=Qt2uNeTy16rD0y9oPdehN2hzt6Nfi5k3lNdDHPmtm4c2udYSCJf1MWCILHFF3Gx7MC
 VRa8c8GiMIDctkr9EtdiCLmOzYvXqZ+eYqraaWFEDh+sD9AJGmzrhl5zMRCTD/cccYL1
 eQTzXuWYSPP0E2L9pr52wFUlwi/qlGoL+RQCEmdrEofXTEaD/HdH/6mhcMK+X3fQo+2F
 YyEe0HGVHpJHGWcJTSZkZrUBkQKpwdDlsfgt8kCoo6uBADMglV4ioHhAjZCLOOlCOh1R
 O4yvyYv7KwgiSkMYqOBOqrtqjOqI/AyM4niXl2NMFFa4ypgcncIhUPmMHbFCABjxJitI
 cM2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKZ98o10fZBIuNo7zCUh7W5NWquLZd3IhX9t6gzbpeG7Fc6sgu/vyzgAiEkyV4RHD2pqinQfC+Y3ZkD7ECgU+TfgbK8hWPzARwIhZE0oaM
X-Gm-Message-State: AOJu0YxqcfkLZ4OjFV0CN/utv9ZFZb2XhJRsw7EwKU3zWhlGNvrmhu4F
 0l2DaUhJ2NhSUR8xVr1ZnY9yh64VuYd1x2f7W1v6wtKw5teQZg6pdDkRLghdIQ==
X-Google-Smtp-Source: AGHT+IGCAtfhhWo6Rlq59zoTSeJjZRf1YXbHOspqfLPOVEnivKrPPVuS9RVtKABc8sYtmtvtPHf0hQ==
X-Received: by 2002:a05:6214:4888:b0:6a0:cbeb:c5c0 with SMTP id
 6a1803df08f44-6abcd0d7813mr50266d6.55.1716491743143; 
 Thu, 23 May 2024 12:15:43 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e4a89b61dsm21219821cf.45.2024.05.23.12.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 12:15:42 -0700 (PDT)
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
Subject: [PATCH v10 7/8] x86/vmware: Remove legacy VMWARE_HYPERCALL* macros
Date: Thu, 23 May 2024 12:14:45 -0700
Message-Id: <20240523191446.54695-8-alexey.makhalov@broadcom.com>
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

No more direct use of these macros should be allowed.
vmware_hypercallX api still use new implementation of VMWARE_HYPERCALL
macro internally, but it is not exposed outside of the vmware.h.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 5114f4c75c54..78567920b23f 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -274,30 +274,4 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 #undef VMW_BP_CONSTRAINT
 #undef VMWARE_HYPERCALL
 
-/* The low bandwidth call. The low word of edx is presumed clear. */
-#define VMWARE_HYPERCALL						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT) ", %%dx; " \
-		      "inl (%%dx), %%eax",				\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
-
-/*
- * The high bandwidth out call. The low word of edx is presumed to have the
- * HB and OUT bits set.
- */
-#define VMWARE_HYPERCALL_HB_OUT						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep outsb",					\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
-
-/*
- * The high bandwidth in call. The low word of edx is presumed to have the
- * HB bit set.
- */
-#define VMWARE_HYPERCALL_HB_IN						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep insb",					\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
 #endif
-- 
2.39.0

