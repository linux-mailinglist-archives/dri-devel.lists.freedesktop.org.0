Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030252BBA4
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 15:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257F610ED0D;
	Wed, 18 May 2022 13:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D2E10ED0D;
 Wed, 18 May 2022 13:58:51 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id z2so4029037ejj.3;
 Wed, 18 May 2022 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNt760DjFBo7HAT2HJsEWq9kQPdH1wnsqRHak7OGdbE=;
 b=XfwdxRe8htQO7kdFxwFsmypBc6VF8jXeIOOsfJMrPCW+urG3DuQwJrVpV9EVgVOSeN
 pr+Ty66pOKcdvt6pvX5caVTuUOAcNW2a+HGZafndz8FpZF5iWcSsPiryF/NQ2UZU2gmt
 lYktUPskOQ9ER/WQp2h3mNOXy6RQdjw4rcARIyN9hm5QiboSppWzcnT1x1WlVrZOJw4d
 Jg1i2ETWFlke4sf4kf62+vG3Qskh2CUno2KmoIzzNiQkFUAEKp1Tvjo7ZyqocEPBHAn9
 kAFUUnMiuXOWdge84nNEeqHmw1L7lVZS7UOFQatNpOCOOGC7JYnpiDCpoE/czSKe3hFp
 pIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNt760DjFBo7HAT2HJsEWq9kQPdH1wnsqRHak7OGdbE=;
 b=JJ2Ia7W89wnrnKqKaUHWvwHmiWrgl8LH9MXbs/+jDirWtyrmoYgYtD9+Uyfma5L+Cd
 Lby2f6e6641TdG6un3Zj0T2lKFCHCe5ffw97zFsSoPvl7/OtH+tBuwKEFlkVABasvSJR
 gE74Uq+muY7nwLWZ+D+fr3u3tJkYmnWg9+l57XKlLTxKXLXxvTf/b07g+5ZaUuXQuusi
 U3n2dnGBxh2az1P4nt9zvBALp2h9BMs6Vf2/c1M4PsGUmGzLAQT+UfE01vgFqjyocmZ8
 5GT/7Bm36SgfSNRuFidrUWVVlDgktRKgREqQEu0Y/fS2IybBidrYa2WUeQIyH8o9ylub
 T5lw==
X-Gm-Message-State: AOAM531Of6oUIhK0liVVa+OMBjqb+aM6nD/3KyfFJqq7Gc59Y/mQ/h39
 PKlijHQJV3jTK280iaQUTAU3xv28FWo=
X-Google-Smtp-Source: ABdhPJyeG7Kl8Fg3W/GXpKVVoLsE4K0hgCocSUMaivJ/H/RxncbTthgTFnaLXHzyTZIjLFkerKcW5A==
X-Received: by 2002:a17:907:1ca5:b0:6f4:b220:430b with SMTP id
 nb37-20020a1709071ca500b006f4b220430bmr24574804ejc.261.1652882330198; 
 Wed, 18 May 2022 06:58:50 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0042aaacd4edasm1388917edt.26.2022.05.18.06.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:58:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each v3
Date: Wed, 18 May 2022 15:58:42 +0200
Message-Id: <20220518135844.3338-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518135844.3338-1-christian.koenig@amd.com>
References: <20220518135844.3338-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_fence_chain containers cleanup signaled fences automatically, so
filter those out from arrays as well.

v2: fix missing walk over the array
v3: massively simplify the patch and actually update the description.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence-unwrap.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index e7c219da4ed7..a4d342fef8e0 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
  * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
  * potential fences in them. If @head is just a normal fence only that one is
  * returned.
+ *
+ * Note that signalled fences are opportunistically filtered out, which
+ * means the iteration is potentially over no fence at all.
  */
 #define dma_fence_unwrap_for_each(fence, cursor, head)			\
 	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
-	     fence = dma_fence_unwrap_next(cursor))
+	     fence = dma_fence_unwrap_next(cursor))			\
+		if (!dma_fence_is_signaled(fence))
 
 #endif
-- 
2.25.1

