Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25604764A07
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ED310E50B;
	Thu, 27 Jul 2023 08:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8251910E50B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:06:12 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so182223b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445172; x=1691049972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hMz0NiXWW4aad/y0uXjwCFa/Ag/H17CXQFU4sIH/+zs=;
 b=AHxGvLfHLl40j8B2JJRU5s4VfBVIfkKAsI0cQEyx34RUKm+kvHJrB2iQzGzRnBcS3v
 6USwrAVD49Q91VdWL412Beuc1lh9luLsvseTAfwZXNQFTlfXj/44XL3QSDLO3kE477UK
 PuQisTQDtaTenLhmz9UxJrWIk76t/9C2sGl3AoIFTG0F/GG2DtEXlZsFxPta58HNNxGh
 nuotqk/EcRuGp6B6DpQqHvzB1OaU8/LVfrpsdfcpoHM2+LjVOOXNlq+MDZzMAY0XeOby
 XoS1N9oa25ZJEGOvTPLqpEaa/2bkazEZHcopiam72Y0TXS5KlF1vjQrUn3lGIfR4Oiwn
 FzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445172; x=1691049972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hMz0NiXWW4aad/y0uXjwCFa/Ag/H17CXQFU4sIH/+zs=;
 b=ZtVU4wFFi9oIbVp3NXjJ4PuItLqX97MUXbSZSIDbHgHJY1e6L//7jmqwTikiH/D1T7
 aSeGO1SbNE/rUg3kvVEZAW33dtUJFtO2/fyVNnz5TUrJ2Tnogiz+L1cCZTEkv+Sa/DWZ
 zKi10RPPslY5l3IU+2tbv5knHusInBeI5UZhfnFOGM6Cq3zXZOBkALN5PyT7Gw8CQ9km
 DTPY2w8clESSjs8cRO509syutprHK0MOPEm30z7EzfsXxUmMlbSExRzdsotB13xQ5kge
 fLhIqdcx7DxXRwntwvj6Y35SgzZmeE9DHzjeGS/Z922WOaxrcDDHlTsVrrZqEuOlpgZt
 6ngQ==
X-Gm-Message-State: ABy/qLZgaQjO2vD5qGNhyqErS+mIPmCSqIeo/OUT6qQhSSl7rwZepSYm
 3ifC7zY2X41k5a0XEw7Ixmjl1Q==
X-Google-Smtp-Source: APBJJlELtr5cWJQ0To//AtRPEOYgFBMbhSo+p4MsXdX0IoPp5bJSVuIL2HKgeywTxbzsVW+qtVe8tQ==
X-Received: by 2002:a05:6a00:4792:b0:668:834d:4bd with SMTP id
 dh18-20020a056a00479200b00668834d04bdmr4674312pfb.0.1690445172123; 
 Thu, 27 Jul 2023 01:06:12 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:06:11 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v3 02/49] mm: move some shrinker-related function declarations
 to mm/internal.h
Date: Thu, 27 Jul 2023 16:04:15 +0800
Message-Id: <20230727080502.77895-3-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following functions are only used inside the mm subsystem, so it's
better to move their declarations to the mm/internal.h file.

1. shrinker_debugfs_add()
2. shrinker_debugfs_detach()
3. shrinker_debugfs_remove()

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h | 19 -------------------
 mm/internal.h            | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 224293b2dd06..8dc15aa37410 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -106,28 +106,9 @@ extern void free_prealloced_shrinker(struct shrinker *shrinker);
 extern void synchronize_shrinkers(void);
 
 #ifdef CONFIG_SHRINKER_DEBUG
-extern int shrinker_debugfs_add(struct shrinker *shrinker);
-extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-					      int *debugfs_id);
-extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-				    int debugfs_id);
 extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
 						  const char *fmt, ...);
 #else /* CONFIG_SHRINKER_DEBUG */
-static inline int shrinker_debugfs_add(struct shrinker *shrinker)
-{
-	return 0;
-}
-static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-						     int *debugfs_id)
-{
-	*debugfs_id = -1;
-	return NULL;
-}
-static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-					   int debugfs_id)
-{
-}
 static inline __printf(2, 3)
 int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 {
diff --git a/mm/internal.h b/mm/internal.h
index 5a03bc4782a2..8aeaf16ae039 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1135,4 +1135,32 @@ struct vma_prepare {
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
 };
+
+/*
+ * shrinker related functions
+ */
+
+#ifdef CONFIG_SHRINKER_DEBUG
+extern int shrinker_debugfs_add(struct shrinker *shrinker);
+extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+					      int *debugfs_id);
+extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+				    int debugfs_id);
+#else /* CONFIG_SHRINKER_DEBUG */
+static inline int shrinker_debugfs_add(struct shrinker *shrinker)
+{
+	return 0;
+}
+static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+						     int *debugfs_id)
+{
+	*debugfs_id = -1;
+	return NULL;
+}
+static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+					   int debugfs_id)
+{
+}
+#endif /* CONFIG_SHRINKER_DEBUG */
+
 #endif	/* __MM_INTERNAL_H */
-- 
2.30.2

