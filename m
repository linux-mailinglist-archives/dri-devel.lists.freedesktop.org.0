Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2D68CDAA0
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 21:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676A810F24C;
	Thu, 23 May 2024 19:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="d1cjtNBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE5310EF72
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 19:15:38 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-792bf1a4f75so561221085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716491738; x=1717096538;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZPMIYqCPOQ9lUONW9JG6SX+420+rT4m9cGMXu5m3VI=;
 b=d1cjtNBUTz8oM5yxBVForSd01sbkOTtuKrcrezye+HxUVPfOy3v32Pwrkj4a1SuHOl
 PI9Jo0y022fQO+s5BKnreR9m0j6hSaVd1L9zDovA2AQqYk2PIsa88SbZfY1iqhYxKIR3
 npPX8VSd0MvMedj+g6rn4ogazs29DHTlyf1t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716491738; x=1717096538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZPMIYqCPOQ9lUONW9JG6SX+420+rT4m9cGMXu5m3VI=;
 b=wFJjg3OzMzUEXI9334OlYqp3BNzBOiJMmd11+9hfDCBZyIomDO/bvO9HQS8p2q0glA
 c5wSY2MleDOhhPLNlcFt2753833WBinNcuhQvYbLz71rNxD7yCD1yW9M2XBmysquSPB1
 GqwbAlxunYse07JyFW7WleVEsv6UryIUcqSyNxhlA+s7TGwOG03fGxSu1wVRp785alL2
 X9BNG0w+g26KC7QsrrNYCc5fOAt03q/aztLQcPvCLfXa2/I2Kylo1m8xRBPo0fOp3PxL
 raS+OF2Y8b3Y6YWMkljnflehYatLknWDsaWQiFfHYIWjoRACKmqTTqvHcNaeDM7unZI2
 Sosg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzgjx1Sz26/FTFQ2cYoEsqqy7x2jcyFDVUWZQi6sKqgKpv9b3oRWVgsQ0HzgYvNCL9a5qwDvaBmZeRKFSMsL0hsVHfx39qS3n+bgY99zlF
X-Gm-Message-State: AOJu0YytLAycPo9uG6kQ5lS4D9ArfyQ9SxBP610P7PfGrOjrk6Y9+VrL
 /LZZZBox0Oo9c5KRNx7m9yZT+bYc02dXkKV99zgTY4jIVssrVZBImaAvAbTqQw==
X-Google-Smtp-Source: AGHT+IG2JzfPFZy3xWsQUnDD6DVaCv75DpVNO+T61rq9vujIHdvBjciczesgyKtATQ7tmpk6hsg4FQ==
X-Received: by 2002:a05:620a:5608:b0:792:9d32:d37f with SMTP id
 af79cd13be357-794aaf8eeccmr19545485a.0.1716491737788; 
 Thu, 23 May 2024 12:15:37 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e4a89b61dsm21219821cf.45.2024.05.23.12.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 12:15:37 -0700 (PDT)
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
Subject: [PATCH v10 6/8] x86/vmware: Correct macro names
Date: Thu, 23 May 2024 12:14:44 -0700
Message-Id: <20240523191446.54695-7-alexey.makhalov@broadcom.com>
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

VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. And move bit-shift
operation to the macro body.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/kernel/cpu/vmware.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 6796425eaaa1..58442c2581e7 100644
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
@@ -424,8 +424,8 @@ static bool __init vmware_legacy_x2apic_available(void)
 	u32 eax;
 
 	eax = vmware_hypercall1(VMWARE_CMD_GETVCPU_INFO, 0);
-	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
-		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
+	return !(eax & GETVCPU_INFO_VCPU_RESERVED) &&
+		(eax & GETVCPU_INFO_LEGACY_X2APIC);
 }
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.39.0

