Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357667F407C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 09:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B271010E5E8;
	Wed, 22 Nov 2023 08:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C086310E2B7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 03:06:27 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6b2018a11efso6383591b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 19:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1700622387; x=1701227187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQTyfvTA/sT9rfHfHNgSFRFvzietrqmBvaroSzp1CzI=;
 b=kqDa1l0SFNK8I0UmSRPYq5Totg+A+dltq8plBO3oEKgTogUIlSCsNBF+leACgpNIST
 KDxwIF8BDzTcopL7HCK8LstcH4QFfzaPZiGwAtKTOkMgYg9OGwJZPPXGMQi5WoTUDdgF
 o8cNF+r2JiU6Fj38gB2DkDHfDriMOQ3NxkK5kMfqhoRFcHugANaYBQMI6aXkgyHsodjG
 0y4qJM2ApnlNitDPep9Rw+hyPMqvhouSM5IiN5kmKveCY+M77WulbeRAlo9bAhJ6NMVG
 x03x0rxDsMb49in5gAdaTaYHB3PprWazM8w5cWmtYTn/Kpusl0iyUEWdQc98z6d+8CWH
 yJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700622387; x=1701227187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQTyfvTA/sT9rfHfHNgSFRFvzietrqmBvaroSzp1CzI=;
 b=pYZuEJhNKFypsdB5SRVHxt6qL/34V90cwzEDHvs6B7DzdwKDty1K3h+WhIgPhl8HfR
 fiDeFL/rQdBfQSTuUlvjrvktjOWIOfRf9ycKxuW4FNdo1vWQ586PtPy9P2Apt2xmP5fy
 4VyOow6E0TkW9zpikzRdDwHzPLD5RuSjtjnayU81Eaq6ShV+dbMNYEcI9j4Yxb+m5xVz
 LK4oC/UhVSASku5MVyXmMA25o/HPuPPKSq8vHsO9NNwImBjpFLykQy+hoMYN1Yl5dQ7G
 lWZwyGQviU4FxiMLSCZ6WjPbX8xU/6HGiIROqBsNglFB2tO1iBfo1xLI/wREs8RP0zCv
 myIg==
X-Gm-Message-State: AOJu0YwXx3x8Hh65YvXoTYL0w4djaak4j28UK5Wdzv0x7dkYyLBEOKoB
 PisZj2dCrPrhAfhQCUeGo2KWFw==
X-Google-Smtp-Source: AGHT+IHMBi1+1x3Yt/bfrl9gyv/iDKPNW7+yCziyo+xCTBYWw/hNzj1p+tHsCVOZgnyBdWAdN+80eQ==
X-Received: by 2002:a05:6a20:78a2:b0:186:2389:a73e with SMTP id
 d34-20020a056a2078a200b001862389a73emr933242pzg.55.1700622387226; 
 Tue, 21 Nov 2023 19:06:27 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
 by smtp.gmail.com with ESMTPSA id
 s2-20020aa78282000000b006a77343b0ccsm8614917pfm.89.2023.11.21.19.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 19:06:26 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] riscv: Add support for kernel-mode FPU
Date: Tue, 21 Nov 2023 19:05:13 -0800
Message-ID: <20231122030621.3759313-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122030621.3759313-1-samuel.holland@sifive.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Nov 2023 08:45:31 +0000
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
Cc: Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed to support recent hardware in the amdgpu DRM driver. The
FPU code in that driver is not performance-critical, so only provide the
minimal support.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/switch_to.h | 14 ++++++++++++++
 arch/riscv/kernel/process.c        |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index f90d8e42f3c7..4b15f1292fc4 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -63,6 +63,20 @@ static __always_inline bool has_fpu(void)
 	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
 		riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
+
+static inline void kernel_fpu_begin(void)
+{
+	preempt_disable();
+	fstate_save(current, task_pt_regs(current));
+	csr_set(CSR_SSTATUS, SR_FS);
+}
+
+static inline void kernel_fpu_end(void)
+{
+	csr_clear(CSR_SSTATUS, SR_FS);
+	fstate_restore(current, task_pt_regs(current));
+	preempt_enable();
+}
 #else
 static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4f21d970a129..6a18bc709d1c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -225,3 +225,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
+
+EXPORT_SYMBOL_GPL(__fstate_save);
+EXPORT_SYMBOL_GPL(__fstate_restore);
-- 
2.42.0

