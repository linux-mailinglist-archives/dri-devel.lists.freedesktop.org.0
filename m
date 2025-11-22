Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57158C7CB0A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 10:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06F310E009;
	Sat, 22 Nov 2025 09:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cRDkb9cR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF5810E009
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 09:03:53 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3436a97f092so3490775a91.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 01:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763802233; x=1764407033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gWSIc38wakQFkjPaEOd32h4AOI7qtYUllCcYDLleeHs=;
 b=cRDkb9cR1WeBT9WPOwHtCHDdmuujnJxKI8zNc+2O9ats1fap/wOFw1Ijzm+P+0uKtE
 XoCwk2I1QmZmbvMtteC8A7EpeE5Mjzy8jN58gxQydz95aytp+FuqdJpHvZs0n4yD/eOV
 Ahh1RAHW8bx2qcIEHjj9eZTYqb682jFd0JLrEraIzGu4T0dotEqbAi8p6qWqhOoG4Q0F
 M3DZ1I1zQI0QCSb9k2DWrhSIkwjk7wzxLi7G3uBK7TKIeuxv12ZyrRHBiLqWetOhzXfK
 Tze283yjGrcOPOd16dm+9SXfT9H6H2RqX067Fo6wUSbHtAV2kCPl0Yil7NGtUSkXdX7I
 zjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763802233; x=1764407033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gWSIc38wakQFkjPaEOd32h4AOI7qtYUllCcYDLleeHs=;
 b=BIqt2fBRm3y7A/h5nJSQpllK9LJ0SQcJnOCfN+47UIgs+EWpJZCMB8NZpA7u6tdLL4
 Fk2hZGGIn7Hi1hKztd5bajE53388e4dWOeg7s65N1lDc+mZkrLciph3awMVCfOcZKtW4
 4AKkS+I90NqY3U1qYsFIBoth6Qv/AiVtVVklMpCJIxAvD5z1u0vaPaq5Nslz7m08JEw2
 EXZjECKqWcofr0uZjiJRl1dAaeFdLOXhqFPRq79IlZ80IcmUo21tpz5F0X1whl4RrCFM
 4aUyGNNzqdcoEU2hZHmAmV61JTW2IeN1Ai5xOwzB6fePySrqkyA/8eD6l+bUBJEgWsC5
 94jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWozwGslUAfLKXyQ+89wQGo5Dh8xyVgnsaXWZozED7XQ8PAeLNi0GR5mD8ckNaXaUcGhmTH7WPu8Uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXMrUXNF7z63Ug4asmU79rl8Y/Yz5WnAN95m11cjrjfqV/oMAY
 RvsdpA1L71xtcdkDjdhpNnRzI6xTWc0jEzyGYJG8etdsToB4ibDqNq6g
X-Gm-Gg: ASbGncu/fBjEE43CIFtP3GwOxrTHzaT3Jxhsdlv+XKDFsNZWb9+qWDqzMoT3RbZX+EI
 nNg2jzW9HXXm0/eLmqcGC3sPgME7mS5Ee2DR+7Z7rgUzuPJUTECWbOV/e7aFc/bJeLpE4gxFAZv
 JTAZlDCeXTjcXEapySOI17kFJaH0xbBc/SHP57ccuWbb5kmb0igeaT8U1FkW71LmgVgw6QMKsHk
 sGDBzcfyXtOWJSFqjcnA9bPHzW+FOtPCWnfxWSv7uGAnbobHCMro6YE8+H9vJZ6JOi/wPs/GD3f
 jq9oQTDRxksHOnrcrS051OzUYlsKuT5Fbj0xv4pHW2uUarbMlWU54PLYCNAZgbac8oJ+DKur+wN
 g8rFIotNtTw33Fi6IT8HyzAoKwbdW0MtEXT13urD/iduWkwFTMfowQP7ZGjuTFsYTSIEa/N0uN3
 VA1sIcaunOxfu3sJG2gdVSf1vT
