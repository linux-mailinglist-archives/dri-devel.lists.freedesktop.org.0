Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C185907C36
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773BA10EB76;
	Thu, 13 Jun 2024 19:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gvamEW5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162D410EB75
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:17:53 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6adc63c2ee0so7594256d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718306272; x=1718911072;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U6QyinaOFJqkp/FwCYbZM2RK9dvc3sFq+NiGTtbWdDw=;
 b=gvamEW5eKuJ6St3xVLdWxbDCSwNhOkZjT4DWi2YF9Z20bSj52Xmj2CErRWphQXJz2M
 OxVT+Tgsb+9/eH63ht3qSRbySy/+QQ6xTkRtrKYxdH3VlzeSV2l5QuD6ERPjTGEgsCQq
 SxkS34X1XpBUIdfyzZTcLGJBZTovWp/isp2Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718306272; x=1718911072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U6QyinaOFJqkp/FwCYbZM2RK9dvc3sFq+NiGTtbWdDw=;
 b=VM+SaMdN1wzuFmlPuSiaTxFaIB3tiL3BoY9unIa+/wlHBhOUO2hF/XgJVbzeTZR0aD
 C7Vk8PYl542MWcC5SrFaIkJJhch0DhL64Rny2TGtRrBTvbkiyHMcBWw6jCubpqCN4Xtb
 DkI7Hvt0F+29SAdob5WYyGVwu6jD+VRCuus31DCsirMWVIr2u0vpRxatnd9/9z/V6gez
 Q+zRAiD+MNEgHhxq60XenmCoP3FotTQVaxWRfA4arM69Ro4XhYrC1MjJ6TQSLoPNtNPC
 DFdsZqwjpKlRVJO09goek5Vsz0MrYVDF+PPHds7ZOcirR6tiTGHckifj82+oJiOP+6k7
 kk5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs9dp2lvor0hg/y/Gx8PdCmmRkqqV9vWlMlEAxtHX45Vyb6vBY8hBWPU2tZdKUM07zi8MtDc/PZXCwepepztJFl2xVrLA3XxMROGojL5cc
X-Gm-Message-State: AOJu0YwO5fDUXaKtW8XMkHaG+aOnje9iiM6yyvjawXTMmDk0MZu0li+X
 r/JlzqDTxqreWToaNRWsR5IzEii0PaRYzunkDt2ByvaW3Ypd7C/bNxPWhvU+oA==
X-Google-Smtp-Source: AGHT+IEhHo4/bVvLX5CCRFwAPWXs+0Q6azIN2QMKWV00z/494lBSBlAsOpG3aNUM+fwFk0Vdxltj4A==
X-Received: by 2002:a05:6214:cab:b0:6b0:6443:7fcb with SMTP id
 6a1803df08f44-6b2afc793b7mr7504386d6.10.1718306272057; 
 Thu, 13 Jun 2024 12:17:52 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 12:17:51 -0700 (PDT)
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
 Tim Merrifield <tim.merrifield@broadcom.com>
Subject: [PATCH v11 8/8] x86/vmware: Add TDX hypercall support
Date: Thu, 13 Jun 2024 12:16:50 -0700
Message-Id: <20240613191650.9913-9-alexey.makhalov@broadcom.com>
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

VMware hypercalls use I/O port, VMCALL or VMMCALL instructions.
Add __tdx_hypercall path to support TDX guests.

No change in high bandwidth hypercalls, as only low bandwidth
ones are supported for TDX guests.

Co-developed-by: Tim Merrifield <tim.merrifield@broadcom.com>
Signed-off-by: Tim Merrifield <tim.merrifield@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 45 +++++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c  | 51 +++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index d83444f03969..c9cf43d5ef23 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -18,6 +18,12 @@
  * arg2 - Hypercall command
  * arg3 bits [15:0] - Port number, LB and direction flags
  *
+ * - Low bandwidth TDX hypercalls (x86_64 only) are similar to LB
+ * hypercalls. They also have up to 6 input and 6 output on registers
+ * arguments, with different argument to register mapping:
+ * %r12 (arg0), %rbx (arg1), %r13 (arg2), %rdx (arg3),
+ * %rsi (arg4), %rdi (arg5).
+ *
  * - High bandwidth (HB) hypercalls are I/O port based only. They have
  * up to 7 input and 7 output arguments passed and returned using
  * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
