Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299428CDA97
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 21:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BFD10EE3A;
	Thu, 23 May 2024 19:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Q8VK0jPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D3410E1D8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 19:15:33 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-794977cbcc3so124529585a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716491732; x=1717096532;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2z+x9cF9UfIHvuJOEUpGiKSSOGcsvbWBKWEuefNVmwU=;
 b=Q8VK0jPlQgKDwW8Rnug3s4drYyWhDPZ9NKb2AHJPidFi6QmVlojtrBkX/qzH7Ugr8M
 G87YArOBHWxJWAZW1uitp70dP06SVdRslX0y1oLOKALBVK+vTJbkphJxz/DBCc23WecF
 eQCZKFERgvM3kYwm2Sv9dpBlEzrXWMca2UUxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716491732; x=1717096532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2z+x9cF9UfIHvuJOEUpGiKSSOGcsvbWBKWEuefNVmwU=;
 b=UJzGZJ9D31XG/GRVJ2LZ+eh3b30zgaosrHEDs1VxhUM4Eh/pOLl2GZRwW6jZ/jh/pn
 8SskUIvOfq6AE1Z2087cC67XwvDilJZ4DbRlpO3B4k/4MU+y6FTdv3iFfDEhshKPpkkx
 VGRAdc/dac31zQa8q1ZLh2E/CQHpbR+PFw4tdiBVyf6/Vj0bDcoLYGKudlNWLWdW8PZ/
 SOVxwCqBfQjuJ/DodkA7ko1uFetOcSiAveN6RiUnd/02RquGJMQh0mNEFcJMMae1XiOw
 FPmNx3Xs28bdQvukNZ6tnRwczFh+yFGB0HT0CFKYl4ISWOZf/ezYMsMsxheDG24DCx21
 HMCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC3KuS0JJOGHRJF1Sg0n9KSIEQ21jS0IpLZxKgdizvJi9JcA6HWQwhKzucHzdh4N1giFRHPSJKPoQ4Og9KhxIdn8w4SoStgZNyRiOSQJ/t
X-Gm-Message-State: AOJu0Yyq3FO5OUqqFEIuULqdMDd50gUOurMSIC0RXbtckecBi7/knUwy
 Bj3o2GeI/oKy2fd29sfIzTkNK90WvTC1ON9nJt+lWxOdvR1Q8NOprvrB8ABWTw==
X-Google-Smtp-Source: AGHT+IE2BasLZ0crWe9TOEiCn1eNxaoBXd8AvFL3B7DO/1kp2aGcJp+wIYKp5XuroBIkt02sx+BaKQ==
X-Received: by 2002:a05:6214:2f09:b0:6ab:86fe:514c with SMTP id
 6a1803df08f44-6abcd0b1f1cmr62536d6.38.1716491732349; 
 Thu, 23 May 2024 12:15:32 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e4a89b61dsm21219821cf.45.2024.05.23.12.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 12:15:31 -0700 (PDT)
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
Subject: [PATCH v10 5/8] x86/vmware: Use VMware hypercall API
Date: Thu, 23 May 2024 12:14:43 -0700
Message-Id: <20240523191446.54695-6-alexey.makhalov@broadcom.com>
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

Remove VMWARE_CMD macro and move to vmware_hypercall API.
No functional changes intended.

Use u32/u64 instead of uint32_t/uint64_t across the file

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 95 ++++++++++--------------------------
 1 file changed, 25 insertions(+), 70 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 07b7b5b773a0..6796425eaaa1 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -49,54 +49,16 @@
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
 
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
-#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)                         \
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
-
 struct vmware_steal_time {
 	union {
-		uint64_t clock;	/* stolen time counter in units of vtsc */
+		u64 clock;	/* stolen time counter in units of vtsc */
 		struct {
 			/* only for little-endian */
-			uint32_t clock_low;
-			uint32_t clock_high;
+			u32 clock_low;
+			u32 clock_high;
 		};
 	};
-	uint64_t reserved[7];
+	u64 reserved[7];
 };
 
 static unsigned long vmware_tsc_khz __ro_after_init;
