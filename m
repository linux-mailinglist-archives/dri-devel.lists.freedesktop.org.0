Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843B828223
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE88D10E3C4;
	Tue,  9 Jan 2024 08:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C05810E3C5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:41:06 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5c6ce4dffb5so961339a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 00:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704789666; x=1705394466;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTBheJ0yx/IBrzgt25TIRXHMWXRBVoQjsLuJ3eOyhd0=;
 b=CsvVgVZND7TdBf0vY+qqQZtoOfQw2mp6kD7CdRftyctiWlzm89l8HATHdYV7Uj3VEV
 EJzcugcA2Qg9L75FHITSKD6xy4XSAGTQFtqKIUm8rveqzz1KnjFVc8FEzF39k4EZzUUX
 OjLX8JN+EKtgCVMPcdMQUXAeXAnmlsN94lmUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789666; x=1705394466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTBheJ0yx/IBrzgt25TIRXHMWXRBVoQjsLuJ3eOyhd0=;
 b=HlhN3CMk143SV8hvhq8VdduTtWyM7UxWSuuUCXtMlVnalf2KDS16HJw39+0TZzyJB6
 GiiYo/54OVeeridkKEOepmz9liAcLg56KKpVBgF6yDGlXGLFxrh/gNiSi53omAxag0FI
 bniuzdfO4p53VgY149iww5MLt9G44sN17dS+iduVKWxQtLn/Xqvsuw0Oti7Str2QNJ85
 E6r6uh+cq8qMF5XdOC0EIxHksKl3BRFTcto0aghhPlij1CtpuPYdA/88HalJjRo2XCme
 73oa+Mj1Lrz8p7J3pWJAgTTovz9w0ZUJC0x4AgWG6IW4TCgAX1yz7aGX8ueZl+A4vPTQ
 yUjQ==
X-Gm-Message-State: AOJu0Yy1Wv+84Lgph/gH1sjiS01dG5YPdg2RWTv0jydMkFYU3Y50Q4jm
 aIG+pJ/UCBIGUbV32vDmVv/MrQA8ucQv
X-Google-Smtp-Source: AGHT+IGBE6XIXMUc4laEpuRDUpZXQvJvaTfNJ/ADIzbkQ6endzb8AhfC7UGOs2v31/huC+/hP2Zm8A==
X-Received: by 2002:a05:6a20:3d93:b0:199:8b61:b2d with SMTP id
 s19-20020a056a203d9300b001998b610b2dmr1777313pzi.40.1704789665730; 
 Tue, 09 Jan 2024 00:41:05 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 sf15-20020a17090b51cf00b0028d435cc2cbsm4772293pjb.15.2024.01.09.00.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:41:05 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
X-Google-Original-From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v6 2/7] x86/vmware: Introduce VMware hypercall API
Date: Tue,  9 Jan 2024 00:40:47 -0800
Message-Id: <20240109084052.58661-3-amakhalov@vmware.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240109084052.58661-1-amakhalov@vmware.com>
References: <20240109084052.58661-1-amakhalov@vmware.com>
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
 kirill.shutemov@linux.intel.com, zackr@vmware.com
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
hypercalls") to have a slow, but safe path in VMWARE_HYPERCALL
earlier during the boot when alternatives are not yet applied.
This logic was inherited from VMWARE_CMD from the commit mentioned
above. Default alternative code was optimized by size to reduce
excessive nop alignment once alternatives are applied. Total
default code size is 26 bytes, in worse case (3 bytes alternative)
remaining 23 bytes will be aligned by only 3 long NOP instructions.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Jeff Sipek <jsipek@vmware.com>
---
 arch/x86/include/asm/vmware.h           | 288 +++++++++++++++++++-----
 arch/x86/kernel/cpu/vmware.c            |  35 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h |   6 +-
 drivers/input/mouse/vmmouse.c           |   2 +
 drivers/ptp/ptp_vmw.c                   |   2 +
 5 files changed, 252 insertions(+), 81 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index de2533337611..2ac87068184a 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -7,14 +7,37 @@
 #include <linux/stringify.h>
 
 /*
- * The hypercall definitions differ in the low word of the %edx argument
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
  * in the following way: the old I/O port based interface uses the port
  * number to distinguish between high- and low bandwidth versions, and
  * uses IN/OUT instructions to define transfer direction.
  *
  * The new vmcall interface instead uses a set of flags to select
  * bandwidth mode and transfer direction. The flags should be loaded
- * into %dx by any user and are automatically replaced by the port
+ * into arg3 by any user and are automatically replaced by the port
  * number if the I/O port method is used.
  */
 
@@ -37,69 +60,218 @@
 
 extern u8 vmware_hypercall_mode;
 
