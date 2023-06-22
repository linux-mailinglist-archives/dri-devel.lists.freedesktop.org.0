Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFAB73B1A3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C734410E62E;
	Fri, 23 Jun 2023 07:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F249A10E4FC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:55:23 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b52418c25bso12032715ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424123; x=1690016123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/vExFBLW3qTniAw4XeP9KQ69i9zow/4wwrpInqlwjM=;
 b=f9niG/1nDZCnLyGAdmXOPnr0UhYRgdnlIknKHTp5fpAvQQctnSzqFRWkCf20Ww177d
 QG9jeeQWMuTex/IwaFDMA8vXlH6fpJPO6Zn2dpmhMfbdqmxsLU2UIGO2NDOzTGYWiDw7
 ywIPFwnvUTjEHuZeccmcjrjEkLsXSYquHahbHd6ZdjnzqEP2RHdSMNMWgiY9L8TVZ0lC
 G4aVTSqjJ5NrWtnVCJTDf1mbR/bEFK3aai4gwzFQmPA34Ikuzxs8i6IqNfr5Nxc5N0yO
 /Hq8+LGyQI4XHPCqHbrNX4k2UTVR4h1zk7vD27aNaHUnKMeOkCqJba/XQtzAGJZToHzN
 Aj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424123; x=1690016123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/vExFBLW3qTniAw4XeP9KQ69i9zow/4wwrpInqlwjM=;
 b=jnBg6p9dqS4/T1xGuITmympvJu8p3klVo3wft87amCJ1o6Yfg6hghsHMCsyvtz55Lg
 qxJkE8kHS1CAGWy6e9PPAv3LHwUjf7vxh3sCeM6JlJt6aSelGwSGXdfkqGpx0aJ7yVkb
 IDo9mrWK2m3L1E2giaFWUQfOBGKhMgCJVg/d0D3b5Bd6/f6P+ruiPNZA5NqdQF/M7xRv
 sOJ5shOTnbT9fauzbPgQ9x2jYkWl0TNyFLZ3ZJU8gMM6EooQJ35F07yA07ofLSR3+rau
 Nijuh6gG2YMCL/NEISEGQA4x47OmCZvRheTl8b32hGOKvE6C12iKH35iJQND9XQi9ANB
 hy6g==
X-Gm-Message-State: AC+VfDx7xvXAkPLqtcSwwLJDyFjglPogHETs6lwIVOu6MFS0b8qWMhlb
 zlzb3dDbnWF0LBui02TrzRqm1A==
X-Google-Smtp-Source: ACHHUZ4R6XsCch8DMbBn2ilzIIAPskFMWcDdECndDXpbpwroXAZTFBoXbn8TaLTiXdt1Xz94/St+OA==
X-Received: by 2002:a17:902:dac6:b0:1a1:956d:2281 with SMTP id
 q6-20020a170902dac600b001a1956d2281mr22035085plx.3.1687424123198; 
 Thu, 22 Jun 2023 01:55:23 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:55:22 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 10/29] vmw_balloon: dynamically allocate the vmw-balloon
 shrinker
Date: Thu, 22 Jun 2023 16:53:16 +0800
Message-Id: <20230622085335.77010-11-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Jun 2023 07:26:31 +0000
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink,
we need to dynamically allocate the vmw-balloon shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct vmballoon.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/misc/vmw_balloon.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 9ce9b9e0e9b6..2f86f666b476 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -380,7 +380,7 @@ struct vmballoon {
 	/**
 	 * @shrinker: shrinker interface that is used to avoid over-inflation.
 	 */
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	/**
 	 * @shrinker_registered: whether the shrinker was registered.
@@ -1569,7 +1569,7 @@ static unsigned long vmballoon_shrinker_count(struct shrinker *shrinker,
 static void vmballoon_unregister_shrinker(struct vmballoon *b)
 {
 	if (b->shrinker_registered)
-		unregister_shrinker(&b->shrinker);
+		unregister_and_free_shrinker(b->shrinker);
 	b->shrinker_registered = false;
 }
 
@@ -1581,14 +1581,18 @@ static int vmballoon_register_shrinker(struct vmballoon *b)
 	if (!vmwballoon_shrinker_enable)
 		return 0;
 
-	b->shrinker.scan_objects = vmballoon_shrinker_scan;
-	b->shrinker.count_objects = vmballoon_shrinker_count;
-	b->shrinker.seeks = DEFAULT_SEEKS;
+	b->shrinker = shrinker_alloc_and_init(vmballoon_shrinker_count,
+					      vmballoon_shrinker_scan,
+					      0, DEFAULT_SEEKS, 0, b);
+	if (!b->shrinker)
+		return -ENOMEM;
 
-	r = register_shrinker(&b->shrinker, "vmw-balloon");
+	r = register_shrinker(b->shrinker, "vmw-balloon");
 
 	if (r == 0)
 		b->shrinker_registered = true;
+	else
+		shrinker_free(b->shrinker);
 
 	return r;
 }
-- 
2.30.2

