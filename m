Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C408192A3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 22:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA9110E265;
	Tue, 19 Dec 2023 21:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A82810E265
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 21:58:18 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d32c5ce32eso1017445ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703023098; x=1703627898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nM0koGqiZNSpnJMYJB5q6p5i94HTaqJ4gpyX8NFfI6c=;
 b=bj/DlYPN1amoZSjaDEIAGvbdIGYLHzw9bFRappOKqS9yC7BwR6uoCrnJMAGwSDLPKm
 q4pANUNIpXE9ONyAyMnF9+Lfmn3MgrSvdBKWgKiu6wJ1yWsUfW3tHidN6MWohkMc+9cz
 HydonZvlmJvj62LNR53vytQsc1UEcYYnicUzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703023098; x=1703627898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nM0koGqiZNSpnJMYJB5q6p5i94HTaqJ4gpyX8NFfI6c=;
 b=ZGJ9tZbcR8Y3DjCgIQd76mmHf5ier2ouCeySj+mRVP9NxabpqYAX/oRLGciIOTN83b
 nXrYAtiXGgGRf+oyC3fjLhstOTVAxyA/Bwk08TLnOHQiZUiwvYNV8+h6+5+9t9Nr91ni
 R9fLg3cd0EJqhfLsGsErX+NzZtEDRDhCQBT/OZKPPJRmS5SjGImAB54tjIIPI9/f3nwM
 rh9GhTehlBpq5E/UdYNRnQrzPHyaQDdnaC1GmGjEtQnuSsVHISUY3UV6TVtMOlLRPslD
 ylIWKlOKen1DU6HlAaH4Y+PT382wNxPy+y4/CXOvSVSLcROTtW+AA3DDRG3268qixjGb
 14OA==
X-Gm-Message-State: AOJu0YwoTtTH048rWZCPPbi70lsiLoD2gUp4YmOCUTmInS8mbyFMTd8e
 v3ZxllRulWYxuAlHK7+YgJMpmQ==
X-Google-Smtp-Source: AGHT+IFuq1D+imdWMdT2mP3dQ4nuRY71YwfaZHC02g8v1eOnQNRqZN/WTfEUmhHy3daf/RPFRuykmQ==
X-Received: by 2002:a17:903:238e:b0:1d3:e694:c20 with SMTP id
 v14-20020a170903238e00b001d3e6940c20mr1556985plh.43.1703023097808; 
 Tue, 19 Dec 2023 13:58:17 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170902e8c100b001d3aa7604c5sm5356476plg.0.2023.12.19.13.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 13:58:17 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v3 6/6] x86/vmware: Add TDX hypercall support
Date: Tue, 19 Dec 2023 13:57:51 -0800
Message-Id: <20231219215751.9445-7-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
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

VMware hypercalls use I/O port, VMCALL or VMMCALL instructions.
Add __tdx_hypercall path to support TDX guests.

No change in high bandwidth hypercalls, as only low bandwidth
ones are supported for TDX guests.

Co-developed-by: Tim Merrifield <timothym@vmware.com>
Signed-off-by: Tim Merrifield <timothym@vmware.com>
Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
---
 arch/x86/include/asm/vmware.h | 83 +++++++++++++++++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c  | 24 ++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 719e41260ece..cad6f5b371a8 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -34,12 +34,65 @@
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
+/*
+ * Hypercall command mask:
+ *   bits[6:0] command, range [0, 127]
+ *   bits[19:16] sub-command, range [0, 15]
+ */
+#define VMWARE_CMD_MASK			0xf007fU
 
 #define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
 #define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
 
 extern u8 vmware_hypercall_mode;
 
+#define VMWARE_TDX_VENDOR_LEAF 0x1af7e4909ULL
+#define VMWARE_TDX_HCALL_FUNC  1
+
+extern unsigned long vmware_tdx_hypercall(unsigned long cmd,
+					  struct tdx_module_args *args);
+
+/*
+ * TDCALL[TDG.VP.VMCALL] uses rax (arg0) and rcx (arg2), while the use of
+ * rbp (arg6) is discouraged by the TDX specification. Therefore, we
+ * remap those registers to r12, r13 and r14, respectively.
+ */
+static inline
+unsigned long vmware_tdx_hypercall_args(unsigned long cmd, unsigned long in1,
+					unsigned long in3, unsigned long in4,
+					unsigned long in5, unsigned long in6,
+					uint32_t *out1, uint32_t *out2,
+					uint32_t *out3, uint32_t *out4,
+					uint32_t *out5, uint32_t *out6)
+{
+	unsigned long ret;
+
+	struct tdx_module_args args = {
+		.rbx = in1,
+		.rdx = in3,
+		.rsi = in4,
+		.rdi = in5,
+		.r14 = in6,
+	};
+
+	ret = vmware_tdx_hypercall(cmd, &args);
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
+	if (out6)
+		*out6 = args.r14;
+
+	return ret;
+}
+
 /*
  * The low bandwidth call. The low word of edx is presumed to have OUT bit
  * set. The high word of edx may contain input data from the caller.
@@ -67,6 +120,11 @@ unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall_args(cmd, in1, 0, 0, 0, 0,
+						 NULL, NULL, NULL,
+						 NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
@@ -85,6 +143,11 @@ unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall_args(cmd, in1, 0, 0, 0, 0,
+						 out1, out2, NULL,
+						 NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=b" (*out1), "=c" (*out2)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
@@ -104,6 +167,11 @@ unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall_args(cmd, in1, 0, 0, 0, 0,
+						 out1, out2, out3,
+						 NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
@@ -123,6 +191,11 @@ unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall_args(cmd, in1, in3, in4, in5, 0,
+						 NULL, out2, NULL,
+						 NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=c" (*out2)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
@@ -145,6 +218,11 @@ unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall_args(cmd, in1, in3, 0, 0, 0,
+						 NULL, out2, out3,
+						 out4, out5, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
 		  "=D" (*out5)
@@ -166,6 +244,11 @@ unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
 {
 	unsigned long out0;
 
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
+		return vmware_tdx_hypercall_args(cmd, in1, in3, in4, in5, 0,
+						 out1, out2, out3,
+						 NULL, NULL, NULL);
+
 	asm_inline volatile (VMWARE_HYPERCALL
 		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
 		: [port] "i" (VMWARE_HYPERVISOR_PORT),
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 3aa1adaed18f..ef07ab7a07e1 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -428,6 +428,30 @@ static bool __init vmware_legacy_x2apic_available(void)
 		(eax & BIT(VCPU_LEGACY_X2APIC));
 }
 
+#ifdef CONFIG_INTEL_TDX_GUEST
+unsigned long vmware_tdx_hypercall(unsigned long cmd,
+				   struct tdx_module_args *args)
+{
+	if (!hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	if (cmd & ~VMWARE_CMD_MASK) {
+		pr_warn("Out of range command %x\n", cmd);
+		return 0;
+	}
+
+	args->r10 = VMWARE_TDX_VENDOR_LEAF;
+	args->r11 = VMWARE_TDX_HCALL_FUNC;
+	args->r12 = VMWARE_HYPERVISOR_MAGIC;
+	args->r13 = cmd;
+
+	__tdx_hypercall(args);
+
+	return args->r12;
+}
+EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
+#endif
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 static void vmware_sev_es_hcall_prepare(struct ghcb *ghcb,
 					struct pt_regs *regs)
-- 
2.39.0

