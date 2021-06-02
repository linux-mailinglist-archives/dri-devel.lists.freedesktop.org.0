Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0023987D0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 13:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F776E069;
	Wed,  2 Jun 2021 11:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09126E069
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 11:17:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b11so2455951edy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ac+Z/FYOYYBEzQimj97k3BPhFFgpBhgFSu+i4tCPu9U=;
 b=V2Pmn4uSA3y2CElLE8NO9J7/m8TtL+3H2Mvs1eaNo4PA3NYX2nKBOepg9n0WRiIxpw
 5orXFdKZAOC/9pU7pEJGOQVVRtT9QMuqXg410/EHIYq2iCEotw5mKiMjv8lMVV5GAoqF
 c9pUzNVhyhYWX7/Lhc5kFpTKSIZkCMjv2vHDM8rqfFb6bPrgX8XbC0u0K3HzGPBw5/Zh
 2G5p9axDbrKXrHYQmIXExY3iUlMHVezvuJnNEvdn9BW+p04ET695X3gyAFINGkYqPR83
 DMJn6AUFTUj7/aE/l4j1l5AwL88KjdeYNjEwgPzWsyMJddFZcipNFFX12hHWiSaDaucq
 1oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ac+Z/FYOYYBEzQimj97k3BPhFFgpBhgFSu+i4tCPu9U=;
 b=gp+mWTQYx/vfmudu2sU19BxFMYxiG0hZNSGxjrIAn8hSn/ycF4MOkhbezr70iOKT5R
 hbR5DIHn7kD6TL3f6paUK4V4/OBFX3HLJ1sgNVcMweAUonDx10xvAxcFVW7Ao2nTnJTM
 RbZKj49tKZ88FgddOK/rlFIsesEj4p+/CX8zzSkqGK12v2SHiFSt+oTqYaJt0YichgYJ
 A0xB0iTYmy/11oeeKs8hnVw0SPBou/P7y9OtGAxRJ+6Z0kuz1oGU03j6+SrVxOg7BNvk
 aXNaq0B1EvFyx00NMFZoUzbeXzvAJ0HA58qIEheaSyXJ812+O9ekj7cZk+cNAYw37B+X
 EfhA==
X-Gm-Message-State: AOAM532rAv3YWpR3ycWDW5hM6/B45smcrbZp/wCyQdmJyti/Oare4WBI
 tSfTSp+dKNNzi90bcE4P7rVxgKbtMwE=
X-Google-Smtp-Source: ABdhPJwOtspCh+KiNqzeYs+SvBkNbzRYFVOuyVJc18ARwi1eomcKvNAAcUevJS/nTA4qKDMdQEcJiA==
X-Received: by 2002:a50:9e8e:: with SMTP id a14mr15947709edf.5.1622632635685; 
 Wed, 02 Jun 2021 04:17:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id r2sm8310497ejc.78.2021.06.02.04.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 04:17:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	jason@jlekstrand.net,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] dma-buf: fix inconsistent debug print
Date: Wed,  2 Jun 2021 13:17:08 +0200
Message-Id: <20210602111714.212426-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The code tries to acquire the rcu protected fence list, but then ignores
individual fences which have been modified while holding the rcu.

Stop that madness and just note cleanly that the list was concurrently modified.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index eadd1eaa2fb5..d3b4e370dbc1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1383,22 +1383,17 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				buf_obj->name ?: "");
 
 		robj = buf_obj->resv;
-		while (true) {
-			seq = read_seqcount_begin(&robj->seq);
-			rcu_read_lock();
-			fobj = rcu_dereference(robj->fence);
-			shared_count = fobj ? fobj->shared_count : 0;
-			fence = rcu_dereference(robj->fence_excl);
-			if (!read_seqcount_retry(&robj->seq, seq))
-				break;
-			rcu_read_unlock();
-		}
-
+		seq = read_seqcount_begin(&robj->seq);
+		rcu_read_lock();
+		fence = rcu_dereference(robj->fence_excl);
 		if (fence)
 			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
+
+		fobj = rcu_dereference(robj->fence);
+		shared_count = fobj ? fobj->shared_count : 0;
 		for (i = 0; i < shared_count; i++) {
 			fence = rcu_dereference(fobj->shared[i]);
 			if (!dma_fence_get_rcu(fence))
@@ -1410,6 +1405,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 			dma_fence_put(fence);
 		}
 		rcu_read_unlock();
+		if (read_seqcount_retry(&robj->seq, seq))
+			seq_printf(s, "\tFences concurrently modified\n");
 
 		seq_puts(s, "\tAttached Devices:\n");
 		attach_count = 0;
-- 
2.25.1

