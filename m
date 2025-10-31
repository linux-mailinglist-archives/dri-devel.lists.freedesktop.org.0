Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A3AC23AA0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A51A10EABD;
	Fri, 31 Oct 2025 08:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nHUICxyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7A10EABC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:06:34 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-29521af0e2cso7601165ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761897994; x=1762502794; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IeLVIXwO7uVSd7Eb1bLuSghidWP97pKx/canepqCQWw=;
 b=nHUICxyfwyeg2ixvbgEA08SsOfdUdQyCVak8MDRP0eoV6fAhwY6XmmmhU47y+Gqyoz
 RXTJm0vsWQKpgWVETQFq4p1U4VozDUMM2whjohIXigO7x2Ko61Wyy2rVjqFKlqWaWdCY
 W9u9JzJOxApF5v+p5ztqJR/duDw/FXbqxJHXvd5cXkmqSgT4Eigd7fTOIlabyeTg3z6I
 RbJBkmO+JoXy0aG1dEyzKJu71s7/nFO96Zjly91iH+HWAwheHsYUT1i55lc9cSNT+Ubl
 jrbGhbpho6JIrRvLtGr6jxoqlteEmZb/v3BqTl7FDNmLFx0D02XJZG6TvYzV88f/uHzs
 Qt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761897994; x=1762502794;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IeLVIXwO7uVSd7Eb1bLuSghidWP97pKx/canepqCQWw=;
 b=CnzfXeazzAkmbXh+cBm2gB0+G+UNXz1Szsv0YtChhmsSgpU2jKTbmC3k0rprjjR8Iz
 jGeuwQaTYZm88oNMsyjy1iTJNWyLPeahgDpDEQ2IufWVU5cCEu9N+VM1wKpZfqtwnrE5
 ez6efXOM0vAWMdVelZ2ieux2kYOMg168148bEHP+kZOlO3tyxcKxqta0ZM2tk78KJGln
 d3lhAHUa42WWnWgIQ31mznE6mE5tHyyx/rFUdxUNL4O/6hCNh/fckxWo1xIa1iFila46
 qoaCF31s+V4dJpRFkNKWk5orUB8L9tyr1BEDjbaKAi44cv8dRvM3+80ZbkNhhIIfddCd
 bYsA==
X-Gm-Message-State: AOJu0Yw/WuRU+v7Jf5JiZk9vWSADrsIACr8r9FQQ5vRSwf/+/wkqhd9R
 6WfgQZGB5XDd+GTLSt2gXp8BWh6R4Pp3yt6dnlN8EyjfnK0vrZaYt7Ac
X-Gm-Gg: ASbGncsAkit6jXUk0kwTaAj+gb1Nzy/U6BU5GyHDOGWkyCkX01/iVaPjQg6DSOIOu0C
 H82YY/DOPoHPeQ2AfOZ+b5iXIVHswgXFkfXQilIKURl5ifOwfnlJNc9JvVavBmVhwbwxSApNfHI
 /Lz638DB+FRZOxQEpgoGZWgTOqOk+/clRSN8kpyayihbtFyouLz7WmOCetqlCC8CvWs04NfXLdX
 9i8pY5vdvHCTfx4GCoBrM7nncI3hLEUs0t+B/OnX/s3yAsD2XQJje8DkRHctgoPW+0Ql3m7pF0e
 3mWX3VpaNmiXA7fgub3Hhi6CS+Ca5p6LRCek+Zsj8/GZNzH7ST6MtSBNA9HtzIankpfYIOZ1/Sg
 7J+IHCM6cO3wypxcCg012jHyLhkP1x3hyEP6x6j7yY2ciP+oE5BJmE4rFMOn7emdJNtLCzBMelg
 mBYk2/pJyMQIPSaqGViyNbtqI88KF4Fa3K4EdlaNrWRR7gGUB5Ml2XtPaND3b5aVQ=
