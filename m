Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41648F3D8
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 02:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0437210E331;
	Sat, 15 Jan 2022 01:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC9B10E331
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jan 2022 01:08:26 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 f12-20020a056902038c00b006116df1190aso21570972ybs.20
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 17:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=sWrCFDJqqXXVSbGVP8s44HP9fGoTeRrZv/20U3l5a9g=;
 b=HsuhTKzXI1C0Bg5qlXVEUKgy0Y59ylb/5klYriv4XRxp76HIR6zzyRrTkNqoZeAa/+
 b49JcXDqX9e/xJ/SUE/3bVyoaZ0lg1xpEMerwoqfVEOSdzj9xLfLi1s1GhQ+IDW9v6/g
 5GED0tKyYGSjJ2/1/kebwAkX3iCP3oywer4GN/EkL+RsKPE2U2Hk2kgIljMzFb8dnS5Y
 FqX9cDLP+EMxfP4f35RPYTdaQONdRKxIF2yg0spELgieeV12+CV7Uxpttxe+nF4d6tb3
 BSX5dX+1OeDTvZq4IqC6x7NYZPz51nGacX/FtiiRJ2MyzFoQX3zRra2Gfbo1QjE20yf4
 5vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sWrCFDJqqXXVSbGVP8s44HP9fGoTeRrZv/20U3l5a9g=;
 b=6owBtz2YENQJ0U8NBiq0GT1vJDw/ue/nehTrf7mqDWCwZkRA0SETLgCOkK1XyV+jMP
 QZ/U/ybAmIP/j15SakiEmqiN4efpZWDo/LuhElCxnHvivT36gpmFPGzpT2htprb6B0OA
 UNCOBG+6BWompbH5erMYygrXCgrBkU6CtLrv4JqvUPvYMPZUDUTL9MzSRk3H3T/Ikb6a
 +MJhDiZ0YXKhsPlfHp8ebCxsQRPz/sByXObfydIfUsRTAZza5rwk6TK9ac+R32H1Xslo
 qsnOsRGJ4fReinAir8VulJzMUXxphu4JtjOzuxY9ORmCjT4N3V5WHLTRAWinWgb4MOfj
 hebw==
X-Gm-Message-State: AOAM530+/SbDEka3XL8CLWAJaUaG+qXD4OBOxXhs8q9jmtSJypRav6qq
 88q0XyxdvZKL90qyx4TWAdY0U9uxCRg=
X-Google-Smtp-Source: ABdhPJxrB6uVRtSUJNiCU0mlnPcpg+H8hNUC8zW0t5DkVGpaOEH4KKhobnZfY7Jxl05uHClUdyHKGaFNjYw=
X-Received: from hridya.mtv.corp.google.com
 ([2620:15c:211:200:5860:362a:3112:9d85])
 (user=hridya job=sendgmr) by 2002:a05:6902:723:: with SMTP id
 l3mr17660046ybt.378.1642208905843; Fri, 14 Jan 2022 17:08:25 -0800 (PST)
Date: Fri, 14 Jan 2022 17:06:02 -0800
In-Reply-To: <20220115010622.3185921-1-hridya@google.com>
Message-Id: <20220115010622.3185921-5-hridya@google.com>
Mime-Version: 1.0
References: <20220115010622.3185921-1-hridya@google.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [RFC 4/6] dma-buf: Add DMA-BUF exporter op to charge a DMA-BUF to a
 cgroup.
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
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Li Li <dualli@google.com>, Marco Ballesio <balejs@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Hang Lu <hangl@codeaurora.org>, Wedson Almeida Filho <wedsonaf@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Chris Down <chris@chrisdown.name>, 
 Vipin Sharma <vipinsh@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
 Vlastimil Babka <vbabka@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 cgroups@vger.kernel.org
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

The optional exporter op provides a way for processes to transfer
charge of a buffer to a different process. This is essential for the
cases where a central allocator process does allocations for various
subsystems, hands over the fd to the client who
requested the memory and drops all references to the allocated memory.

Signed-off-by: Hridya Valsaraju <hridya@google.com>
---
 include/linux/dma-buf.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 7ab50076e7a6..d5e52f81cc6f 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -13,6 +13,7 @@
 #ifndef __DMA_BUF_H__
 #define __DMA_BUF_H__
 
+#include <linux/cgroup_gpu.h>
 #include <linux/dma-buf-map.h>
 #include <linux/file.h>
 #include <linux/err.h>
@@ -285,6 +286,23 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
+
+	/**
+	 * @charge_to_cgroup:
+	 *
+	 * This is called by an exporter to charge a buffer to the specified
+	 * cgroup. The caller must hold a reference to @gpucg obtained via
+	 * gpucg_get(). The DMA-BUF will be uncharged from the cgroup it is
+	 * currently charged to before being charged to @gpucg. The caller must
+	 * belong to the cgroup the buffer is currently charged to.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * 0 on success or negative error code on failure.
+	 */
+	int (*charge_to_cgroup)(struct dma_buf *dmabuf, struct gpucg *gpucg);
 };
 
 /**
-- 
2.34.1.703.g22d0c6ccf7-goog

