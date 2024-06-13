Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41F907C32
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE1510EB71;
	Thu, 13 Jun 2024 19:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="X9P3xsJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB78010EB6A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:17:42 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6301aa3a89eso16334747b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718306261; x=1718911061;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7pPcaHiPPoaU0LCl+3obAd9PjZsEURqyWYfZZD0IxMg=;
 b=X9P3xsJO4QvjJfxxI23OhC3AUN1dP4091X8rbhYe1Qyv6rE6JXv/xdK6UEMxBIauMB
 X9p1eBYsT+BFlaZJBeC0JEbc6RL+5z+Rv76v95WMa4AsmHgOi6EY/OB3OD8Kak0IDol8
 /qxkIotJR6Xk0ANRmmsQTAAXFHxYTDUj4pEbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718306261; x=1718911061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7pPcaHiPPoaU0LCl+3obAd9PjZsEURqyWYfZZD0IxMg=;
 b=gQvxq6pxbWoyV7Wsmni43sKI6NH1ylBBC/p7uOb0lZmG/0m7mHLuSLd1hEXGFw/7s6
 CYcanhve7pms8apefHQ4D3eAkphZntoBwHieJ133CY/z5U6+IDvz0sKkQoH7J31jksz2
 n9EfPdkK7sakXH3Z671aa7OXvNuKRW4SXUdFNoE1qFi38bHHbpZpaHxu/WFoRxrYiNGA
 guNeLTV+fPCyfqnVSpJo/23SGkrtWSXYtYkVtWW/jZsCY7NpPHtTxo0eH7UTY3Bs1e+t
 LBKNCzMA8p1jpBPRvDjIyvstv0mudeX+XLIdDUXcOd+ZNJbXuBGSinkY8L0zhEBatHkh
 4V2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd3/xj275UhdNfzFNaqg/3GdkLiJjfV0JnZekLinw3gwoVo0XR4pKTXakX0BhN7+cyUad444HJYDfTrat+48pGovShlfAhEAYBRYlRcOd/
X-Gm-Message-State: AOJu0YznPoxTjREqsVMtdpeyakQKPtEwLLMVdqUVLA4nU2qri6lrCLdO
 ceWMWoeqZQ6sc4btyuPvdqaoC9VMSxWDaFWuqgrWB2gqnpJSzRqEgprHNZ4AVA==
X-Google-Smtp-Source: AGHT+IEWURrmB3A2rOUKWL00yxGmIpKcgzJOWJY4x+5FfERXRFuKFdGultRWCA+8ZJ4Et9888+QB5w==
X-Received: by 2002:a81:e90b:0:b0:618:83a4:588e with SMTP id
 00721157ae682-63223d3b72emr4007287b3.37.1718306261554; 
 Thu, 13 Jun 2024 12:17:41 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 12:17:41 -0700 (PDT)
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
Subject: [PATCH v11 6/8] x86/vmware: Correct macro names
Date: Thu, 13 Jun 2024 12:16:48 -0700
Message-Id: <20240613191650.9913-7-alexey.makhalov@broadcom.com>
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

VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. And move bit-shift
operation to the macro body.

Fixes: 4cca6ea04d31c ("x86/apic: Allow x2apic without IR on VMware platform")
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index c0a3ffa9e023..d24ba03b30b8 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -42,8 +42,8 @@
 #define CPUID_VMWARE_INFO_LEAF               0x40000000
 #define CPUID_VMWARE_FEATURES_LEAF           0x40000010
 
-#define VMWARE_CMD_LEGACY_X2APIC  3
-#define VMWARE_CMD_VCPU_RESERVED 31
+#define GETVCPU_INFO_LEGACY_X2APIC           BIT(3)
+#define GETVCPU_INFO_VCPU_RESERVED           BIT(31)
 
 #define STEALCLOCK_NOT_AVAILABLE (-1)
 #define STEALCLOCK_DISABLED        0
@@ -473,8 +473,8 @@ static bool __init vmware_legacy_x2apic_available(void)
 	u32 eax;
 
 	eax = vmware_hypercall1(VMWARE_CMD_GETVCPU_INFO, 0);
-	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
-		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
+	return !(eax & GETVCPU_INFO_VCPU_RESERVED) &&
+		(eax & GETVCPU_INFO_LEGACY_X2APIC);
 }
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.39.4

