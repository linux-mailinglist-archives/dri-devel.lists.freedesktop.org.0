Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578FF3EFADE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C9589664;
	Wed, 18 Aug 2021 06:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404BB6E406
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:06:05 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 18so1066402pfh.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vtwcSVdVTFoZmc04BzBkMsZrmW9WU0SQRrViE0dMhIM=;
 b=Z1gB5H+T4fVxQ9g7C046IHH7yRTsOIIkoqVD70Mvn7Km3k9/+QRqPilFblkj1uhpqQ
 HJP2ZYOXSNYzlbKXjxf/6OiulCTO42svSQHjQHTNwmpWThK5Q3l30wWPG5s2IE7kBDhy
 /v6uHno+sopqjj1/YM8w60Afemeq49IhOrlYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vtwcSVdVTFoZmc04BzBkMsZrmW9WU0SQRrViE0dMhIM=;
 b=hh3pO61o9spxsSUlmrpA2VdQqgb7BF3WJZrHv5d+V2klrQ7q8i0BTVDQi0eGPbK3QC
 CrSrv3CyhiAceZPgir3nmiNoPnd8ISy8F9piNESo50pl69MgJe7Sy5lPPFDC0Kb6vGoG
 Vd2mwjzgF0GVBULL6PM2EJTulxn5EQAgW8PSOI+/oxIWyXjyt8+6nKFK7a0BnHxO5BM5
 zusXvtw90IE12WHkSAvcEPT29UKxsNqJLp5KV/hia0+3CX685RSJaREggoEKi4tHPUtb
 77Q8+wNyiMVKAiiboIEsz1oBu8hsCDKMtseB5iKxkNYHUVWTAB2VNareq8Q/Bk5vyKyR
 yz1g==
X-Gm-Message-State: AOAM5322J5Dix94u3v/SPbi0IAxDGWiXLVnLYDhvKhE8tRLTu6OHhHWR
 3hDQMBcTmTCdEr2LuIfbC5hwQA==
X-Google-Smtp-Source: ABdhPJx3FtQFX8RskWrausYNddXgw3mS8wwHMQa70n9fNMHoQAnpneqhnt2vKRb+O5Y6R98gISV33w==
X-Received: by 2002:a05:6a00:1ad3:b029:3e0:c106:2dea with SMTP id
 f19-20020a056a001ad3b02903e0c1062deamr7475031pfv.8.1629266764822; 
 Tue, 17 Aug 2021 23:06:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n30sm1015079pfv.87.2021.08.17.23.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:06:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, dccp@vger.kernel.org,
 netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 42/63] net: dccp: Use memset_startat() for TP zeroing
Date: Tue, 17 Aug 2021 23:05:12 -0700
Message-Id: <20210818060533.3569517-43-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; h=from:subject;
 bh=oy6iBSCr9kyZzvyYymYY57kzNqoaMnV5JLYgBAUoJm0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMn1SkgQ8BjGsCq2GdMgGzLdaT1ETjcggbTd7md
 ILaTjp+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJwAKCRCJcvTf3G3AJuyaD/
 4sQC9WJISdx2sivmaYm8XFbYloHqwWeRooJB9Xn5LQlXYeixqdc3xt1r2gvg66w3xCH+tVVrX9xwZ8
 j4rOz0Jnr4M4+XoPft5UNGFK5WHVSQxM1uFZ6yYUAzKW8y+4UNCClX7NR8hlCV6VzksxhefmAPPtmS
 wOq7tQbgdvsAdVIszxfGUQEQ/lsjPMC/whKeduyJAGzs1zzly6D2vtwy0ZqcaAksRvJiZQJ40aB4zR
 mW+la1HOBIsMfVxsqbEcAWaJPSQAIOhZNkyVHQp6hsVB1RDZN3i3KFqmpmAkeVu2vlJF1EKcdgGaEn
 jyCwLPfogMCZn9L/uBRkh+ra5YX7NEEWpVHUFB3qfY8BR7bV/cmBNHN9o9xE2BB2e5L9mVlsgzLs5N
 +ZgL0eXIWi7FZf8+kVbThu2pP/RPDsS+237VGqD842n6pSszz+Ef+1o6GC8dcy1e/RD0ca/bTNa5N4
 IxUAbV/MpfsG0SAYjf5hGJPBD5JnPZKJypzRlhJyPq16auQMT6oq3Br8H9Bqrol1u3NMiDR5o+pwtf
 tVZXMStjqtGmw0i8+SVL+bnPCzcw4UxGNNF0OxZi7Xh5YdVPsWcdXNWPjX4cWWnd8R6sNMzlOOLjqy
 +W6jas5qQpj5s60ah2DQNcBu2uwwUtZ3ce3UAMyWXl/MPjF/Wzb6mFfp/Anw==
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

Use memset_startat() so memset() doesn't get confused about writing
beyond the destination member that is intended to be the starting point
of zeroing through the end of the struct.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: dccp@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/dccp/trace.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/dccp/trace.h b/net/dccp/trace.h
index 5062421beee9..5a43b3508c7f 100644
--- a/net/dccp/trace.h
+++ b/net/dccp/trace.h
@@ -60,9 +60,7 @@ TRACE_EVENT(dccp_probe,
 			__entry->tx_t_ipi = hc->tx_t_ipi;
 		} else {
 			__entry->tx_s = 0;
-			memset(&__entry->tx_rtt, 0, (void *)&__entry->tx_t_ipi -
-			       (void *)&__entry->tx_rtt +
-			       sizeof(__entry->tx_t_ipi));
+			memset_startat(__entry, 0, tx_rtt);
 		}
 	),
 
-- 
2.30.2

