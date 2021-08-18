Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE263EFBA2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8900D6E416;
	Wed, 18 Aug 2021 06:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22796E420
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:22 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id e19so1121813pla.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1LbbD/YHfDVHNeuHjhgxvKcBP+1WtTwantiuN7hQzxQ=;
 b=R/1OtHvoHrsgMZo2li12wNTYlU4PYGAodCOD+bIgq6ChwHsHKH49ggQITGRp9klOcT
 hhN+gn1T653COGeLJn51yUwjbH33XbTplN3tsZd0bxePCyRVYpIOaD3v9sb70h6Hkjpp
 /6QSomg4XXw8M4XDn0+BhJ3006b/HlyORx8ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1LbbD/YHfDVHNeuHjhgxvKcBP+1WtTwantiuN7hQzxQ=;
 b=hp125W+T8ulQ7CXCb0w+R1HH7pxat3wYY5nas1ieg6v52j++su9ucEXU3cl3Sesq+b
 ubSrFbSgo3WUGj0BhxBfmwdTxrA2gSJttc995ORFQ0LJMzuTu1zJj/jOobYBxV11K32i
 Yikdk0u+n52GJ3T9j99OPT0saurdaJnCQltazEW7AQhJjUua+RBXwbdtezZVLVjNAV5T
 CKumTJnxBvmr3spDh7wD1kL/slBk0lm3R14qouPzQi+eTMIOTbqYU+/fUNstZ4Rg8CX2
 qwXJKDQEomfkGTgTXVvM3enGMgSVySteTL5HIhdemVlXoYNqPdCfd2cGCBwPcBrs7wrb
 fxnQ==
X-Gm-Message-State: AOAM532Jr3fmDcl8tkdUTCLDaiVLcb+ABHXWzzMzLiSlaTS5RA2QpuJK
 GW80s6U+yqmEicjPm0j2tzBWww==
X-Google-Smtp-Source: ABdhPJyKMEAVPHsuvTX9JdA/U10JiK4He7DVLG9xhnHdmIIqBLdqt2XQeH2Vwwj2NzeOu2ek31vsog==
X-Received: by 2002:a17:90b:360a:: with SMTP id
 ml10mr7562259pjb.134.1629267262532; 
 Tue, 17 Aug 2021 23:14:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m2sm4664262pfo.45.2021.08.17.23.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 44/63] mac80211: Use memset_after() to clear tx status
Date: Tue, 17 Aug 2021 23:05:14 -0700
Message-Id: <20210818060533.3569517-45-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3555; h=from:subject;
 bh=jIEORg6wH0RDOzc/SbRhmDjozuh0HKi5XMaIwXi52DY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMn1+XywUWgPufzSUanBKkFtpljUhjVl6XdrCJz
 43V0wceJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJwAKCRCJcvTf3G3AJh5OD/
 9VdGJw1yYkd3gefk4A5UR8RKWnRGhCsbm09zznQ7YsRWg1t+N+YFLA4AFq3FqxFeqDG3jzMNoOsdTO
 L6w9PUmC/a9IT1z+It5L++wcgxo3uVfAxiDShSCXzCwqbKDVcSrgSTJgJPulz8y1znwvAOPKF64eH0
 pSX5zFI6NJwx/mf9nIe+nz9g6VrdmWmHR7mcVM4AIklt7/5RSv325yrDnFLwAyB9rv4exDMh6Egpxj
 8sF1D3Pa6Be8GmmXNM7DKo1oqmwnfhplZxkHPfRIFSXVTYwQNGJUx7dCkZsOWVIcy3w6u50Y0mU9DG
 A+XMuV8TDHlOIEIwtbJKGnvgGkIhTldX5Wd95E/0PKvT9wVgxcTgJUCXhO6V/PfeIWGU6PnZ849Td8
 U6ZP5aiyGS6/WCMJuj0tczg2lozZzkge3SUEkNnYtQCKUr1vHrynm7rYVjMrIIvJG275gaGz60NbGE
 67lI4Kcj/LGkuEZPVVCVwWeIwkVBaqWNe+W2D/Gs/U7WC+8+e2X7y7YmCXoJhak0Jjoz1KHL2NKG3c
 7CTZmKih3SVwYKmzxvKgHmp8I/RljMKmk4PyeSMncOwCjk5UYHvkRAslkthRz0xs54C82JmN6NSLCC
 Y8i9yUKlOEZkCSxm3fC3nvo3ctL36pHA5wrQEu1m/IneouARaiIxI65dilNg==
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
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_after() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct.

