Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA2907C29
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 21:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E309010EB62;
	Thu, 13 Jun 2024 19:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Y21fr6Nw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE31110E0F4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 19:17:16 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7955f3d4516so226804285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718306235; x=1718911035;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NC/AYFyoO9S19kQ3qOxs7+XLTodYdZI/b1WzHwADho0=;
 b=Y21fr6NwvaZZpjOwNFnRhpO8nyZMkpJWtTg0UbSzqutAJsJvk1XjKdOB6OJ7HrSjyL
 ZZLHVfBn5jrHIDDVwdfs0mmLhUVHG0QWoHvbkNo7dsBYd1+sxDi4SnZiQzH7RjP7nA5p
 XZ0CRqNy2IqcB/HDxzU89bOTTWEyc+ArWOS2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718306235; x=1718911035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NC/AYFyoO9S19kQ3qOxs7+XLTodYdZI/b1WzHwADho0=;
 b=YcU972yVeiU2E9nTSoo8F5TaWiFACuHDip6PnGH+FGBC+MEmnDtr6WwM6/xQivnPFT
 GQls2NCbUtUVEVoNhZhllD4wizjtV20GoR7FgpBQ2mtR/aC8DZZETyVnNz5ZY9LbmxpL
 QmVVHvFgrxnLwQVaKBUgGO1JJALUqlpLlHNx/9TkaM03mA4oR9vpwbUMj4JJN9J/Fjm3
 ipdCKfZV8QydKOnTTJhKQIl6lytO813R8/ZTauQ3U8Xa7kGf2v3IiSGeVtIJeHzqy/PA
 XbAxV5Gzd5dSR5ZxNUpWf92u/W3JUgK36omAtSlZzgSwSoq/42wSobqqN2WmFc33tQkQ
 BQbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLLPNCxWitOE3H02E8nJFQN6uagLkfaBIJ/rLM4Z0rrszkjJak1US7lblEbyzt2CxtTahNI6ss7GsjcoyKOEdoaCoF0Z/3cWI2Ih4csvDu
X-Gm-Message-State: AOJu0YwNgcAUkvuripDsHDeLi3DyiCQ6TGNTLd1wUBHB+2XF20NCIrvM
 q4JwkQ6BkkEvv5iFhJ3ueb7MWeWAI8GdZ3jI6Y1dIvhV9ZedduhTF27+gRHXLw==
X-Google-Smtp-Source: AGHT+IHgqzhScZOgUE/gqvz3OpOTuoDlrnlwif3SW+jviqBJcKlg3UXk9A/jLXi1/PPNVDEkMOEYWA==
X-Received: by 2002:a0c:d6cf:0:b0:6b2:9e53:fe50 with SMTP id
 6a1803df08f44-6b2af2ee3famr12897306d6.22.1718306235389; 
 Thu, 13 Jun 2024 12:17:15 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb47f6sm9714106d6.82.2024.06.13.12.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 12:17:15 -0700 (PDT)
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
Subject: [PATCH v11 1/8] x86/vmware: Introduce VMware hypercall API
Date: Thu, 13 Jun 2024 12:16:43 -0700
Message-Id: <20240613191650.9913-2-alexey.makhalov@broadcom.com>
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

Introduce vmware_hypercall family of functions. It is a common
implementation to be used by the VMware guest code and virtual
device drivers in architecture independent manner.

The API consists of vmware_hypercallX and vmware_hypercall_hb_{out,in}
set of functions by analogy with KVM hypercall API. Architecture
specific implementation is hidden inside.

It will simplify future enhancements in VMware hypercalls such
as SEV-ES and TDX related changes without needs to modify a
caller in device drivers code.

