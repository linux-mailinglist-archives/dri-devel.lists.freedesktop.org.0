Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8FC3EFBB3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2C96E428;
	Wed, 18 Aug 2021 06:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD516E418
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:14 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id l11so1148819plk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2xy8/Tts2Q0pCjtb48qnJm2SajC5SEAfbYkA07Au0YI=;
 b=N1IWhHeIGBOPznpFmYcWRZnJUNwykvj7PFgOHlWYvKaPc+cPgY1O8yVwcgQcJCfF0O
 1wIrsy0WvqMxKkjPp7ddmtLZ7u0JBo0fSPMSf4XEMdcOmOVzMLubsGfeG4F7+aLs4Anz
 DBivjnb6cRK6FqL5VKQ3cy4DFeYHbbZmjbWPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2xy8/Tts2Q0pCjtb48qnJm2SajC5SEAfbYkA07Au0YI=;
 b=fterbobm0Mnp4nPFB37heashaa1ezNonlRt3m6oC+uZc05MSHJ2tkX3xXodJRMUFwC
 j0ujrxhJ+56eSpO1pdumkgeTHGPJ1Rji+eLLFL3oX8wi/oL/QjdG2KhRLtsTxOLcqELJ
 GIS14SUZ6VXRG3wolaqZHKDIxSh3BhThRkctRsgLHHF46PW4vs1w/k3wFnxwoZMK3Dyt
 c4t2Y3KA68a4kKlaFitd+U3QGNz8vKqbzulMJpehnnr+Q1Vm+jlTUPkbyw+ILS+3CJ0u
 IVHst8AlFVmgr5Ns1wIrIA4mzBUlauiDlCkWoYt6aGZhtcoO/oUksyihtBTk3f/tFpyg
 y/6A==
X-Gm-Message-State: AOAM531Fl7wdvrazWvemsFnn6j/bOBUfFXIoTwB3kSBhus69PT2LkR6i
 yyRKxisNjOgvwfKXYjExGpk+oQ==
X-Google-Smtp-Source: ABdhPJwZVI61yBxbgc94xcpC0vKFM8RdsF+Geat411+/6IprYSspNUgcCL5/LDmLoHHLCl5CFFI5+A==
X-Received: by 2002:a17:903:41c2:b0:12d:a7aa:40a8 with SMTP id
 u2-20020a17090341c200b0012da7aa40a8mr6069996ple.61.1629267253835; 
 Tue, 17 Aug 2021 23:14:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p29sm4918970pfw.141.2021.08.17.23.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Ariel Elior <aelior@marvell.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, GR-everest-linux-l2@marvell.com,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 17/63] bnx2x: Use struct_group() for memcpy() region
Date: Tue, 17 Aug 2021 23:04:47 -0700
Message-Id: <20210818060533.3569517-18-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3830; h=from:subject;
 bh=GkN0LVVLNQH/53cAo4VYkKN66rn+11NBIFFE2ztC6YM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMhRw9LfaYvUc+sf+L0uY8MlzrAk1ef7MCxvB9t
 k6OtDqOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjIQAKCRCJcvTf3G3AJifDD/
 9c0n+kvuNRhg8rqC3IlmdQj3GSvDZWsG+FKvThaAwsrcm5zgUTbPwQ6iL1wr4Jk3ViFO6PKwpuQs+W
 kYs8Ff8+E5QKNzTFYv9f3U+QrUgXZuliPkgx2C9OIEVvt2UEnDYPUhUqHBMLx0BXSCvr7kVoiYR8b2
 iu457PTEfCQPJdDfKt78EEPnPsrqkubZweDgt/Gq/PsCcnEku9oGBRvz1KKVnO8QWy9TYdunjBP41s
 792+Xj9Zh+GH4ISZfO3dP/vihbtHZcRxlUtqy2yT76MawS9BzD6PInHIpTeYQxnPOICMfQPusrHTT7
 ndnKvr9GSg7peInc8FmZqYcs6y4mjJE/eklW07D6UJI9TtDjmKiqTTBOdNU43zM6qWjHal537hZmIe
 9zFtdGwmUuRUgeltJDGJ4yXIugnOVn6G6DSwMAlT/S3hVGlxpguq6rEv6/0IWLa23jWt9JpGwJ1Jjj
 o+t/SbwzCJ0ClfKocBAik/2Za+ZKR9dJgOeM/G8xa98QQfHOvYYuIP//mv1JYcM1fvVbNymKySQfVs
 8/HAgbbCc54arSAMkCFxkUT/fPiS/v1RbgtjVl9VmyC/p3ATw++a51ydTf5AAZxt2GMj+TS/xSz84B
 SiFL9TGxlTtdNqLwvPbVXHgt96CGuJjKFxAMufc9C7Zx6iAgBZyMu4MpCY0w==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() in struct nig_stats around members egress_mac_pkt0_lo,