Additionally fix the common helper, ieee80211_tx_info_clear_status(),
which was not clearing ack_signal, but the open-coded versions
did. Johannes Berg points out this bug was introduced by commit
e3e1a0bcb3f1 ("mac80211: reduce IEEE80211_TX_MAX_RATES") but was harmless.

Also drops the associated unneeded BUILD_BUG_ON()s, and adds a note to
carl9170 about usage.

Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/carl9170/tx.c   | 11 +++++------
 drivers/net/wireless/intersil/p54/txrx.c |  6 +-----
 include/net/mac80211.h                   |  7 +------
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/carl9170/tx.c b/drivers/net/wireless/ath/carl9170/tx.c
index 88444fe6d1c6..aa95d1a65882 100644
--- a/drivers/net/wireless/ath/carl9170/tx.c
+++ b/drivers/net/wireless/ath/carl9170/tx.c
@@ -275,12 +275,11 @@ static void carl9170_tx_release(struct kref *ref)
 	if (WARN_ON_ONCE(!ar))
 		return;
 
-	BUILD_BUG_ON(
-	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
-
-	memset(&txinfo->status.ack_signal, 0,
-	       sizeof(struct ieee80211_tx_info) -
-	       offsetof(struct ieee80211_tx_info, status.ack_signal));
+	/*
+	 * Should this call ieee80211_tx_info_clear_status() instead of clearing
+	 * manually? txinfo->status.rates do not seem to be used here.
+	 */
+	memset_after(&txinfo->status, 0, rates);
 
 	if (atomic_read(&ar->tx_total_queued))
 		ar->tx_schedule = true;
diff --git a/drivers/net/wireless/intersil/p54/txrx.c b/drivers/net/wireless/intersil/p54/txrx.c
index 873fea59894f..8414aa208655 100644
--- a/drivers/net/wireless/intersil/p54/txrx.c
+++ b/drivers/net/wireless/intersil/p54/txrx.c
@@ -431,11 +431,7 @@ static void p54_rx_frame_sent(struct p54_common *priv, struct sk_buff *skb)
 	 * Clear manually, ieee80211_tx_info_clear_status would
 	 * clear the counts too and we need them.
 	 */
-	memset(&info->status.ack_signal, 0,
-	       sizeof(struct ieee80211_tx_info) -
-	       offsetof(struct ieee80211_tx_info, status.ack_signal));
-	BUILD_BUG_ON(offsetof(struct ieee80211_tx_info,
-			      status.ack_signal) != 20);
+	memset_after(&info->status, 0, rates);
 
 	if (entry_hdr->flags & cpu_to_le16(P54_HDR_FLAG_DATA_ALIGN))
 		pad = entry_data->align[0];
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index d8a1d09a2141..4c469b04de37 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1197,12 +1197,7 @@ ieee80211_tx_info_clear_status(struct ieee80211_tx_info *info)
 	/* clear the rate counts */
 	for (i = 0; i < IEEE80211_TX_MAX_RATES; i++)
 		info->status.rates[i].count = 0;
-
-	BUILD_BUG_ON(
-	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
-	memset(&info->status.ampdu_ack_len, 0,
-	       sizeof(struct ieee80211_tx_info) -
-	       offsetof(struct ieee80211_tx_info, status.ampdu_ack_len));
+	memset_after(&info->status, 0, rates);
 }
 
 
-- 
2.30.2

