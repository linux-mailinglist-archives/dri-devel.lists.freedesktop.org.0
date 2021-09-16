Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C340D8D1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0316ECF2;
	Thu, 16 Sep 2021 11:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4D16ECFB;
 Thu, 16 Sep 2021 11:31:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t18so9000020wrb.0;
 Thu, 16 Sep 2021 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OelJOhuMSDpOCxseF7sOKocHejnff6bn9jvwNAWVN9c=;
 b=Iijq6Cm9Ej0SprjX1K9K5PvirqlrIaG6Y4k5CZcUa44rtXLi6ZhPbe1PQH4VWAwTmW
 mib7IISdNwrwpqo8C4wGcU/OMCxOvG/zhYKQJM0K2d0Zzt7nWqP05N9nIWatWhkwqmeN
 CtIs15zkBdLQJp/UlpAEIO9ouCgJueWdcdvkl9IT2Wl9OmUNmdyZlmJ7OJX8yzD5bk6O
 WNs98qv8SfYCauWiPIDihMRyKawOTr5Dbvv2RGaUb+m+9Z1zwliJC/vzOTCEtATuIBel
 DYYFKeUefV0Dv8y7Pr47mBHjXFVFfa9diSyRU77nnAD9beIqDCJ/VI3Nbg20SKqxdniu
 wRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OelJOhuMSDpOCxseF7sOKocHejnff6bn9jvwNAWVN9c=;
 b=5M9jAZTY9jyL4Cwcpqc5DyNrinvc0XWylStUCQNuo81wXot6GeSqLjx0bChmxxcvYH
 rG6D57dX+Q3QS7f2HwrSjNkqq/4rx1eke6LBYeF3K0ygfhbfm22nL/0QqZJTaMH3GOVu
 ftaW4F59oZSMLAFYVgaJ0YX6hzFtDBcKQYXSK3Nn81L5g3nLm8i/BtbJhU1xtXn99oLP
 2PWqi/AgjP4pvvdG0zlvd51xbd/zvkoQB/y+XoguM54EgpEjYO5nfshpKWlMMeBztVBA
 vfzp/J71DeKyREHf7mNziO2wddjf0cufutLhMsEOpNbbd6T12NWwN8XJUBQjpxYGHi/b
 GP7w==
X-Gm-Message-State: AOAM530bhTgarVDQPHlY8xlQwZvrq9WWoFXIZn6HO0Qq7WLFpgyoLIyO
 Ee82alZPGbfsQHo7STDksjI=
X-Google-Smtp-Source: ABdhPJyyjNUHgeRlxAAv+2S4iFRKdiR8A03xaRO6uw/CnwGHfvRgcRffoM7u+ZLJtG1P/cJT31/PRA==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr3236805wri.301.1631791868953; 
 Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Date: Thu, 16 Sep 2021 13:30:42 +0200
Message-Id: <20210916113042.3631-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

Heureka, that's finally not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-resv.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 6761512ba662..3e6ffba0af70 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -384,32 +384,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
 	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
 }
 
-/**
- * dma_resv_get_excl_unlocked - get the reservation object's
- * exclusive fence, without lock held.
- * @obj: the reservation object
- *
- * If there is an exclusive fence, this atomically increments it's
- * reference count and returns it.
- *
- * RETURNS
- * The exclusive fence or NULL if none
- */
-static inline struct dma_fence *
-dma_resv_get_excl_unlocked(struct dma_resv *obj)
-{
-	struct dma_fence *fence;
-
-	if (!rcu_access_pointer(obj->fence_excl))
-		return NULL;
-
-	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
-	rcu_read_unlock();
-
-	return fence;
-}
-
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
-- 
2.25.1