X-Google-Smtp-Source: AGHT+IGhFLRMuVYsJyg0Hk0qGxv9T+7d4+7cAQ0FGbKkkh0amDTMd2Acnw8xiF99bDeg05kFkWf4ow==
X-Received: by 2002:a17:902:b70f:b0:294:e8a0:382b with SMTP id
 d9443c01a7336-2951a4f767dmr25011125ad.54.1761897993644; 
 Fri, 31 Oct 2025 01:06:33 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain
 (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2952699c9fbsm14113245ad.82.2025.10.31.01.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 01:06:33 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 31 Oct 2025 16:06:30 +0800
Subject: [PATCH] drm/tiny: pixpaper: Prevent inlining of send helpers to
 reduce stack usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-fix_202510270858-v1-1-6b111d475ce2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAVuBGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA2ND3bTMingIx8jcwMLUQtco1cTMxDjJwMDUxFQJqK2gKBWoBmxkdGx
 tLQBOGmBZYgAAAA==
X-Change-ID: 20251031-fix_202510270858-2e4643b00545
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761897992; l=2818;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=UuG3+VCNBbYpzeZ0dxVY03iZi2WsaJI6aqGWnRdi9IE=;
 b=mK5+SYBvGWn62MR/m+GdIu/nNPFIfMwQ2E2Ch9x0cFaUiEx+6Qf7V8YKLzV6lC9dvp44QfwL4
 MS+Nsbaq2KSA97KntzVW89WCREuwcThUpa6N6adNPMod4GcASuBpKkk
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=
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

Clang reports that pixpaper_panel_hw_init() exceeds the 8 KB stack
frame limit:

    drivers/gpu/drm/tiny/pixpaper.c:579:12: warning:
      stack frame size (20024) exceeds limit (8192)
      in 'pixpaper_panel_hw_init'

This warning occurs because the compiler aggressively inlines
pixpaper_send_cmd() and pixpaper_send_data() into
pixpaper_panel_hw_init(), which inflates the estimated stack usage.

Mark these two helper functions as 'noinline' to prevent inlining.
This significantly reduces the reported stack usage without changing
runtime behavior.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510270858.1GzE6iQg-lkp@intel.com/
Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
When building with Clang and frame size warnings enabled
(-Wframe-larger-than=8192), the compiler reports that
pixpaper_panel_hw_init() consumes over 20 KB of stack space:

    drivers/gpu/drm/tiny/pixpaper.c:579:12: warning:
      stack frame size (20024) exceeds limit (8192)
      in 'pixpaper_panel_hw_init'

This happens because Clang aggressively inlines
pixpaper_send_cmd() and pixpaper_send_data() into
pixpaper_panel_hw_init(), causing the calculated stack usage
to balloon far beyond the warning threshold.

The fix is straightforward: mark these two helper functions as
'noinline' to prevent inlining. This reduces the reported stack
usage to within normal limits without changing runtime behavior.
---
 drivers/gpu/drm/tiny/pixpaper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
index 32598fb2fee7fcdea3ea0696c2bf54404fcffa2e..70e3239adfd0f86f92551991872486380489fb9b 100644
--- a/drivers/gpu/drm/tiny/pixpaper.c
+++ b/drivers/gpu/drm/tiny/pixpaper.c
@@ -536,7 +536,7 @@ static void pixpaper_spi_sync(struct spi_device *spi, struct spi_message *msg,
 		err->errno_code = ret;
 }
 
-static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
+static noinline void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
 			      struct pixpaper_error_ctx *err)
 {
 	if (err->errno_code)
@@ -556,7 +556,7 @@ static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
 	pixpaper_spi_sync(panel->spi, &msg, err);
 }
 
-static void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
+static noinline void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
 			       struct pixpaper_error_ctx *err)
 {
 	if (err->errno_code)

---
base-commit: d127176862a93c4b3216bda533d2bee170af5e71
change-id: 20251031-fix_202510270858-2e4643b00545

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

