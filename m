Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E1F771FBF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 13:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E0210E257;
	Mon,  7 Aug 2023 11:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBC610E257
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 11:12:05 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-51f64817809so360175a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406725; x=1692011525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qNGhCyBYRkIC+KqhUj1bienmPbnCoyI88yux10rL0c=;
 b=Xc/b9RVeZGabBZRzbFnLG60A3XcuysnQbX8QDB63xQh9Qsy33GgzK9r54ssZ8BRYsv
 Zo1icyrpegHwV8KMFlNuxd6Vv7rJh2g9STB5A/Cyu6q4WM+YLxsvvmbNVVdkSntCluNl
 It/PLVMY+sHjh9niVg4dAEeIOr6EcMWhtMnuFdCY7H6/MC8Iz/ZfTZnLr8OJnSIA36e9
 mmNGX7xKmI8VWlsJYDncO9Zq/rF2h1OiOCACwI0xXgbsWIREHFfM5CkS8NCDLLHpFGlK
 JETB4OwnLh2lGmaSIFNM9gd2qMpLx0zP9hut1e08UtN8MQU5ZK62c3ni+xnuk2sIAfG7
 kkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406725; x=1692011525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qNGhCyBYRkIC+KqhUj1bienmPbnCoyI88yux10rL0c=;
 b=gfDoLnDwzLZPY3xTRyJE8xe+sV2JDf9+mBa0DnyUH66sAl6q924xGcgp+qpTd0s89G
 CrrQ80t7qAUYMQqpa6oNhi1RoSUrageAc8uxnQ+6hlyX7/90dVlSJMfvsgiq5Tjw/t5P
 fWzT4xr1KGJt80DKqKAKSurGszZSwVBbNm/N4A92btI+WKbL99bchi+A0ZKmW6QZCkNJ
 Cdj8kT8nmcGai6v8+sE4EcBNBmt9qJa/mf5ok6chdi4vqswvtVgtNxlTQWF70C1Ewi8c
 3H8DbF4/R2FOCTk4sJWVo4MvdqKrrQZbCeRLsiCpBwc1prQp5Ovn+igFFnNxLoCsC4ZI
 vbxA==
X-Gm-Message-State: AOJu0YxeSfijzijXK6E/53yJ9ASfVDhP93dFWiaJdNHIruyya2Q8+gVA
 FS7JTq5wSkZ5T8xP7JaW8KjRfA==
X-Google-Smtp-Source: AGHT+IH0i+Trkswf5ZN/Zo/hyk0nSAkeHBCb5cnTJePkF3I+vCqNyDS8fjeM0LPIBtSn2h3E1rmPDQ==
X-Received: by 2002:a17:90a:2909:b0:269:5bf7:d79c with SMTP id
 g9-20020a17090a290900b002695bf7d79cmr2210453pjd.1.1691406724771; 
 Mon, 07 Aug 2023 04:12:04 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:12:04 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Subject: [PATCH v4 10/48] f2fs: dynamically allocate the f2fs-shrinker
Date: Mon,  7 Aug 2023 19:08:58 +0800
Message-Id: <20230807110936.21819-11-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
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
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new APIs to dynamically allocate the f2fs-shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/f2fs/super.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index aa1f9a3a8037..9092310582aa 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -83,11 +83,27 @@ void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
 #endif
 
 /* f2fs-wide shrinker description */
-static struct shrinker f2fs_shrinker_info = {
-	.scan_objects = f2fs_shrink_scan,
-	.count_objects = f2fs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *f2fs_shrinker_info;
+
+static int __init f2fs_init_shrinker(void)
+{
+	f2fs_shrinker_info = shrinker_alloc(0, "f2fs-shrinker");
+	if (!f2fs_shrinker_info)
+		return -ENOMEM;
+
+	f2fs_shrinker_info->count_objects = f2fs_shrink_count;
+	f2fs_shrinker_info->scan_objects = f2fs_shrink_scan;
+	f2fs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(f2fs_shrinker_info);
+
+	return 0;
+}
+
+static void f2fs_exit_shrinker(void)
+{
+	shrinker_free(f2fs_shrinker_info);
+}
 
 enum {
 	Opt_gc_background,
@@ -4940,7 +4956,7 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_init_sysfs();
 	if (err)
 		goto free_garbage_collection_cache;
-	err = register_shrinker(&f2fs_shrinker_info, "f2fs-shrinker");
+	err = f2fs_init_shrinker();
 	if (err)
 		goto free_sysfs;
 	err = register_filesystem(&f2fs_fs_type);
@@ -4985,7 +5001,7 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
 free_shrinker:
-	unregister_shrinker(&f2fs_shrinker_info);
+	f2fs_exit_shrinker();
 free_sysfs:
 	f2fs_exit_sysfs();
 free_garbage_collection_cache:
@@ -5017,7 +5033,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
-	unregister_shrinker(&f2fs_shrinker_info);
+	f2fs_exit_shrinker();
 	f2fs_exit_sysfs();
 	f2fs_destroy_garbage_collection_cache();
 	f2fs_destroy_extent_cache();
-- 
2.30.2

