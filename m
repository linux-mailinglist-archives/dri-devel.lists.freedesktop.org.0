Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365583D7FC3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55356E92E;
	Tue, 27 Jul 2021 20:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0326E8B2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:09 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so6658922pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RbUTIPyfuQU3KvEwbLJbeU9iwD29PEErUjBhpe3f1nk=;
 b=GtYyBBbtPxLFI/WfuLaMvDoXxWyPmC0zNQzNuCkFG4NF0Vg9BHEps6UBdbqkXeNeF3
 TCLGbDASIg/2n9k5Rj/pRUe4EsWyA1ECIuxw4qfKiy8940LxdncMbz9exdPrnZjqZaTH
 WwI9EGrUEd5BHZVFi1kSv8N0o7CeawloSKwTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RbUTIPyfuQU3KvEwbLJbeU9iwD29PEErUjBhpe3f1nk=;
 b=Sh09Z1GuAt3fkw+E9VdZoWSkIBIM2KksqMdV4U+Ul8tpRUenmh/JzUFtvVRDCdPdai
 NBtAFxvu5w/2J6P9NPyb/oEcnTdSbXrlNszwLs0P8MSyMvWKgEetNGg/WTK99X7jSxrT
 fpyIUv6aN5DAj1+jRsPk0L0UM6T10e21RGxIa2gR7DoGVCEOOX0k3sPjHGaIIk2kgGRr
 T8YBg5kZoqHzT/m20qlM+VzK457Ne69I4bKiaIOQnQWqtyRj9+nYH64xU37crnWcw0BZ
 WHtnD/WNVg97eJVC1Kksr1eAlBcx7DozQmQ9ZISG1M948eWIYc6uf4NYS9EUqOuiNY/X
 mOrw==
X-Gm-Message-State: AOAM532KjRuMs90HX0s/89GRKIP3IfvpE8zuLm5iKhUguz6Uu7G+GfF6
 Y8owUoKQuUIPoQ1pNE7zsuEcLg==
X-Google-Smtp-Source: ABdhPJy7+ciBuOtNN7d83O4Zu0WNd8ovLzhIYFckNLYZmMMBqTt0NJ7ydcv6U7b3s5X1OqBXomDXgw==
X-Received: by 2002:a63:4b20:: with SMTP id y32mr25282843pga.382.1627419549553; 
 Tue, 27 Jul 2021 13:59:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n12sm5264202pgr.2.2021.07.27.13.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 14/64] libertas_tf: Use struct_group() for memcpy() region
Date: Tue, 27 Jul 2021 13:58:05 -0700
Message-Id: <20210727205855.411487-15-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; h=from:subject;
 bh=aN5SRWSO0jhRLPZQ+xEXk4KxeSHDMCg25qp77Fv8hh8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHODeg0TURmPLYxq0mwE2hFWy/0AYNHuIKbeAQlp
 DWoEAlmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzgwAKCRCJcvTf3G3AJjDjEA
 CAOGWMwUe/TqhcNNpZ+tmgfq8Zfq/oBEgyGg6BbrnIuZqsMJLAnXFi1FFsi5XiWdBd9wW2z+pWLDsZ
 Qk5cK3uqkczBfKd+ThpeYFCNe/sGC223YyA78nUC5LdHCnah148wC6VuU4iYiPf187zVu1aljWgPkP
 QgNCXG2oB9NqtBh3pf0JmaHSqgeAqqpxLaVaFEmJDH7QkNmA17wGfU899KFpdb3HVZ8CkncDMoZhn1
 DPXzHpS9vXg9vY+WPSF5Taeau8VEyUmFL+4Pc4A2M2LVWkpNBJCyJaADuQQg6QJdEmd9Qr6GMczp8B
 kuQcY9rOtl7uJhxsUbV+WyMYzIHXeJTGYueZa//yzwGhHGliQt3xlVGVyKk9A3pnvgh3jDJN8uYVaj
 b/rYpFLFcaBGhaT1yXcgkFAyKZpXO8Vh/Pi/2cwO1Z5UW4BAcnj54ZvKyiY4BZaN4jeZ47sDe9ccuy
 Y2ISwX8AwsLUH5I50e1AM5SHgOwd6aFVQVGJ0mAJspEUB2gl2BWkH9f+9sQ4HHmBKVKFcOmb1P4Ax/
 PyqbaIoRlAj521CKzVKPR5wMiaW+0R2VneaPhPljqaAoY8fgIovvOjTe7GjzsFwSiv1CtakSIvU3Td
 UV1MTQ9MpUR6nFelPgLKjEpZMPkFtJ/MjnG8kchV6cXWqyz8+t5IN5yp45VQ==
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
field array bounds checking for memcpy(), memmove(), and memset(),
avoid intentionally writing across neighboring fields.

Use struct_group() in struct txpd around members tx_dest_addr_high
and tx_dest_addr_low so they can be referenced together. This will
allow memcpy() and sizeof() to more easily reason about sizes, improve
readability, and avoid future warnings about writing beyond the end
of tx_dest_addr_high.

"pahole" shows no size nor member offset changes to struct txpd.
"objdump -d" shows no object code changes.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/marvell/libertas_tf/libertas_tf.h | 10 ++++++----
 drivers/net/wireless/marvell/libertas_tf/main.c        |  3 ++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas_tf/libertas_tf.h b/drivers/net/wireless/marvell/libertas_tf/libertas_tf.h
index 5d726545d987..b2af2ddb6bc4 100644
--- a/drivers/net/wireless/marvell/libertas_tf/libertas_tf.h
+++ b/drivers/net/wireless/marvell/libertas_tf/libertas_tf.h
@@ -268,10 +268,12 @@ struct txpd {
 	__le32 tx_packet_location;
 	/* Tx packet length */
 	__le16 tx_packet_length;
-	/* First 2 byte of destination MAC address */
-	u8 tx_dest_addr_high[2];
-	/* Last 4 byte of destination MAC address */
-	u8 tx_dest_addr_low[4];
+	struct_group(tx_dest_addr,
+		/* First 2 byte of destination MAC address */
+		u8 tx_dest_addr_high[2];
+		/* Last 4 byte of destination MAC address */
+		u8 tx_dest_addr_low[4];
+	);
 	/* Pkt Priority */
 	u8 priority;
 	/* Pkt Trasnit Power control */
diff --git a/drivers/net/wireless/marvell/libertas_tf/main.c b/drivers/net/wireless/marvell/libertas_tf/main.c
index 71492211904b..02a1e1f547d8 100644
--- a/drivers/net/wireless/marvell/libertas_tf/main.c
+++ b/drivers/net/wireless/marvell/libertas_tf/main.c
@@ -232,7 +232,8 @@ static void lbtf_tx_work(struct work_struct *work)
 			     ieee80211_get_tx_rate(priv->hw, info)->hw_value);
 
 	/* copy destination address from 802.11 header */
-	memcpy(txpd->tx_dest_addr_high, skb->data + sizeof(struct txpd) + 4,
+	BUILD_BUG_ON(sizeof(txpd->tx_dest_addr) != ETH_ALEN);
+	memcpy(&txpd->tx_dest_addr, skb->data + sizeof(struct txpd) + 4,
 		ETH_ALEN);
 	txpd->tx_packet_length = cpu_to_le16(len);
 	txpd->tx_packet_location = cpu_to_le32(sizeof(struct txpd));
-- 
2.30.2