-/* The low bandwidth call. The low word of edx is presumed clear. */
-#define VMWARE_HYPERCALL						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT) ", %%dx; " \
-		      "inl (%%dx), %%eax",				\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
-
 /*
- * The high bandwidth out call. The low word of edx is presumed to have the
- * HB and OUT bits set.
+ * The low bandwidth call. The low word of %edx is presumed to have OUT bit
+ * set. The high word of %edx may contain input data from the caller.
  */
-#define VMWARE_HYPERCALL_HB_OUT						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep outsb",					\
+#define VMWARE_HYPERCALL						\
+	ALTERNATIVE_3("cmpb $"						\
+			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
+			", %[mode]\n\t"					\
+		      "jg 2f\n\t"					\
+		      "je 1f\n\t"					\
+		      "movw %[port], %%dx\n\t"				\
+		      "inl (%%dx), %%eax\n\t"				\
+		      "jmp 3f\n\t"					\
+		      "1: vmmcall\n\t"					\
+		      "jmp 3f\n\t"					\
+		      "2: vmcall\n\t"					\
+		      "3:\n\t",						\
+		      "movw %[port], %%dx\n\t"				\
+		      "inl (%%dx), %%eax", X86_FEATURE_HYPERVISOR,	\
 		      "vmcall", X86_FEATURE_VMCALL,			\
 		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
 
+static inline
+unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
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
+				uint32_t *out1, uint32_t *out2)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
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
+				uint32_t *out1, uint32_t *out2,
+				uint32_t *out3)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
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
+				unsigned long in5, uint32_t *out2)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
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
+				unsigned long in3, uint32_t *out2,
+				uint32_t *out3, uint32_t *out4,
+				uint32_t *out5)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
+		  "=D" (*out5)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
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
+				unsigned long in5, uint32_t *out1,
+				uint32_t *out2, uint32_t *out3)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
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
+
+#ifdef CONFIG_X86_64
+#define VMW_BP_REG "%%rbp"
+#define VMW_BP_CONSTRAINT "r"
+#else
+#define VMW_BP_REG "%%ebp"
+#define VMW_BP_CONSTRAINT "m"
+#endif
+
 /*
- * The high bandwidth in call. The low word of edx is presumed to have the
- * HB bit set.
+ * High bandwidth calls are not supported on encrypted memory guests.
+ * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
+ * low bandwidth hypercall it memory encryption is set.
+ * This assumption simplifies HB hypercall impementation to just I/O port
+ * based approach without alternative patching.
  */
-#define VMWARE_HYPERCALL_HB_IN						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep insb",					\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
+static inline
+unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
+				      unsigned long in3, unsigned long in4,
+				      unsigned long in5, unsigned long in6,
+				      uint32_t *out1)
+{
+	unsigned long out0;
+
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push " VMW_BP_REG "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], " VMW_BP_REG "\n\t"
+		"rep outsb\n\t"
+		"pop " VMW_BP_REG "\n\t"
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
+
+static inline
+unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
+				     unsigned long in3, unsigned long in4,
+				     unsigned long in5, unsigned long in6,
+				     uint32_t *out1)
+{
+	unsigned long out0;
 
-#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
-	__asm__("inl (%%dx), %%eax" :					\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
-		"memory")
-
-#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
-	__asm__("vmcall" :						\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(0), "b"(UINT_MAX) :					\
-		"memory")
-
-#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)				\
-	__asm__("vmmcall" :						\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(0), "b"(UINT_MAX) :					\
-		"memory")
-
-#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
-	switch (vmware_hypercall_mode) {			\
-	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
-		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
-		break;						\
-	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
-		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
-		break;						\
-	default:						\
-		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
-		break;						\
-	}							\
-	} while (0)
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push " VMW_BP_REG "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], " VMW_BP_REG "\n\t"
+		"rep insb\n\t"
+		"pop " VMW_BP_REG "\n\t"
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
+#undef VMW_BP_REG
+#undef VMW_BP_CONSTRAINT
 
 #endif
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 4db8e1daa4a1..3aa1adaed18f 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -67,9 +67,10 @@ EXPORT_SYMBOL_GPL(vmware_hypercall_mode);
 
 static inline int __vmware_platform(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVERSION, eax, ebx, ecx, edx);
-	return eax != (uint32_t)-1 && ebx == VMWARE_HYPERVISOR_MAGIC;
+	uint32_t eax, ebx, ecx;
+
+	eax = vmware_hypercall3(VMWARE_CMD_GETVERSION, 0, &ebx, &ecx);
+	return eax != UINT_MAX && ebx == VMWARE_HYPERVISOR_MAGIC;
 }
 
 static unsigned long vmware_get_tsc_khz(void)
