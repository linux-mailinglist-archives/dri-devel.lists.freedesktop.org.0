Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547D7F407A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 09:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B548010E5E5;
	Wed, 22 Nov 2023 08:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B8D10E253
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 03:06:26 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3b83c4c5aefso286750b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 19:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1700622386; x=1701227186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n4I/LD7GmsgMbduRtQjHbuBVYFqV+JeYB9eIa+Lz0UU=;
 b=JnsVzVcTpISkoewDdl55KHfcycitatFg/qQDOtcHmGJ0FgqktZcLUzf42AdSwcnZyg
 262Iu3RQs27RnRAHUN8I/m7QrUOUmy63jqdLNo4ILkXkDJZC6fly99bI6CnwdiETqIh8
 TNRJfYtlG3jxwOU6wz26XLGsiMRC9aeQRjVmhg8mMpTDLee+pPshmRtTsNLpyrNmwQp6
 C1p3SFJC06U5UGxpGCOedDy/LqALtpN4lYUFxnz5k19SQF3TNFJwsi0jLRMbTq+hb75q
 GGuP6BMxpEjCkBUONU5XCts3adPYrqYG0LncOb7k+upYM91/elHezcgwl2GaPDJ/eVL+
 +YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700622386; x=1701227186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n4I/LD7GmsgMbduRtQjHbuBVYFqV+JeYB9eIa+Lz0UU=;
 b=RfFv1nvMLA0pDp5Cwa0P6F0jSx+XPtIEBtzCRj0+189xdC0oeqc9n/3GQyXEbeg9h6
 Cmb9g5V2BzvswuxLKrycDJLhXh2j7PaU3AuiRp6KyCeMydBSYFGJMexBWyoFWnUDyjJi
 t+htWUgU8yyIHQrfpxsIwoB7y6l7O2knxFplnuei58zfASEofq0YcSgt0RHUZeCWahJA
 zTDxX0uTE279ZU/ut8gsT6ksvAUPkfA4ODfNSCZHIQj0c9BXets0mwA3tQEqtiprDEzK
 fYQXhUuwS8XFGElcU31PEHxI3HJonlSQ7zz8mnb2nYvRfer1ecb6cdf6WDQK2XZva2R3
 3STg==
X-Gm-Message-State: AOJu0YxIJj9EqhIbvAWwIiNPUkFTk8NUv/ZdNu979uuDbFW7MHAGtWc0
 BxP4OF0zNuWRUljM34exj5HidA==
X-Google-Smtp-Source: AGHT+IEIpXI2h8pXg+ykpqNNYZiarqi3t5LKkDhtbal14Y2nnzqjhX+0ng3mTUwJLxHE3tG0iOG9Lg==
X-Received: by 2002:a05:6808:bce:b0:3b8:3ec6:8a41 with SMTP id
 o14-20020a0568080bce00b003b83ec68a41mr673776oik.45.1700622383389; 
 Tue, 21 Nov 2023 19:06:23 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
 by smtp.gmail.com with ESMTPSA id
 s2-20020aa78282000000b006a77343b0ccsm8614917pfm.89.2023.11.21.19.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 19:06:23 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] riscv: Add kernel-mode FPU support for amdgpu
Date: Tue, 21 Nov 2023 19:05:12 -0800
Message-ID: <20231122030621.3759313-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series allows using newer AMD GPUs (e.g. Navi) on RISC-V boards
such as SiFive's HiFive Unmatched. Those GPUs need CONFIG_DRM_AMD_DC_FP
to initialize, which requires kernel-mode FPU support.

I'm sending these patches as one series so there is a user along with
the infrastructure being added. I assume patch 3 would be merged
separately, after patches 1-2 are merged.


Samuel Holland (3):
  riscv: Add support for kernel-mode FPU
  riscv: Factor out riscv-march-y to a separate Makefile
  drm/amd/display: Support DRM_AMD_DC_FP on RISC-V

 arch/riscv/Makefile                            | 12 +-----------
 arch/riscv/Makefile.isa                        | 15 +++++++++++++++
 arch/riscv/include/asm/switch_to.h             | 14 ++++++++++++++
 arch/riscv/kernel/process.c                    |  3 +++
 drivers/gpu/drm/amd/display/Kconfig            |  5 ++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c |  6 ++++--
 drivers/gpu/drm/amd/display/dc/dml/Makefile    |  6 ++++++
 drivers/gpu/drm/amd/display/dc/dml2/Makefile   |  6 ++++++
 8 files changed, 53 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/Makefile.isa

-- 
2.42.0