Current implementation extends an idea from commit bac7b4e84323
("x86/vmware: Update platform detection code for VMCALL/VMMCALL
hypercalls") to have a slow, but safe path vmware_hypercall_slow()
earlier during the boot when alternatives are not yet applied.
The code inherits VMWARE_CMD logic from the commit mentioned above.

Move common macros from vmware.c to vmware.h.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 279 ++++++++++++++++++++++++++++++++--
 arch/x86/kernel/cpu/vmware.c  |  58 ++++++-
 2 files changed, 315 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index ac9fc51e2b18..724c8b9b4b8d 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -7,26 +7,277 @@
 #include <linux/stringify.h>
 
 /*
- * The hypercall definitions differ in the low word of the %edx argument
- * in the following way: the old port base interface uses the port
- * number to distinguish between high- and low bandwidth versions.
+ * VMware hypercall ABI.
+ *
+ * - Low bandwidth (LB) hypercalls (I/O port based, vmcall and vmmcall)
+ * have up to 6 input and 6 output arguments passed and returned using
+ * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
+ * %esi (arg4), %edi (arg5).
+ * The following input arguments must be initialized by the caller:
+ * arg0 - VMWARE_HYPERVISOR_MAGIC
+ * arg2 - Hypercall command
+ * arg3 bits [15:0] - Port number, LB and direction flags
+ *
+ * - High bandwidth (HB) hypercalls are I/O port based only. They have
+ * up to 7 input and 7 output arguments passed and returned using
+ * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
+ * %esi (arg4), %edi (arg5), %ebp (arg6).
+ * The following input arguments must be initialized by the caller:
+ * arg0 - VMWARE_HYPERVISOR_MAGIC
+ * arg1 - Hypercall command
+ * arg3 bits [15:0] - Port number, HB and direction flags
+ *
+ * For compatibility purposes, x86_64 systems use only lower 32 bits
+ * for input and output arguments.
+ *
+ * The hypercall definitions differ in the low word of the %edx (arg3)
+ * in the following way: the old I/O port based interface uses the port
+ * number to distinguish between high- and low bandwidth versions, and
+ * uses IN/OUT instructions to define transfer direction.
  *
  * The new vmcall interface instead uses a set of flags to select
  * bandwidth mode and transfer direction. The flags should be loaded
- * into %dx by any user and are automatically replaced by the port
- * number if the VMWARE_HYPERVISOR_PORT method is used.
- *
- * In short, new driver code should strictly use the new definition of
- * %dx content.
+ * into arg3 by any user and are automatically replaced by the port
+ * number if the I/O port method is used.
+ */
+
+#define VMWARE_HYPERVISOR_HB		BIT(0)
+#define VMWARE_HYPERVISOR_OUT		BIT(1)
+
+#define VMWARE_HYPERVISOR_PORT		0x5658
+#define VMWARE_HYPERVISOR_PORT_HB	(VMWARE_HYPERVISOR_PORT | \
+					 VMWARE_HYPERVISOR_HB)
+
+#define VMWARE_HYPERVISOR_MAGIC		0x564d5868U
+
+#define VMWARE_CMD_GETVERSION		10
+#define VMWARE_CMD_GETHZ		45
+#define VMWARE_CMD_GETVCPU_INFO		68
+#define VMWARE_CMD_STEALCLOCK		91
+
+#define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
+#define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
+
+extern unsigned long vmware_hypercall_slow(unsigned long cmd,
+					   unsigned long in1, unsigned long in3,
+					   unsigned long in4, unsigned long in5,
+					   u32 *out1, u32 *out2, u32 *out3,
+					   u32 *out4, u32 *out5);
+
+/*
+ * The low bandwidth call. The low word of %edx is presumed to have OUT bit
+ * set. The high word of %edx may contain input data from the caller.
  */
+#define VMWARE_HYPERCALL					\
+	ALTERNATIVE_2("movw %[port], %%dx\n\t"			\
+		      "inl (%%dx), %%eax",			\
+		      "vmcall", X86_FEATURE_VMCALL,		\
+		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
+
+static inline
+unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     NULL, NULL, NULL, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
+				u32 *out1, u32 *out2)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     out1, out2, NULL, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
+				u32 *out1, u32 *out2, u32 *out3)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
+					     out1, out2, out3, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, u32 *out2)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
+					     NULL, out2, NULL, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3),
+		  "S" (in4),
+		  "D" (in5)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
+				unsigned long in3, u32 *out2,
+				u32 *out3, u32 *out4, u32 *out5)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, in3, 0, 0,
+					     NULL, out2, out3, out4, out5);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
+		  "=D" (*out5)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, u32 *out1,
+				u32 *out2, u32 *out3)
+{
+	unsigned long out0;
+
+	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
+		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
+					     out1, out2, out3, NULL, NULL);
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3),
+		  "S" (in4),
+		  "D" (in5)
+		: "cc", "memory");
+	return out0;
+}
+
+#ifdef CONFIG_X86_64
+#define VMW_BP_CONSTRAINT "r"
+#else
+#define VMW_BP_CONSTRAINT "m"
+#endif
+
+/*
+ * High bandwidth calls are not supported on encrypted memory guests.
+ * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
+ * low bandwidth hypercall if memory encryption is set.
+ * This assumption simplifies HB hypercall implementation to just I/O port
+ * based approach without alternative patching.
+ */
+static inline
+unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
+				      unsigned long in3, unsigned long in4,
+				      unsigned long in5, unsigned long in6,
+				      u32 *out1)
+{
+	unsigned long out0;
+
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push %%" _ASM_BP "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], %%" _ASM_BP "\n\t"
+		"rep outsb\n\t"
+		"pop %%" _ASM_BP "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=a" (out0), "=b" (*out1)
+		: "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT (in6)
+		: "cc", "memory");
+	return out0;
+}
 
