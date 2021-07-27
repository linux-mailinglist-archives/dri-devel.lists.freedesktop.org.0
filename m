Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A505F3D7FBC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F56A6E7D9;
	Tue, 27 Jul 2021 20:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F726E111
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:04 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e21so2943pla.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HpqGAKzdyVBA/Xfwi2YIWzNMC8MxbuJr9wu4OHi5PCI=;
 b=b9n3PLWe+yZgButmI22wyxu+eeyOUhPxCDUEfynBqPyMnsrnYQiVExI+J4v3rxE5/o
 G8J1IXNU0m0vNz/8YTkfJoaVZZj0wRBYaQuAJPoofDusamLFunZmfD45sWLn68LLU6JA
 BeETDRJ6OBfY6C94RhaCenx0bdi00zda2HbHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpqGAKzdyVBA/Xfwi2YIWzNMC8MxbuJr9wu4OHi5PCI=;
 b=SvIJ6TIy6+BS27KQBWYEYP/ealZAw/isjqahHyNvbI+bdQ7Xct2xHNqZGcJeg6k2f/
 IUSgZi7FLfqGMabrAhg7CIAD/JGshm7JsCZ6mwr8c25O+i0p5luQA33BiSVT67sPdS4G
 tDF1V02EHFHnTgfARNTPcI80nqMpGYKDRYsf4mtcgQQc6mL9Xqm0MmRPRdhYg5ldB8dJ
 H/+QB8ylVBzgTAvndrG+IZ7BM0h7qnB07r7XSpMFIcChKEn8U+53sBl+AOt7UJ1MYNZo
 Qeg7tVtgk9Vods9ZHhRIgRpP9mwbE1pXyUffpWJpCPBjRsL3rLV35kdcaLanW8ngFPJe
 wL9w==
X-Gm-Message-State: AOAM533XVbV1XdOUoyet98hfGi6B2lb9+9+XZRMcp8RY6ODDCud98Ac9
 Z9aIfbzJSUpE66SsOEuw+ujLKw==
X-Google-Smtp-Source: ABdhPJwDSoBnYuvYRba1s+KLi8H28OXxuTeCqk1M8Bi6vVkOBrXn2p1i6DPX5y3V6fg7nYwJU2Ltsg==
X-Received: by 2002:a05:6a00:1391:b029:347:168f:1be7 with SMTP id
 t17-20020a056a001391b0290347168f1be7mr25305700pfg.70.1627419544638; 
 Tue, 27 Jul 2021 13:59:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z11sm547955pjq.13.2021.07.27.13.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 02/64] mac80211: Use flex-array for radiotap header bitmap
Date: Tue, 27 Jul 2021 13:57:53 -0700
Message-Id: <20210727205855.411487-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3134; h=from:subject;
 bh=5kQsK42FaWrxRPo6tG17S0vU5dwTXkF5YJ2Hl+bjQYs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOASZA2wSHJdmV0oArAVWb1HVe/NAsbCB3ibAr6
 bxRmCeCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzgAAKCRCJcvTf3G3AJucAD/
 9WI40Y8DsttY+40HaEXLlcd6Xryj8yJoVYK9d3gFpDvBSXYBI3VB3m525SOa2sCJC28jHTFRiHhMP6
 huqw/nIdms4tjuS8pOZ+DGwzggPQcPgixq4hWdvWbXbeWvQ8mzb3g3NqUh7MCUUYaHd0XZHxeZEa68
 KBhKJTR1IzAMdGAY+67PouIo4YzyBaBznnCQb+NLdIUlfT6t8W4CZN8+AQx4EbaO/u03il9VH+AfXK
 zdL7aZ+v+6RlA8EstG3CnlY/VnSeo0q9XrTH0Q56zymAeoXPIKieJGMZFa6iM2gjIrRUcDFGpVhu7C
 FZJrEnBqWU+ZIq8c+Zv+XxxBR1dgFsXNeW0wYvt3oXMHiOFT6xXQ9AnpctZU8KlMtct/hdjCaZw4oR
 6asBqobuZZVyim88vDBe4PCm0P2lmf5t8CRqSL58iOkzZjRIH+nNwtC8icwiMHZbEOgdBWJYI4n844
 m7nJHNp9t3NKdyBYEy6/4q2ExNfaSeCS36fcueGEcPaVGU6/xc4bbPtOCUCt/ocW7/1gVWfDLaGod7
 erVQcNz7hMISnSKfJsI54OZh2ah7BqVzDbpCwCewNsGxodKlGatSWB6nfpU2DxvtQKgn0q2ExYIS5K
 sH5r2wLmmPf369ln2Cl1YKvhBYGnsOEMQkCSbYctGbRwD2e8tiHtSiSMTzJw==
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

