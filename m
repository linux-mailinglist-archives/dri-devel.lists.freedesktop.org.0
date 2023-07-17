Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC4757550
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 09:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CC510E2DC;
	Tue, 18 Jul 2023 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9205510E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 22:29:26 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b8ad356f03so29626695ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689632966; x=1692224966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XFPVhrUWRZQSAaKQnnj1TZG9poZqEqSu3fVdFJa8KKE=;
 b=YHbmAyIqg8BYpJU1Jk+XnlqKZH3UCVovE5VLeCN3tuNUrY/YLOl0HTKZydaosVQ0mi
 bZ/+W7LaITxuZQ7V0/ZvDUCbe8DuZA62WoXOTwBKy/EH1GOSsAU1WER+eLG5I3bcGQ8g
 9RubTwXoJcDUl8g3IOnz3/GFqSZACjnxzTlCj+4JqoaaXj6mcm/Pbnow99OvOfjdCBkR
 juCPV3H7FJFjkVSd1lhUxp3cd0E0Pg7TUp1lyVgFshzwbhi8ju8hQFNSyiHsXMlks4Mu
 tF6014MG/tDwXw6owFkRGs3p712Y0TRM+xwwZ4ZAyVtu+hsrNEFxxR0Y0OuIfe9awYnk
 teCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689632966; x=1692224966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XFPVhrUWRZQSAaKQnnj1TZG9poZqEqSu3fVdFJa8KKE=;
 b=WVJjUBRBbjMwVYjPjWhuP4ymClSVshucgjnu7nkMra0XeE/rEmJ0teW2a+ROOhjtkQ
 8hj4UDzVrfSYkj+0MkIwUHgUAaC1wuNOnd6UbMG1Bww+z/DOhSsbX9GQsrioNt7pFAWf
 iuoZXOLkFx1bgi63ca+0FqFzrUAfnCXz4IkQtMA16OpYzcsFhTuz88vp/XZXA6kwuBbk
 P8kBmX8DyPABrRv+fJU7nFnSKjmKJxN39QXHo4M4HSTvNxSNX8YDfqv3D3udT1ekLZpI
 iZWAq2dbOkOdEP1xhkq2L3aQwfqSoJbuAMWyH9bvKxytledvWIVD7IXj7bjrU8LkqGLB
 g8SQ==
X-Gm-Message-State: ABy/qLalcPFsoMLjsQzCVggTlCK+r5+RXTY7VLY6c55dx/5RsNWQQ4WF
 oBtCIF5JKwMSJ+3fIYtlVk8CQA==
X-Google-Smtp-Source: APBJJlGcyS1478AzqSwi9033GBaEO4A6Ib9Gvs0E+TYvAHuX+SPIhJ/+F5b4vj5CO2kQ+M8+NIDK/A==
X-Received: by 2002:a17:902:9a4b:b0:1b9:c03b:39d9 with SMTP id
 x11-20020a1709029a4b00b001b9c03b39d9mr10939188plv.53.1689632965727; 
 Mon, 17 Jul 2023 15:29:25 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001b9e8e833f3sm375704plg.61.2023.07.17.15.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 15:29:25 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/display: Allow building DC with clang on RISC-V
Date: Mon, 17 Jul 2023 15:29:23 -0700
Message-Id: <20230717222923.3026018-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Jul 2023 07:28:04 +0000
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
Cc: llvm@lists.linux.dev, Tom Rix <trix@redhat.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang on RISC-V appears to be unaffected by the bug causing excessive
stack usage in calculate_bandwidth(). clang 16 with -fstack-usage
reports a 304 byte stack frame size with CONFIG_ARCH_RV32I, and 512
bytes with CONFIG_ARCH_RV64I.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpu/drm/amd/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index bf0a655d009e..901d1961b739 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -5,7 +5,7 @@ menu "Display Engine Configuration"
 config DRM_AMD_DC
 	bool "AMD DC - Enable new display engine"
 	default y
-	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
+	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
 	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
-- 
2.40.1