-/* Old port-based version */
-#define VMWARE_HYPERVISOR_PORT    0x5658
-#define VMWARE_HYPERVISOR_PORT_HB 0x5659
+static inline
+unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
+				     unsigned long in3, unsigned long in4,
+				     unsigned long in5, unsigned long in6,
+				     u32 *out1)
+{
+	unsigned long out0;
 
-/* Current vmcall / vmmcall version */
-#define VMWARE_HYPERVISOR_HB   BIT(0)
-#define VMWARE_HYPERVISOR_OUT  BIT(1)
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push %%" _ASM_BP "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], %%" _ASM_BP "\n\t"
+		"rep insb\n\t"
+		"pop %%" _ASM_BP "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=a" (out0), "=b" (*out1)
+		: "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT (in6)
+		: "cc", "memory");
+	return out0;
+}
+#undef VMW_BP_CONSTRAINT
+#undef VMWARE_HYPERCALL
 
 /* The low bandwidth call. The low word of edx is presumed clear. */
 #define VMWARE_HYPERCALL						\
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 11f83d07925e..533ac2d1de88 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -41,17 +41,9 @@
 
 #define CPUID_VMWARE_INFO_LEAF               0x40000000
 #define CPUID_VMWARE_FEATURES_LEAF           0x40000010
-#define CPUID_VMWARE_FEATURES_ECX_VMMCALL    BIT(0)
-#define CPUID_VMWARE_FEATURES_ECX_VMCALL     BIT(1)
 
-#define VMWARE_HYPERVISOR_MAGIC	0x564D5868
-
-#define VMWARE_CMD_GETVERSION    10
-#define VMWARE_CMD_GETHZ         45
-#define VMWARE_CMD_GETVCPU_INFO  68
 #define VMWARE_CMD_LEGACY_X2APIC  3
 #define VMWARE_CMD_VCPU_RESERVED 31
-#define VMWARE_CMD_STEALCLOCK    91
 
 #define STEALCLOCK_NOT_AVAILABLE (-1)
 #define STEALCLOCK_DISABLED        0
@@ -110,6 +102,56 @@ struct vmware_steal_time {
 static unsigned long vmware_tsc_khz __ro_after_init;
 static u8 vmware_hypercall_mode     __ro_after_init;
 
+unsigned long vmware_hypercall_slow(unsigned long cmd,
+				    unsigned long in1, unsigned long in3,
+				    unsigned long in4, unsigned long in5,
+				    u32 *out1, u32 *out2, u32 *out3,
+				    u32 *out4, u32 *out5)
+{
+	unsigned long out0;
+
+	switch (vmware_hypercall_mode) {
+	case CPUID_VMWARE_FEATURES_ECX_VMCALL:
+		asm_inline volatile ("vmcall"
+				: "=a" (out0), "=b" (*out1), "=c" (*out2),
+				"=d" (*out3), "=S" (*out4), "=D" (*out5)
+				: "a" (VMWARE_HYPERVISOR_MAGIC),
+				"b" (in1),
+				"c" (cmd),
+				"d" (in3),
+				"S" (in4),
+				"D" (in5)
+				: "cc", "memory");
+		break;
+	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:
+		asm_inline volatile ("vmmcall"
+				: "=a" (out0), "=b" (*out1), "=c" (*out2),
+				"=d" (*out3), "=S" (*out4), "=D" (*out5)
+				: "a" (VMWARE_HYPERVISOR_MAGIC),
+				"b" (in1),
+				"c" (cmd),
+				"d" (in3),
+				"S" (in4),
+				"D" (in5)
+				: "cc", "memory");
+		break;
+	default:
+		asm_inline volatile ("movw %[port], %%dx; inl (%%dx), %%eax"
+				: "=a" (out0), "=b" (*out1), "=c" (*out2),
+				"=d" (*out3), "=S" (*out4), "=D" (*out5)
+				: [port] "i" (VMWARE_HYPERVISOR_PORT),
+				"a" (VMWARE_HYPERVISOR_MAGIC),
+				"b" (in1),
+				"c" (cmd),
+				"d" (in3),
+				"S" (in4),
+				"D" (in5)
+				: "cc", "memory");
+		break;
+	}
+	return out0;
+}
+
 static inline int __vmware_platform(void)
 {
 	uint32_t eax, ebx, ecx, edx;
-- 
2.39.4