@@ -105,9 +67,10 @@ EXPORT_SYMBOL_GPL(vmware_hypercall_mode);
 
 static inline int __vmware_platform(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVERSION, eax, ebx, ecx, edx);
-	return eax != (uint32_t)-1 && ebx == VMWARE_HYPERVISOR_MAGIC;
+	u32 eax, ebx, ecx;
+
+	eax = vmware_hypercall3(VMWARE_CMD_GETVERSION, 0, &ebx, &ecx);
+	return eax != UINT_MAX && ebx == VMWARE_HYPERVISOR_MAGIC;
 }
 
 static unsigned long vmware_get_tsc_khz(void)
@@ -159,21 +122,12 @@ static void __init vmware_cyc2ns_setup(void)
 	pr_info("using clock offset of %llu ns\n", d->cyc2ns_offset);
 }
 
-static int vmware_cmd_stealclock(uint32_t arg1, uint32_t arg2)
+static int vmware_cmd_stealclock(u32 addr_hi, u32 addr_lo)
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
+	u32 info;
+
+	return vmware_hypercall5(VMWARE_CMD_STEALCLOCK, 0, 0, addr_hi, addr_lo,
+				 &info);
 }
 
 static bool stealclock_enable(phys_addr_t pa)
@@ -208,15 +162,15 @@ static bool vmware_is_stealclock_available(void)
  * Return:
  *      The steal clock reading in ns.
  */
-static uint64_t vmware_steal_clock(int cpu)
+static u64 vmware_steal_clock(int cpu)
 {
 	struct vmware_steal_time *steal = &per_cpu(vmw_steal_time, cpu);
-	uint64_t clock;
+	u64 clock;
 
 	if (IS_ENABLED(CONFIG_64BIT))
 		clock = READ_ONCE(steal->clock);
 	else {
-		uint32_t initial_high, low, high;
+		u32 initial_high, low, high;
 
 		do {
 			initial_high = READ_ONCE(steal->clock_high);
@@ -228,7 +182,7 @@ static uint64_t vmware_steal_clock(int cpu)
 			high = READ_ONCE(steal->clock_high);
 		} while (initial_high != high);
 
-		clock = ((uint64_t)high << 32) | low;
+		clock = ((u64)high << 32) | low;
 	}
 
 	return mul_u64_u32_shr(clock, vmware_cyc2ns.cyc2ns_mul,
@@ -382,13 +336,13 @@ static void __init vmware_set_capabilities(void)
 
 static void __init vmware_platform_setup(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	uint64_t lpj, tsc_khz;
+	u32 eax, ebx, ecx;
+	u64 lpj, tsc_khz;
 
-	VMWARE_CMD(GETHZ, eax, ebx, ecx, edx);
+	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);
 
 	if (ebx != UINT_MAX) {
-		lpj = tsc_khz = eax | (((uint64_t)ebx) << 32);
+		lpj = tsc_khz = eax | (((u64)ebx) << 32);
 		do_div(tsc_khz, 1000);
 		WARN_ON(tsc_khz >> 32);
 		pr_info("TSC freq read from hypervisor : %lu.%03lu MHz\n",
@@ -439,7 +393,7 @@ static u8 __init vmware_select_hypercall(void)
  * If !boot_cpu_has(X86_FEATURE_HYPERVISOR), vmware_hypercall_mode
  * intentionally defaults to 0.
  */
-static uint32_t __init vmware_platform(void)
+static u32 __init vmware_platform(void)
 {
 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR)) {
 		unsigned int eax;
@@ -467,8 +421,9 @@ static uint32_t __init vmware_platform(void)
 /* Checks if hypervisor supports x2apic without VT-D interrupt remapping. */
 static bool __init vmware_legacy_x2apic_available(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
+	u32 eax;
+
+	eax = vmware_hypercall1(VMWARE_CMD_GETVCPU_INFO, 0);
 	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
 		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
 }
-- 
2.39.0

