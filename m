Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20673EFBB8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA4B6E42C;
	Wed, 18 Aug 2021 06:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B1B6E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:20 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id c17so1170982plz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2pM2ucDG5zliIAHLMoXUSUCi2eG5GhvAhwNtz+MErg=;
 b=mwg1q+Bt4QS2kDiAiYMrptxKuPiLfGTL3MbhRH+y+rtpN+PzOswpzAybX1QwsdWpC+
 /4EJLgRYHAO0A/0MlMQ1JbRzphtUuW7CEaeih+Hg720g37V8tn+kB2YNyIeVU9s27YGJ
 I5Nv+aE5iixSzp+8UlyJNVcSewinIrbX4uCuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2pM2ucDG5zliIAHLMoXUSUCi2eG5GhvAhwNtz+MErg=;
 b=gilg/P4OEKob+KxjYAh2YhK+EMcVFmEbxJRc8PVSm1Z5DlmxFC8mxENujE775UWR1F
 Z///4LPvEhLhAXwvAMaHv7hIdkuG0+ueWioyVKhj0/ublCS5mLFfGCBjQt9DlRtT/Y0Q
 B4E9sGAJx5RWohoQ12TtcO6vJNNKRetBVOx6Lg3XhqGismDLycHmSKthT1mYDxfV5Ra3
 izD81rt/G4IJM2L9+Ju3D9sbNPr6rHrt0lIh8JBYzhkPQUALDvcd/cf/426jKydsv33Z
 rHH2RZHz9+9NGhtYrTE3X8wIwFOCSmgJbvNMNXI6F/RoXXeEIBrjxjg6cnVjC/5mrY2t
 tmcQ==
X-Gm-Message-State: AOAM530uFW8sEAnZY+kronX3vaTCioJ976gqQNnY22lSNhw+IXl9wT/Q
 ni0R+EuaiDX6dx5bd9Xxookr6g==
X-Google-Smtp-Source: ABdhPJy3pLNFC0UXT9j5IspDzOvKFRoKWLAd34sfU1xG8WMyu2hdKoL/KuE0lWutReWDKTv5ir2SbA==
X-Received: by 2002:a17:902:8e84:b029:12c:8742:1d02 with SMTP id
 bg4-20020a1709028e84b029012c87421d02mr6048620plb.38.1629267260326; 
 Tue, 17 Aug 2021 23:14:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c2sm4955806pfi.80.2021.08.17.23.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:19 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 38/63] xfrm: Use memset_after() to clear padding
Date: Tue, 17 Aug 2021 23:05:08 -0700
Message-Id: <20210818060533.3569517-39-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; h=from:subject;
 bh=eNwDaozDVyCitQLryWC3/RFgBjRXkOp7KVQC946+IMc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMmAX0G1QJqNpqHK4m8y3LeJ99HmlfZlOjfOt4C
 XfOmkkGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJgAKCRCJcvTf3G3AJqqREA
 Cd9YfEItqXqOY6xygw682gXWYaNQa5IvKCcsyt4U6GdZah2FRAUQ0UxtMIwc0L2/8g3CAi4wzU83FH
 5n6GD+dF8r+3cEP4bPwYLGEKzsgswWQIqJWwKGJoBvFSxG5wbfIHwbvZFOM5y+/t0aPwonqcCoJOw3
 ThLBMvQUV6CpfMGRKgiedNLzbF/W83qJ2AR4sriqV/LBY6hNK46QXR861zd0a5kaRKvgMSwMV52G0c
 jSd0GHvFCTEnjsussKR6m695hHoQ//Grp/PmO9TMZ/3lfxTIWoYIoIcbwp7uZ54MslPdksTUwsmU0h
 IO8Y+uXx5pnjdZSpaSsSCIOVJL/EthakY7NQ5WVjObsr0IqBBwrY20F03r3zPRKZGy1AqQzOMGCwoZ
 OzA7VYExn3uUxUXRBqic+nz/P7UBIsBMqdKH9LaSVuz96021TUStdpZJm7ZJXKi0cNJAzywfSDP3HH
 czY6llUcG1ZRmA3/1iK36jI7I7bTyaQibsz/ss/kI2A94u+5cgagPX+YYXqa9D238TuWELhNQQbyON
 ahzeMR7rMXzdB40Gm0u/oCpw+3fhAQ8YcZjYa35I7aWjTr47jLo+AN/O0Es/XUUwjNu9T1tAclWZEZ
 SDapObM7dpmG1Ldxs4y59x6+0RFPyEN5Tb14raVdPsku576ce7lt/B+4yXMw==
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

Clear trailing padding bytes using the new helper so that memset()
doesn't get confused about writing "past the end" of the last struct
member. There is no change to the resulting machine code.

Cc: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/xfrm/xfrm_policy.c | 4 +---
 net/xfrm/xfrm_user.c   | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index 37d17a79617c..1a06585022ab 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -2486,9 +2486,7 @@ static inline struct xfrm_dst *xfrm_alloc_dst(struct net *net, int family)
 	xdst = dst_alloc(dst_ops, NULL, 1, DST_OBSOLETE_NONE, 0);
 
 	if (likely(xdst)) {
-		struct dst_entry *dst = &xdst->u.dst;
-
-		memset(dst + 1, 0, sizeof(*xdst) - sizeof(*dst));
+		memset_after(xdst, 0, u.dst);
 	} else
 		xdst = ERR_PTR(-ENOBUFS);
 
diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 03b66d154b2b..b7b986520dc7 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -2912,7 +2912,7 @@ static int build_expire(struct sk_buff *skb, struct xfrm_state *x, const struct
 	copy_to_user_state(x, &ue->state);
 	ue->hard = (c->data.hard != 0) ? 1 : 0;
 	/* clear the padding bytes */
-	memset(&ue->hard + 1, 0, sizeof(*ue) - offsetofend(typeof(*ue), hard));
+	memset_after(ue, 0, hard);
 
 	err = xfrm_mark_put(skb, &x->mark);
 	if (err)
-- 
2.30.2

