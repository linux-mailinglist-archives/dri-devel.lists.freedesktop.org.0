Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1F245D50
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C528A6E4F8;
	Mon, 17 Aug 2020 07:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF17E6E417
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 19:23:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c15so12808262wrs.11
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EwFJZ7dfAqQ1UBhHBt6LFEw2dpyCC5fZ/uaODPbwQ/k=;
 b=V8aN4aPGz4W/rhy/Q2gJmxMbjDP4IRKELAm+TZMXVoa0g3IM5sKGSKxAL9WDkdzRdc
 uX5MQexjBo90N5mP/4jKoS5+JudjMkTKk3qNBvmKoOJ3808ZSsyL0gS0BM9pEUjkjpUa
 XWBxdX/ZyfepBIe5evz+gbIeF/ppVLyVFOizf3ffAoNVrVagVhIGSVrKp7GQHVy5VgUE
 jF84GKxPp5e/FBgozBO+6QPKig3WofCX9L+050rUp26G17L8UADyqFy/YVbyAGXzqy70
 3w21mQc95ILOXaVw0ukA1NkVVTWtvzAQ6G57LYlI9XYpWjIJ0D59UFkCgvXPKuj6BBw3
 BffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EwFJZ7dfAqQ1UBhHBt6LFEw2dpyCC5fZ/uaODPbwQ/k=;
 b=FQcxj2zbYj8KLRexAkSN0DDCamQoBNWpnuxOjGPpRayiaIkebEjSEMdRUkI+J0FqsH
 ggHVzhgDVBiKDuxbvtijOXoSVEvWmK27KkfsBq89HKWb3Fb+sGkEThxDoialNV4xrO68
 uR9wgeBOzrCNEIHZbNgdvhXLw6kRgyCdEnmUKx8AgSXj96haHQmMGMMKwGQe/43JNajj
 /uYW67MRX6zjO5kIY/kgc9hHw1tWEC0caKpIIzFbTSp4LyEojratjqtEyPCwLbByZDx5
 XsFHtRY+vXEt6Iw+K69N2R6E5EL1zDBxcs6HIJkR5VlW7QkHBA2e92Fm+Lp2AfWJJ/lI
 DgiQ==
X-Gm-Message-State: AOAM530BVVxBPwETjtnCuiujnAmgMGhnfT/ybupCx2sFpygnw+WQIDY9
 o+f3bPNKwxHFpcRtFzXDatk=
X-Google-Smtp-Source: ABdhPJzKVZZ6r6L7ot1ZZO9bdKj1FQQ/74Sm840x6qryXJBgWNNZtbnpDq+zS2ZuU1QSHa5zhMF0vg==
X-Received: by 2002:a5d:4144:: with SMTP id c4mr11672695wrq.200.1597605824368; 
 Sun, 16 Aug 2020 12:23:44 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id p17sm30992902wra.81.2020.08.16.12.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 12:23:43 -0700 (PDT)
Date: Sun, 16 Aug 2020 22:23:25 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/4] staging: android: Replace BUG_ON with WARN_ON
Message-ID: <fd55c53cb20c4887a87c05fffa28c28a740cd314.1597602783.git.tomersamara98@gmail.com>
References: <cover.1597602783.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597602783.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:43 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Riley Andrews <riandrews@android.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hridya Valsaraju <hridya@google.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BUG_ON() is replaced with WARN_ON at ion_page_pool.c
Fixes the following issue:
Avoid crashing the kernel - try using WARN_ON & recovery code ratherthan BUG() or BUG_ON().

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_page_pool.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index 0198b886d906..c1b9eda35c96 100644
--- a/drivers/staging/android/ion/ion_page_pool.c
+++ b/drivers/staging/android/ion/ion_page_pool.c
@@ -46,11 +46,13 @@ static struct page *ion_page_pool_remove(struct ion_page_pool *pool, bool high)
 	struct page *page;
 
 	if (high) {
-		BUG_ON(!pool->high_count);
+		if (WARN_ON(!pool->high_count))
+			return NULL;
 		page = list_first_entry(&pool->high_items, struct page, lru);
 		pool->high_count--;
 	} else {
-		BUG_ON(!pool->low_count);
+		if (WARN_ON(!pool->low_count))
+			return NULL;
 		page = list_first_entry(&pool->low_items, struct page, lru);
 		pool->low_count--;
 	}
@@ -65,7 +67,8 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 {
 	struct page *page = NULL;
 
-	BUG_ON(!pool);
+	if (WARN_ON(!pool))
+		return NULL;
 
 	mutex_lock(&pool->mutex);
 	if (pool->high_count)
@@ -82,7 +85,8 @@ struct page *ion_page_pool_alloc(struct ion_page_pool *pool)
 
 void ion_page_pool_free(struct ion_page_pool *pool, struct page *page)
 {
-	BUG_ON(pool->order != compound_order(page));
+	if (WARN_ON(pool->order != compound_order(page)))
+		return;
 
 	ion_page_pool_add(pool, page);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
