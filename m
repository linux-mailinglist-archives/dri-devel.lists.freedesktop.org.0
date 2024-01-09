Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972E827E20
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 06:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB4510E350;
	Tue,  9 Jan 2024 05:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B8A10E350
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 05:10:42 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-28ca63fd071so1234693a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 21:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704777042; x=1705381842;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8/C+cZAZlDGQnbyhqyYcqig/5vzt/WyH0xZX56gmkE=;
 b=hAq/Bk2GUj+YlhEMTGtDRpEiix5RPbqAJXR/cG/iXKeMMizBghMYG1/y/j4Yl9Mgpg
 6tGMJIoVcKisV58I7aB+ZQH2/Glg4nBG6q5E/+X5K/NL4+MHJAnJVTaVI14ARcYMLOY5
 YvrMTQKYDmbJtb6baRV7T0Gm7uSEa0fg5OhKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704777042; x=1705381842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X8/C+cZAZlDGQnbyhqyYcqig/5vzt/WyH0xZX56gmkE=;
 b=me/WR0KDNDXu5K91Rirf5+TX+dFx9JUvCQkJMjwXRS/ldPhSJhe4JGB1zWH43XTuno
 8Bhh6ZtfxMBrxQ0se4uSasqelITaN9YiH+tWBYMiBfPwC1HNt3fGs74Nxhn1CdnYiQZJ
 JBgc3b0fm04KW1/x1RplnyzAdI0X21W0PA3xLCTXDgQsfJo6tanz2ETYh14ATB6QHIk0
 QmrP+zMWVzb3R9ToEdtvEh0YtYYpJvs9TVw/xHelGeYYcxzRt8IqxUlzH4DIMkiWUgmf
 WmTp97YOgRAAlHp3+1iKyLzN21s2wNkGSgYCh+/LGKthk6GmqGSvLSSwSp4YgxYr5sAB
 2Qww==
X-Gm-Message-State: AOJu0YwT9pp75m/db9SDRP3D4qFQiiDebN+PggV7bSRJ/tzvEC640o/N
 PmqgQ9aq2TmXDQL0BRXeHbBBSAYnbzDS
X-Google-Smtp-Source: AGHT+IGyOplJoUD1xpbK3AjrXC0Jcps/zI6GoGi+HTYdTfOMuuInqEmCQyQCViE4TmBnZqyRyNzi7A==
X-Received: by 2002:a17:90a:ad04:b0:28a:fd9f:8ff0 with SMTP id
 r4-20020a17090aad0400b0028afd9f8ff0mr1967323pjq.8.1704777042213; 
 Mon, 08 Jan 2024 21:10:42 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090ac88c00b0028aecd6b29fsm7344115pjt.3.2024.01.08.21.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 21:10:41 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
X-Google-Original-From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v5 6/7] x86/vmware: Undefine VMWARE_HYPERCALL
Date: Mon,  8 Jan 2024 21:10:16 -0800
Message-Id: <20240109051017.58167-7-amakhalov@vmware.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240109051017.58167-1-amakhalov@vmware.com>
References: <20240109051017.58167-1-amakhalov@vmware.com>
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

No more direct use of VMWARE_HYPERCALL macro should be allowed.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
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

