Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1E489343
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B1212A8D8;
	Mon, 10 Jan 2022 08:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B37310E3AB;
 Sun,  9 Jan 2022 20:31:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v6so22930105wra.8;
 Sun, 09 Jan 2022 12:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CVxqdhSmwND7LPC9Ui4ZQJOIVfvWlzvv/90s7w6B5IM=;
 b=c/Zk0NQcXA2SZ9SiVcMCotQhECHHHx7PSWjjvXc3/8beOJuLmOFmaZJ3B0UOrVzQiY
 Rvpt1XGBc0vy0b7vroeODiwR3LaXmdaF/O11MNffAyjvA8a2hSRInyDWEJ1VKGTogXTI
 pvQI30pctZNmdEbD3ly+7Pq9pjmqy4khzpI3vnJ0gHBuTVF0earYnmtKl1lMHPNqnPxL
 3U99hze3eCkl5+lAkf6yln2HDhbiaVMfypz5PYaNS9G4ALkox/GmA+3kxCkV6ei5dJG/
 7BRTQVrLytg9ZI/XwcBLhx+KXNvTrae3srdkbf0Ynwlm/I8Ur3PopP7ez7F+j5l05cvJ
 WCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CVxqdhSmwND7LPC9Ui4ZQJOIVfvWlzvv/90s7w6B5IM=;
 b=qiaPCK/WbiPqdaHqjmiUJqc91asjIAxUJluOIoFo7oxIKJ3N5stkiI/AmZ5VpAjKb0
 U6hX12IIjpt527hMkkWldovRGhGtp72mjnYZAsAwgh+QNNvp5hA+zchuSzbrMpi6a9we
 TR9Tz7qJwQdkWyUznCitoNsCHz210NkIOn2Q5fuOlCoEeiSL6+sOtILgPgfc6ZzDL0vN
 nwBqwt6Ckoewcm/Ll/+p09H9ZA2X8vx7ng+HJec+npv9py40ttRPGVDn+DoQ6svs6LRZ
 LtbW8pjg0rJzYtZBZR/1JHCfXIckY4faH0aQk2g47eQegl1x4ibpSpswGXDZBg+rH+/H
 MbVg==
X-Gm-Message-State: AOAM530qQMwIrUww/vlWGahR1E7vhAMNgW34h3tWhek9NlmVUFFQHa0Y
 paCUhrJy8rU2ZbGx+OlzDKc=
X-Google-Smtp-Source: ABdhPJxVqtlvscb41hOdCYQDVd7o8btAn3V18ZKgh8iUFdh4Qc76jZk6Pjedl6ObHF3sbnrvwkRJrA==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr62101570wrs.579.1641760313091; 
 Sun, 09 Jan 2022 12:31:53 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id f8sm5304253wry.16.2022.01.09.12.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:31:52 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] i915: make array flex_regs static const
Date: Sun,  9 Jan 2022 20:31:52 +0000
Message-Id: <20220109203152.51414-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Jan 2022 08:27:29 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array flex_regs on the stack but
instead it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index e27f3b7cf094..df698960fdc0 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2114,7 +2114,7 @@ gen8_update_reg_state_unlocked(const struct intel_context *ce,
 	u32 ctx_oactxctrl = stream->perf->ctx_oactxctrl_offset;
 	u32 ctx_flexeu0 = stream->perf->ctx_flexeu0_offset;
 	/* The MMIO offsets for Flex EU registers aren't contiguous */
-	i915_reg_t flex_regs[] = {
+	static const i915_reg_t flex_regs[] = {
 		EU_PERF_CNTL0,
 		EU_PERF_CNTL1,
 		EU_PERF_CNTL2,
-- 
2.32.0

