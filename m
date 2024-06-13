Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E9907C33
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC8010EB6A;
	Thu, 13 Jun 2024 19:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="WUOM3V1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF26E10EB75
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:17:47 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6316253dc2aso9799357b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718306267; x=1718911067;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvm0BsFAFI1cdP2yPyZHFfaL98AuxIoGBUiXiDXnc2A=;
 b=WUOM3V1BBs1WxMy6CsOFzuxNs85GppCc73EJM3ploQoLSPJeNpHK/Wr9dnWdBt3H2+
 xCsWeHSOgwjjSlaIa7GeMgvFcZcyXX+9zIIWC2lIGhsVuej8RHD0ONUWpXeQafWo+9X5
 y/AwBUp00zx9UMZULHp3wwbVCRUIX651+jPmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718306267; x=1718911067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvm0BsFAFI1cdP2yPyZHFfaL98AuxIoGBUiXiDXnc2A=;
 b=B6xjLpeoQSXftxiglFyDF7W9aqOGLQyxoYqBV1v6MWEMBrYtuSfWC7Oq607nA+m9m7
 ryNvNxhWvuJzC0aisfM0N+g3n7zaUqEp1P6yfD6i3DrtS6VGvKeOy/5ZRCDUzq192Pbq
 sAhRaF2HK0uQkzQiTlz1+Cz6aKpqV5N6MEBVP9FQQqOLADCam84a+qXp0wkDwEfwE8F/
 cnwmwXf1SN0bOOITQgVl5w8l33Vvlv4uSneJgsjI5IqW9+tFD8ced0oiamCA7iGT/c3W
 pwil9nkPAY90Z5LqgUQ9H7/P1Tw6tB9tYEc9kcYa062Pig8oUkjLFb9d+u6yXGE9oPSw
 9Ujg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZduqBC6SUTmUOU8ITNaxqBDoH8LHuhqEriIW1mWG4GJRx2V1q3/emz3oFMWXhbnW2NBT1V8StVk9+Y6xCgTGImtEA+hc7lqDr+gs5rLCa
X-Gm-Message-State: AOJu0YwPR1kyUiT/qT7rhlNlC3iyfH3VpOMca4v6NLcoBQAmcD1/e7qJ
 XQROAroUhHYEB3lU9+WBMCDsL7GD4N/fz8b5xMFVoF7sfaId3GfTjX24Vzhprw==
X-Google-Smtp-Source: AGHT+IFE9wLsZ7ENC3mJ6qucAwCj2u4sQKXs6B3ZL4fkGGOEpeG9V3zFRYPhrCcwGDxwPGGrlz4D+Q==
X-Received: by 2002:a81:8d13:0:b0:62f:b04c:2442 with SMTP id
 00721157ae682-63222070cafmr4181267b3.7.1718306266717; 
 Thu, 13 Jun 2024 12:17:46 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 12:17:46 -0700 (PDT)
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
Subject: [PATCH v11 7/8] x86/vmware: Remove legacy VMWARE_HYPERCALL* macros
Date: Thu, 13 Jun 2024 12:16:49 -0700
Message-Id: <20240613191650.9913-8-alexey.makhalov@broadcom.com>
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

No more direct use of these macros should be allowed.
vmware_hypercallX api still use new implementation of VMWARE_HYPERCALL
macro internally, but it is not exposed outside of the vmware.h.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 724c8b9b4b8d..d83444f03969 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -279,30 +279,4 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
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
2.39.4

