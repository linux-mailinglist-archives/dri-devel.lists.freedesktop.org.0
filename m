Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D234177DC72
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA1110E300;
	Wed, 16 Aug 2023 08:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E424A10E300
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:35:45 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a7491aa219so1184073b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692174945; x=1692779745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XOawoAw7JBbYg8TgQbZYqEagcfiYqNfqAyY2NKDB1A=;
 b=PyfuIsbShqpwpbjl4vofYUk+TfdwWstY542diGxwFJ36y7DMcAR/z7hAGvCREmmlaN
 vNd/GwqFF0aMnpzZBe8NO2dDgD0aqGC2f32Lg6N7HlIg59atjCIL3TLR01ZUU5oMB70U
 npk1lFX01zank9iFM2udD48/KeFpXVK8djnz15tDqMHZ4HYfGcA2gjs7RsdlD9F0BcP4
 430guculcU9h+D7LkNvnSKTLGUJZ3iPK9Qqr5PwInblId0avPRzq2nxZBd1PCi9k9TEU
 zBkK2NTo4hdnb5g8bNED4hAfSEL+/FPKfrg1qFRMak7Kh3O1iQw8QnUbQJJNLja/4F+f
 8AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692174945; x=1692779745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XOawoAw7JBbYg8TgQbZYqEagcfiYqNfqAyY2NKDB1A=;
 b=lKHW4ZcBDcrVnRZeQyB0+7VZs8aBUtAa5pljdOTNLDlgnqJVD6QMaYiVkuZNx6JqI2
 rbnqk2Hy/h9nnJcfXyN1YkLaS+oX6NHF5AYYcbFFufSMR1Fb+S1zuunRE+Vmwz5QCxrC
 ED/0Ne1wRnVM3RTk7PLOZqF/mRwO0nMNSjoBZeGAxGvjbZCNfpHvIFAZp9mi21b1CzwR
 BzuYQcZX25fTRxVtcVvxQpJGCYMgyGigyplSn2Q+diQJPkQCHXom4Mc/9jSlacB4AIzn
 LW+PK7s1a9+o2Vm/7u1jF/8VqpK6f8OP0ubZtKZLPwQM9WdfFJ0teVE1NjtOMardBq0c
 coHw==
X-Gm-Message-State: AOJu0Yy5BVgAbsTEzRNPmrKMAxiEKPup3L3sTZ4U0m9qYCU5VEUSPgPo
 QVzYM73qIWLJwoJ1MX2zvdHWDw==
X-Google-Smtp-Source: AGHT+IGA1qVTmfQFv7cpPNrqVYl64zBDExPD4YUQImIxFOPGaIX4C9laxn2JW3k95O2LVpSAmFJCaQ==
X-Received: by 2002:a05:6808:1816:b0:3a7:8e1b:9d4f with SMTP id
 bh22-20020a056808181600b003a78e1b9d4fmr1282984oib.3.1692174945208; 
 Wed, 16 Aug 2023 01:35:45 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a639510000000b005658d3a46d7sm7506333pgd.84.2023.08.16.01.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 01:35:44 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com
Subject: [PATCH 1/5] mm: move some shrinker-related function declarations to
 mm/internal.h
Date: Wed, 16 Aug 2023 16:34:15 +0800
Message-Id: <20230816083419.41088-2-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230816083419.41088-1-zhengqi.arch@bytedance.com>
References: <20230816083419.41088-1-zhengqi.arch@bytedance.com>
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
Cc: linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following functions are only used inside the mm subsystem, so it's
better to move their declarations to the mm/internal.h file.

1. shrinker_debugfs_add()
2. shrinker_debugfs_detach()
3. shrinker_debugfs_remove()

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/shrinker.h | 19 -------------------
 mm/internal.h            | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 19 deletions(-)

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
index 0b0029e4db87..dc9c81ff1b27 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1153,4 +1153,30 @@ struct vma_prepare {
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
 };
+
+/* shrinker related functions */
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