@@ -121,21 +122,12 @@ static void __init vmware_cyc2ns_setup(void)
 	pr_info("using clock offset of %llu ns\n", d->cyc2ns_offset);
 }
 
-static int vmware_cmd_stealclock(uint32_t arg1, uint32_t arg2)
+static int vmware_cmd_stealclock(uint32_t addr_hi, uint32_t addr_lo)
 {
-	uint32_t result, info;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(result),
-		"=c"(info) :
-		"a"(VMWARE_HYPERVISOR_MAGIC),
-		"b"(0),
-		"c"(VMWARE_CMD_STEALCLOCK),
-		"d"(0),
-		"S"(arg1),
-		"D"(arg2) :
-		"memory");
-	return result;
+	uint32_t info;
+
+	return vmware_hypercall5(VMWARE_CMD_STEALCLOCK, 0, 0, addr_hi, addr_lo,
+				 &info);
 }
 
 static bool stealclock_enable(phys_addr_t pa)
@@ -344,10 +336,10 @@ static void __init vmware_set_capabilities(void)
 
 static void __init vmware_platform_setup(void)
 {
-	uint32_t eax, ebx, ecx, edx;
+	uint32_t eax, ebx, ecx;
 	uint64_t lpj, tsc_khz;
 
-	VMWARE_CMD(GETHZ, eax, ebx, ecx, edx);
+	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);
 
 	if (ebx != UINT_MAX) {
 		lpj = tsc_khz = eax | (((uint64_t)ebx) << 32);
@@ -429,8 +421,9 @@ static uint32_t __init vmware_platform(void)
 /* Checks if hypervisor supports x2apic without VT-D interrupt remapping. */
 static bool __init vmware_legacy_x2apic_available(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
+	uint32_t eax;
+
+	eax = vmware_hypercall1(VMWARE_CMD_GETVCPU_INFO, 0);
 	return !(eax & BIT(VCPU_RESERVED)) &&
 		(eax & BIT(VCPU_LEGACY_X2APIC));
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
index 23899d743a90..e040ee21ea1a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
@@ -68,6 +68,8 @@
                 "=d"(edx),			\
                 "=S"(si),			\
                 "=D"(di) :			\
+         [port] "i" (VMWARE_HYPERVISOR_PORT),	\
+         [mode] "m" (vmware_hypercall_mode),	\
                 "a"(magic),			\
                 "b"(in_ebx),			\
                 "c"(cmd),			\
@@ -110,7 +112,7 @@
 		"push %%rbp;"				\
 		UNWIND_HINT_UNDEFINED			\
                 "mov %12, %%rbp;"			\
-                VMWARE_HYPERCALL_HB_OUT			\
+                "rep outsb;"				\
                 "pop %%rbp;"				\
 		UNWIND_HINT_RESTORE :			\
                 "=a"(eax),				\
@@ -139,7 +141,7 @@
 		"push %%rbp;"				\
 		UNWIND_HINT_UNDEFINED			\
                 "mov %12, %%rbp;"			\
-                VMWARE_HYPERCALL_HB_IN			\
+                "rep insb;"				\
                 "pop %%rbp;"				\
 		UNWIND_HINT_RESTORE :			\
                 "=a"(eax),				\
diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.c
index ea9eff7c8099..ad94c835ee66 100644
--- a/drivers/input/mouse/vmmouse.c
+++ b/drivers/input/mouse/vmmouse.c
@@ -91,6 +91,8 @@ struct vmmouse_data {
 		"=d"(out4),				\
 		"=S"(__dummy1),				\
 		"=D"(__dummy2) :			\
+         [port] "i" (VMWARE_HYPERVISOR_PORT),		\
+         [mode] "m" (vmware_hypercall_mode),		\
 		"a"(VMMOUSE_PROTO_MAGIC),		\
 		"b"(in1),				\
 		"c"(VMMOUSE_PROTO_CMD_##cmd),		\
diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 27c5547aa8a9..279d191d2df9 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -29,6 +29,8 @@ static int ptp_vmw_pclk_read(u64 *ns)
 	asm volatile (VMWARE_HYPERCALL :
 		"=a"(ret), "=b"(nsec_hi), "=c"(nsec_lo), "=d"(unused1),
 		"=S"(unused2), "=D"(unused3) :
+		[port] "i" (VMWARE_HYPERVISOR_PORT),
+		[mode] "m" (vmware_hypercall_mode),
 		"a"(VMWARE_MAGIC), "b"(0),
 		"c"(VMWARE_CMD_PCLK_GETTIME), "d"(0) :
 		"memory");
-- 
2.39.0

