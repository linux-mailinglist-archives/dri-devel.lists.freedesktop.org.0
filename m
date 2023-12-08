Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629BC80993A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 03:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB1710E251;
	Fri,  8 Dec 2023 02:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC5210E248
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 02:32:41 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5c21e185df5so1401566a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 18:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1702002761; x=1702607561;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sK+dpfhTNn2ryOO3zkIQxrXe0eF4GP377XOMqpOvjVM=;
 b=hwj7k9IgKAxzC1D54WHW0zTK3mr2/TbDxGSw/kOxIEDn5TrFsjJm3stCMkwLw2JjIa
 cDpBWBtZedViZfRRI5P9dnRHg6fBn0pISvxtZ0oeAnHRadNKh8H5nDJ0YsmdRB6v9NTu
 nsOKANkx8jbwOpLz1L38QiEoM1fjL/uZEmeps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002761; x=1702607561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sK+dpfhTNn2ryOO3zkIQxrXe0eF4GP377XOMqpOvjVM=;
 b=MKJbhJUiyCQ8DsBE9RYiIq3YL3VSsPB0o0uB+cMdsz8dkYPe1X1am6h+4yutZMH9mF
 JcaS7vH+roqEak9m337oN9kj3uNQv+/OPpi9pPA+6DZzX0x3kKlzxbYXQy/2xNpPWbLU
 hiv5UOC+jYqkerADPEEYN7kAenLJYkwZjapArt8kimqEZl6/n2l6pHRV+LfBZhx70BYv
 KBZI4S9ioW1nJefL8Llr+M70yaRgItxPgLwjiSV20W/jCWUKNTpyxcnIysVVaKMbp+uG
 bk6kphHHmxpdBYCgSEgQMGmwNpAbFq7vdQAOv/jFuIWd9GcHP9FVFp9iLcy2WF2Ie8Ve
 l3RA==
X-Gm-Message-State: AOJu0YzcB9pWvX7Bu+eMoiRizWYz+VWjmxOp1Jx3p4ckthc0iaMYpeHX
 lJvEePSvbApV5bl9B6i9le6pjw==
X-Google-Smtp-Source: AGHT+IEzveokbMoywO7bnYhPg9EUBTWQ79PqRORS8/rPU6xUCtgIKr75zOGibzyV7HydSoCKic+JYA==
X-Received: by 2002:a05:6a20:8f24:b0:18b:4dc2:a4c7 with SMTP id
 b36-20020a056a208f2400b0018b4dc2a4c7mr4129011pzk.14.1702002761513; 
 Thu, 07 Dec 2023 18:32:41 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 pq18-20020a17090b3d9200b00286dfa09e7asm615887pjb.24.2023.12.07.18.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:32:41 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH] x86/vmware: Add TDX hypercall support
Date: Thu,  7 Dec 2023 18:32:33 -0800
Message-Id: <20231208023233.71170-1-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <64074f04-fd72-488b-831a-ad744bbcd950@broadcom.com>
References: <64074f04-fd72-488b-831a-ad744bbcd950@broadcom.com>
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
 zackr@vmware.com
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
 arch/x86/kernel/cpu/vmware.c  | 22 ++++++++++
 2 files changed, 105 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 719e41260ece..04c698b905ab 100644
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
+#define VMWARE_CMD_MASK			0xf007fULL
 
 #define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
 #define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
 
 extern u8 vmware_hypercall_mode;
 
+#define VMWARE_TDX_VENDOR_LEAF 0x1af7e4909ULL
+#define VMWARE_TDX_HCALL_FUNC  1
+
+extern unsigned long vmware_tdx_hypercall(struct tdx_module_args *args);
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
+		.r13 = cmd,
+		.rbx = in1,
+		.rdx = in3,
+		.rsi = in4,
+		.rdi = in5,
+		.r14 = in6,
+	};
+
+	ret = vmware_tdx_hypercall(&args);
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
index 3aa1adaed18f..bcf1d0fb3e89 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -428,6 +428,28 @@ static bool __init vmware_legacy_x2apic_available(void)
 		(eax & BIT(VCPU_LEGACY_X2APIC));
 }
 
+#ifdef CONFIG_INTEL_TDX_GUEST
+unsigned long vmware_tdx_hypercall(struct tdx_module_args *args)
+{
+	if (!hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	if (args->r13 & ~VMWARE_CMD_MASK) {
+		pr_warn("Out of range command %llx\n", args->r13);
+		return 0;
+	}
+
+	args->r10 = VMWARE_TDX_VENDOR_LEAF;
+	args->r11 = VMWARE_TDX_HCALL_FUNC;
+	args->r12 = VMWARE_HYPERVISOR_MAGIC;
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

