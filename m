Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9620B3EFBB6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85296E426;
	Wed, 18 Aug 2021 06:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EC46E419
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:17 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id l11so1148874plk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0i1or1K/1dFEzNVxMTz6RhSxVOT4OJeaz+0eeqAwhFA=;
 b=Oe49+j/0UXJ7D4hLbrrauzW6DPsuwO4bSYSpu3MHYIR3JnaLRxc45VZexykTP0KNTs
 TmDL4PviB0QbN/Io75LJ7Tfje5mipp/v9WFQqOm9o9gyYM1cBdhUbgEaldWedaWT60xS
 qb7hM0nBEEpQtMj92w3cx9+esvngBsY/a4Otg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0i1or1K/1dFEzNVxMTz6RhSxVOT4OJeaz+0eeqAwhFA=;
 b=mLs4XSnXwlZ54ZDo3rd8Ap6fJ0CsyjmfyFOcI6vcBn1R+j8gqd/lvMyNidy0wtXcMm
 NU9QQl7qCJXB3nhMrX5ZUey7t/lLMAgXA3SaZbuXEBPh7x9D0dPFFajvG+qZkh4ImGde
 BN/BqY0WWf6DmQkC1NikxAmeDeWCk5ugCgNlTvO2xlQul6zc7WYTQhIFy1jJ75iJVK2B
 9wp48ArbKdBymZvV+W1T6VXqhmACg8aN1cxBcHZdcyr+hj54mBkPSwPqwxJtFl9SR2QE
 KUWfeyHg/82jR6YBkVIeeb7Z8mW/tWqhIVh3CP/qqMjBN4mQRmgVSPtfG55zXVUpwg3E
 HAew==
X-Gm-Message-State: AOAM5303bYY/NdcCyaIcwnx2mjZ4J+FOoGur/sDbTlmXTBJHczDggS7D
 3UN6F/uh1VIxB/Fc+6CmtBPVyg==
X-Google-Smtp-Source: ABdhPJywwox1i7+sQwgOh5pOCbo+BOlEsPJIaFcHvRCzFKyYrKK09UqZit7+ggVQZGAHkMaYk9KLlg==
X-Received: by 2002:a17:90a:17cc:: with SMTP id
 q70mr7609797pja.1.1629267256623; 
 Tue, 17 Aug 2021 23:14:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h17sm4603571pfh.192.2021.08.17.23.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Jes Sorensen <jes@trained-monkey.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-hippi@sunsite.dk, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 41/63] net: 802: Use memset_startat() to clear struct fields
Date: Tue, 17 Aug 2021 23:05:11 -0700
Message-Id: <20210818060533.3569517-42-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; h=from:subject;
 bh=C+6KD7t/6fG5hDgRQb4fosYJ4WHPortotbK235WcI2o=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMn5oDen6ROCRtoOkoprqxOZyis1cM1QgeAkzRs
 Z+Yu9WKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJwAKCRCJcvTf3G3AJoehD/
 9r6K6SUsL5lVEdFegLY8K/qjemzJ8Qx2dDCwnIGOnbcI770wVd2gUkq+8bMIiGTpuHm8KLfXED/VPo
 XEYrAiSzdYDynkSQ5uT93DAcDJecWMvkl5cUZenRJ9e335MwzPk46WbpMY5lsvDG4LBrEYQUe3GB15
 fZ8nYwjw5Q+FqdH31kVwt/2NSANrGxWmVtnNghwDYLKm0CqhmEc4kK70cmiOpl45EDBUWHjcVcHhtk
 +PEcSI8yUja1AxKpyhVTXYsFHlVN/kEk65BL8+8npbvCk63MR9WStzKhTbrb23jLFEg5yu8WATqERe
 o8xICyKNkMqYX8hCFs5pnjdeEKWUc2/FYepf6KI7RGfKkvKyE2n/BKKsZFKeZ181uCBiO/JcP0Pipn
 OHApybTpw2p4YCgPfp4IRYVXIyQaygaAotgvJzqZQbLI8E7vsFhH+rcgXzUijzLTAFpUblDhEwLI6b
 cBzYe+DkWVZ6Glc4eJvXZCjr/W7SxC+nlNR+56QP4XtDM7sC1Yi5QeYqjWqQLKsSmiJ1twc3nx9dtJ
 qai0woqnGDGFUMcP9v95DEMFbrsh44dGCjOIVocZ3STFgPzYzmTzvVvmCwlMPH+NaZaZZI/NgHQYpw
 aSEEIjABnuJlCZR3/gTlppRk49XP0ANcu3hytZpYQh0SZTdqnExuxHJTAJ6g==
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

Cc: Jes Sorensen <jes@trained-monkey.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-hippi@sunsite.dk
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/802/hippi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/802/hippi.c b/net/802/hippi.c
index f80b33a8f7e0..6f71ffc8bdd1 100644
--- a/net/802/hippi.c
+++ b/net/802/hippi.c
@@ -65,7 +65,7 @@ static int hippi_header(struct sk_buff *skb, struct net_device *dev,
 	hip->le.src_addr_type	= 2;	/* 12 bit SC address */
 
 	memcpy(hip->le.src_switch_addr, dev->dev_addr + 3, 3);
-	memset(&hip->le.reserved, 0, 16);
+	memset_startat(&hip->le, 0, reserved);
 
 	hip->snap.dsap		= HIPPI_EXTENDED_SAP;
 	hip->snap.ssap		= HIPPI_EXTENDED_SAP;
-- 
2.30.2