egress_mac_pkt0_hi, egress_mac_pkt1_lo, and egress_mac_pkt1_hi (and the
respective members in struct bnx2x_eth_stats), so they can be referenced
together. This will allow memcpy() and sizeof() to more easily reason
about sizes, improve readability, and avoid future warnings about writing
beyond the end of struct bnx2x_eth_stats's rx_stat_ifhcinbadoctets_hi.

"pahole" shows no size nor member offset changes to either struct.
"objdump -d" shows no meaningful object code changes (i.e. only source
line number induced differences and optimizations).

Additionally adds BUILD_BUG_ON() to compare the separate struct group
sizes.

Cc: Ariel Elior <aelior@marvell.com>
Cc: Sudarsana Kalluru <skalluru@marvell.com>
Cc: GR-everest-linux-l2@marvell.com
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c |  7 ++++---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h | 14 ++++++++++----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c
index 0b193edb73b8..2bb133ae61c3 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c
@@ -849,7 +849,8 @@ static int bnx2x_hw_stats_update(struct bnx2x *bp)
 
 	memcpy(old, new, sizeof(struct nig_stats));
 
-	memcpy(&(estats->rx_stat_ifhcinbadoctets_hi), &(pstats->mac_stx[1]),
+	BUILD_BUG_ON(sizeof(estats->shared) != sizeof(pstats->mac_stx[1]));
+	memcpy(&(estats->shared), &(pstats->mac_stx[1]),
 	       sizeof(struct mac_stx));
 	estats->brb_drop_hi = pstats->brb_drop_hi;
 	estats->brb_drop_lo = pstats->brb_drop_lo;
@@ -1634,9 +1635,9 @@ void bnx2x_stats_init(struct bnx2x *bp)
 			REG_RD(bp, NIG_REG_STAT0_BRB_TRUNCATE + port*0x38);
 	if (!CHIP_IS_E3(bp)) {
 		REG_RD_DMAE(bp, NIG_REG_STAT0_EGRESS_MAC_PKT0 + port*0x50,
-			    &(bp->port.old_nig_stats.egress_mac_pkt0_lo), 2);
+			    &(bp->port.old_nig_stats.egress_mac_pkt0), 2);
 		REG_RD_DMAE(bp, NIG_REG_STAT0_EGRESS_MAC_PKT1 + port*0x50,
-			    &(bp->port.old_nig_stats.egress_mac_pkt1_lo), 2);
+			    &(bp->port.old_nig_stats.egress_mac_pkt1), 2);
 	}
 
 	/* Prepare statistics ramrod data */
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h
index d55e63692cf3..ae93c078707b 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h
@@ -36,10 +36,14 @@ struct nig_stats {
 	u32 pbf_octets;
 	u32 pbf_packet;
 	u32 safc_inp;
-	u32 egress_mac_pkt0_lo;
-	u32 egress_mac_pkt0_hi;
-	u32 egress_mac_pkt1_lo;
-	u32 egress_mac_pkt1_hi;
+	struct_group(egress_mac_pkt0,
+		u32 egress_mac_pkt0_lo;
+		u32 egress_mac_pkt0_hi;
+	);
+	struct_group(egress_mac_pkt1,
+		u32 egress_mac_pkt1_lo;
+		u32 egress_mac_pkt1_hi;
+	);
 };
 
 enum bnx2x_stats_event {
@@ -83,6 +87,7 @@ struct bnx2x_eth_stats {
 	u32 no_buff_discard_hi;
 	u32 no_buff_discard_lo;
 
+	struct_group(shared,
 	u32 rx_stat_ifhcinbadoctets_hi;
 	u32 rx_stat_ifhcinbadoctets_lo;
 	u32 tx_stat_ifhcoutbadoctets_hi;
@@ -159,6 +164,7 @@ struct bnx2x_eth_stats {
 	u32 tx_stat_dot3statsinternalmactransmiterrors_lo;
 	u32 tx_stat_bmac_ufl_hi;
 	u32 tx_stat_bmac_ufl_lo;
+	);
 
 	u32 pause_frames_received_hi;
 	u32 pause_frames_received_lo;
-- 
2.30.2