@@ -54,6 +60,12 @@
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
+/*
+ * Hypercall command mask:
+ *   bits [6:0] command, range [0, 127]
+ *   bits [19:16] sub-command, range [0, 15]
+ */
+#define VMWARE_CMD_MASK			0xf007fU
 
 #define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
 #define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
@@ -64,6 +76,15 @@ extern unsigned long vmware_hypercall_slow(unsigned long cmd,
 					   u32 *out1, u32 *out2, u32 *out3,
 					   u32 *out4, u32 *out5);
 
+#define VMWARE_TDX_VENDOR_LEAF 0x1af7e4909ULL
+#define VMWARE_TDX_HCALL_FUNC  1
+
+extern unsigned long vmware_tdx_hypercall(unsigned long cmd,
+					  unsigned long in1, unsigned long in3,
+					  unsigned long in4, unsigned long in5,
+					  u32 *out1, u32 *out2, u32 *out3,
+					  u32 *out4, u32 *out5);
+
 /*
  * The low bandwidth call. The low word of %edx is presumed to have OUT bit
  * set. The high word of %edx may contain input data from the caller.
@@ -79,6 +100,10 @@ unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    NULL, NULL, NULL, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
 					     NULL, NULL, NULL, NULL, NULL);
@@ -100,6 +125,10 @@ unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    out1, out2, NULL, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
 					     out1, out2, NULL, NULL, NULL);
@@ -121,6 +150,10 @@ unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
+					    out1, out2, out3, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
 					     out1, out2, out3, NULL, NULL);
@@ -143,6 +176,10 @@ unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, in4, in5,
+					    NULL, out2, NULL, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
 					     NULL, out2, NULL, NULL, NULL);
@@ -167,6 +204,10 @@ unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, 0, 0,
+					    NULL, out2, out3, out4, out5);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, in3, 0, 0,
 					     NULL, out2, out3, out4, out5);
@@ -191,6 +232,10 @@ unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall(cmd, in1, in3, in4, in5,
+					    out1, out2, out3, NULL, NULL);
+
 	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
 		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
 					     out1, out2, out3, NULL, NULL);
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index d24ba03b30b8..708048b8a095 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -477,6 +477,57 @@ static bool __init vmware_legacy_x2apic_available(void)
 		(eax & GETVCPU_INFO_LEGACY_X2APIC);
 }
 
+#ifdef CONFIG_INTEL_TDX_GUEST
+/*
+ * TDCALL[TDG.VP.VMCALL] uses %rax (arg0) and %rcx (arg2). Therefore,
+ * we remap those registers to %r12 and %r13, respectively.
+ */
+unsigned long vmware_tdx_hypercall(unsigned long cmd,
+				   unsigned long in1, unsigned long in3,
+				   unsigned long in4, unsigned long in5,
+				   u32 *out1, u32 *out2, u32 *out3,
+				   u32 *out4, u32 *out5)
+{
+	struct tdx_module_args args;
+
+	if (!hypervisor_is_type(X86_HYPER_VMWARE)) {
+		pr_warn_once("Incorrect usage\n");
+		return ULONG_MAX;
+	}
+
+	if (cmd & ~VMWARE_CMD_MASK) {
+		pr_warn_once("Out of range command %lx\n", cmd);
+		return ULONG_MAX;
+	}
+
+	args.rbx = in1;
+	args.rdx = in3;
+	args.rsi = in4;
+	args.rdi = in5;
+	args.r10 = VMWARE_TDX_VENDOR_LEAF;
+	args.r11 = VMWARE_TDX_HCALL_FUNC;
+	args.r12 = VMWARE_HYPERVISOR_MAGIC;
+	args.r13 = cmd;
+	args.r15 = 0; /* CPL */
+
+	__tdx_hypercall(&args);
+
+	if (out1)
+		*out1 = args.rbx;
+	if (out2)
+		*out2 = args.r13;
+	if (out3)
+		*out3 = args.rdx;
+	if (out4)
+		*out4 = args.rsi;
+	if (out5)
+		*out5 = args.rdi;
+
+	return args.r12;
+}
+EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
+#endif
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 static void vmware_sev_es_hcall_prepare(struct ghcb *ghcb,
 					struct pt_regs *regs)
-- 
2.39.4

