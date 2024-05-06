Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA8E8BD703
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 23:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FEC10F047;
	Mon,  6 May 2024 21:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="agcDllVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE52B10F047
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 21:53:40 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1ecd3867556so17074925ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 14:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715032420; x=1715637220;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XasMM8RHDoAht3zV8M7CkVA/nSY/Z484OZ0/rKT1mpc=;
 b=agcDllVWUHorDgrEDVgSo9BxXm1vuieukedVz5occ/zk4xd8wupBrxD8M9TS6T2mR8
 7cgcPOa3re24v7HQYH6aeciYLeIwDQF/V3aZ56wr+W3ZGQA+goY4yPVoO59RXu3Ll4Jf
 5GKcnzqK8ptGOstl+L91YSfuareMDbhH1aCK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715032420; x=1715637220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XasMM8RHDoAht3zV8M7CkVA/nSY/Z484OZ0/rKT1mpc=;
 b=AcY2+lwi68y7KRsn6c80urdQ3cmGR+PNr4Ab128DkCNB/JSnOz/VJm5YHN+Lsw0E8P
 dYsCg0Lbk2v2STpdHh3T9zpJlHitMJVVb9PZScl5mHbATtfDPsJEO5eKqR1T6UNEkhvQ
 70u4PTS1igVgGwlnLWmYjWVbNguTCQaE4SvZ8iDGaZWZcsxsl6+i5/fQijR8Kor1BXm+
 IB/CwKQglPsqu+IRd6xGQfl1bmRolXk4PDsTTiPD8UMUHULrbTRjdUjTZq9KFmYbciHW
 9vtqgCXreuDQcWcqcuw+uhXbiZZBV1WiKYc5Jwcue3V8iRwTosBnIp83qTmRi/5ptmlc
 nUqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcmwB4F//chQftHsUIFxu49MTvrKyE0ztssPQJSVAyN/kSGH+gPBl7i53R1AWRZDWHFiZhmAV/L6lEGL3uAuhXODjPB7BnAlycnk5a5sgM
X-Gm-Message-State: AOJu0YwrKvQqtun3GYnu1miggE3irGvFBHDPYT6Jf6CsH+UgKqF5jnia
 BGYZokMydBRSHkFnQ8RB28oNVb+ML0Zhkk5F5vm5kRGhYS6VAkqpVEjrNtPHrw==
X-Google-Smtp-Source: AGHT+IENEOGN0tWde3qp/pU38RH6aIHaQEh28095AqfBsIIDAqJikcahIU1wceH2ANpCTzdN1vcY4A==
X-Received: by 2002:a17:902:d355:b0:1eb:3e13:ca0b with SMTP id
 l21-20020a170902d35500b001eb3e13ca0bmr9908685plk.37.1715032420197; 
 Mon, 06 May 2024 14:53:40 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a170902f54800b001ed6868e257sm5664008plf.123.2024.05.06.14.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 14:53:39 -0700 (PDT)
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
Subject: [PATCH v9 2/8] x86/vmware: Correct macro names
Date: Mon,  6 May 2024 14:52:59 -0700
Message-Id: <20240506215305.30756-3-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240506215305.30756-1-alexey.makhalov@broadcom.com>
References: <20240505182829.GBZjfPzeEijTsBUth5@fat_crate.local>
 <20240506215305.30756-1-alexey.makhalov@broadcom.com>
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
index 68d812e12e52..9d804d60a11f 100644
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
@@ -431,8 +431,8 @@ static bool __init vmware_legacy_x2apic_available(void)
 {
 	uint32_t eax, ebx, ecx, edx;
 	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
-	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
-		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
+	return !(eax & GETVCPU_INFO_VCPU_RESERVED) &&
+		(eax & GETVCPU_INFO_LEGACY_X2APIC);
 }
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.39.0

