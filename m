Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEAC3EFBC9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505316E431;
	Wed, 18 Aug 2021 06:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD5C6E41A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:24 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id q2so1114259plr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xqHRpTF29XKCvHESFQ890ZRLt8tV/z5c3XHhrLDSkrI=;
 b=eDnWZw9KRm46hwXvZT4C7S5d+90hyINh4v1SZZHIktQhca39Kv5j4305RFuRZO4r+N
 FpSZgAZO8EAZPKCqstt9sYRz4H1aNUG21Hkzfac89V2BS6o4rE2tpIfJtZvJgvvE0tGw
 8wAP/HK8m8mUdps9C8RUZGGooYOTstKeYh1Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xqHRpTF29XKCvHESFQ890ZRLt8tV/z5c3XHhrLDSkrI=;
 b=pDFtD7oNknyv/oMXjBdQ9a/k+5JBQfqDSPzwpJZJ62hxGkcR44l6DscdydUeV4OEOj
 qUYhEbXe2PvZvk0a9K5jLDT3haDZy+7R/ahXeSp9yukyOh7rdL8mT7Zed5p/Td7hH0c4
 pE3NF4JXwFFL6Ad4rzouLRq9Xaw1CjKU2IkskVqDb6biRVIj3ZCqevt4LHO6nFVgPVH4
 skTpcQBp+jxbkVzIrK7t1NoTI97WY7Y9DEmPv6soTWmX+4K5djiwT4MfisvicTGqbZM9
 lWWAcwddJQxoL65VvzaEyIrQPCx4Fqp0BcbeVZ4QrEN9T7gG098uZIZ9zh/4eFjBG4bx
 B6Eg==
X-Gm-Message-State: AOAM533GQiKsCd7+qZ3s+O8/iAcv31sb+zrf2sRkuW/EajGTiIOayupk
 WOAYehI0bGBwcmnKUHTFwEuEbA==
X-Google-Smtp-Source: ABdhPJzs0l6+96q5WrJaIq9sc6XvKb4+TMWLp34figTZCCyBwzySh6PWPIKNRtNT4xpSHHkkTwp3EA==
X-Received: by 2002:a17:902:cec3:b0:12d:92c4:1ea6 with SMTP id
 d3-20020a170902cec300b0012d92c41ea6mr5883424plg.36.1629267264338; 
 Tue, 17 Aug 2021 23:14:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u10sm5718071pgj.48.2021.08.17.23.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 50/63] tracing: Use memset_startat() to zero struct
 trace_iterator
Date: Tue, 17 Aug 2021 23:05:20 -0700
Message-Id: <20210818060533.3569517-51-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; h=from:subject;
 bh=tJ+Y8mubd5vChiEdKyhrwIAPkGIRLmuKu7c5cVoFF8E=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMpD14ogHSXr5bFvuUHYu3T5qJe0zYALPCZMtZa
 BMo6QAuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKQAKCRCJcvTf3G3AJmAwD/
 0a3+zKByTlHW7da31ew04MLWM2GyDtX5IWTWqZsa8eYoXbBB5X7LZRQLJ1vlQZHRLhepR9ZpITXmne
 EiQC9Yi2RCSGHYXs1DT8c2kWev59MckO9Ru6PbJsXCCCEtTQ6DMpe/Jx5fGA8+6uai2MdlkbPr1hcJ
 pBSeJNFQs0Pv1vqmL283XNUPLYaVRRlPmA9Gp6u3cYUEC+MvJh//1ksZAZO4Nyg2WQnN8olRr3f3NE
 /FPwlpkC0jjYP6MOJqAsGXQsShWeRQihUK27+fSMl0qP0sQvOypGdnWB5Xt9pHnrb59B+NoIWV3usD
 tlUXL9PjYEJYMDWPQTUUNPBMZZKOHI+48wGm37V+dXOW7TWP6k1ZaORRpaSbK4ePyA4y/UOyFr9kg/
 uCpCZQbVxO0XsyHwZnPxyR0ffSAr5pZsGQoIXVSdGOiCT/l0l3GHYuulIqOqhrbldUvZjy3etP7MiI
 hx1VUn4EjkhIMB8HWOeouTN9VqnOXsp0Uoh3nMHIAOMLkJS8l1ptPjxUjAbP1ZRctjIKVTGS6xk+Mc
 BWlhshbZH64vEGQ9HoKgHm6UlwyYt5R2mkzOSjk0VSY4jGO4wg5giXsw55wRe6w4igcWbd0lCpFOWG
 qRUJgP1YlRnTAtp59niaAQ2aRXBKcpue4WIdo6iOcrFKIwc2EolBb7yDoGAA==
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

Use memset_startat() to avoid confusing memset() about writing beyond
the target struct member.

Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 kernel/trace/trace.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 13587e771567..9ff8c31975cd 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6691,9 +6691,7 @@ tracing_read_pipe(struct file *filp, char __user *ubuf,
 		cnt = PAGE_SIZE - 1;
 
 	/* reset all but tr, trace, and overruns */
-	memset(&iter->seq, 0,
-	       sizeof(struct trace_iterator) -
-	       offsetof(struct trace_iterator, seq));
+	memset_startat(iter, 0, seq);
 	cpumask_clear(iter->started);
 	trace_seq_init(&iter->seq);
 	iter->pos = -1;
-- 
2.30.2

