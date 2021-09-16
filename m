Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C707D40D67E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624B86EB35;
	Thu, 16 Sep 2021 09:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13536EB35
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:44:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q26so8421997wrc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLv8c3GPvSmHSixxrZzhkLRp5WLbVu1bfIiV+NIuCjg=;
 b=KP1ezvOI0ZFODE+OslQZj5tg8JLbwwSixXwoM0qJh/HiqUtOiVyo/yzNCj3d2RntxX
 dSUj4mjuuDS+BCCxBnqdq0bbFm39VPhLoVGED55p9IxGm917YembcQftJgOsbF+A8LSW
 fQcQdbXG5ww3eFrwZIm+lb3GNMCpvWqUZDhF4ow//YJ6bjD1F+3YFNc6Mq97it4KMG4+
 3hE5OyiiagDO5laHDtp6BJnq/IYMMd+CEcgNR0TpOY9XQ+1WEAjVefg8Z8bxAxuWPpMx
 aoFmo7WmYPT5fcH4ajvlVGxkjSGTUZuniR8DpoWJ3kjZW+UJjea2kErNk1ojMhpOjX0I
 Fh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LLv8c3GPvSmHSixxrZzhkLRp5WLbVu1bfIiV+NIuCjg=;
 b=D+1J09P82R/YzSIe714WsA9I6zrhtcCOYdCzO+X4RiauZZbExu84CMa/TRsZa81nlz
 uyhojurinqXYBvaqd087rM3Zp2eIZTL+Uga0raXMy+L5y4b30Dmq0jDNrC4WIQYxWqgG
 5eWj9+ZpLVp/E6oNkinsnV/yBRoRzd7SpLKwv2naG5+vDWp4ByV0WhncYen1VJJuk4mi
 m5zxT9LJjA1ZLuYZkmexUZmbcM2ptjrNMtjwgkRJylbKZt79zFMsFfDpPa0zY2CZyOHM
 4CclyVPr90CYFtU0D71M74XMQPBLo0V53KeytAG4smK5L4Y+gRbD0U9m6kidjRyQfdiy
 XazA==
X-Gm-Message-State: AOAM53122JkCv1D6DkMPE45B9qXeBKqbAaNLEFwQO2zIPBLvBVaPfNb9
 nYfuNN4jm9xSr9sSeSuPMzMCqA4zmts=
X-Google-Smtp-Source: ABdhPJxfZrGaNINRkIM4LAyUQlrkuRJpHatfKtMbjz3rEOifaoQKzADw+fMIU6/qGNVlMJoclvGG0w==
X-Received: by 2002:a05:6000:1623:: with SMTP id
 v3mr5033115wrb.288.1631785449213; 
 Thu, 16 Sep 2021 02:44:09 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id o26sm6830771wmc.17.2021.09.16.02.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:44:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/6] lib/scatterlist: Add contiguous DMA chunks helpers
Date: Thu, 16 Sep 2021 11:43:59 +0200
Message-Id: <20210916094404.888267-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
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

From: Thierry Reding <treding@nvidia.com>

Add a few helpers to count the number of contiguous DMA chunks found in
an SG table. This is useful to determine whether or not a mapping can be
used by drivers whose devices need contiguous memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/scatterlist.h | 11 +++++++++++
 lib/scatterlist.c           | 26 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 266754a55327..cca235ff2d0a 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -281,6 +281,7 @@ int sg_split(struct scatterlist *in, const int in_mapped_nents,
 	     const size_t *split_sizes,
 	     struct scatterlist **out, int *out_mapped_nents,
 	     gfp_t gfp_mask);
+unsigned int sg_dma_count_chunks(struct scatterlist *sgl, unsigned int nents);
 
 typedef struct scatterlist *(sg_alloc_fn)(unsigned int, gfp_t);
 typedef void (sg_free_fn)(struct scatterlist *, unsigned int);
@@ -358,6 +359,16 @@ size_t sg_pcopy_to_buffer(struct scatterlist *sgl, unsigned int nents,
 size_t sg_zero_buffer(struct scatterlist *sgl, unsigned int nents,
 		       size_t buflen, off_t skip);
 
+static inline unsigned int sgt_dma_count_chunks(struct sg_table *sgt)
+{
+	return sg_dma_count_chunks(sgt->sgl, sgt->nents);
+}
+
+static inline bool sgt_dma_contiguous(struct sg_table *sgt)
+{
+	return sgt_dma_count_chunks(sgt) == 1;
+}
+
 /*
  * Maximum number of entries that will be allocated in one piece, if
  * a list larger than this is required then chaining will be utilized.
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index abb3432ed744..fae2179a218a 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -142,6 +142,32 @@ void sg_init_one(struct scatterlist *sg, const void *buf, unsigned int buflen)
 }
 EXPORT_SYMBOL(sg_init_one);
 
+/**
+ * sg_dma_count_chunks - return number of contiguous DMA chunks in scatterlist
+ * @sgl: SG table
+ * @nents: number of entries in SG table
+ */
+unsigned int sg_dma_count_chunks(struct scatterlist *sgl, unsigned int nents)
+{
+	dma_addr_t next = ~(dma_addr_t)0;
+	unsigned int count = 0, i;
+	struct scatterlist *s;
+
+	for_each_sg(sgl, s, nents, i) {
+		/* sg_dma_address(s) is only valid for entries that have sg_dma_len(s) != 0. */
+		if (!sg_dma_len(s))
+			continue;
+
+		if (sg_dma_address(s) != next) {
+			next = sg_dma_address(s) + sg_dma_len(s);
+			count++;
+		}
+	}
+
+	return count;
+}
+EXPORT_SYMBOL(sg_dma_count_chunks);
+
 /*
  * The default behaviour of sg_alloc_table() is to use these kmalloc/kfree
  * helpers.
-- 
2.33.0

