Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB48BD711
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 23:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A6910F105;
	Mon,  6 May 2024 21:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gMQuOWVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1F210F105
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 21:54:17 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-61d35d266e7so27779967b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715032456; x=1715637256;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fIJKpP9PuqIwYQVQAXhh3lvsNULoqRv8W6dHtBpvXk=;
 b=gMQuOWVn+afPStMwPhY0Mfz5rGS5DORII5Mkvp/0y2r8ULrBkxwxLbJhiZyJws/gun
 lygI5c48s+I3/YSDz38GM0J1wq8xdLFgLraXCP+AT0Vul7pU1dnPyokSpig4uZPSDOhv
 Cw1s6JuJ/PmLufkTuVNN7L/WXeWqOrJ1pkYZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715032456; x=1715637256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4fIJKpP9PuqIwYQVQAXhh3lvsNULoqRv8W6dHtBpvXk=;
 b=iizNaGHrrl8eitJ+HLcj8ELXhOmR3cexafdEwhidvA0Y6IkAo9iRykDYWSwXB0z0H7
 EfddsG0JeA4ybyU6RoRJ+bGRQ47KYHGb++qEx9p//P8TAvgzQnaOeUxrPa13ENQKKKRr
 glE0LUqCj+o7VJ4i7avurztsgBFNkddx6JBq+XqF7qtagfaGTreFC482v51MxMuiuKg+
 fqovqycX3eReREZznj7s7sImSWTSDlwVUwN1yO8zT1Uz5NCdRWi91dTiliN9ikxPxwmW
 qC/cdJ9LUS2O+EYdtPVnUWWCYROIKEIvLoLeFGBpSqO3adJRsh9YzWC0NzgC4sVEx7mN
 eFwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoM+rz9DtIPbTsU3kgTlmtDGFhhH2uUzAwt3lTzJrV6npo91N0qoX63BJgAR56JiUuEO1oORQ8Relg3pHxelNMIlbuhVqjwo7OTlotn7Yq
X-Gm-Message-State: AOJu0Yzw4C8bRxg/bhjYsaoBP7fhz5FNp6UlJDXFxP3UGbcsEcjeygym
 EtpjGdIkDQdC48S5fx9GMpjuC8Is7cWZsJM5Vl2LrZxZS0h/AZ3QhyKvidpfi3hB95aTZ2vD798
 =
X-Google-Smtp-Source: AGHT+IFyWv+jxb29t05zzSKDmxjDVEWVQ7r5yIdjW5CDcL456PzBbnI/9joeCaGDokUA59UoiPatEg==
X-Received: by 2002:a17:902:ea0b:b0:1e4:31e9:83ba with SMTP id
 s11-20020a170902ea0b00b001e431e983bamr13602030plg.1.1715032434870; 
 Mon, 06 May 2024 14:53:54 -0700 (PDT)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a170902f54800b001ed6868e257sm5664008plf.123.2024.05.06.14.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 14:53:54 -0700 (PDT)
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
Subject: [PATCH v9 7/8] x86/vmware: Undefine VMWARE_HYPERCALL
Date: Mon,  6 May 2024 14:53:04 -0700
Message-Id: <20240506215305.30756-8-alexey.makhalov@broadcom.com>
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

No more direct use of VMWARE_HYPERCALL macro should be allowed.

Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 2ac87068184a..84a31f579a30 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -273,5 +273,6 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 }
 #undef VMW_BP_REG
 #undef VMW_BP_CONSTRAINT
+#undef VMWARE_HYPERCALL
 
 #endif
-- 
2.39.0

