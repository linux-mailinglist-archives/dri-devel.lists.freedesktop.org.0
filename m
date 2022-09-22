Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0435E5926
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1634A10EA46;
	Thu, 22 Sep 2022 03:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E07810EA40
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:27 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id w13so7558354plp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rwUBwzi7xfMGM3gnlz2nJv+3JsC676oosCJWmNEJmq8=;
 b=HOmSehjQy+kC6oCpZ6SUxpIPlijDlparMa9cZ7awXPTJLs7/4j0owgFxRWDzn2zsIB
 IAG9YOoiEmpC79+56phr0pTunmEY9rE4X71d6vAGzfT6Uf9X4Z+qt1yXQHhb3bWLA/Uv
 Cx/HPbXhrdOJJX9w53uN9mKOp6WP5Gv2LT5oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rwUBwzi7xfMGM3gnlz2nJv+3JsC676oosCJWmNEJmq8=;
 b=SSdyEhA4KpkZ+24eOYNbK8WQ3xMfonXzB47t6MU2LlCDJu+RqDdt4GK1IBO0JT8eS/
 aoMsvojbJYUoSExsYOQiNiMxv+56afkioPJsbfdUSTJubmPwJK3sb6MeK0LCAYkYShtZ
 BRjfjHZHgoc7ABQRLyHazO+ew655RVESxgQsBdWvXK5bYy1AgJxMjgDaIIIQ5vxA7waX
 xFGIXr0YoOzzjMjDy0yWVJEy4Hxk/MaWeE/fzgK0eUpm3NWaMZrxYP75wqDbfgaqRajA
 ZadMm2ZROMlHglbEwzOpN1Wq9HGo2cItnrEe9Wcz0AYK3agNbA/pw+88qBKrLHlpGFmL
 e4ig==
X-Gm-Message-State: ACrzQf3XfLEmdVjGlhJUnkl9sT5pMZoLQhg8ywYFu63DS9oAu6rJzNXQ
 b8qpAMcP6p2fMfiFfn90ASL5aw==
X-Google-Smtp-Source: AMsMyM6ZljnCrU0qh0+e7vc+HuV1x+ArU+n+M48jxv5R3lt8UQZqPTf6/v1OyEJJWiwBGfdDSixUTw==
X-Received: by 2002:a17:902:c245:b0:178:3912:f1f7 with SMTP id
 5-20020a170902c24500b001783912f1f7mr1161429plg.75.1663816227182; 
 Wed, 21 Sep 2022 20:10:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a170902c94800b00178143a728esm2758861pla.275.2022.09.21.20.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 05/12] dma-buf: Proactively round up to kmalloc bucket size
Date: Wed, 21 Sep 2022 20:10:06 -0700
Message-Id: <20220922031013.2150682-6-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448; h=from:subject;
 bh=58mLiyNPt53YHcQiP0NJ/gcO5KVNHG9xKF/nxWP5lU4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9IT0VAPWCWir3uMps9kCdjSMILjRU6yciDG9uFs
 fWbeIjWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSEwAKCRCJcvTf3G3AJuZ5EA
 CTJrl1LYI7CQAG4pCtipLkuzhhHVBFayO1cJ9nr4E0Jm4P1ZR+BSgD/HPdeicWCgV2fEGCG3A3qzTO
 bp/9wj/VPvNh93gqjrf2HSe113aZFNagRxlssfUYxwkKTY+LPLzDzin95QfiHah48Jg0HBw8zKWEmX
 dZTJH7KlwTcHEy9Bz5p3PA4qx+B3pkBrNQ0zdb4io0a7ErunaXVRCSpt2tZNukDe/wt1CXiR/32N+T
 1euSAVbSYv0W0fFslnfEqztbrNKxL91NWnvy3XzftablM4/PXqSNUqv6xYBt7IY33WxxP+/g2Fn7HD
 6QmdkXUhTr9armjFjNYZMQo0prwqkn0FJaXEIed35vePpH2uibYbE4OwOA2Dyo4lUtHPs/KAKQYEB3
 6oCNer7mpHEc9oOoqN35lm+ZhZ9UmAPZl/X1Np9gol6eRnt/yo2BbllRVW8PfKLVzPclAS1ny/vZEN
 uVJmqmDUdiq2OpecYEKuqhvI07vawcYvhSB6Au1f9Ys6viXBeeurbiQKrvf0oP7kADVYUzN9YCua/x
 a6zit1PoOjCMh44PKnVGgBRCRhU0CfvSYrhoxA8P45Ye7BiKkBm0StH0S/n/9duZxNKqbCFgYNdviR
 h0OHIRRNJYqc0Tw95yUM7tJKCf1eAwytfKrF8F6YwYcUQ/V1S+/AOfGfUWHQ==
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
Cc: linux-wireless@vger.kernel.org, Jacob Shin <jacob.shin@amd.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/dma-buf/dma-resv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 205acb2c744d..a20f6db99b8f 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -98,12 +98,17 @@ static void dma_resv_list_set(struct dma_resv_list *list,
 static struct dma_resv_list *dma_resv_list_alloc(unsigned int max_fences)
 {
 	struct dma_resv_list *list;
+	size_t size = struct_size(list, table, max_fences);
 
-	list = kmalloc(struct_size(list, table, max_fences), GFP_KERNEL);
+	/* Round up to the next kmalloc bucket size. */
+	size = kmalloc_size_roundup(size);
+
+	list = kmalloc(size, GFP_KERNEL);
 	if (!list)
 		return NULL;
 
-	list->max_fences = (ksize(list) - offsetof(typeof(*list), table)) /
+	/* Given the resulting bucket size, recalculated max_fences. */
+	list->max_fences = (size - offsetof(typeof(*list), table)) /
 		sizeof(*list->table);
 
 	return list;
-- 
2.34.1

