Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E769473B16E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17E710E614;
	Fri, 23 Jun 2023 07:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A026F10E50A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:57:40 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b5079b8cb3so12593625ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424260; x=1690016260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRQUwtIbFrjRbKaWDWITc6Upds+hXxxlwcQqvFPvJow=;
 b=Kv6dWh2IIchnBu9RbCVLsx8HZLugRgYdolMOnFdVv/Mze68pcgFvadMFaompRsV/Ii
 Vr4ahAwXirWdfwADAjPFAtSTivwacduawKzyeKPVnp7cESQMTGYfaqAI7425tQvAdQ85
 8rLDDpZCwcAbH67+6k+hMmW8Fi1etqH6LYFHkuQfbD+ESFiwPmeSocm5kXqI50kDiSjf
 PCd9vDumWTECSSKSpOEWhL8aCyPGbcSxO0SaB85LOV7uPD9a5LVIfvAATYV0qgfKCSQQ
 J+7inf8lDO5dvyUSQTFKKOcNdRaAbUMX2WbzVCHQayCH8tZA09PfVWiof+vKchWmVnWN
 0e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424260; x=1690016260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRQUwtIbFrjRbKaWDWITc6Upds+hXxxlwcQqvFPvJow=;
 b=PFrV2V0FKCbmo7pQn/rdI7yfpOefRfP2Y+D3uUfuAusV2SZDqbZIugxPtkn4ueu+UA
 Wmec0wSeTOAUTvDkgsCn0BjBN5UmYJ5tS66EWEkVDR5LWq0Op8/Qi406WeUKgiicGU71
 Vga+k4wA9lvlTZFj+4JFd22qlZFQX/QvI+6kSlqORobZ57gZynCJNvRxO5Wy6Qno1szS
 sJqIN+eOkEVsermcF6pkMNalpFEL0stYn05xdMjrjPTiz+V0D4LOfXVOKhu/ggbu6nLA
 uE33hIoy0eaeBdempy/KCddVNIPkCq7Z7UTBkgLuXrYmT40ugvxz1cX6Acy+/8egFXf3
 m4yw==
X-Gm-Message-State: AC+VfDyMJ6xg1qORGpeLI1db9ayfBGswuFbCRUo/4yAuD62kUnP/9Bt2
 w69lhLnrgrdH5LJCX1Lnp+fBcA==
X-Google-Smtp-Source: ACHHUZ4KKZ8AXrupsFYw18EsJWvGfL6qm7cyYV/rSPTKOdYWRQ8IhOkLOim7I9s7W96jDohmbJS9Lg==
X-Received: by 2002:a17:903:41d2:b0:1a6:cf4b:4d7d with SMTP id
 u18-20020a17090341d200b001a6cf4b4d7dmr21650808ple.2.1687424260203; 
 Thu, 22 Jun 2023 01:57:40 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:57:39 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 27/29] mm: vmscan: hold write lock to reparent shrinker
 nr_deferred
Date: Thu, 22 Jun 2023 16:53:33 +0800
Message-Id: <20230622085335.77010-28-zhengqi.arch@bytedance.com>
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

For now, reparent_shrinker_deferred() is the only holder
of read lock of shrinker_rwsem. And it already holds the
global cgroup_mutex, so it will not be called in parallel.

Therefore, in order to convert shrinker_rwsem to shrinker_mutex
later, here we change to hold the write lock of shrinker_rwsem
to reparent.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/vmscan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 357a1f2ad690..0711b63e68d9 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -433,7 +433,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 		parent = root_mem_cgroup;
 
 	/* Prevent from concurrent shrinker_info expand */
-	down_read(&shrinker_rwsem);
+	down_write(&shrinker_rwsem);
 	for_each_node(nid) {
 		child_info = shrinker_info_protected(memcg, nid);
 		parent_info = shrinker_info_protected(parent, nid);
@@ -442,7 +442,7 @@ void reparent_shrinker_deferred(struct mem_cgroup *memcg)
 			atomic_long_add(nr, &parent_info->nr_deferred[i]);
 		}
 	}
-	up_read(&shrinker_rwsem);
+	up_write(&shrinker_rwsem);
 }
 
 static bool cgroup_reclaim(struct scan_control *sc)
-- 
2.30.2

