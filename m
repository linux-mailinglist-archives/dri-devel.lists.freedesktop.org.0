Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989C3B34FA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF43D6EC75;
	Thu, 24 Jun 2021 17:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5086EC73
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:47:41 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id e33so5354371pgm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tz/DuF/FND0AtzBbmjaoWlKt/aPhPThKNTwr9Xn43ZY=;
 b=mUdywTQcwlGKOE7OWwYQdxjXsDaW66xFphJXbcZaHPQWM1XW1H9ZUkhuDs0FPkY/9Y
 UEcPpnRE4mIjEccZBgw9PG7DESEF1A/rxrd0sWdpGos5pb0O2am1Q5QOH6SP7bubXQDf
 eY0m3QA3laJ7RO33+PhUpbriBN0v/ETCeccUX+zQvJHN5GzU0yqP2+IhM+BgXkqXQoOI
 h/Ke5l5G3NY8ir8F48Dp+E0i0nlgf4VZRkud9pMwTUAwPVvNv6SSCk+lWaPQPNvcGAC/
 yNT1IcHaebZHyiA72yPR8Jte9dmAtTjtbVQO4+AUJyaAnx9xhfWYc7YrldYbRJNG4iI7
 FOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tz/DuF/FND0AtzBbmjaoWlKt/aPhPThKNTwr9Xn43ZY=;
 b=jzcJB3eLR5ZvCwcBrnAyAzwRxAFGWB1LJvsewBWJV8LXh/24VNXWOxEKm0mAEZraae
 Ezy8e0blmSPNhWylGtJ8JMw0LKV6rohZQVIKI3zZFDhCy1bfMd/A4GnRac/zOhW29JjE
 HcXp/LIjEt87vbpfu1JBHAAeAmVGFm+WF5vNbYQZhYHHR0bF4Y/EzlptalKI7uOg0wli
 Gzkz55RFMKRh4Avvsr3SJl4xsgniMkMkJ3m1cAb9UiMd2Wq87jz+T+54EqBi6Uxj9E/A
 v33pO+tgjy9H7sXdn7+ElZBmAs9Qgk6VmgBReRaTb8Zf7fMfENdMhLRcLE7uQy4tmkav
 xRhA==
X-Gm-Message-State: AOAM531EQuvul1/xRD7AGuVcSzfhuY/K+esVyMf78hgMKxXb2MIto0yk
 2v0Qhb+HTWqp9ATkMdc9EMuOqKODRiqBqQ==
X-Google-Smtp-Source: ABdhPJzAJUXKOu/Owpa4Ppem0EN3JzZS9ocke4+a3A0aamByRKXT2Z/LKeWyDmXuPfBVTGE+1efu+g==
X-Received: by 2002:a65:49c4:: with SMTP id t4mr5784474pgs.108.1624556860603; 
 Thu, 24 Jun 2021 10:47:40 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id y1sm3013280pgr.70.2021.06.24.10.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 10:47:40 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] dma-buf/sync_file: Don't leak fences on merge failure
Date: Thu, 24 Jun 2021 12:47:32 -0500
Message-Id: <20210624174732.1754546-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each add_fence() call does a dma_fence_get() on the relevant fence.  In
the error path, we weren't calling dma_fence_put() so all those fences
got leaked.  Also, in the krealloc_array failure case, we weren't
freeing the fences array.  Instead, ensure that i and fences are always
zero-initialized and dma_fence_put() all the fences and kfree(fences) on
every error path.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: a02b9dc90d84 ("dma-buf/sync_file: refactor fence storage in struct sync_file")
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sync_file.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 20d9bddbb985b..394e6e1e96860 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -211,8 +211,8 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 					 struct sync_file *b)
 {
 	struct sync_file *sync_file;
-	struct dma_fence **fences, **nfences, **a_fences, **b_fences;
-	int i, i_a, i_b, num_fences, a_num_fences, b_num_fences;
+	struct dma_fence **fences = NULL, **nfences, **a_fences, **b_fences;
+	int i = 0, i_a, i_b, num_fences, a_num_fences, b_num_fences;
 
 	sync_file = sync_file_alloc();
 	if (!sync_file)
@@ -236,7 +236,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 	 * If a sync_file can only be created with sync_file_merge
 	 * and sync_file_create, this is a reasonable assumption.
 	 */
-	for (i = i_a = i_b = 0; i_a < a_num_fences && i_b < b_num_fences; ) {
+	for (i_a = i_b = 0; i_a < a_num_fences && i_b < b_num_fences; ) {
 		struct dma_fence *pt_a = a_fences[i_a];
 		struct dma_fence *pt_b = b_fences[i_b];
 
@@ -277,15 +277,16 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 		fences = nfences;
 	}
 
-	if (sync_file_set_fence(sync_file, fences, i) < 0) {
-		kfree(fences);
+	if (sync_file_set_fence(sync_file, fences, i) < 0)
 		goto err;
-	}
 
 	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
 	return sync_file;
 
 err:
+	while (i)
+		dma_fence_put(fences[--i]);
+	kfree(fences);
 	fput(sync_file->file);
 	return NULL;
 
-- 
2.31.1

