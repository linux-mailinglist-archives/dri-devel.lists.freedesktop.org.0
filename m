Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4226245D25
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F886E4B1;
	Mon, 17 Aug 2020 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5B16E425
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 19:31:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t14so12245836wmi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=riVeaXVjuZmcehfNxxO8lj1kUtlDfTSeuBv9qK6ixUA=;
 b=M35WWEAt9qJsNNvKpcIIpZDd4UCS92+EA1NKQ1mjYL7EO+BCytO5qucyp5SJ5ycDBW
 ok6UZvtncPj9Z2neCyQSNZF5vSNZkEwxhdJt5BCBMUbXd4yrGHw7qkcIzGC5oFi5Usn9
 WQNJXubTHLsJ00fSyWsZcgu/UMYdPTXN0Q6V7/d//ppdwwFoIW4GnLT9KXU/3advb3zz
 1UtIGTD9LHNCptcgSJL8oEA7rFk/LIsevxHRWlWzc4oMXZ+k8NWd9nKi1zu0Z8ECfg7p
 dg9RzfTXM9NoJGKySUUqFARfqIiR6X8xAk4CbHAvRE4W8631hQsy4Sv1NPKyzp5D798y
 Y8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=riVeaXVjuZmcehfNxxO8lj1kUtlDfTSeuBv9qK6ixUA=;
 b=kLsA3nXT+/hTHiiDMWaRBqUVSQ4MumAJhrRsLWw9wBMvDagm0aHh45Y0FWjh0/P3DG
 GmUkNLgexDYA3E02yrt6bjPkbOXUkGXo6yqNb3uk8L+gwYcA8qBQ9zk5WPJ4531BmQ8u
 rL5angtvz+4ThnkyguPVe+Qs0OXWew3U/BzIXFK+yWhO7tSQiDvXFu24LfII1U4JtpTb
 T0wYvBKT1z/ojSqbr8cOe6oxr+vrYsWboLTuWCPOsPBp9ppLi49UqjfUHLs8Gt6cw1vt
 JD4LleRZl5OwyHeXU1kOsJxNDmmQ0zJJq7tOQ77VwTU9nNUSD7exIRRaYc7JrgM+r0TR
 hm7A==
X-Gm-Message-State: AOAM531USO4IgFd+Now9KmGMYra/DyNHMNuEc1ERHPqvzHJBhqSut/6t
 zsnSI1fMpUmQvkycx2QEKZc=
X-Google-Smtp-Source: ABdhPJyi4UbmT00nTsoSw/OuAaaFid8FGig1pZoNI7QyAgobSL5JM93sWI/I2tZYZtmJy2gncMhaeQ==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr11556318wmh.168.1597606285796; 
 Sun, 16 Aug 2020 12:31:25 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id u66sm27717981wmu.37.2020.08.16.12.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 12:31:25 -0700 (PDT)
Date: Sun, 16 Aug 2020 22:31:22 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 4/4] staging: android: Add error handling to
 order_to_index callers
Message-ID: <c653c468e0c3044b10df375e8245e5d50634a7fa.1597602783.git.tomersamara98@gmail.com>
References: <cover.1597602783.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597602783.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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

Add error check to:
- free_buffer_page
- alloc_buffer_page
after calling order_to_index, due to converting BUG to WARN at
order_to_index.

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_system_heap.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
index 37065a59ca69..1e73bfc88884 100644
--- a/drivers/staging/android/ion/ion_system_heap.c
+++ b/drivers/staging/android/ion/ion_system_heap.c
@@ -49,8 +49,13 @@ static struct page *alloc_buffer_page(struct ion_system_heap *heap,
 				      struct ion_buffer *buffer,
 				      unsigned long order)
 {
-	struct ion_page_pool *pool = heap->pools[order_to_index(order)];
+	struct ion_page_pool *pool;
+	int index = order_to_index(order);
+
+	if (index < 0)
+		return NULL;
 
+	pool = heap->pools[index];
 	return ion_page_pool_alloc(pool);
 }
 
@@ -59,6 +64,7 @@ static void free_buffer_page(struct ion_system_heap *heap,
 {
 	struct ion_page_pool *pool;
 	unsigned int order = compound_order(page);
+	int index;
 
 	/* go to system */
 	if (buffer->private_flags & ION_PRIV_FLAG_SHRINKER_FREE) {
@@ -66,8 +72,11 @@ static void free_buffer_page(struct ion_system_heap *heap,
 		return;
 	}
 
-	pool = heap->pools[order_to_index(order)];
+	index = order_to_index(order);
+	if (index < 0)
+		return;
 
+	pool = heap->pools[index];
 	ion_page_pool_free(pool, page);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
