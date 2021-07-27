Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5B3D80A3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DC36EA64;
	Tue, 27 Jul 2021 21:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28D36EA57
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:06:59 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d17so17604881plh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BAjc7jN8mF2lxOocjxYUs8uk4UIdg9BIVyN6yKZHmUw=;
 b=Ik3f6gOvQpeLuCM/En5JJmwMGhnVmhecqCsKjDJ2odwR3b/OtNzLiyoeOTeu9TpBj2
 /OaEnt7Z40ngSvFECb51CKe1Mrq/TscdrX+6sxtX8ZJ679XmXcxAcgkm85bGnl2v4XsX
 BNB53x5u/LQy29sMxiNlUWB84NzJJ44Lw+SoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BAjc7jN8mF2lxOocjxYUs8uk4UIdg9BIVyN6yKZHmUw=;
 b=CddXX4ag1CywjukF9Y52hhfSB3ffxtodGFv+X583WwuJYLMkJlhAEK5HcvzZdwT7Qg
 i7RNofHmwkXTZEt0KLoGmHEf+CfbOYsZYdE6CHXEJ8rbPdiYrEJq+Ty1qQBxXgZW6CPv
 y5NTvrDUK9yd2/z7DAo3CZYw+Emq3nAkZ4hWtXpBu3FeTu7l5kJF/8DKBlSm0AriEvwD
 +rnPnd3VaXhVxRt8e34JFH+2BpSsMoQ+R2Vo8IG+X21G0MOxp13g1xjh+DlLU+p8JFxR
 CJtToyKqb1+CGEgpiGwZDrmIeOFh8P5rr2jcmXpQDKGJW6ubGR1d5JB1mC2mLPzGXUZI
 gpJg==
X-Gm-Message-State: AOAM531+jojj3Xd7WHEIT529PhY0h10aKPDcCrtf4bUytiBsFXbpjxLU
 Bp/Atj73uAgO3H+qQkKDsZHy0w==
X-Google-Smtp-Source: ABdhPJzTyWnyJkM2fI4o+nQh75gG0gKQnAIhyupMsjyxw0lo+I3SNPw8cSYvp7EuMi65u5YL90cSkg==
X-Received: by 2002:a63:190b:: with SMTP id z11mr25001094pgl.320.1627420019329; 
 Tue, 27 Jul 2021 14:06:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i1sm4395555pfo.37.2021.07.27.14.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:06:55 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 38/64] xfrm: Use memset_after() to clear padding
Date: Tue, 27 Jul 2021 13:58:29 -0700
Message-Id: <20210727205855.411487-39-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; h=from:subject;
 bh=g0VWO37QK3XIcvkgv5p13lDa7YD+Jvxsuneh5al+DKo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOIQmnrWwAaxPVdj8lblXkb8ZdEI/mjJwkI9weg
 Jb9tdxuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziAAKCRCJcvTf3G3AJkUiD/
 9GVAFoJywTVZLGJMfv82icJWJQRMDO1fnyc7Vo6lQ1D7/W+Dagrov588jsfphYxw9bCcMrBW5+ML39
 Nlw0d86SRJKsp9W1D/uWpxT7B+ZifwMCrBQiW/QQdugvpBK16DiM/nuIxmvvNngfCD7TZeYhnxyJCN
 Q8sbUMZx2T8aExzVPglAhsAqyZAACXNIyRAkJJKyEFCtk5DV7xNyz4H7EIco1PaNQ6CPSvz3qtegIn
 nv2P2319IG2VLE3I2NZVINSDUfhFT63odWJElKoysAbPDvrq3781fUtYESiohGHqBR8FD3BGT+O8y5
 9KD6fIZ0TSLsD63axSBtgp5OUer7kr086Bp7sU1ndEXv436bquzOxnCxGOOZ82tsCGeW/VxkIdKzGd
 IqrtSepbn6JZoMYp10wQJpM6ZcvscK8K2zcp2RMRpDMku/9dFd2GQ45TO3uUh94594qJDdQG0ecNlA
 NIP+5MnO4vD6X6sONnGwoom7JbHdfvLOAg4vRaXZ2jfmckTzxmeUil4NB16b45RGMUUNbmfDrGgLJc
 0oHx1OYHLUpyYpWBvqH49SivknOgZOZzXIyabXPipERmCdfnqRmLJeBYq67aP5IvRZgUVF848zQS1a
 wYduCIDFnUzR+Pq8e8OGT0DcZ9ZGKEr3Av8YeNoVe5GpEviziiQ3/Fj3WyIg==
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
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Clear trailing padding bytes using the new helper so that memset()
doesn't get confused about writing "past the end" of the last struct
member. There is no change to the resulting machine code.

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
index acc3a0dab331..0bf8fec3fd97 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -2907,7 +2907,7 @@ static int build_expire(struct sk_buff *skb, struct xfrm_state *x, const struct
 	copy_to_user_state(x, &ue->state);
 	ue->hard = (c->data.hard != 0) ? 1 : 0;
 	/* clear the padding bytes */
-	memset(&ue->hard + 1, 0, sizeof(*ue) - offsetofend(typeof(*ue), hard));
+	memset_after(ue, 0, hard);
 
 	err = xfrm_mark_put(skb, &x->mark);
 	if (err)
-- 
2.30.2

