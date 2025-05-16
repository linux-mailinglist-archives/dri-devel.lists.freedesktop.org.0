Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196FDABA523
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 23:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81AF10EB95;
	Fri, 16 May 2025 21:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="na93+EQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD7510E298
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 21:30:05 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-231d13ac4d4so22282955ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747431005; x=1748035805;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
 bh=Cl8sKId1p4fnSWsbXS5nPLz/0J3dr2L1BPCgdcqnxp0=;
 b=na93+EQqmLYrs2tVnDUkFb+UXqno0IwXxYz7d1NaZqq1kzYKRMJRfGI5BeNO5ZNh4l
 tTF8n5WX7S6V/G+3rEozY0Z5kvjClIRc1n5K3yfTdDf8FHoHt2l4/NzBRDhMuaunnD8m
 MkHinqLT0OEcltY9bF1BY84S19kPr87vbbblkN/9q3pbrfWwDe151tsQYAHDLojwfz2a
 H5WKWXgFlUJ6iGzQnU/zsf80/u7nrhXAZsWGKaOUWRxhyoYUMDQSFOm0RsGXN96dmFkj
 m7WaQMzNgx/L/h8fvN58kYPfbIf5oySbYhbhDKJEjMKbk8fgCOap3Y/SOgnhWkIypNMO
 tBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747431005; x=1748035805;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cl8sKId1p4fnSWsbXS5nPLz/0J3dr2L1BPCgdcqnxp0=;
 b=Zjgu8cidpewPHi85RFP/BEtrX8aDe5Fxn8MJt6l38c+qbC3AwLcWrOUWUTjIw0R+lE
 LkykH2gS3Hyn9G45G+AipYo/WWyXBKuekMVB80IDnv44TkqlLbjCgRr8/kWiz1rZwUpu
 n1knLS57KuEthlyJPGQ0l6NtmbAo8nPLKiVcQkQM5HCYf8TA2psItK4ArNLI9P8Rw1jC
 knqRsZXKxh0tAH2VCBRvBOwNoS9uMdGqcLXq+MJlPqWEJZtDDGY9sVzii2AwV0q1nhSd
 W6M42RjYZLLToFk8cWqp2YuTfJJ1Hda2fLtb4IBvYgLaxMYX/3Rv+tCcQlteGdrsPFnM
 rcgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIzQbBKD2fGUEYZw3A4C6T3Ozz+9bCuDpRCjWA7Jr+g+ptU1pizOSJngoV6BtVbsrmJUZithrxSwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqorekBVcuTyvUsr4DVMeWbQcH7BefjpydhHywOpcANlAAaD5+
 muTF9MNuxn8Gqa5XlpJwwwnvv1Bs9fQ73s8XdyI+rIhhk7ojSRgQKD6c6C5d5KoEcSkGNyNo+Tb
 Rtcuffw==
X-Google-Smtp-Source: AGHT+IF6I89C9mEIARSlw1bcJepJA60kvrJai+jIj3fEWudVeM5rH1kouHgj/taWzfpRfkrGgw+/t4fBuRo=
X-Received: from pjbsw16.prod.google.com ([2002:a17:90b:2c90:b0:2ff:84e6:b2bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3d07:b0:224:a96:e39
 with SMTP id d9443c01a7336-231d438b420mr68386655ad.9.1747431004975; Fri, 16
 May 2025 14:30:04 -0700 (PDT)
Date: Fri, 16 May 2025 14:28:26 -0700
In-Reply-To: <20250516212833.2544737-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250516212833.2544737-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516212833.2544737-2-seanjc@google.com>
Subject: [PATCH v2 1/8] KVM: SVM: Remove wbinvd in sev_vm_destroy()
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Zheyun Shen <szy0127@sjtu.edu.cn>, 
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kevin Loughlin <kevinloughlin@google.com>, 
 Kai Huang <kai.huang@intel.com>, Mingwei Zhang <mizhang@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zheyun Shen <szy0127@sjtu.edu.cn>

Before sev_vm_destroy() is called, kvm_arch_guest_memory_reclaimed()
has been called for SEV and SEV-ES and kvm_arch_gmem_invalidate()
has been called for SEV-SNP. These functions have already handled
flushing the memory. Therefore, this wbinvd_on_all_cpus() can
simply be dropped.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 978a0088a3f1..e9fd3bcec37a 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2883,12 +2883,6 @@ void sev_vm_destroy(struct kvm *kvm)
 		return;
 	}
 
-	/*
-	 * Ensure that all guest tagged cache entries are flushed before
-	 * releasing the pages back to the system for use. CLFLUSH will
-	 * not do this, so issue a WBINVD.
-	 */
-	wbinvd_on_all_cpus();
 
 	/*
 	 * if userspace was terminated before unregistering the memory regions
-- 
2.49.0.1112.g889b7c5bd8-goog

