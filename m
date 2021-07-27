Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C53D7FF1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9C66E957;
	Tue, 27 Jul 2021 20:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470006E111
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:07 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id a20so64087plm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2339k4b0c5OWODNkIvToUoNb0tla173APtop2g87yK0=;
 b=iEi8m5VvnHSI7PFGMBkWP99DR9/hasEmGaHMmQ/hAQvXWolvYn1ZqWUISR9yx86HKe
 271G4W/Ncz7bw1+gj01x3c+6WGGDOH9Vwl/Z+aiHCXNR+A9GI+MIw4zbZztpHvcFA5pK
 3bJY25UolqjG5yrPadDsyTKAutRNBCjMgVGtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2339k4b0c5OWODNkIvToUoNb0tla173APtop2g87yK0=;
 b=R1DC5U2QNZe+oP5OEsjO6pBAFoo4d0G2mjvzTRDkkBCuOZVSm8MVcWO8a1o9akkXfI
 MSwubtZPCeelIvU/AP4YrPeDDPICHC6uVUPwJ+D9Wv5xIadKP9fKvUWZQMQPmxAr9BIE
 2EHZ8YDIxZ3ww42t7KbeCJrabC5fzjKcuFn1psajvv1NXrFSAzu4R8HdvXVC7Hktgclh
 bQoBvXUP/qB+mfSUde4vrA6L3XK9gN5cRNzpJES5esu65aYEbaX4bsZRuFDPooRh3R83
 A8wqHO1YJDKISVcdiY3CGVyrXIhyom+AykCBhR5uy7VNtI/xwuc6rUhN26PEOdqA/0qB
 5Phg==
X-Gm-Message-State: AOAM531hVRzAmq25T/oCXY4cPd7+GLvUzkHrLhitdmIU/Degh1wPU0dN
 8glYYATyQ9AEakvHMw3efcQsVw==
X-Google-Smtp-Source: ABdhPJyJWxUGA3LrJs4BG51/vLWpJYAHbkWL9HNsMr9tG1fy6upd+bj3BEBNQksVHaNDSvFaiNMgng==
X-Received: by 2002:a63:5610:: with SMTP id k16mr25193869pgb.439.1627419546981; 
 Tue, 27 Jul 2021 13:59:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j20sm4672710pfc.203.2021.07.27.13.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:05 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 06/64] bnxt_en: Use struct_group_attr() for memcpy() region
Date: Tue, 27 Jul 2021 13:57:57 -0700
Message-Id: <20210727205855.411487-7-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358; h=from:subject;
 bh=urnr1c0HuSr0zcemksTCEth1t70QAfbHaEcP+c1mXUA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOBqioJQ+1gy1GQQan/jf7RJ1/WXH5A0qXVd7xV
 vq5+5hOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzgQAKCRCJcvTf3G3AJiWREA
 CNm4WJeCn47J5obmfhInAVhQHs+WaRodzYXqYlwhYZwqztfgNWLmnuTFB7WixSIet+ogzFMJ1r7fzU
 QnWXAsLuJ3BX98gUGzvKpmV42J3D2bYmtlrZs7Eyhzqsf8YU/1DgzM/cyzoMB1MkY7QVnFyA9ECldc
 n4XuqAu3QiaIe+5lzEXU3cW0wy5VDaO3U89VhsX3c6FWjMhQ0FF71U5yZVlZ7s8QMcwjgGQ/rSZ5HS
 tHMaYMmuprGsc0WRWDxssLMce4AZIdKRwnQBGxYX56oM9u/26JaL77KjZeahVv+n4nC+KkXfWFoSls
 jO+qT1zevLJBtQfWAqBgbtl6mxUkW3D/0aBPlL7o63ss885dcW9pWjj8sVkqG2AOPVUcl+mMOp+VQm
 5qmqUeZbnxJVtXjSRXpvzpBMjNj47QiFJaRRu++FQ9+TJ9TwFws9C31mCXsNjIBK/xzNCc0OuY/J2T
 Fuuz5AL5SsvRzztZGGQvpjWG2xGgfilhJucEqfeyaJrFQIvjGMIAVFYzMGX4dwwIpBMhxVU4spof3f
 TLNENoSRR30/sOaQWASgjwj8RqwZ3WioWr4/ALRyqYdHD8j5usq3wgrSpYlAC1AQpefx1uLVDOyes3
 1j+4vL+JqxKC93LWdqu/2gVD/VBJnBjDTcrSW3GQTmYSKuzKxca2WKziYSew==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() around members queue_id, min_bw, max_bw, tsa, pri_lvl,
and bw_weight so they can be referenced together. This will allow memcpy()
and sizeof() to more easily reason about sizes, improve readability,
and avoid future warnings about writing beyond the end of queue_id.

"pahole" shows no size nor member offset changes to struct bnxt_cos2bw_cfg.
"objdump -d" shows no meaningful object code changes (i.e. only source
line number induced differences and optimizations).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.c |  4 ++--
 drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.h | 14 ++++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.c
index 8a68df4d9e59..95c636f89329 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.c
@@ -148,10 +148,10 @@ static int bnxt_hwrm_queue_cos2bw_qcfg(struct bnxt *bp, struct ieee_ets *ets)
 	}
 
 	data = &resp->queue_id0 + offsetof(struct bnxt_cos2bw_cfg, queue_id);
-	for (i = 0; i < bp->max_tc; i++, data += sizeof(cos2bw) - 4) {
+	for (i = 0; i < bp->max_tc; i++, data += sizeof(cos2bw.cfg)) {
 		int tc;
 
-		memcpy(&cos2bw.queue_id, data, sizeof(cos2bw) - 4);
+		memcpy(&cos2bw.cfg, data, sizeof(cos2bw.cfg));
 		if (i == 0)
 			cos2bw.queue_id = resp->queue_id0;
 
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.h b/drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.h
index 6eed231de565..716742522161 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_dcb.h
@@ -23,13 +23,15 @@ struct bnxt_dcb {
 
 struct bnxt_cos2bw_cfg {
 	u8			pad[3];
-	u8			queue_id;
-	__le32			min_bw;
-	__le32			max_bw;
+	struct_group_attr(cfg, __packed,
+		u8		queue_id;
+		__le32		min_bw;
+		__le32		max_bw;
 #define BW_VALUE_UNIT_PERCENT1_100		(0x1UL << 29)
-	u8			tsa;
-	u8			pri_lvl;
-	u8			bw_weight;
+		u8		tsa;
+		u8		pri_lvl;
+		u8		bw_weight;
+	);
 	u8			unused;
 };
 
-- 
2.30.2

