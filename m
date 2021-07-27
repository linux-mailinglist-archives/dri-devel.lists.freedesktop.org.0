Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A283D8126
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5D86E9EF;
	Tue, 27 Jul 2021 21:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C586E9EF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:16:56 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id q2so20420plr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvD4cE9CC0UwuFk0tFrxkl0FdzddHJztTx+G0lXko2o=;
 b=X2kAI6271c2kBTWRkNK+SRyUD05VC55sahGiHWkGhtgogxcqv13k4bEJx1CzoRkXNa
 NYhpiT00hyKycZt5MZCqoJys0Vj8ijuU6JI/ftE4rUt3HcwgYje+gBJFSIJVGEF29R+B
 1p8D2+Q//lxigAx/4Pqgw4xuPqYVkWyNr336o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvD4cE9CC0UwuFk0tFrxkl0FdzddHJztTx+G0lXko2o=;
 b=lvZIH/xylGOJDd5JP7VSH6bzQWutIRp6Mcq1iQRRCBofNz9cIb46IHGEevKE73s/35
 fqG5YlXBhZNv+I404OC6Pu83IOdoz0v/sADazwMyPAkBlOQ+Ppto/naY/dhKVo/F4Wb7
 T48hLEb1aMDBZX+nNVBlZLSlmz3YAk3XSn0bGxjVGBjPvSWXBgXegULz8r4BKBxHr/ST
 WNfKKD4QViK0Ec05142z31fP3SyIi+UCACgpqDdUi3UvjVuX5gQOW+frkLrX1RRUOtFi
 1ya8In93azaqDcrZjBksn5W+vE4gm+puwHp90DnEDxA5BsOtkbMhMGIxYVjiJqVmTbf3
 Dpbg==
X-Gm-Message-State: AOAM531Th4bqfKGfL/MQd7LTmQurVRWtlIt/Q77bJ2vtw4St0NG47gLv
 Db6lla7xWGmWVaSe2iEdF/dSgg==
X-Google-Smtp-Source: ABdhPJzx5uKJYYGIQeb6ncc39fFtWiuuJzbqS3/tvESRfbaEkAgXMJJefnvqpPoyIhq8uFbnDuQ/Yw==
X-Received: by 2002:a17:90a:3fc6:: with SMTP id
 u6mr9309818pjm.146.1627420615860; 
 Tue, 27 Jul 2021 14:16:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t9sm5079279pgc.81.2021.07.27.14.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:16:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 21/64] cxgb4: Use struct_group() for memcpy() region
Date: Tue, 27 Jul 2021 13:58:12 -0700
Message-Id: <20210727205855.411487-22-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3924; h=from:subject;
 bh=y2sMUjTim/gIwxveSmmQhx7NYTt7b1pVbIiPi7Evl4M=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOEnE25c6OQAZUZh7are7MybFphgO5c0XjmqaoM
 cypZk3uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzhAAKCRCJcvTf3G3AJrVgD/
 9EUipW/aGz8pZZO+KYM/hHRGzHn3eJ8lr6sIZd2kwgY/YenMRyXcbyazHaKtq9k4qFGDfasF7ov858
 QgSo0FLS6kKdp77nml8K4O9E8I7ayBPKVtULTSDvCMtWKEqBcfC6Q7M0Nb1UixUrR2Z1JhZZK9WtWH
 ID8omgKPI4LnnaYo4ycEAVB9pzBuOp2dw3mX8jThZiOXisc1A8O6CIE/RAKv1Fno46ecBIpYI58Lfj
 Q2dLClrapmNlYoUxj2kteXxZy308YbZng7p0daoSE68G8Dm0g06bXBLPRLc/bImHPgA3klYnSoixgZ
 RMD6kvFN+5q7n8MnIJdaq7gJBYyPBy/9C6wwG2lmKxvmgPKgNj1zDkyb7ttS5FAEi0kc+f+uE/Qvc6
 LxFFznj1facXXLvYjxYdFVv9TF/b9/6/BBeUCOHLnyB4kGzOqlN4zBCzSlX25q7Qr8HnPEr34tJ/mP
 3QyTlF29k5BfJetxRga3bVSYt4eLe0vVj8bLZug1htSckQNfV4X1STPomfizJ8F8ssl8VR+AZqcEPZ
 ru/Rhw2gsydUoGnN1DHmcUDJjNa8iHRdhVeY0MaxkmG0p3DjmhYkpj3nmosca/JbyjnMdcrVrIyErT
 CYzNTxmbAjdwEJnwSyRPybVcS5R4LwUCJqb30qR0qVGXDBcsbP8DrEjKddqA==
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