The it_present member of struct ieee80211_radiotap_header is treated as a
flexible array (multiple u32s can be conditionally present). In order for
memcpy() to reason (or really, not reason) about the size of operations
against this struct, use of bytes beyond it_present need to be treated
as part of the flexible array. Add a union/struct to contain the new
"bitmap" member, for use with trailing presence bitmaps and arguments.

Additionally improve readability in the iterator code which walks
through the bitmaps and arguments.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/net/ieee80211_radiotap.h | 24 ++++++++++++++++++++----
 net/mac80211/rx.c                |  2 +-
 net/wireless/radiotap.c          |  5 ++---
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/include/net/ieee80211_radiotap.h b/include/net/ieee80211_radiotap.h
index c0854933e24f..101c1e961032 100644
--- a/include/net/ieee80211_radiotap.h
+++ b/include/net/ieee80211_radiotap.h
@@ -39,10 +39,26 @@ struct ieee80211_radiotap_header {
 	 */
 	__le16 it_len;
 
-	/**
-	 * @it_present: (first) present word
-	 */
-	__le32 it_present;
+	union {
+		/**
+		 * @it_present: (first) present word
+		 */
+		__le32 it_present;
+
+		struct {
+			/* The compiler makes it difficult to overlap
+			 * a flex-array with an existing singleton,
+			 * so we're forced to add an empty named
+			 * variable here.
+			 */
+			struct { } __unused;
+
+			/**
+			 * @bitmap: all presence bitmaps
+			 */
+			__le32 bitmap[];
+		};
+	};
 } __packed;
 
 /* version is always 0 */
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 2563473b5cf1..0d959a98e908 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -328,7 +328,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
 
 	rthdr = skb_push(skb, rtap_len);
 	memset(rthdr, 0, rtap_len - rtap.len - rtap.pad);
-	it_present = &rthdr->it_present;
+	it_present = rthdr->bitmap;
 
 	/* radiotap header, set always present flags */
 	rthdr->it_len = cpu_to_le16(rtap_len);
diff --git a/net/wireless/radiotap.c b/net/wireless/radiotap.c
index 36f1b59a78bf..9f4f1a772964 100644
--- a/net/wireless/radiotap.c
+++ b/net/wireless/radiotap.c
@@ -115,10 +115,9 @@ int ieee80211_radiotap_iterator_init(
 	iterator->_max_length = get_unaligned_le16(&radiotap_header->it_len);
 	iterator->_arg_index = 0;
 	iterator->_bitmap_shifter = get_unaligned_le32(&radiotap_header->it_present);
-	iterator->_arg = (uint8_t *)radiotap_header + sizeof(*radiotap_header);
+	iterator->_arg = (uint8_t *)&radiotap_header->bitmap[1];
 	iterator->_reset_on_ext = 0;
-	iterator->_next_bitmap = &radiotap_header->it_present;
-	iterator->_next_bitmap++;
+	iterator->_next_bitmap = &radiotap_header->bitmap[1];
 	iterator->_vns = vns;
 	iterator->current_namespace = &radiotap_ns;
 	iterator->is_radiotap_ns = 1;
-- 
2.30.2

