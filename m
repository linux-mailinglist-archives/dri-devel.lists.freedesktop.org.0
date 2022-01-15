Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A002248F3D9
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 02:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5A610E346;
	Sat, 15 Jan 2022 01:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF44210E346
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 01:08:47 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 p135-20020a25748d000000b00611f5308717so3806974ybc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 17:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ti5KO9A8vk9sjDtc4QE21jT0NFR0GaV/WLBKcRARKgI=;
 b=S7eWa/B0tO4XbPv0OdCk5n8qWLZPt/5gRI1DTJwTi5GhQHBW/2q4S1Goa6HVJ53kOV
 C4SDzmhRcejlHxG15TPB2RCHg/RE9n0Klhhmd91JlvLbggw+Zomcqm6xLZmX5+VZmd5v
 6z2PEUpw/n9msL7glrfIs7RCavPk8+6AWV+iux/DG1QvtvTlcz7OoEHlREsv93KpGfY7
 7PequsOl0jKjwIIwYcy3wUNuWKC7exUsRjvXFMuBU8C8z0cNytD8ojAHfXP8uaBhODyO
 ecTIbTrob/3fDmTXsmgbfls5PaDFeVT7ZAhbWGu7Ln8w+tk/R5tS0MQPM33+aFxrGILz
 73Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ti5KO9A8vk9sjDtc4QE21jT0NFR0GaV/WLBKcRARKgI=;
 b=1Y+S3clceSQYx6xLCA0O0bm1tsiyFuGUZijTUSKunil2+QZZO301N1MQ6tlEmQCBXT
 53L7cqLDGqdi2Tweg/kvObTdEugboR6h6AWqnzd/x4BKu+vJrgO4dWrij8dphbO+xild
 OT4mkdOHbTkEzBD57Hf7M64urrs95yMNAU6r/HUX7qS8X7WPNNpTa1FchXcC7l2f5CAP
 JYbtpJwOBpsjnaKxBCmAnZl9t2upa5lKEHR2BmqmhAOEQe5kLonmsN+FKRYrVsI031Hl
 nc6bBFnoJ/2s4cl2iU+OxQr8sDBHJwMnK7O5xM9We3KdplJTRuEmmilp8hVlapspO1s7
 meHQ==
X-Gm-Message-State: AOAM531Ot+p4oK61qyXtyCW4paRIiZ2LLh36j0Sk4mpkMZKW7BzjkXIm
 McbH1fyurqOd4s3r0/wHnCVD7bCP/lk=
X-Google-Smtp-Source: ABdhPJyx2A41ANkEXxjx9b22jDn5GMaVfTqhW/nKH2++Oa46UOTgyGXsF/oz0GqIRyot11Vvd63nfkZv34o=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:5860:362a:3112:9d85])
 (user=hridya job=sendgmr) by 2002:a05:6902:286:: with SMTP id
 v6mr15557991ybh.569.1642208926921; Fri, 14 Jan 2022 17:08:46 -0800 (PST)
Date: Fri, 14 Jan 2022 17:06:03 -0800
In-Reply-To: <20220115010622.3185921-1-hridya@google.com>
Message-Id: <20220115010622.3185921-6-hridya@google.com>
Mime-Version: 1.0
References: <20220115010622.3185921-1-hridya@google.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [RFC 5/6] dmabuf: system_heap: implement dma-buf op for GPU cgroup
 charge transfer
From: Hridya Valsaraju <hridya@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>, 
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, 
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Dave Airlie <airlied@redhat.com>, Kenneth Graunke <kenneth@whitecape.org>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Li Li <dualli@google.com>, 
 Marco Ballesio <balejs@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Hang Lu <hangl@codeaurora.org>, 
 Wedson Almeida Filho <wedsonaf@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 Chris Down <chris@chrisdown.name>, Vipin Sharma <vipinsh@google.com>, 
 Daniel Borkmann <daniel@iogearbox.net>, Vlastimil Babka <vbabka@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org
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
Cc: Kenny.Ho@amd.com, daniels@collabora.com, tjmercier@google.com,
 kaleshsingh@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DMA-BUF op can be invoked when a process that allocated a buffer
relinquishes its ownership and passes it over to another process.

Signed-off-by: Hridya Valsaraju <hridya@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index adfdc8c576f2..70f5b98f1157 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -307,6 +307,48 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 	kfree(buffer);
 }
 
+#ifdef CONFIG_CGROUP_GPU
+static int system_heap_dma_buf_charge(struct dma_buf *dmabuf, struct gpucg *gpucg)
+{
+	struct gpucg *current_gpucg;
+	struct gpucg_device *gpucg_dev;
+	struct system_heap_buffer *buffer = dmabuf->priv;
+	size_t len = buffer->len;
+	int ret = 0;
+
+	/*
+	 * Check that the process requesting the transfer is the same as the one
+	 * to whom the buffer is currently charged to.
+	 */
+	current_gpucg = gpucg_get(current);
+	if (current_gpucg != buffer->gpucg)
+		ret = -EPERM;
+
+	gpucg_put(current_gpucg);
+	if (ret)
+		return ret;
+
+	gpucg_dev = dma_heap_get_gpucg_dev(buffer->heap);
+
+	ret = gpucg_try_charge(gpucg, gpucg_dev, len);
+	if (ret)
+		return ret;
+
+	/* uncharge the buffer from the cgroup its currently charged to. */
+	gpucg_uncharge(buffer->gpucg, gpucg_dev, buffer->len);
+	gpucg_put(buffer->gpucg);
+
+	buffer->gpucg = gpucg;
+
+	return 0;
+}
+#else
+static int system_heap_dma_buf_charge(struct dma_buf *dmabuf, struct gpucg *gpucg)
+{
+	return 0;
+}
+#endif
+
 static const struct dma_buf_ops system_heap_buf_ops = {
 	.attach = system_heap_attach,
 	.detach = system_heap_detach,
@@ -318,6 +360,7 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 	.vmap = system_heap_vmap,
 	.vunmap = system_heap_vunmap,
 	.release = system_heap_dma_buf_release,
+	.charge_to_cgroup = system_heap_dma_buf_charge,
 };
 
 static struct page *alloc_largest_available(unsigned long size,
-- 
2.34.1.703.g22d0c6ccf7-goog

