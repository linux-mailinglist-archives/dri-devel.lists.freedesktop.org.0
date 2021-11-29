Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F035461485
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACBA6FA5A;
	Mon, 29 Nov 2021 12:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E1E6FA54
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d9so15383251wrw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qk7PwcqKvFwxCK8c/zm5biTBtYcJsU3HDhj1Rke+mig=;
 b=FUno/CVbKE7JV8YJFa0o4CtrijMPMX87xBQhWP+1YXYchLcq5zbHntBZNNdZBl+s8R
 vshKLxgazIvSz+SvzJMinSgOY+QHMkbgIdd93TsKzKJ1bbxUcNxCQC3Kl5m6InYvdE5f
 wtAY9LDNSYcGcOy8X8BkiAZe0AwNL7nhCdd2qfhkIOA18p96RFkoa3EcVdVOSO06ITtl
 OC5ny0EPuOUuEJNxh1bI3MPs9vmhw62O2uWfJzwZbZn+Gmp2BbHucnTnzYQ8v/cGzViN
 iiKMZWe+OCx6yrdvKI4Jf21Qd1XvjG6MMdAAonYkrjDrZTab+kup5OirXnL9as8fbKPf
 q7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qk7PwcqKvFwxCK8c/zm5biTBtYcJsU3HDhj1Rke+mig=;
 b=FW8piELftnthFNcsoG2u2oh7Lh2ttvbMO3o2BOcCn8M9uL8ln2Eot5F+2PaNhs4wvy
 tF91xMgPe9XBg091gr+1j8fSn8Jz97Ia9CxVEOdSuygGtUcyUyJIJTlJUqTeW8X34A6i
 5SDMeIVjAPZFItOI2bay7+2akc0aujnd4q1Ew3cRo25A+3uFy0cbSHf/rsO6P37xvUMJ
 gHBWIDYQ4B1lw8MO9yNcxR1SUcP8GIrCGe6NcufpLONXnoAaK+k3I7a3c5Q/eidY4hJL
 rxWhOmxiOP5CPEqgP0VhRgy/R+KTIhD9po5+rIookDPffg72iKQv21xaVawz1cv6xkj6
 oGXw==
X-Gm-Message-State: AOAM533OCuhGYoO52aFbnRfgdmudfsAo/if28LIJib/oYr3Fd4rJhJN6
 P/1qlYBULSbcWSFGfFe9CgE=
X-Google-Smtp-Source: ABdhPJzutv9dYwYC0rKE63+JgPY234G43ihXLtPrH/m+jsweVYi2o2XtcslEUwhpoQYexjXov2BVhg==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr32860041wrw.591.1638187625591; 
 Mon, 29 Nov 2021 04:07:05 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:05 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 03/28] dma-buf: make fence mandatory for
 dma_resv_add_excl_fence v2
Date: Mon, 29 Nov 2021 13:06:34 +0100
Message-Id: <20211129120659.1815-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling dma_resv_add_excl_fence() with the fence as NULL and expecting
that that this frees up the fences is simply abuse of the internals of
the dma_resv object.

v2: drop the fence pruning completely.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ff3c0558b3b8..4deea75c0b9c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -305,8 +305,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 	if (old)
 		i = old->shared_count;
 
-	if (fence)
-		dma_fence_get(fence);
+	dma_fence_get(fence);
 
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
-- 
2.25.1