Use struct_group() in struct fw_eth_tx_pkt_vm_wr around members ethmacdst,
ethmacsrc, ethtype, and vlantci, so they can be referenced together. This
will allow memcpy() and sizeof() to more easily reason about sizes,
improve readability, and avoid future warnings about writing beyond the
end of ethmacdst.

"pahole" shows no size nor member offset changes to struct
fw_eth_tx_pkt_vm_wr. "objdump -d" shows no object code changes.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/chelsio/cxgb4/sge.c      |  8 +++++---
 drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h | 10 ++++++----
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  7 ++-----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index 6a099cb34b12..9080b2c5ffe8 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -1842,8 +1842,10 @@ static netdev_tx_t cxgb4_vf_eth_xmit(struct sk_buff *skb,
 	 * (including the VLAN tag) into the header so we reject anything
 	 * smaller than that ...
 	 */
-	fw_hdr_copy_len = sizeof(wr->ethmacdst) + sizeof(wr->ethmacsrc) +
-			  sizeof(wr->ethtype) + sizeof(wr->vlantci);
+	BUILD_BUG_ON(sizeof(wr->firmware) !=
+		     (sizeof(wr->ethmacdst) + sizeof(wr->ethmacsrc) +
+		      sizeof(wr->ethtype) + sizeof(wr->vlantci)));
+	fw_hdr_copy_len = sizeof(wr->firmware);
 	ret = cxgb4_validate_skb(skb, dev, fw_hdr_copy_len);
 	if (ret)
 		goto out_free;
@@ -1924,7 +1926,7 @@ static netdev_tx_t cxgb4_vf_eth_xmit(struct sk_buff *skb,
 	wr->equiq_to_len16 = cpu_to_be32(wr_mid);
 	wr->r3[0] = cpu_to_be32(0);
 	wr->r3[1] = cpu_to_be32(0);
-	skb_copy_from_linear_data(skb, (void *)wr->ethmacdst, fw_hdr_copy_len);
+	skb_copy_from_linear_data(skb, &wr->firmware, fw_hdr_copy_len);
 	end = (u64 *)wr + flits;
 
 	/* If this is a Large Send Offload packet we'll put in an LSO CPL
diff --git a/drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h b/drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h
index 0a326c054707..2419459a0b85 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h
+++ b/drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h
@@ -794,10 +794,12 @@ struct fw_eth_tx_pkt_vm_wr {
 	__be32 op_immdlen;
 	__be32 equiq_to_len16;
 	__be32 r3[2];
-	u8 ethmacdst[6];
-	u8 ethmacsrc[6];
-	__be16 ethtype;
-	__be16 vlantci;
+	struct_group(firmware,
+		u8 ethmacdst[ETH_ALEN];
+		u8 ethmacsrc[ETH_ALEN];
+		__be16 ethtype;
+		__be16 vlantci;
+	);
 };
 
 #define FW_CMD_MAX_TIMEOUT 10000
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index 7bc80eeb2c21..671ca93e64ab 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -1167,10 +1167,7 @@ netdev_tx_t t4vf_eth_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct cpl_tx_pkt_core *cpl;
 	const struct skb_shared_info *ssi;
 	dma_addr_t addr[MAX_SKB_FRAGS + 1];
-	const size_t fw_hdr_copy_len = (sizeof(wr->ethmacdst) +
-					sizeof(wr->ethmacsrc) +
-					sizeof(wr->ethtype) +
-					sizeof(wr->vlantci));
+	const size_t fw_hdr_copy_len = sizeof(wr->firmware);
 
 	/*
 	 * The chip minimum packet length is 10 octets but the firmware
@@ -1267,7 +1264,7 @@ netdev_tx_t t4vf_eth_xmit(struct sk_buff *skb, struct net_device *dev)
 	wr->equiq_to_len16 = cpu_to_be32(wr_mid);
 	wr->r3[0] = cpu_to_be32(0);
 	wr->r3[1] = cpu_to_be32(0);
-	skb_copy_from_linear_data(skb, (void *)wr->ethmacdst, fw_hdr_copy_len);
+	skb_copy_from_linear_data(skb, &wr->firmware, fw_hdr_copy_len);
 	end = (u64 *)wr + flits;
 
 	/*
-- 
2.30.2

