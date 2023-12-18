Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB5817AA2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFCA10E38B;
	Mon, 18 Dec 2023 19:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com
 [209.85.166.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9840910E38B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:10:02 +0000 (UTC)
Received: by mail-io1-f74.google.com with SMTP id
 ca18e2360f4ac-7b76d3bdfd8so380909039f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 11:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702926602; x=1703531402;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=goaaxpdo4bsNfCqF/IRbg9OCDHUZobJiFZIImpZ+yx8=;
 b=lwuQVfMBt38iBreYhCdXPtxSi7hZ8+ElbZy+MH8ncF71cY5qU1QxWZ7pEkGItxAVgp
 rIlR7zSHdXCDHTWhi5sSj2TXNQZtLnYLIXyZDEujBVDMbSgbeDLg0/wFh6pqNi+4spxx
 pAlbA5N1U86dJV9FAVSJEECBuxPWqmO6paYPSaA/NSlzPqe5NO6Mkc3YQlDINSfox3nM
 7A88pHFZPz6TQcDjL9DgE3yhRjsi+xRG3vytCJvN7FoX4zXIwEBJ0M6bIMtKuyMVu+zi
 8ka3EyPdRrNNeGhO7RgMOx+hPgvUcmmSPjEQQCAbKstBXgH20NrzLSe7N7GVojZqewdE
 yqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702926602; x=1703531402;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=goaaxpdo4bsNfCqF/IRbg9OCDHUZobJiFZIImpZ+yx8=;
 b=mhvCVWHwAs1BXZrQvYHDGnxj1/PF4SmuRTXbQtGXGWSC3THWrJr9BakKZaQWMHy5R/
 PFt2lv16/+VDLfaJxTmlqcYCm1Ac9Y9qYKuNFCHAxetclmZVJYsA+FP6E4ikcprKg/H6
 JCgbpvqldo9hrpxsQ3Scz5s/0lZZFD5LnNQeRpalhnbJpHWSiccCR/P3qI+1BQJbAxo6
 4jne7Al64Jjz6pg9YRloyM1UL222YiYJL1rLoIY2nfMw/L9c0rDIvv6Y8/mKoikujByz
 BCuLJYmlNKaUQzW9c1sPJ+dWZi37M32lk34n3iVvoSQjBh4NhIjOGXwuAE5qBVG5WJ7R
 pKLw==
X-Gm-Message-State: AOJu0YzzCXMSSbKm2OGTiqka5w7hjxw45x1DqrQyYIe5EHQqd97+6/ag
 I299m6Za3juNMsc6k3AbHFJ7Vg+cwusNl6OlIA==
X-Google-Smtp-Source: AGHT+IFUY8BpU9FYiO3qXLsrixI3f2KRzrpKPFLWGggPIyswomFyP7axWioDJ25jeinUYLtcPCBUeHTO/ThFJJoKRA==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:5cbf:3534:fb34:758e])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:83:b0:5d7:29d7:8a35 with SMTP
 id be3-20020a05690c008300b005d729d78a35mr1936565ywb.5.1702867232915; Sun, 17
 Dec 2023 18:40:32 -0800 (PST)
Date: Sun, 17 Dec 2023 18:40:09 -0800
In-Reply-To: <20231218024024.3516870-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231218024024.3516870-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231218024024.3516870-3-almasrymina@google.com>
Subject: [RFC PATCH net-next v5 02/14] net: page_pool: factor out page_pool
 recycle check
From: Mina Almasry <almasrymina@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Andrii Nakryiko <andrii@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Shailend Chand <shailend@google.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Wei <dw@davidwei.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Shakeel Butt <shakeelb@google.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The check is duplicated in 2 places, factor it out into a common helper.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/page_pool.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 45bb4210412d..0edb9251d98d 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -657,6 +657,11 @@ static bool page_pool_recycle_in_cache(struct page *page,
 	return true;
 }
 
+static bool __page_pool_page_can_be_recycled(const struct page *page)
+{
+	return page_ref_count(page) == 1 && !page_is_pfmemalloc(page);
+}
+
 /* If the page refcnt == 1, this will try to recycle the page.
  * if PP_FLAG_DMA_SYNC_DEV is set, we'll try to sync the DMA area for
  * the configured size min(dma_sync_size, pool->max_len).
@@ -678,7 +683,7 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
 	 * page is NOT reusable when allocated when system is under
 	 * some pressure. (page_is_pfmemalloc)
 	 */
-	if (likely(page_ref_count(page) == 1 && !page_is_pfmemalloc(page))) {
+	if (likely(__page_pool_page_can_be_recycled(page))) {
 		/* Read barrier done in page_ref_count / READ_ONCE */
 
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
@@ -793,7 +798,7 @@ static struct page *page_pool_drain_frag(struct page_pool *pool,
 	if (likely(page_pool_unref_page(page, drain_count)))
 		return NULL;
 
-	if (page_ref_count(page) == 1 && !page_is_pfmemalloc(page)) {
+	if (__page_pool_page_can_be_recycled(page)) {
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 			page_pool_dma_sync_for_device(pool, page, -1);
 
-- 
2.43.0.472.g3155946c3a-goog