X-Google-Smtp-Source: AGHT+IFEXYWimQk4DcIAFQyt9lEPKtWhsqJCLh0YYLXBxKfxO64RbGZR0X6+cGmFQNdZPcXXMZdWtg==
X-Received: by 2002:a17:90b:540b:b0:33f:ebc2:634 with SMTP id
 98e67ed59e1d1-34733e78ea2mr5873399a91.9.1763802232568; 
 Sat, 22 Nov 2025 01:03:52 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3472692e5c8sm7842401a91.11.2025.11.22.01.03.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 22 Nov 2025 01:03:52 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, Uladzislau Rezki <urezki@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever possible
Date: Sat, 22 Nov 2025 17:03:43 +0800
Message-Id: <20251122090343.81243-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Barry Song <v-songbaohua@oppo.com>

In many cases, the pages passed to vmap() may include
high-order pages—for example, the systemheap often allocates
pages in descending order: order 8, then 4, then 0. Currently,
vmap() iterates over every page individually—even the pages
inside a high-order block are handled one by one. This patch
detects high-order pages and maps them as a single contiguous
block whenever possible.

Another possibility is to implement a new API, vmap_sg().
However, that change seems to be quite large in scope.

When vmapping a 128MB dma-buf using the systemheap,
this RFC appears to make system_heap_do_vmap() 16× faster:

W/ patch:
[   51.363682] system_heap_do_vmap took 2474000 ns
[   53.307044] system_heap_do_vmap took 2469008 ns
[   55.061985] system_heap_do_vmap took 2519008 ns
[   56.653810] system_heap_do_vmap took 2674000 ns

W/o patch:
[    8.260880] system_heap_do_vmap took 39490000 ns
[   32.513292] system_heap_do_vmap took 38784000 ns
[   82.673374] system_heap_do_vmap took 40711008 ns
[   84.579062] system_heap_do_vmap took 40236000 ns

Cc: Uladzislau Rezki <urezki@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: John Stultz <jstultz@google.com>
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/vmalloc.c | 49 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 0832f944544c..af2e3e8c052a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -642,6 +642,34 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int stride,
+		int max_steps,
+		unsigned int idx)
+{
+	/*
+	 * Currently, batching is only supported in vmap_pages_range
+	 * when page_shift == PAGE_SHIFT.
+	 */
+	if (stride != 1)
+		return 0;
+
+	struct page *base = pages[idx];
+	if (!PageHead(base))
+		return 0;
+
+	int order = compound_order(base);
+	int nr_pages = 1 << order;
+
+	if (max_steps < nr_pages)
+		return 0;
+
+	for (int i = 0; i < nr_pages; i++)
+		if (pages[idx + i] != base + i)
+			return 0;
+	return order;
+}
+
 /*
  * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
  * flush caches.
@@ -655,23 +683,32 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
+	unsigned int stride;
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
+	/*
+	 * Some users may allocate pages from high-order down to order 0.
+	 * We roughly check if the first page is a compound page. If so,
+	 * there is a chance to batch multiple pages together.
+	 */
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
+			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
 		return vmap_small_pages_range_noflush(addr, end, prot, pages);
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
+	stride = 1U << (page_shift - PAGE_SHIFT);
+	for (i = 0; i < nr; ) {
+		int err, order;
 
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+		order = get_vmap_batch_order(pages, stride, nr - i, i);
+		err = vmap_range_noflush(addr, addr + (1UL << (page_shift + order)),
 					page_to_phys(pages[i]), prot,
-					page_shift);
+					page_shift + order);
 		if (err)
 			return err;
 
-		addr += 1UL << page_shift;
+		addr += 1UL  << (page_shift + order);
+		i += 1U << (order + page_shift - PAGE_SHIFT);
 	}
 
 	return 0;
-- 
2.39.3 (Apple Git-146)

